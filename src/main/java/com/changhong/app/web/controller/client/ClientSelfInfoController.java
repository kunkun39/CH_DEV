package com.changhong.app.web.controller.client;

import com.changhong.app.domain.Auth;
import com.changhong.app.exception.CHSecurityException;
import com.changhong.app.service.UserService;
import com.changhong.app.utils.SecurityUtils;
import com.changhong.app.web.facade.dto.AdminUserDTO;
import com.changhong.app.web.facade.dto.ClientUserDTO;
import org.springframework.util.StringUtils;
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
 * User: Jack Wang
 * Date: 15-10-14
 * Time: 下午2:35
 */
public class ClientSelfInfoController extends SimpleFormController {
    private UserService userService;
    private String serverContext;


    public ClientSelfInfoController() {
        setCommandClass(ClientUserDTO.class);
        setCommandName("clientSelfInfo");
        setFormView("client/clientselfinfo");
    }

    @Override
    protected Object formBackingObject(HttpServletRequest request) throws Exception {
        int userId = SecurityUtils.currectAuthenticationId();
        int message = ServletRequestUtils.getIntParameter(request, "message", -1);

        request.setAttribute("message", message);
        request.setAttribute("MENU_KEY", "INFO");
        return userService.obtainClientUserById(userId);
    }

    @Override
    protected void onBindAndValidate(HttpServletRequest request, Object command, BindException errors) throws Exception {
    }

    @Override
    protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
        ClientUserDTO clientUserDTO = (ClientUserDTO) command;
        userService.changeClientInformation(clientUserDTO);

        Auth auth = SecurityUtils.currentAuthentication();
        auth.setName(clientUserDTO.getName());

        Map<String, Object> model = new HashMap<String, Object>();
        model.put("message", 1);

        return new ModelAndView(new RedirectView("/" + serverContext + "/security/clientselfinfo.html"), model);
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setServerContext(String serverContext) {
        this.serverContext = serverContext;
    }
}
