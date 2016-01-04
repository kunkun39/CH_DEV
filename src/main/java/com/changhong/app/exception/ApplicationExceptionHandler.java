package com.changhong.app.exception;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * User: Jack Wang
 * Date: 14-4-24
 * Time: 上午9:24
 */
public class ApplicationExceptionHandler implements HandlerExceptionResolver {

    private Logger logger = Logger.getLogger(ApplicationExceptionHandler.class);

	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object obj, Exception ex) {
		logger.error("Catch Exception : ", ex);
        request.setAttribute("PAGE_KEY", "INDEX");

        if (ex instanceof CHSecurityException) {
            return new ModelAndView("security");
        }

        return new ModelAndView("error.html");
	}
}
