package com.changhong.app.domain;

import com.changhong.app.utils.CHStringUtils;

/**
 * User: Jack Wang
 * Date: 15-10-19
 * Time: 下午5:40
 */
public class RegisterConfirm extends EntityBase {

    private String  validateNumber;

    private boolean validateConfirm;

    private String username;

    public RegisterConfirm() {
    }

    public RegisterConfirm(String username) {
        this.validateNumber = CHStringUtils.getRandomString(10);
        this.validateConfirm = false;
        this.username = username;
    }

    public String getValidateNumber() {
        return validateNumber;
    }

    public void setValidateNumber(String validateNumber) {
        this.validateNumber = validateNumber;
    }

    public boolean isValidateConfirm() {
        return validateConfirm;
    }

    public void setValidateConfirm(boolean validateConfirm) {
        this.validateConfirm = validateConfirm;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
