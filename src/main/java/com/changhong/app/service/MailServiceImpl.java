package com.changhong.app.service;

import com.changhong.app.utils.DesUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.util.Assert;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.MessagingException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * User:wangxiufeng
 * Date:2016/1/6
 * Time:13:32
 */
@Service("mailService")
public class MailServiceImpl implements MailService, InitializingBean {

    private static final Log logger = LogFactory.getLog(MailServiceImpl.class);
    private JavaMailSenderImpl mailSender;
    //    private SimpleMailMessage simpleMailMessage;
    @Autowired
    private VelocityEngine velocityEngine;
    private static final String registerMailVmName = "velocity/registermail.vm";
    private static final String pwdLookBackVmName = "velocity/passwdmail.vm";

    @Value("${mail.host}")
    private String mailHost = "smtp.163.com";

    @Value("${mail.username}")
    private String mailUsername = "xxx@163.com";

    @Value("${mail.password}")
    private String mailPassword = "xxx";

    @Value("${application.mail.request.path}")
    private String applicationHost = "";

    //below this is added by oscar chang
    public VelocityEngine getVelocityEngine() {
        return velocityEngine;
    }

    public void setVelocityEngine(VelocityEngine velocityEngine) {
        this.velocityEngine = velocityEngine;
    }

    public void sendUserRegisterMail(String sendMail, String validateNumber) throws Exception {
        String code;
        String encUserId = DesUtils.getEncString(sendMail);
        String encValidationNumber = DesUtils.getEncString(validateNumber);
        code = encUserId + "||" + encValidationNumber;

        String title = "广电应用市场用户注册激活";
        sendEmail(sendMail, title, registerMailVmName, code);
    }

    /**
     * 找回密码邮件发送
     *
     * @param sendMail
     * @param validateNumber
     * @throws Exception
     */
    public void sendUserPWDLookBackMail(String sendMail, String validateNumber) throws Exception {
        String code;
        String encUserId = DesUtils.getEncString(sendMail);
        String encValidationNumber = DesUtils.getEncString(validateNumber);
        code = encUserId + "||" + encValidationNumber;

        String title = "广电应用市场用户密码找回";
        sendEmail(sendMail, title, pwdLookBackVmName, code);
    }

    public void afterPropertiesSet() throws Exception {
        Assert.hasText(applicationHost, "the basic appcation path not configure");

        mailSender = new JavaMailSenderImpl();

        // 设置参数
        mailSender.setHost(mailHost);
        mailSender.setUsername(mailUsername);
        mailSender.setPassword(mailPassword);

        Properties prop = new Properties();
        prop.setProperty("mail.smtp.auth", "true");
        mailSender.setJavaMailProperties(prop);
    }

    private void sendEmail(String mail, String title, String typeVmName, String code) throws MessagingException {
        Map model = new HashMap();
        MimeMessage msg = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");
        helper.setFrom(mailSender.getUsername());
        helper.setTo(mail);
        helper.setSubject(title);

        model.put("applicationHost", applicationHost);
        model.put("code", code);
        model.put("mail", mail);
        String mailText = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, typeVmName, "utf-8", model);

        helper.setText(mailText, true);
        mailSender.send(msg);
    }
}
