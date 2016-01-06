package com.changhong.app.web.controller.user;

import com.changhong.app.service.UserService;
import com.changhong.app.utils.DesUtils;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * User:wangxiufeng
 * Date:2016/1/6
 * Time:15:03
 */
public class UserResendMailController extends AbstractController {

    private String serverContext;

    private UserService userService;


    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        String username = ServletRequestUtils.getStringParameter(httpServletRequest, "username", "");
        username = DesUtils.getDesString(username);

        userService.handleClientResendMail(username);

        Map<String, Object> model = new HashMap<String, Object>();
        model.put("username", username);//解密username
        model.put("usernameenc", DesUtils.getEncString(username));//加密username
        return new ModelAndView("chapp/userregisteremail", model);
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setServerContext(String serverContext) {
        this.serverContext = serverContext;
    }
}
