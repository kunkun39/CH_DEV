package com.changhong.app.service;

import com.changhong.app.domain.*;
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

    @Override
    public ClientUser obtainClientUserByUserName(String username) {
        return userDao.loadClientUser(username);
    }

    public void changeClientUserDetails(ClientUserDTO userDTO) {
        //save user
        ClientUser user = ClientUserWebAssember.DtoToDomain(userDTO);
        ClientUser saveUser = saveOrUpdateClientUser(user);

        //验证信息
        RegisterConfirm confirm = saveOrUpdateRegisterConfirm(saveUser.getUsername());

        //发送邮件
//        RegisterMailSendThread send = new RegisterMailSendThread(saveUser.getUsername(), confirm);
//        ApplicationThreadPool.executeThread(send);
    }


    public int obtainClientUserRegisterActive(String username, String validateNumber) {
        RegisterConfirm confirm = userDao.loadClientUserRegisterConfirm(validateNumber);

        if (confirm == null) {
            return EnumRegisterConfirm.EXCEPTION.getDescribtion();//验证信息为空
        }

        if (confirm.isValidateConfirm()) {
            return EnumRegisterConfirm.USED.getDescribtion();//已经认证过
        }

        long nowTime = new Date().getTime();
        long registerTime = confirm.getTimestamp().getTime();
        confirm.setValidateConfirm(true);

        if ((registerTime + TWO_FOUR_HOUR) >= nowTime) {
            ClientUser user = userDao.loadClientUser(username);
            if (user != null) {
                user.setActive(true);
            }
            return EnumRegisterConfirm.SUCCESS.getDescribtion();//注册成功
        } else {
            //验证超过24小时
            return EnumRegisterConfirm.OUTTIME.getDescribtion();
        }

    }


    public int obtainPwdLookbackActive(String username, String validateNumber) {
        RegisterConfirm confirm = userDao.loadClientUserRegisterConfirm(validateNumber);

        if (confirm == null) {
            return EnumRegisterConfirm.EXCEPTION.getDescribtion();//验证信息为空
        }

        if (confirm.isValidateConfirm()) {
            return EnumRegisterConfirm.USED.getDescribtion();//已经认证过
        }

        long nowTime = new Date().getTime();
        long registerTime = confirm.getTimestamp().getTime();
        confirm.setValidateConfirm(true);

        if ((registerTime + TWO_FOUR_HOUR) >= nowTime) {
            return EnumRegisterConfirm.SUCCESS.getDescribtion();//注册成功
        } else {
            //验证超过24小时
            return EnumRegisterConfirm.OUTTIME.getDescribtion();
        }

    }


    public void handleClientResendMail(String username) {
        //save validation
        RegisterConfirm confirm = saveOrUpdateRegisterConfirm(username);

        //send email out or send message out
        RegisterMailSendThread send = new RegisterMailSendThread(username, confirm);
        ApplicationThreadPool.executeThread(send);
    }


    public void handlePwdLookBackSendMail(String username) {
        //save validation
        RegisterConfirm confirm = saveOrUpdateRegisterConfirm(username);

        //send email out or send message out
        PwdLookBackMailSendThread send = new PwdLookBackMailSendThread(username, confirm);
        ApplicationThreadPool.executeThread(send);
    }

    public RegisterConfirm saveOrUpdateRegisterConfirm(String username) {
        //save validation
        RegisterConfirm confirm = new RegisterConfirm(username);
        //本地对象
        RegisterConfirm nativeConfirm = userDao.loadRegisterConfirmByUsername(username);

        if (nativeConfirm == null) {
            nativeConfirm = confirm;
        } else {
            nativeConfirm.setValidateNumber(confirm.getValidateNumber());
            nativeConfirm.setValidateConfirm(false);
            nativeConfirm.setUsername(username);
            nativeConfirm.setTimestamp(confirm.getTimestamp());
        }

        userDao.saveOrUpdate(nativeConfirm);
        return nativeConfirm;
    }

    public ClientUser saveOrUpdateClientUser(ClientUser user) {
        //本地对象
        ClientUser nativeClientUser = userDao.loadClientUser(user.getUsername());

        if (nativeClientUser == null) {
            nativeClientUser = user;
        } else {
            nativeClientUser.setPassword(user.getPassword());
            nativeClientUser.setTimestamp(user.getTimestamp());
            nativeClientUser.setUsername(user.getUsername());
            nativeClientUser.setActive(user.isActive());
            nativeClientUser.setContactWay(user.getContactWay());
            nativeClientUser.setEnabled(user.isEnabled());
            nativeClientUser.setName(user.getName());
        }

        userDao.saveOrUpdate(nativeClientUser);
        return nativeClientUser;
    }

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
