package com.changhong.app.web.controller.user;

import com.changhong.app.domain.ClientUser;
import com.changhong.app.service.ClientService;
import com.changhong.app.service.UserService;
import com.changhong.app.utils.ValidatorUtils;
import com.changhong.app.web.facade.dto.ClientUserDTO;
import org.springframework.validation.BindException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * User:wangxiufeng
 * Date:2015/12/28
 * Time:11:35
 */
public class UserRegisterController extends SimpleFormController {

    private String serverContext;

    private UserService userService;

    public UserRegisterController() {
        setCommandClass(ClientUserDTO.class);
        setCommandName("user");
        setFormView("/chapp/register");
    }

    /**
     * 调用该方法创建一个command对象实例
     *
     * @param request
     * @return command对象实例
     * @throws Exception
     */
    @Override
    protected Object formBackingObject(HttpServletRequest request) throws Exception {
        return new ClientUserDTO();
    }

    /**
     * 自定义数据绑定和校验处理
     *
     * @param request
     * @param command
     * @param errors
     * @throws Exception
     */
    @Override
    protected void onBindAndValidate(HttpServletRequest request, Object command, BindException errors) throws Exception {
        super.onBindAndValidate(request, command, errors);
        String username = ServletRequestUtils.getStringParameter(request, "username", "");

        if (!ValidatorUtils.isValidEmail(username)) {
            errors.rejectValue("username", "client.username.formatnot");
        } else if (userService.obtainClientUserExist(username)) {
            errors.rejectValue("username", "client.username.duplicate");
        }

        String password = ServletRequestUtils.getStringParameter(request, "password", "-1");
        String passwordAgain = ServletRequestUtils.getStringParameter(request, "passwordAgain", "-2");
        if (!password.equals(passwordAgain)) {
            errors.rejectValue("passwordAgain", "client.password.notsame");
        }

        //验证码是否正确
        String registerCode = ServletRequestUtils.getStringParameter(request, "registerCode", "");
        if (!UserRegisterCodeController.validate(request, registerCode)) {
            errors.rejectValue("registerCode", "client.code.notright");
        }
    }

    @Override
    protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {

        ClientUserDTO clientUserDTO = (ClientUserDTO) command;
        userService.changeClientUserDetails(clientUserDTO);

        ModelAndView modelAndView = new ModelAndView(new RedirectView("/" + serverContext + "/security/clientregisterinfo.html"));
        return modelAndView;
    }

    public void setServerContext(String serverContext) {
        this.serverContext = serverContext;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
