package com.changhong.app.service;

import com.changhong.app.domain.AdminUser;
import com.changhong.app.domain.Auth;
import com.changhong.app.domain.ClientUser;
import com.changhong.app.domain.RegisterConfirm;
import com.changhong.app.repository.ClientDao;
import com.changhong.app.repository.UserDao;
import com.changhong.app.thread.ApplicationThreadPool;
import com.changhong.app.thread.PwdLookBackMailSendThread;
import com.changhong.app.thread.RegisterMailSendThread;
import com.changhong.app.utils.SecurityUtils;
import com.changhong.app.web.facade.assember.ClientUserWebAssember;
import com.changhong.app.web.facade.dto.ClientUserDTO;
import com.changhong.app.web.facade.dto.UserPasswordDTO;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.logging.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * User: Jack Wang
 * Date: 15-10-15
 * Time: 上午10:36
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    private static final Log log = LogFactory.getLog(UserServiceImpl.class);

    @Autowired
    private UserDao userDao;

    /**
     * 24hour
     */
    private final long TWO_FOUR_HOUR = 24 * 60 * 60 * 1000;

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
        return userDao.findUserByName(username);
    }

    /*User Register and Login Part Part***************************************************************/

    public boolean obtainClientUserExist(String username) {
        return userDao.loadClientUserExist(username);
    }

    public boolean obtainUserEnable(String username) {
        return userDao.loadClientUserEnable(username);
    }

    public ClientUserDTO obtainClientUserById(int clientId) {
        ClientUser clientUser = (ClientUser) userDao.findById(clientId, ClientUser.class);
        return ClientUserWebAssember.DomainToDto(clientUser);
    }

    /**
     * 执行注册：保存用户信息，保存验证信息，发送邮件
     *
     * @param userDTO
     */
    public void changeClientUserDetails(ClientUserDTO userDTO) {
        //save user
        ClientUser user = ClientUserWebAssember.DtoToDomain(userDTO);
        userDao.saveOrUpdate(user);

        //验证信息
        RegisterConfirm confirm = new RegisterConfirm(user.getUsername());
        userDao.saveOrUpdate(confirm);

        //发送邮件
        RegisterMailSendThread send = new RegisterMailSendThread(user.getUsername(), confirm);
        ApplicationThreadPool.executeThread(send);
    }

    /**
     * 检测用户注册状态
     *
     * @param username       用户注册邮箱
     * @param validateNumber 随机验证码
     * @return 返回注册状态 1：成功；2：验证超时;3:改用户已经验证成功;4:验证信息有异常
     */
    public int obtainClientUserRegisterActive(String username, String validateNumber) {
        RegisterConfirm confirm = userDao.loadClientUserRegisterConfirm(validateNumber);

        if (confirm == null) {
            return 4;//验证信息为空
        }

        if (confirm.isValidateConfirm()) {
            return 3;//已经认证过
        }

        long nowTime = new Date().getTime();
        long registerTime = confirm.getTimestamp().getTime();
        confirm.setValidateConfirm(true);

        if ((registerTime + TWO_FOUR_HOUR) >= nowTime) {
            ClientUser user = userDao.loadClientUser(username);
            if (user != null) {
                user.setActive(true);
            }
            return 1;//注册成功
        } else {
            //验证超过24小时
            return 2;
        }

    }

    /**
     * 检测用户修改密码认证邮件状态
     *
     * @param username       用户注册邮箱
     * @param validateNumber 随机验证码
     * @return 返回注册状态 1：成功；2：验证超时;3:改用户已经验证成功;4:验证信息有异常
     */
    public int obtainPwdLookbackActive(String username, String validateNumber) {
        RegisterConfirm confirm = userDao.loadClientUserRegisterConfirm(validateNumber);

        if (confirm == null) {
            return 4;//验证信息为空
        }

        if (confirm.isValidateConfirm()) {
            return 3;//已经认证过
        }

        long nowTime = new Date().getTime();
        long registerTime = confirm.getTimestamp().getTime();
        confirm.setValidateConfirm(true);

        if ((registerTime + TWO_FOUR_HOUR) >= nowTime) {
            return 1;//注册成功
        } else {
            //验证超过24小时
            return 2;
        }

    }

    /**
     * 重新发送邮件
     *
     * @param username
     */
    public void handleClientResendMail(String username) {
        //save validation
        RegisterConfirm confirm = new RegisterConfirm(username);
        //本地对象
        RegisterConfirm nativeConfirm=userDao.loadRegisterConfirmByUsername(username);

        if (nativeConfirm==null){
            nativeConfirm=confirm;
        }else {
            nativeConfirm.setValidateNumber(confirm.getValidateNumber());
            nativeConfirm.setValidateConfirm(false);
            nativeConfirm.setUsername(username);
            nativeConfirm.setTimestamp(confirm.getTimestamp());
        }
        userDao.saveOrUpdate(nativeConfirm);

        //send email out or send message out
        RegisterMailSendThread send = new RegisterMailSendThread(username, confirm);
        ApplicationThreadPool.executeThread(send);
    }

    /**
     * 密码找回邮件发送
     *
     * @param username
     */
    public void handlePwdLookBackSendMail(String username) {
        //save validation
        RegisterConfirm confirm = new RegisterConfirm(username);
        //本地对象
        RegisterConfirm nativeConfirm=userDao.loadRegisterConfirmByUsername(username);

        if (nativeConfirm==null){
            nativeConfirm=confirm;
        }else {
            nativeConfirm.setValidateNumber(confirm.getValidateNumber());
            nativeConfirm.setValidateConfirm(false);
            nativeConfirm.setUsername(username);
            nativeConfirm.setTimestamp(confirm.getTimestamp());
        }

        userDao.saveOrUpdate(nativeConfirm);

        //send email out or send message out
        PwdLookBackMailSendThread send = new PwdLookBackMailSendThread(username, confirm);
        ApplicationThreadPool.executeThread(send);
    }

    /**
     * 更改密码
     *
     * @param username
     * @param newPassword
     */
    public void updateUserPassword(String username, String newPassword) {
        userDao.updateUserPassword(username, newPassword);
    }

    public UserPasswordDTO obtainPasswordByUserId(int userId) {
        ClientUser client = (ClientUser) userDao.findById(userId, ClientUser.class);
        return ClientUserWebAssember.toPasswordDTO(client);
    }

    public boolean obtainOldPasswordRight(int userId, String oldPassword) {
        ClientUser client = (ClientUser) userDao.findById(userId, ClientUser.class);
        return client.getPassword().equals(oldPassword) ? true : false;
    }

    public void changeClientUserPassword(int userId, String newPassword) {
        ClientUser client = (ClientUser) userDao.findById(userId, ClientUser.class);
        client.setPassword(newPassword);
    }

    public void changeClientInformation(ClientUserDTO userDTO) {
        ClientUser user = ClientUserWebAssember.DtoToDomain(userDTO);
        userDao.persist(user);
    }
}
