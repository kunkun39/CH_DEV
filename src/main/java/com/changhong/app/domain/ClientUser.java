package com.changhong.app.domain;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * User: Jack Wang
 * Date: 15-10-19
 * Time: 下午3:43
 */
public class ClientUser extends Auth {

    private boolean active;

    public ClientUser() {
    }

    public ClientUser(String name, String contactWay, String username, String password) {
        super(name, contactWay, username, password);
        this.active = false;
    }

    @Override
    public Collection<GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
        GrantedAuthority authority = new GrantedAuthorityImpl("ROLE_USRE");
        grantedAuthorities.add(authority);
        return grantedAuthorities;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}
