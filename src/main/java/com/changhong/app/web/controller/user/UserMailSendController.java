package com.changhong.app.web.controller.user;

import com.changhong.app.service.UserService;
import com.changhong.app.utils.DesUtils;
import com.changhong.app.utils.MailLoginUrlUtil;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * 邮件发送控制器，传递参数：username:邮箱地址
 * mailtype 发送类型，1：密码找回，0或其他为未注册
 * isresend 是否是重新发送，默认是否
 * User:wangxiufeng
 * Date:2016/1/6
 * Time:15:03
 */
public class UserMailSendController extends AbstractController {

    private String serverContext;

    private UserService userService;


    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        String username = ServletRequestUtils.getStringParameter(httpServletRequest, "usernamenormal", "");
        //邮件发送类型 0为注册邮件；1为密码找回邮件
        int mailtype = ServletRequestUtils.getIntParameter(httpServletRequest, "mailtype", 0);
        //是否是重新发送
        boolean isresend = ServletRequestUtils.getBooleanParameter(httpServletRequest, "isresend", false);

        if (mailtype == 1) {
            userService.handlePwdLookBackSendMail(username);//发送密码找回邮件
        } else {
            userService.handleClientResendMail(username);//重新发送注册邮件
        }
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("usernamenormal", username);//解密username
        model.put("mailtype", mailtype);//邮件类型
        model.put("isresend", isresend);//邮件是否是重新发送
        model.put("tomailpageurl", MailLoginUrlUtil.getMailLoginUrl(username));//邮箱登陆地址，如果没有检索到对应地址会默认用163邮箱登陆地址

        return new ModelAndView("chapp/userregisteremail", model);
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setServerContext(String serverContext) {
        this.serverContext = serverContext;
    }
}
