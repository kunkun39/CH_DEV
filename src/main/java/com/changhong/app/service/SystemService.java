package com.changhong.app.service;

import com.changhong.app.domain.AdminUser;
import com.changhong.app.web.facade.dto.AdminUserDto;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 15-12-24
 * Time: 下午5:55
 * To change this template use File | Settings | File Templates.
 */
public interface SystemService {
    List<AdminUserDto> obtainAdminUsers(String keyWords, int startPosition, int pageSize);

    int obtainAdminUserSize(String keyWords);
}
