package com.changhong.app.web.controller.user;

import com.changhong.app.service.ClientService;
import com.changhong.app.service.UserService;
import com.changhong.app.utils.DesUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * 注册后注册状态控制器
 * User:wangxiufeng
 * Date:2016/1/6
 * Time:14:34
 */
public class UserRegisterActiveController extends AbstractController {


    private static final Log logger = LogFactory.getLog(UserRegisterActiveController.class);

    public UserService userService;

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        {
            Map<String, Object> model = new HashMap<String, Object>();

            try {
                String validation = ServletRequestUtils.getStringParameter(httpServletRequest, "a", "");//a代表邮件验证返回传递参数 sendMail||validateNumber
                String[] tokens = StringUtils.delimitedListToStringArray(validation, "||");
                String username = DesUtils.getDesString(tokens[0]);//用户注册邮箱
                String validateNumber = DesUtils.getDesString(tokens[1]);//随机码

                //验证注册信息
                int registerActive = userService.obtainClientUserRegisterActive(username, validateNumber);

                model.put("username", tokens[0]);

                if (1 == registerActive) {
                    //注册成功
                    model.put("INFO_KEY", "OK");
                } else if (2 == registerActive) {
                    //验证失效，超过24小时
                    model.put("INFO_KEY", "OUTTIME_REGISTER");
                } else if (3 == registerActive) {
                    //已经验证过
                    model.put("INFO_KEY", "USED_REGISTER");
                } else {
                    //验证信息有异常
                    model.put("INFO_KEY", "EXCEPTION_REGISTER");
                }

            } catch (Exception e) {
                logger.error(e);
                model.put("INFO_KEY", "EXCEPTION_REGISTER");
            }
            return new ModelAndView("chapp/userregisterinfo", model);
        }
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
