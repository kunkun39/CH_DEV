package com.changhong.app.utils;

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
public class SessionUtils {

    private static DeveloperSessionRegistryImpl sessionRegistry;

    public static void init() {
        sessionRegistry = (DeveloperSessionRegistryImpl) ApplicationEventPublisher.getBean("sessionRegistry");
    }

    public static void removeSessionsByUserName(String userName) {
        if (sessionRegistry != null && StringUtils.hasText(userName)) {
            Set<String> set = null;
            List<Object> userList = sessionRegistry.getAllPrincipals();
            for (Object user : userList) {
                if (userName.equals(((Auth) user).getUsername())) {
                    set = sessionRegistry.getSessionId(user);
                    break;
                }
            }
            if (set != null) {
                for (String sessionId : set) {
                    sessionRegistry.removeSessionInformation(sessionId);
                }
            }
        }
    }
}
