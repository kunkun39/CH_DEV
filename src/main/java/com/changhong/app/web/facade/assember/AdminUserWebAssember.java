package com.changhong.app.web.facade.assember;

import com.changhong.app.domain.AdminUser;
import com.changhong.app.repository.EntityLoadHolder;
import com.changhong.app.web.facade.dto.AdminUserDTO;

import java.util.ArrayList;
import java.util.List;

/**
 * User: Jack Wang
 * Date: 15-12-24
 * Time: 下午6:11
 */
public class AdminUserWebAssember {

    public static AdminUser DtoToDomain(AdminUserDTO dto) {
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
            }

            if (newClassFlg) {
                adminUser = new AdminUser(dto.getName(), dto.getContactWay(), dto.getUsername(), dto.getPassword());
            }
        }

        return adminUser;
    }

    public static AdminUserDTO DomainToDto(AdminUser adminUser) {
        AdminUserDTO dto = null;

        if (adminUser != null) {
            dto = new AdminUserDTO();
            dto.setId(adminUser.getId());
            dto.setName(adminUser.getName());
            dto.setUsername(adminUser.getUsername());
            dto.setPassword(adminUser.getPassword());
            dto.setContactWay(adminUser.getContactWay());
            dto.setEnabled(adminUser.isEnabled());
        }

        return dto;
    }

    public static List<AdminUserDTO> DomainToDto(List<AdminUser> adminUserList) {
        List<AdminUserDTO> dtoList = new ArrayList<AdminUserDTO>();

        for(AdminUser adminUser : adminUserList) {
            dtoList.add(DomainToDto(adminUser));
        }

        return dtoList;
    }
}
