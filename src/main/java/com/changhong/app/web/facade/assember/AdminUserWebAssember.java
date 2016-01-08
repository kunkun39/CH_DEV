package com.changhong.app.web.facade.assember;

import com.changhong.app.domain.AdminUser;
import com.changhong.app.domain.Auth;
import com.changhong.app.repository.EntityLoadHolder;
import com.changhong.app.web.facade.dto.AdminUserDTO;
import com.changhong.app.web.facade.dto.UserPasswordDTO;

import java.util.ArrayList;
import java.util.List;

/**
 * User: Jack Wang
 * Date: 15-12-24
 * Time: 下午6:11
 */
public class AdminUserWebAssember {

    public static AdminUser toAdminUserDomain(AdminUserDTO dto) {
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

    public static AdminUserDTO toAdminUserDTO(AdminUser adminUser) {
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

    public static List<AdminUserDTO> toAdminUserDTO(List<AdminUser> adminUserList) {
        List<AdminUserDTO> dtoList = new ArrayList<AdminUserDTO>();

        for(AdminUser adminUser : adminUserList) {
            dtoList.add(toAdminUserDTO(adminUser));
        }

        return dtoList;
    }


    public static UserPasswordDTO toPasswordDTO(Auth auth) {
        int id = auth.getId();
        String username = auth.getUsername();
        return new UserPasswordDTO(id,username);
    }
}
