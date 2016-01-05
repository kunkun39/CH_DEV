package com.changhong.app.web.facade.dto;

import java.io.Serializable;

/**
 * User: Jack Wang
 * Date: 15-12-28
 * Time: 上午9:38
 */
public class ClientUserDTO implements Serializable {

    private int id;

    private String name;

    private String contactWay;

    private String username;

    private String password;

    private String passwordAgain;//密码确认

    private boolean agreeCondition;

    private String registerCode;

    private boolean enabled;

    private boolean active;

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

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getPasswordAgain() {
        return passwordAgain;
    }

    public void setPasswordAgain(String passwordAgain) {
        this.passwordAgain = passwordAgain;
    }

    public boolean isAgreeCondition() {
        return agreeCondition;
    }

    public void setAgreeCondition(boolean agreeCondition) {
        this.agreeCondition = agreeCondition;
    }

    public String getRegisterCode() {
        return registerCode;
    }

    public void setRegisterCode(String registerCode) {
        this.registerCode = registerCode;
    }
}
