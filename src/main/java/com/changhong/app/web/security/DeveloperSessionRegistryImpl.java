package com.changhong.app.web.security;

import com.changhong.app.domain.Auth;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationListener;
import org.springframework.security.core.session.SessionDestroyedEvent;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

import java.util.*;


/**
 * User: pengjie
 * Date: 16-1-12
 * Time: 下午7:57
 */
public class DeveloperSessionRegistryImpl implements SessionRegistry, ApplicationListener<SessionDestroyedEvent> {

    //~ Instance fields ================================================================================================

    protected final Log logger = LogFactory.getLog(DeveloperSessionRegistryImpl.class);

    /** <principal:Object,SessionIdSet> */
    private final Map<Object,Set<String>> principals = Collections.synchronizedMap(new HashMap<Object, Set<String>>());
    /** <sessionId:Object,SessionInformation> */
    private final Map<String, SessionInformation> sessionIds = Collections.synchronizedMap(new HashMap<String, SessionInformation>());

    //~ Methods ========================================================================================================

    public List<Object> getAllPrincipals() {
        logger.debug("getAllPrincipals");
        return Arrays.asList(principals.keySet().toArray());
    }

    public List<SessionInformation> getAllSessions(Object principal, boolean includeExpiredSessions) {
        logger.debug("getAllSessions");
        final Set<String> sessionsUsedByPrincipal = principals.get(principal);

        if (sessionsUsedByPrincipal == null) {
            return Collections.emptyList();
        }

        List<SessionInformation> list = new ArrayList<SessionInformation>(sessionsUsedByPrincipal.size());

        synchronized (sessionsUsedByPrincipal) {
            for (String sessionId : sessionsUsedByPrincipal) {
                SessionInformation sessionInformation = getSessionInformation(sessionId);

                if (sessionInformation == null) {
                    continue;
                }

                if (includeExpiredSessions || !sessionInformation.isExpired()) {
                    list.add(sessionInformation);
                }
            }
        }

        return list;
    }

    public SessionInformation getSessionInformation(String sessionId) {
        logger.debug("getSessionInformation");
        Assert.hasText(sessionId, "SessionId required as per interface contract");

        return (SessionInformation) sessionIds.get(sessionId);
    }

    public void onApplicationEvent(SessionDestroyedEvent event) {
        logger.debug("onApplicationEvent");
        String sessionId = event.getId();
        removeSessionInformation(sessionId);
    }

    public void refreshLastRequest(String sessionId) {
        logger.debug("refreshLastRequest");
        Assert.hasText(sessionId, "SessionId required as per interface contract");

        SessionInformation info = getSessionInformation(sessionId);

        if (info != null) {
            info.refreshLastRequest();
        }
    }

    public synchronized void registerNewSession(String sessionId, Object principal) {
        logger.debug("registerNewSession");
        Assert.hasText(sessionId, "SessionId required as per interface contract");
        Assert.notNull(principal, "Principal required as per interface contract");

        if (logger.isDebugEnabled()) {
            logger.debug("Registering session " + sessionId +", for principal " + principal);
        }

        if (getSessionInformation(sessionId) != null) {
            removeSessionInformation(sessionId);
        }

        sessionIds.put(sessionId, new SessionInformation(principal, sessionId, new Date()));

        Set<String> sessionsUsedByPrincipal = principals.get(principal);

        if (sessionsUsedByPrincipal == null) {
            sessionsUsedByPrincipal = Collections.synchronizedSet(new HashSet<String>(4));
            principals.put(principal, sessionsUsedByPrincipal);
        }

        sessionsUsedByPrincipal.add(sessionId);

        if (logger.isTraceEnabled()) {
            logger.trace("Sessions used by '" + principal + "' : " + sessionsUsedByPrincipal);
        }
    }

    public void removeSessionInformation(String sessionId) {
        logger.debug("removeSessionInformation");
        Assert.hasText(sessionId, "SessionId required as per interface contract");

        SessionInformation info = getSessionInformation(sessionId);

        if (info == null) {
            return;
        }

        if (logger.isTraceEnabled()) {
            logger.debug("Removing session " + sessionId + " from set of registered sessions");
        }

        sessionIds.remove(sessionId);

        Set<String> sessionsUsedByPrincipal = principals.get(info.getPrincipal());

        if (sessionsUsedByPrincipal == null) {
            return;
        }

        if (logger.isDebugEnabled()) {
            logger.debug("Removing session " + sessionId + " from principal's set of registered sessions");
        }

        synchronized (sessionsUsedByPrincipal) {
            sessionsUsedByPrincipal.remove(sessionId);

            if (sessionsUsedByPrincipal.size() == 0) {
                // No need to keep object in principals Map anymore
                if (logger.isDebugEnabled()) {
                    logger.debug("Removing principal " + info.getPrincipal() + " from registry");
                }
                principals.remove(info.getPrincipal());
            }
        }

        if (logger.isTraceEnabled()) {
            logger.trace("Sessions used by '" + info.getPrincipal() + "' : " + sessionsUsedByPrincipal);
        }
    }

    public Set<String> getSessionId(Object key) {
        return principals.get(key);
    }

    public void kickOffUser(String userName) {
        if (StringUtils.hasText(userName)) {
            Set<String> set = null;
            List<Object> userList = getAllPrincipals();
            for (Object user : userList) {
                if (userName.equals(((Auth) user).getUsername())) {
                    set = getSessionId(user);
                    break;
                }
            }
            if (set != null) {
                for (String sessionId : set) {
                    SessionInformation sessionInformation = sessionIds.get(sessionId);
                    sessionInformation.expireNow();
                }
            }
        }
    }
}
