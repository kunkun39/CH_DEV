package com.changhong.app.web.facade.dto;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 15-12-24
 * Time: 下午6:04
 * To change this template use File | Settings | File Templates.
 */
public class AdminUserDto {
    private int id;

    private String name;

    private String contactWay;

    private String username;

    private String password;

    private boolean enabled;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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
}
