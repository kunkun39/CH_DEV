package com.changhong.app.service;

import com.changhong.app.web.facade.dto.ClientUserDTO;
//import com.changhong.app.web.facade.dto.UserPasswordDTO;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * User: Jack Wang
 * Date: 15-10-15
 * Time: 上午9:46
 */
public interface UserService extends UserDetailsService {

    /*User Register and Login Part Part***************************************************************/

    boolean obtainClientUserExist(String username);

    ClientUserDTO obtainClientUserById(int clientId);

    void changeClientUserDetails(ClientUserDTO userDTO);

    int obtainClientUserRegisterActive(String username, String validateNumber);

    int obtainPwdLookbackActive(String username, String validateNumber);

    void handleClientResendMail(String username);

    void handlePwdLookBackSendMail(String username);

    void updateUserPassword(String username, String newPassword);

//    UserPasswordDTO obtainPasswordByUserId(int userId);

    boolean obtainOldPasswordRight(int userId, String oldPassword);

    void changeClientUserPassword(int userId, String newPassword);

    //change contact information
    public void changeClientInformation(ClientUserDTO userDTO);
}
