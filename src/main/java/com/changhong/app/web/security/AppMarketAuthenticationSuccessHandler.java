package com.changhong.app.web.security;

import com.changhong.app.utils.SecurityUtils;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * User: Jack Wang
 * Date: 15-10-15
 * Time: 下午3:09
 */
public class AppMarketAuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    private String adminTargetUrl;

    private String clientTargetUrl;

    @Override
    protected String determineTargetUrl(HttpServletRequest request, HttpServletResponse response) {
        String role = SecurityUtils.currentAuthenticationRole();

        if ("ROLE_ADMIN".equals(role)) {
            return adminTargetUrl;
        }

        return clientTargetUrl;
    }

    public void setAdminTargetUrl(String adminTargetUrl) {
        this.adminTargetUrl = adminTargetUrl;
    }

    public void setClientTargetUrl(String clientTargetUrl) {
        this.clientTargetUrl = clientTargetUrl;
    }
}
