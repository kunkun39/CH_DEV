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
import java.util.HashMap;
import java.util.Map;

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
        setFormView("/chapp/userregister");
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

    }

    @Override
    protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {

        ClientUserDTO clientUserDTO = (ClientUserDTO) command;
        userService.changeClientUserDetails(clientUserDTO);

        Map<String, Object> model = new HashMap<String, Object>();
        model.put("usernamenormal", clientUserDTO.getUsername());//未加密用户名
        model.put("mailtype", 0);//邮件类型 0表示注册
        model.put("isresend", false);//邮件是否是重新发送

        ModelAndView modelAndView = new ModelAndView(new RedirectView("/" + serverContext + "/chapp/usermailsend.html"),model);

        return modelAndView;
    }

    public void setServerContext(String serverContext) {
        this.serverContext = serverContext;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
