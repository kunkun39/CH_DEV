package com.changhong.app.web.controller.client;

import com.changhong.app.service.UserService;
import com.changhong.app.utils.SecurityUtils;
import com.changhong.app.web.facade.dto.UserPasswordDTO;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * User: Jack Wang
 * Date: 15-10-14
 * Time: 下午2:35
 */
public class ClientChangePassController extends SimpleFormController{
    private UserService userService;

    public ClientChangePassController() {
        setCommandClass(UserPasswordDTO.class);
        setCommandName("userPassword");
        setFormView("client/clientchangepass");
    }

    protected Object formBackingObject(HttpServletRequest request) throws Exception {
        int change = ServletRequestUtils.getIntParameter(request,"change",0);
        request.setAttribute("change",change);
        request.setAttribute("MENU_KEY", "PASS");
        int curUserId = SecurityUtils.currectAuthenticationId();
        return userService.obtainPasswordByUserId(curUserId);
    }

    @Override
    protected void onBindAndValidate(HttpServletRequest request, Object command, BindException errors) throws Exception {
        int userId = ServletRequestUtils.getIntParameter(request,"userId",-1);
        String oldPassword = ServletRequestUtils.getStringParameter(request,"oldPassword","");
        if (!StringUtils.hasText(oldPassword)) {
            //errors.rejectValue("newPasswordAgain","clientuser.oldpassword.empty");
        } else {
            boolean PasswordIsRight = userService.obtainOldPasswordRight(userId,oldPassword);
            if (!PasswordIsRight){
                errors.rejectValue("newPasswordAgain","clientuser.oldpassword.notright");
            }
        }
        if (errors.getFieldError("newPassword") == null){
            String newPassword = ServletRequestUtils.getStringParameter(request,"newPassword","");
            if (!StringUtils.hasText(newPassword)){
               errors.rejectValue("newPasswordAgain","clientuser.password.empty");
            } else {
               if (oldPassword.equals(newPassword)){
                   //errors.rejectValue("newPasswordAgain","clientuser.newoldpassword.same");
               }
            }
        }
        if (errors.getFieldError("newPasswordAgain") == null){
            String newPassword = ServletRequestUtils.getStringParameter(request,"newPassword","");
            String newPasswordAgain = ServletRequestUtils.getStringParameter(request,"newPasswordAgain","");
            if (!StringUtils.hasText(newPassword) || !StringUtils.hasText(newPasswordAgain)){
                errors.rejectValue("newPasswordAgain","clientuser.password.empty");
            } else {
                if (!newPassword.equals(newPasswordAgain)){
                    errors.rejectValue("newPasswordAgain","clientuser.password.notsame");
                }
            }
        }
    }

    @Override
    protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
        UserPasswordDTO userPasswordDTO = (UserPasswordDTO)command;
        userService.changeClientUserPassword(userPasswordDTO.getUserId(),userPasswordDTO.getNewPassword());
        return new ModelAndView(new RedirectView("clientchangepass.html?change=1"));
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
