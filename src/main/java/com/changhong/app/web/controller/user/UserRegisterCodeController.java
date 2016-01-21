package com.changhong.app.web.controller.user;

import com.changhong.app.utils.RegisterCodeUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * User:wangxiufeng
 * Date:2015/12/28
 * Time:22:48
 */
public class UserRegisterCodeController extends AbstractController {

    private static final Log logger = LogFactory.getLog(UserRegisterCodeController.class);

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        RegisterCodeUtils.create(httpServletRequest, httpServletResponse);
        return null;
    }

    public static boolean validate(HttpServletRequest request, String codeValue) {
        HttpSession session = request.getSession();
        String validateCode = (String) session.getAttribute("validateCode");
        if (!StringUtils.hasText(codeValue) || !StringUtils.hasText(validateCode) || !validateCode.equalsIgnoreCase(codeValue)) {
            if (codeValue == null) {
                codeValue = "";
            }
            if (validateCode == null) {
                validateCode = "";
            }
            logger.error("user input code:" + codeValue + " and system required code:" + validateCode);
            return false;
        }
        return true;
    }

}
