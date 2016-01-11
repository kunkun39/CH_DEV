package com.changhong.app.web.controller.user;

import com.changhong.app.service.UserService;
import com.changhong.app.utils.DesUtils;
import com.changhong.app.web.facade.dto.ClientUserDTO;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.logging.Log;
import org.springframework.validation.BindException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * User:wangxiufeng
 * Date:2016/1/8
 * Time:22:50
 */
public class UserPwdLookBackController extends SimpleFormController {

    private static final Log log = LogFactory.getLog(UserPwdLookBackController.class);

    String serverContext;

    UserService userService;

    public UserPwdLookBackController() {
        setCommandClass(ClientUserDTO.class);
        setCommandName("user");
        setFormView("/chapp/userpwdlookback");
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
        ClientUserDTO clientUserDTO = new ClientUserDTO();
        String username = ServletRequestUtils.getStringParameter(request, "username", "");
        clientUserDTO.setUsername(DesUtils.getDesString(username));
        return clientUserDTO;
    }

    @Override
    protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
        ClientUserDTO clientUserDTO = (ClientUserDTO) command;
        String username = DesUtils.getDesString(clientUserDTO.getUsername());
        userService.updateUserPassword(username, clientUserDTO.getPassword());

        Map<String, Object> model = new HashMap<String, Object>();
        model.put("username", username);
        model.put("INFO_KEY", "OK_PWD_BACK");

        return new ModelAndView("chapp/userregisterinfo", model);
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setServerContext(String serverContext) {
        this.serverContext = serverContext;
    }
}
