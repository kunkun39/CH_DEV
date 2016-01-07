package com.changhong.app.web.controller.admin;

import com.changhong.app.exception.CHSecurityException;
import com.changhong.app.service.SystemService;
import com.changhong.app.utils.SecurityUtils;
import com.changhong.app.web.facade.dto.AdminUserDTO;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * User: pengjie
 * Date: 16-1-7
 * Time: 下午4:05
 */
public class AdminUserInfoChangeController extends AbstractController{

    private SystemService systemService;

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        if (!SecurityUtils.isAdminRole()) {
            throw new CHSecurityException("you do not have administrator privileges");
        }
        Map<String, Object> model = new HashMap<String, Object>();
        AdminUserDTO dto = systemService.obtainAdminUserById(SecurityUtils.currectAuthenticationId());
        model.put("user", dto);
        model.put("PAGE_KEY", "ADMIN");
        return new ModelAndView("admin/adminuserinfochange", model);
    }

    public void setSystemService(SystemService systemService) {
        this.systemService = systemService;
    }
}
