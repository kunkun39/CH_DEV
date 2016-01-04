package com.changhong.app.web.controller.admin;

import com.changhong.app.service.SystemService;
import com.changhong.app.web.facade.dto.AdminUserDTO;
import com.changhong.app.web.paging.AdminUserOverviewPaging;
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
 * User: Jack Wang
 * Date: 15-12-24
 * Time: 上午10:37
 */
public class AdminUserManageController extends AbstractController {

    private SystemService systemService;

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();

        int currentPage = ServletRequestUtils.getIntParameter(httpServletRequest, "current", 1);
        String keyWords = StringUtils.trimWhitespace(ServletRequestUtils.getStringParameter(httpServletRequest, "keywords", ""));

        AdminUserOverviewPaging paging = new AdminUserOverviewPaging(systemService);
        constractPaging(paging, currentPage, keyWords);
        List<AdminUserDTO> dtoList = paging.getItems();

        model.put("PAGE_KEY", "ADMIN");
        model.put("paging", paging);
        model.put("adminusers", dtoList);
        model.put("MANAGE_KEY","USERS");

        return new ModelAndView("admin/adminuser", model);
    }

    private void constractPaging(AdminUserOverviewPaging paging, int currentPage, String keyWords) {
        paging.setCurrentPageNumber(currentPage);
        paging.setKeyWords(keyWords);
    }

    public SystemService getSystemService() {
        return systemService;
    }

    public void setSystemService(SystemService systemService) {
        this.systemService = systemService;
    }
}
