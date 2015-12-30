package com.changhong.app.web.controller.admin;

import com.changhong.app.service.SystemService;
import com.changhong.app.web.facade.dto.AdminUserDTO;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * User: pengjie
 * Date: 15-12-28
 * Time: 下午6:45
 */
public class AdminUserAddController extends SimpleFormController {

    private SystemService systemService;

    private String serverContext;

    public AdminUserAddController() {
        setCommandClass(AdminUserDTO.class);
        setCommandName("adminUser");
        setFormView("admin/adminuseradd");
    }
    @Override
    protected Object formBackingObject(HttpServletRequest request) throws Exception {
        return new AdminUserDTO();
    }

    @Override
    protected void onBindAndValidate(HttpServletRequest request, Object command, BindException errors) throws Exception {

    }

    @Override
    protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
        AdminUserDTO dto = (AdminUserDTO) command;
        if (StringUtils.hasText(dto.getUsername()) && StringUtils.hasText(dto.getPassword())) {
            systemService.insertAdminUser(dto);
        }
        return new ModelAndView(new RedirectView("/" + serverContext + "/security/adminusers.html"));
    }

    public SystemService getSystemService() {
        return systemService;
    }

    public void setSystemService(SystemService systemService) {
        this.systemService = systemService;
    }

    public String getServerContext() {
        return serverContext;
    }

    public void setServerContext(String serverContext) {
        this.serverContext = serverContext;
    }
}
