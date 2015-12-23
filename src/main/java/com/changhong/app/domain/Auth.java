package com.changhong.app.domain;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * User: Jack Wang
 * Date: 15-10-15
 * Time: 下午1:22
 */
public class Auth extends EntityBase implements UserDetails {

    protected String name;
    protected String contactWay;

    protected String username;
    protected String password;
    protected boolean enabled = true;

    public Auth() {
    }

    public Auth(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public Auth(String name, String contactWay, String username, String password) {
        this.name = name;
        this.contactWay = contactWay;
        this.username = username;
        this.password = password;
        this.enabled = true;
    }

    /*************************************************GETTER**********************************************************/

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContactWay() {
        return contactWay;
    }

    public void setContactWay(String contactWay) {
        this.contactWay = contactWay;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public boolean isAccountNonExpired() {
        return true;
    }

    public boolean isAccountNonLocked() {
        return true;
    }

    public boolean isCredentialsNonExpired() {
        return true;
    }

    public Collection<GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
        GrantedAuthority authority = new GrantedAuthorityImpl("ROLE_ADMIN");
        grantedAuthorities.add(authority);
        return grantedAuthorities;
    }

}
