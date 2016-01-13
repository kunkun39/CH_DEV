package com.changhong.app.web.security;

import com.changhong.app.domain.Auth;
import com.changhong.app.web.application.ApplicationEventPublisher;
import com.changhong.app.web.security.DeveloperSessionRegistryImpl;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Set;

/**
 * User: pengjie
 * Date: 16-1-13
 * Time: 上午9:32
 */
public class SecuritySessionManager {

    private static DeveloperSessionRegistryImpl sessionRegistry;

    public static void init() {
        sessionRegistry = (DeveloperSessionRegistryImpl) ApplicationEventPublisher.getBean("sessionRegistry");
    }

    public static void removeSessionsByUserName(String userName) {
        if (sessionRegistry != null) {
            sessionRegistry.kickOffUser(userName);
        }
    }
}
