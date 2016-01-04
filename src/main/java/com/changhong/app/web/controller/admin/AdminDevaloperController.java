package com.changhong.app.web.controller.admin;

import com.changhong.app.service.SystemService;
import com.changhong.app.web.facade.dto.ClientUserDTO;
import com.changhong.app.web.paging.AdminDeveloperOverviewPaging;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * User: pengjie
 * Date: 15-12-25
 * Time: 下午1:38
 */
public class AdminDevaloperController extends AbstractController{

    private SystemService systemService;

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();

        int currentPage = ServletRequestUtils.getIntParameter(httpServletRequest, "current", 1);
        String name = StringUtils.trimWhitespace(ServletRequestUtils.getStringParameter(httpServletRequest, "name", ""));

        AdminDeveloperOverviewPaging paging = new AdminDeveloperOverviewPaging(systemService);
        constractPaging(paging, currentPage, name);
        List<ClientUserDTO> clientUserDTOList = paging.getItems();

        model.put("PAGE_KEY", "ADMIN");
        model.put("paging", paging);
        model.put("users", clientUserDTOList);
        model.put("MANAGE_KEY","DEVELOPER");
        return new ModelAndView("admin/developer", model);
    }

    private void constractPaging(AdminDeveloperOverviewPaging paging, int currentPage, String name) {
        paging.setCurrentPageNumber(currentPage);
        paging.setName(name);
    }

    public SystemService getSystemService() {
        return systemService;
    }

    public void setSystemService(SystemService systemService) {
        this.systemService = systemService;
    }
}
