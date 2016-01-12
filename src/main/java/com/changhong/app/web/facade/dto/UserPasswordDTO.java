package com.changhong.app.web.facade.dto;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: xiaobo
 * Date: 16-1-6
 * Time: 下午1:30
 * To change this template use File | Settings | File Templates.
 */
public class UserPasswordDTO implements Serializable{
    private int userId;
    private String username;
    private String oldPassword;
    private String newPassword;
    private String newPasswordAgain;

    public UserPasswordDTO() {
    }

    public UserPasswordDTO(int id, String username, String password) {
        this.userId = id;
        this.username = username;
        this.oldPassword = password;
    }


    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getNewPasswordAgain() {
        return newPasswordAgain;
    }

    public void setNewPasswordAgain(String newPasswordAgain) {
        this.newPasswordAgain = newPasswordAgain;
    }
}
