package com.changhong.app.web.application;

import com.changhong.app.utils.StatusManageUtils;
import com.changhong.app.web.security.SecuritySessionManager;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.ApplicationEvent;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

/**
 * User: Jack Wang
 * Date: 14-4-29
 * Time: 下午3:16
 */
@Service("applicationEventPublisher")
public class ApplicationEventPublisher implements ApplicationContextAware, InitializingBean {

    private static ApplicationContext ctx;

    public void afterPropertiesSet() throws Exception {
        Assert.notNull(ctx);
    }

    public static void publishEvent(ApplicationEvent event) {
        if (isRunningInTomcat()) {
            ctx.publishEvent(event);
        }
    }

    public static Object getBean(String beanName) {
        return getCtx().getBean(beanName);
    }

    private static boolean isRunningInTomcat() {
        return ctx != null;
    }

    public static ApplicationContext getCtx() {
        return ctx;
    }

    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        setCtx(applicationContext);
        SecuritySessionManager.init();
        StatusManageUtils.init();
    }

    private void setCtx(ApplicationContext ctx) {
        ApplicationEventPublisher.ctx = ctx;
    }
}
