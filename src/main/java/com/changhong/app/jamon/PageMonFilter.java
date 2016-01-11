package com.changhong.app.jamon;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.jamonapi.JAMonFilter;
import com.jamonapi.MonKeyImp;
import com.jamonapi.Monitor;
import com.jamonapi.MonitorFactory;

/**
 * User: Jack Wang
 * Date: 16-1-8
 * Time: 下午2:55
 */
public class PageMonFilter extends JAMonFilter {
    private static final long serialVersionUID = 5746197114960908454L;

    private FilterConfig filterConfig = null;

    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }

    public void destroy() {
        this.filterConfig = null;
    }

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain filterChain) throws IOException, ServletException {
        Monitor allPages = MonitorFactory.start(new MonKeyImp(
                "jammon.webui.allPages", getURI(request), "ms."));
        Monitor monitor = MonitorFactory.start(getURI(request));

        try {
            filterChain.doFilter(request, response);
        } finally {
            monitor.stop();
            allPages.stop();
        }
    }

    protected String getURI(ServletRequest request) {
        if (request instanceof HttpServletRequest) {
            return ((HttpServletRequest) request).getRequestURI();
        } else {
            return "Not an HttpServletRequest";
        }
    }
}
