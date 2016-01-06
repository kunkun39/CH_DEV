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

        return new ModelAndView("chapp/userregisteremail", model);
    }
}
