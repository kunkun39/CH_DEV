package com.changhong.app.service;

import com.changhong.app.domain.AdminUser;
import com.changhong.app.domain.Auth;
import com.changhong.app.domain.ClientUser;
import com.changhong.app.domain.RegisterConfirm;
import com.changhong.app.repository.ClientDao;
import com.changhong.app.repository.UserDao;
import com.changhong.app.thread.ApplicationThreadPool;
import com.changhong.app.utils.SecurityUtils;
import com.changhong.app.web.facade.dto.ClientUserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * User: Jack Wang
 * Date: 15-10-15
 * Time: 上午10:36
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private ClientDao clientDao;

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
        return userDao.findUserByName(username);
    }

    @Override
    public boolean obtainClientUserExist(String username) {
        return false;
    }

    @Override
    public ClientUserDTO obtainClientUserById(int clientId) {
        return null;
    }

    @Override
    public void changeClientUserDetails(ClientUserDTO userDTO) {

    }

    /*User Register and Login Part Part***************************************************************/

//    public boolean obtainClientUserExist(String username) {
//        return clientDao.loadClientUserExist(username);
//    }
//
//    public ClientUserDTO obtainClientUserById(int clientId) {
//        ClientUser clientUser = (ClientUser) clientDao.findById(clientId, ClientUser.class);
//        return ClientUserAssember.toClientUserDTO(clientUser);
//    }
//
//    public void changeClientUserDetails(ClientUserDTO userDTO) {
//        //save user
//        ClientUser user = ClientUserAssember.toClientUserRegisterDomain(userDTO);
//        clientDao.saveOrUpdate(user);
//
//        //save validation
//        RegisterConfirm confirm = new RegisterConfirm(user.getUsername());
//        clientDao.saveOrUpdate(confirm);
//
//        //send email out or send message out
//        ClientRegisterSendThread send = new ClientRegisterSendThread(user.getUsername(), confirm);
//        ApplicationThreadPool.executeThread(send);
//    }
//
//    public int obtainClientUserRegisterActive(String username, String validateNumber) {
//        RegisterConfirm confirm = clientDao.loadClientUserRegisterConfirm(validateNumber);
//        if (confirm != null) {
//            long nowTime = new Date().getTime();
//            long registerTime = confirm.getTimestamp().getTime();
//            confirm.setValidateConfirm(true);
//
//            if((registerTime + TWO_FOUR_HOUR) >= nowTime) {
//                ClientUser user = clientDao.loadClientUser(username);
//                if (user != null) {
//                    user.setActive(true);
//                }
//                return 1;
//            } else {
//                return 2;
//            }
//        }
//        return 3;
//    }

}
