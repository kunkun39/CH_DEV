package com.changhong.app.web.tag;

import com.changhong.app.utils.EscapesUtils;
import org.springframework.util.StringUtils;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

/**
 * User: Jack Wang
 * Date: 14-4-9
 * Time: 上午11:34
 */
public class SubStringTag extends TagSupport {
    private String value;
    private int length = 10;
    private String suffix = "...";
    private boolean showTitle = true;
    private boolean needUnEscapes = false;

    @Override
    public int doStartTag() throws JspException {
        StringBuilder builder = new StringBuilder();
        builder.append(showTitle && needSuffix() ? createTitleHead() : "");
        builder.append(generateSubString());
        builder.append(showTitle && needSuffix() ? createTitleTail() : "");
        try {
            writeMessage(builder.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return EVAL_BODY_INCLUDE;
    }

    protected String generateSubString() {
        boolean needSuffixAsBoolean = needSuffix();
        String suffix = needSuffixAsBoolean ? this.suffix : "";
        String unEscapesValue = needUnEscapes ? EscapesUtils.unEscapesForHTML(this.value) : this.value ;
        String value = needSuffixAsBoolean ? unEscapesValue.substring(0, length) : unEscapesValue;
        return generateSimpleTag(value, suffix);
    }

    private boolean needSuffix() {
        return value.length() > length;
    }

    private String generateSimpleTag(String value, String suffix) {
        if (!StringUtils.hasText(value)) {
            return "";
        }
        return value + suffix;
    }

    protected void writeMessage(String urlInfo) throws IOException {
        pageContext.getOut().write(urlInfo);
    }

    protected String createTitleHead() {
        return "<a title=\"" + value + "\">";
    }

    protected String createTitleTail() {
        return "</a>";
    }

    //************ GETTERS / SETTERS *************//

    public void setLength(int length) {
        this.length = length;
    }

    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public void setShowTitle(boolean showTitle) {
        this.showTitle = showTitle;
    }

    public void setNeedUnEscapes(boolean needUnEscapes) {
        this.needUnEscapes = needUnEscapes;
    }
}


