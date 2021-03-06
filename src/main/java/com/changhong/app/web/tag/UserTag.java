package com.changhong.app.web.tag;


import com.changhong.app.domain.Auth;
import com.changhong.app.utils.SecurityUtils;
import com.opensymphony.oscache.util.StringUtil;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

/**
 * User: Jack Wang
 * Date: 14-4-9
 * Time: 上午11:35
 */
public class UserTag extends TagSupport {

    private String context;

    @Override
    public int doStartTag() throws JspException {
        String user = generateUserInfo();
        try {
            writeMessage(user);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return EVAL_BODY_INCLUDE;
    }

    protected String generateUserInfo() {
        StringBuffer buffer = new StringBuffer();

        Auth auth = SecurityUtils.currentAuthentication();
        if (auth == null) {
            buffer.append("<a href=\"" + context + "/chapp/login.html\">登陆</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href=\"" + context + "/chapp/userregister.html\">注册</a>");
        } else {
            if (StringUtil.hasLength(auth.getName())) {
                String name = auth.getName();
                String showname = name;
                if (name.length() > 4) {
                    showname = name.substring(0, 4) + "";
                }
                buffer.append("<a title=\"" + name + "\">" + showname + "</a>" + "&nbsp;&nbsp;|&nbsp;&nbsp;");
                buffer.append("<a href=\"" + context + "/j_spring_security_logout\">退出</a>");
            } else {
                buffer.append("<a title=\"未填写用户姓名\">陌生人</a>" + "&nbsp;&nbsp;|&nbsp;&nbsp;");
                buffer.append("<a href=\"" + context + "/j_spring_security_logout\">退出</a>");
            }
        }

        return buffer.toString();
    }


    protected void writeMessage(String urlInfo) throws IOException {
        pageContext.getOut().write(urlInfo);
    }

    public void setContext(String context) {
        this.context = context;
    }
}
