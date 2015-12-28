package com.changhong.app.web.paging;

import com.changhong.app.service.SystemService;
import com.changhong.app.web.facade.dto.AdminUserDTO;

import java.util.List;

/**
 * User: Jack Wang
 * Date: 15-12-25
 * Time: 上午10:11
 */
public class AdminUserOverviewPaging extends AbstractPaging<AdminUserDTO>{

    private SystemService systemService;

    private String keyWords;

    public AdminUserOverviewPaging(SystemService systemService) {
        this.systemService = systemService;
    }
    @Override
    public List<AdminUserDTO> getItems() {
        return systemService.obtainAdminUsers(keyWords, getStartPosition(), getPageSize());
    }

    @Override
    public long getTotalItemSize() {
        if (totalItemSize < 0) {
            totalItemSize = systemService.obtainAdminUserSize(keyWords);
        }

        return totalItemSize;
    }

    public String getParameterValues() {
        return "&keywords=" + getKeyWords();
    }

    public String getKeyWords() {
        return keyWords;
    }

    public void setKeyWords(String keyWords) {
        this.keyWords = keyWords;
    }
}
