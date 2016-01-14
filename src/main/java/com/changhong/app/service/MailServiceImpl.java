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
    private SimpleMailMessage simpleMailMessage;
    @Autowired
    private VelocityEngine velocityEngine;
    private String registerMailVmName = "velocity/registermail.vm";
    private String pwdLookBackVmName = "velocity/passwdmail.vm";
    Map model = new HashMap();
    private String code;

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
        String encUserId = DesUtils.getEncString(sendMail);
        String encValidationNumber = DesUtils.getEncString(validateNumber);
        code = encUserId + "||" + encValidationNumber;

        String title = "广电应用市场用户注册激活";
        sendEmail(sendMail, title, registerMailVmName);
    }

    /**
     * 找回密码邮件发送
     *
     * @param sendMail
     * @param validateNumber
     * @throws Exception
     */
    public void sendUserPWDLookBackMail(String sendMail, String validateNumber) throws Exception {
        String encUserId = DesUtils.getEncString(sendMail);
        String encValidationNumber = DesUtils.getEncString(validateNumber);
        code = encUserId + "||" + encValidationNumber;

        String title = "广电应用市场用户密码找回";
        sendEmail(sendMail, title, pwdLookBackVmName);
    }

    public void afterPropertiesSet() throws Exception {
        Assert.hasText(applicationHost, "the basic appcation path not configure");

        mailSender = new JavaMailSenderImpl();
        simpleMailMessage = new SimpleMailMessage();

        // 设置参数
        mailSender.setHost(mailHost);
        mailSender.setUsername(mailUsername);
        mailSender.setPassword(mailPassword);

        Properties prop = new Properties();
        prop.setProperty("mail.smtp.auth", "true");
        mailSender.setJavaMailProperties(prop);

    }

    private void sendEmail(String mail, String title, String typeVmName) throws MessagingException {

        simpleMailMessage.setTo(mail);                          //接收人
        simpleMailMessage.setFrom(mailSender.getUsername());  //发送人,从配置文件中取得
        simpleMailMessage.setSubject(title);

        model.put("applicationHost", applicationHost);
        model.put("code", code);

        String result = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, typeVmName, "UTF-8", model);

        simpleMailMessage.setText(result);
        mailSender.send(simpleMailMessage);
    }

}
