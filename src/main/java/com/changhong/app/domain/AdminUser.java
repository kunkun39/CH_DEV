package com.changhong.app.domain;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * User: Jack Wang
 * Date: 15-10-15
 * Time: 上午10:55
 */
public class AdminUser extends Auth {

    public AdminUser() {
    }

    public AdminUser(String name, String contactWay, String username, String password) {
        super(name, contactWay, username, password);
    }

    @Override
    public Collection<GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
        GrantedAuthority authority = new GrantedAuthorityImpl("ROLE_ADMIN");
        grantedAuthorities.add(authority);
        return grantedAuthorities;
    }
}
