package com.changhong.app.utils;

/**
 * User: pengjie
 * Date: 16-1-20
 * Time: 下午4:27
 */
public class SQLEscapesUtils {
    public static String escapesEqualQuery(String str) {
        return str.replace("'", "''").replace("\\", "\\\\");
    }

    public static String escapesLikeQuery(String str) {
        return escapesEqualQuery(str).replace("_", "\\_").replace("%", "\\%");
    }
}
