package com.changhong.app.utils;

/**
 * User: pengjie
 * Date: 16-1-20
 * Time: 下午4:27
 */
public class EscapesUtils {
    public static String escapesEqualQueryForSQL(String str) {
        return str.replace("'", "''").replace("\\", "\\\\");
    }

    public static String escapesLikeQueryForSQL(String str) {
        return escapesEqualQueryForSQL(str).replace("_", "\\_").replace("%", "\\%");
    }

    public static String escapesForJS(String str) {
        return str.replace("&", "&amp").replace("'", "\\'").replace("\"", "&quot");
    }

    public static String escapesForHTML(String str) {
        return escapesForJS(str);
    }
}
