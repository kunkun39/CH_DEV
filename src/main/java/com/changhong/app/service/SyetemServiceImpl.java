package com.changhong.app.service;

import com.changhong.app.domain.AdminUser;
import com.changhong.app.repository.UserDao;
import com.changhong.app.web.facade.assember.AdminUserWebAssember;
import com.changhong.app.web.facade.dto.AdminUserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 15-12-25
 * Time: 上午10:27
 * To change this template use File | Settings | File Templates.
 */
@Service("systemService")
public class SyetemServiceImpl implements SystemService {

    @Autowired
    private UserDao userDao;

    public List<AdminUserDto> obtainAdminUsers(String keyWords, int startPosition, int pageSize) {
        List<AdminUser> adminUserList = userDao.loadAdminUsersByNameOrContactway(keyWords, startPosition, pageSize);

        return AdminUserWebAssember.DomainToDto(adminUserList);
    }

    public int obtainAdminUserSize(String keyWords) {
        return userDao.loadAdminUserSizeByNameOrContactway(keyWords);
    }
}
