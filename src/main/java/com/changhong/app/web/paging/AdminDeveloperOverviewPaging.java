package com.changhong.app.web.paging;

import com.changhong.app.service.SystemService;
import com.changhong.app.web.facade.dto.ClientUserDTO;

import java.util.List;

/**
 * User: pengjie
 * Date: 15-12-28
 * Time: 上午11:54
 */
public class AdminDeveloperOverviewPaging extends AbstractPaging<ClientUserDTO>{

    private SystemService systemService;

    private String name;

    public AdminDeveloperOverviewPaging(SystemService systemService) {
        this.systemService = systemService;
    }

    @Override
    public List<ClientUserDTO> getItems() {
        return systemService.obtainClientUsers(name, getStartPosition(), getPageSize());
    }

    @Override
    public long getTotalItemSize() {
        if (totalItemSize < 0) {
            totalItemSize = systemService.ObtainClientUserSize(name);
        }

        return totalItemSize;
    }

    public String getParameterValues() {
        return "&name=" + name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
