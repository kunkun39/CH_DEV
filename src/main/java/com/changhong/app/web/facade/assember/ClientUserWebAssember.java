package com.changhong.app.web.facade.assember;

import com.changhong.app.domain.Auth;
import com.changhong.app.domain.ClientUser;
import com.changhong.app.repository.EntityLoadHolder;
import com.changhong.app.web.facade.dto.ClientUserDTO;
import com.changhong.app.web.facade.dto.UserPasswordDTO;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 15-12-28
 * Time: 上午9:17
 * To change this template use File | Settings | File Templates.
 */
public class ClientUserWebAssember {

    public static ClientUser DtoToDomain(ClientUserDTO dto) {
        ClientUser clientUser = null;

        if (dto != null) {
            boolean newClassFlg = true;
            if (dto.getId() > 0) {
                clientUser = (ClientUser) EntityLoadHolder.getUserDao().findById(dto.getId(), ClientUser.class);
                if (clientUser != null) {
                    clientUser.setId(dto.getId());
                    clientUser.setName(dto.getName());
                    clientUser.setUsername(dto.getUsername());
                    clientUser.setPassword(dto.getPassword());
                    clientUser.setContactWay(dto.getContactWay());
                    clientUser.setActive(dto.isActive());
                    clientUser.setEnabled(dto.isEnabled());

                    newClassFlg = false;
                }
            }

            if (newClassFlg) {
                clientUser = new ClientUser(dto.getName(), dto.getContactWay(), dto.getUsername(), dto.getPassword());
            }
        }

        return clientUser;
    }

    public static ClientUserDTO DomainToDto(ClientUser clientUser) {
        ClientUserDTO dto = null;

        if (clientUser != null) {
            dto = new ClientUserDTO();
            dto.setId(clientUser.getId());
            dto.setName(clientUser.getName());
            dto.setContactWay(clientUser.getContactWay());
            dto.setUsername(clientUser.getUsername());
            dto.setPassword(clientUser.getPassword());
            dto.setActive(clientUser.isActive());
            dto.setEnabled(clientUser.isEnabled());
        }

        return dto;
    }

    public static List<ClientUserDTO> DomainToDto(List<ClientUser> clientUserList) {
        List<ClientUserDTO> dtoList = new ArrayList<ClientUserDTO>();

        for (ClientUser clientUser : clientUserList) {
            dtoList.add(DomainToDto(clientUser));
        }

        return dtoList;
    }


     public static UserPasswordDTO toPasswordDTO(ClientUser clientUser) {
        int id = clientUser.getId();
        String username = clientUser.getUsername();
        return new UserPasswordDTO(id,username);
    }
}
