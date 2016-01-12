package com.changhong.app.web.controller.user;

import com.changhong.app.service.UserService;
import com.changhong.app.utils.DesUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * 用户密码找回 邮件链接确认回调
 * User:wangxiufeng
 * Date:2016/1/8
 * Time:17:41
 */
public class UserPwdBackMailBackController extends AbstractController {

    UserService userService;

    String serverContext;

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        {
            Map<String, Object> model = new HashMap<String, Object>();

            try {
                String validation = ServletRequestUtils.getStringParameter(httpServletRequest, "a", "");//a代表邮件验证返回传递参数 sendMail||validateNumber
                String[] tokens = StringUtils.delimitedListToStringArray(validation, "||");
                String username = DesUtils.getDesString(tokens[0]);//用户注册邮箱
                String validateNumber = DesUtils.getDesString(tokens[1]);//随机码

                //验证验证码信息
                int registerActive = userService.obtainPwdLookbackActive(username, validateNumber);
                model.put("username", DesUtils.getEncString(username));

                if (1 == registerActive) {
                    //验证成功
                    ModelAndView modelAndView = new ModelAndView(new RedirectView("/" + serverContext + "/chapp/userpwdlookback.html"), model);
                    return modelAndView;
                } else if (2 == registerActive) {
                    //验证失效，超过24小时
                    model.put("INFO_KEY", "OUTTIME_PWD_BACK");
                } else if (3 == registerActive) {
                    //已经验证过
                    model.put("INFO_KEY", "USED_PWD_BACK");
                } else {
                    //验证信息有异常
                    model.put("INFO_KEY", "EXCEPTION_PWD_BACK");
                }

            } catch (Exception e) {
                logger.error(e);
                model.put("INFO_KEY", "EXCEPTION_PWD_BACK");
            }
            return new ModelAndView("chapp/userregisterinfo", model);
        }
    }

    public void setServerContext(String serverContext) {
        this.serverContext = serverContext;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
