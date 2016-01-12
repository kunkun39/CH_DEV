package com.changhong.app.service;

import com.changhong.app.utils.DesUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
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

    @Value("${mail.host}")
    private String mailHost = "smtp.163.com";

    @Value("${mail.username}")
    private String mailUsername = "xxx@163.com";

    @Value("${mail.password}")
    private String mailPassword = "xxx";

    @Value("${application.local.request.path}")
    private String applicationHost = "";


    @Override
    public void sendUserRegisterMail(String sendMail, String validateNumber) throws Exception {
        String encUserId = DesUtils.getEncString(sendMail);
        String encValidationNumber = DesUtils.getEncString(validateNumber);
        String code = encUserId + "||" + encValidationNumber;

        String title = "广电应用市场用户注册激活";
        String content = "尊敬的开发者：\n" +
                "\n" +
                "您好!\n" +
                "\n" +
                "欢迎加入广电应用市场开放平台！\n" +
                "\n" +
                "点击下面的链接完成注册:" + applicationHost + "chapp/finishregister.html?a=" + code + "\n" +
                "\n" +
                "\n" +
                "                                                                                                                             广电应用市场平台组\n" +
                "\n" +
                "若链接无法直接点开，请复制链接到浏览器中打开！（本邮件为系统自动发出请不要回复）";

        sendEmail(sendMail, title, content);
    }

    /**
     * 找回密码邮件发送
     * @param sendMail
     * @param validateNumber
     * @throws Exception
     */
    @Override
    public void sendUserPWDLookBackMail(String sendMail, String validateNumber) throws Exception {
        String encUserId = DesUtils.getEncString(sendMail);
        String encValidationNumber = DesUtils.getEncString(validateNumber);
        String code = encUserId + "||" + encValidationNumber;

        String title = "广电应用市场用户密码找回";
        String content = "尊敬的开发者：\n" +
                "\n" +
                "您好!\n" +
                "\n" +
                "欢迎使用广电应用市场开放平台！\n" +
                "\n" +
                "点击下面的链接设置新密码:" + applicationHost + "chapp/finishpwdlookbackmail.html?a=" + code + "\n" +
                "\n" +
                "\n" +
                "                                                                                                                             广电应用市场平台组\n" +
                "\n" +
                "若链接无法直接点开，请复制链接到浏览器中打开！（本邮件为系统自动发出请不要回复）";

        sendEmail(sendMail, title, content);
    }

    @Override
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

    private void sendEmail(String mail, String title, String content) throws MessagingException {
        MimeMessage msg = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");

        helper.setFrom(mailSender.getUsername());
        helper.setTo(mail);
        helper.setSubject(title);
        //第二个参数true，表示text的内容为html，然后注意<img/>标签，src='cid:file'，'cid'是 contentId的缩写，'file'是一个标记，需要在后面的代码中调用MimeMessageHelper的addInline方法替代成文件
        helper.setText(content, true);

        mailSender.send(msg);
    }
//测试代码暂时屏蔽
//    public static void main(String[] args) throws Exception {
//        MailServiceImpl mailService = new MailServiceImpl();
//        mailService.sendUserRegisterMail("34445282@qq.com", "111111");
//    }
}
