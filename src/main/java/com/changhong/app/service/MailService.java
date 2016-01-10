package com.changhong.app.service;

/**
 * 发送注册邮件
 * User:wangxiufeng
 * Date:2016/1/6
 * Time:13:31
 */
public interface MailService {
    /**
     * 发送注册邮件
     * @param sendMail
     * @param validateNumber
     * @throws Exception
     */
    void sendUserRegisterMail(String sendMail, String validateNumber) throws Exception;

    /**
     * 发送密码找回邮件
     * @param sendMail
     * @param validateNumber
     * @throws Exception
     */
    void sendUserPWDLookBackMail(String sendMail, String validateNumber) throws Exception;
}
