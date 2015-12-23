package com.changhong.app.repository;

import com.changhong.app.domain.AdminUser;
import com.changhong.app.domain.ClientUser;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.List;

/**
 * User: Jack Wang
 * Date: 15-10-15
 * Time: 上午10:38
 */
public interface UserDao extends EntityObjectDao {

    UserDetails findUserByName(String username);

    List<AdminUser> loadAdminUsers(String name, int startPosition, int pageSize);

    int loadAdminUserSize(String name);

    List<ClientUser> loadAdminDevelopers(String name, int startPosition, int pageSize);

    int loadAdminDeveloperSize(String name);

}
