package com.changhong.app.repository;

import com.changhong.app.domain.AdminUser;
import com.changhong.app.domain.ClientUser;
import com.changhong.app.domain.RegisterConfirm;
import com.changhong.app.web.facade.dto.ClientUserDTO;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.List;

/**
 * User: Jack Wang
 * Date: 15-10-15
 * Time: 上午10:38
 */
public interface UserDao extends EntityObjectDao {

    UserDetails findUserByName(String username);

    List<AdminUser> loadAdminUsersByNameOrContactway(String keyWords, int startPosition, int pageSize);

    int loadAdminUserSizeByNameOrContactway(String keyWords);

    List<ClientUser> loadAdminDevelopers(String name, int startPosition, int pageSize);

    int loadAdminDeveloperSize(String name);

    List<AdminUser> loadAdminUserByName(String userName);

    /**
     * 用户是否存在
     *
     * @param username 用户名
     * @return
     */
    public boolean loadClientUserExist(String username);

    boolean loadClientUserEnable(String username);
    /**
     * 通过用户名获取用户信息
     */
    ClientUser loadClientUser(String username);

    RegisterConfirm loadClientUserRegisterConfirm(String validateNumber);

    RegisterConfirm loadRegisterConfirmByUsername(String username);
    /**
     * 更新密码
     * @param username
     * @param newPassword
     */
    void updateUserPassword(String username, String newPassword);


}
