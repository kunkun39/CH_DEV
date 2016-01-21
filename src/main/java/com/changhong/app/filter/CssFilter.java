package com.changhong.app.filter;

import org.springframework.util.StringUtils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * User: dangwei.pan
 * Date: 16-1-13
 * Time: 下午3:30
 */
public class CssFilter implements Filter {

    private Boolean applicationLive = null;

    private String resourcePath = null;

    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void destroy() {
    }

    public String getProperties(String key) {
        InputStream inputStream = getClass().getResourceAsStream("/application.properties");
        Properties properties = new Properties();
        try {
            properties.load(inputStream);
        } catch (IOException e1) {
            e1.printStackTrace();
        }
        return properties.getProperty(key);
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest hRequest = (HttpServletRequest) request;
        HttpServletResponse hResponse = (HttpServletResponse) response;
        HttpSession httpSession = hRequest.getSession();

        if (applicationLive == null) {
            applicationLive = Boolean.valueOf(getProperties("application.live"));
        }
        if (!StringUtils.hasText(resourcePath)) {
            resourcePath = getProperties("application.static.resource.path");
        }
        httpSession.setAttribute("APPLICATION_LIVE", applicationLive);
        httpSession.setAttribute("RESOURCE_PATH", resourcePath);
        //将控制器传向下一个filter
        chain.doFilter(hRequest, hResponse);
    }
}
