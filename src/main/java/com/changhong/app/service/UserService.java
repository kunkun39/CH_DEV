package com.changhong.app.service;

import com.changhong.app.domain.ClientUser;
import com.changhong.app.web.facade.dto.ClientUserDTO;
import com.changhong.app.web.facade.dto.UserPasswordDTO;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * User: Jack Wang
 * Date: 15-10-15
 * Time: 上午9:46
 */
public interface UserService extends UserDetailsService {

    /*User Register and Login Part Part***************************************************************/

    /**
     * 用户是否存在
     * @param username
     * @return
     */
    boolean obtainClientUserExist(String username);

    /**
     * 注册时候判断用户状态
     * @param username 用户注册邮箱
     * @return -1 用户不存在；0 用户未进行邮箱注册；大于0，用户的id
     */
    int obtailUserCouldRegister(String username);

    boolean obtainUserEnable(String username);

    ClientUserDTO obtainClientUserById(int clientId);

    /**
     * 通过邮箱账号查询用户信息
     * @param username
     * @return
     */
    ClientUser obtainClientUserByUserName(String username);

    /**
     * 更改用户信息（注册时候使用）
     * @param userDTO
     */
    void changeClientUserDetails(ClientUserDTO userDTO);
    /**
     * 检测用户注册状态
     *
     * @param username       用户注册邮箱
     * @param validateNumber 随机验证码
     * @return 返回注册状态 1：成功；2：验证超时;3:改用户已经验证成功;4:验证信息为空有异常
     */
    int obtainClientUserRegisterActive(String username, String validateNumber);
    /**
     * 检测用户修改密码认证邮件状态
     *
     * @param username       用户注册邮箱
     * @param validateNumber 随机验证码
     * @return 返回注册状态 1：成功；2：验证超时;3:改用户已经验证成功;4:验证信息有异常
     */
    int obtainPwdLookbackActive(String username, String validateNumber);

    /**
     * 重新发送邮件
     *
     * @param username
     */
    void handleClientResendMail(String username);

    /**
     * 密码找回邮件发送
     *
     * @param username
     */
    void handlePwdLookBackSendMail(String username);

    /**
     * 更改密码
     * @param username
     * @param newPassword
     */
    void updateUserPassword(String username, String newPassword);

    UserPasswordDTO obtainPasswordByUserId(int userId);

    boolean obtainOldPasswordRight(int userId, String oldPassword);

    void changeClientUserPassword(int userId, String newPassword);

    public void changeClientInformation(ClientUserDTO userDTO);
}
