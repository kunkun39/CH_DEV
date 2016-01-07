package com.changhong.app.web.controller.user;

import com.changhong.app.utils.DesUtils;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * 注册邮件发送成功
 * User:wangxiufeng
 * Date:2016/1/6
 * Time:14:51
 */
public class UserRegisterMailSendedController extends AbstractController {


    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        String username = ServletRequestUtils.getStringParameter(httpServletRequest, "username", "");
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("username", username);//解密username
        model.put("usernameenc", DesUtils.getEncString(username));//加密username
        model.put("tomailpageurl", getMailLoginUrl(username));

        return new ModelAndView("chapp/userregisteremail", model);
    }

    private String getMailLoginUrl(String mailAddress) {
        String mailLogin = "";
        if (mailAddress == null || mailAddress.equals("")) {
            return mailLogin;
        }

        if (mailAddress.endsWith("163.com")) {//163邮箱
            mailLogin = "http://mail.163.com";

        } else if (mailAddress.endsWith("qq.com")) {//qq邮箱
            mailLogin = "https://mail.qq.com";

        } else if (mailAddress.endsWith("139.com")) {//中国移动139邮箱
            mailLogin = "http://mail.10086.cn";

        } else if (mailAddress.endsWith("sohu.com")) {//搜狐邮箱
            mailLogin = "http://mail.sohu.com/";

        } else if (mailAddress.endsWith("189.cn")) {//189邮箱
            mailLogin = "http://mail.189.cn/";

        } else if (mailAddress.endsWith("126.com")) {//网易126邮箱
            mailLogin = "http://www.126.com/";

        } else if (mailAddress.endsWith("tom.com")) {//tom邮箱
            mailLogin = "http://web.mail.tom.com/webmail/login/index.action";

        } else if (mailAddress.endsWith("sina.com") || mailAddress.endsWith("sina.cn")) {//新浪邮箱
            mailLogin = "http://mail.sina.com.cn/";

        } else if (mailAddress.endsWith("2980.com")) {//2980邮箱
            mailLogin = "http://www.2980.com/login.aspx";

        } else if (mailAddress.endsWith("aliyun.com")) {//阿里云邮箱
            mailLogin = "https://mail.aliyun.com/alimail";

        } else if (mailAddress.endsWith("21cn.com")) {//21cn.com邮箱
            mailLogin = "http://mail.21cn.com/w2/";

        } else if (mailAddress.endsWith("188.com")) {//188财富邮箱
            mailLogin = "http://www.188.com/";

        } else if (mailAddress.endsWith("yeah.net")) {//网易免费邮
            mailLogin = "http://www.yeah.net/";

        } else if (mailAddress.endsWith("wo.cn")) {//联通邮箱
            mailLogin = "http://mail.wo.cn/mail/login.action";

        }else {
            mailLogin = "http://mail.163.com";//临时采用默认是163邮箱
        }

        return mailLogin;
    }
}
