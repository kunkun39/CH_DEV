package com.changhong.app.thread;

import com.changhong.app.domain.RegisterConfirm;
import com.changhong.app.service.MailService;
import com.changhong.app.web.application.ApplicationEventPublisher;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 密码找回
 * User:wangxiufeng
 * Date:2016/1/6
 * Time:13:25
 */
public class PwdLookBackMailSendThread extends Thread {


    private static final Log log = LogFactory.getLog(PwdLookBackMailSendThread.class);
    //密码找回的邮箱
    private String pwdLookBackEmail;
    //验证信息
    private RegisterConfirm pwdLookBackConfirm;

    public PwdLookBackMailSendThread(String pwdLookBackEmail, RegisterConfirm pwdLookBackConfirm) {
        this.pwdLookBackEmail = pwdLookBackEmail;
        this.pwdLookBackConfirm = pwdLookBackConfirm;
    }

    @Override
    public void run() {
        super.run();
        MailService mailService = (MailService) ApplicationEventPublisher.getBean("mailService");

        try {
            mailService.sendUserPWDLookBackMail(pwdLookBackEmail, pwdLookBackConfirm.getValidateNumber());
            log.info("send sendUserPWDLookBackMail  for user " + pwdLookBackEmail + " successful");
        } catch (Exception e) {
            log.error("send sendUserPWDLookBackMail  for user " + pwdLookBackEmail + " failed", e);
        }
    }
}
