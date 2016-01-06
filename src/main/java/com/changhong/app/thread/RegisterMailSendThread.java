package com.changhong.app.thread;

import com.changhong.app.domain.RegisterConfirm;
import com.changhong.app.service.MailService;
import com.changhong.app.utils.RegisterCodeUtils;
import com.changhong.app.web.application.ApplicationEventPublisher;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * User:wangxiufeng
 * Date:2016/1/6
 * Time:13:25
 */
public class RegisterMailSendThread extends Thread {


    private static final Log log = LogFactory.getLog(RegisterMailSendThread.class);
    //用户注册邮箱
    private String registerEmail;
    //用户注册验证信息
    private RegisterConfirm registerConfirm;

    public RegisterMailSendThread(String registerEmail, RegisterConfirm registerConfirm) {
        this.registerEmail = registerEmail;
        this.registerConfirm = registerConfirm;
    }

    @Override
    public void run() {
        super.run();
        MailService mailService = (MailService) ApplicationEventPublisher.getBean("mailService");

        try {
            mailService.sendUserRegisterMail(registerEmail, registerConfirm.getValidateNumber());
            log.info("send register mail for user " + registerEmail + " successful");
        } catch (Exception e) {
            log.error("send register mail for user " + registerEmail + " failed", e);
        }
    }
}
