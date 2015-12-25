package com.changhong.app.web.facade.assember;

import com.changhong.app.domain.AdminUser;
import com.changhong.app.repository.EntityLoadHolder;
import com.changhong.app.web.facade.dto.AdminUserDto;
import org.directwebremoting.annotations.DataTransferObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 15-12-24
 * Time: 下午6:11
 * To change this template use File | Settings | File Templates.
 */
public class AdminUserWebAssember {

    public static AdminUser DtoToDomain(AdminUserDto dto) {
        AdminUser adminUser = null;

        if (dto != null) {
            boolean newClassFlg = true;
            if (dto.getId() > 0) {
                adminUser = (AdminUser) EntityLoadHolder.getUserDao().findById(dto.getId(), AdminUser.class);
                if (adminUser != null) {
                    adminUser.setId(dto.getId());
                    adminUser.setName(dto.getName());
                    adminUser.setUsername(dto.getUsername());
                    adminUser.setPassword(dto.getPassword());
                    adminUser.setContactWay(dto.getContactWay());

                    newClassFlg = false;
                }

                if (newClassFlg) {
                    adminUser = new AdminUser(dto.getName(), dto.getContactWay(), dto.getUsername(), dto.getPassword());
                }
            }
        }

        return adminUser;
    }

    public static AdminUserDto DomainToDto(AdminUser adminUser) {
        AdminUserDto dto = null;

        if (adminUser != null) {
            dto = new AdminUserDto();
            dto.setId(adminUser.getId());
            dto.setName(adminUser.getName());
            dto.setUsername(adminUser.getUsername());
            dto.setPassword(adminUser.getPassword());
            dto.setContactWay(adminUser.getContactWay());
            dto.setEnabled(adminUser.isEnabled());
        }

        return dto;
    }

    public static List<AdminUserDto> DomainToDto(List<AdminUser> adminUserList) {
        List<AdminUserDto> dtoList = new ArrayList<AdminUserDto>();

        for(AdminUser adminUser : adminUserList) {
            dtoList.add(DomainToDto(adminUser));
        }

        return dtoList;
    }
}
