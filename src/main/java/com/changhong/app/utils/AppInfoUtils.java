package com.changhong.app.utils;

import android.content.res.AXmlResourceParser;
import org.xmlpull.v1.XmlPullParser;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * User: Jack Wang
 * Date: 15-10-14
 * Time: 下午4:01
 */
public class AppInfoUtils {

    public static Map<String, String> obtainApkInfo(String filepath) {
        Map<String, String> model = new HashMap<String, String>();

        ZipFile zipFile = null;
        try {
            zipFile = new ZipFile(filepath);
            ZipEntry zipEntry = zipFile.getEntry("AndroidManifest.xml");
            if (zipEntry != null) {
                AXmlResourceParser parser = new AXmlResourceParser();
                parser.open(zipFile.getInputStream(zipEntry));
                while (true) {
                    int type = parser.next();
                    if (type == XmlPullParser.END_DOCUMENT) {
                        break;
                    }
                    switch (type) {
                        case XmlPullParser.START_TAG:
                            for (int k = 0; k < parser.getAttributeCount(); k++) {
                                String attributeName = parser.getAttributeName(k);
                                //System.out.println(attributeName + ":" + parser.getAttributeValue(k));

                                if ("versionCode".equals(attributeName)) {
                                    model.put("versionCode", parser.getAttributeUnsignedIntValue(k, 0) + "");
                                }
                                if ("versionName".equals(attributeName)) {
                                    model.put("versionName", parser.getAttributeValue(k));
                                }
                                if ("package".equals(attributeName)) {
                                    model.put("packageName", parser.getAttributeValue(k));
                                }
                            }
                            break;

                        default:
                            break;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (zipFile != null) {
                    zipFile.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        try {
            File file = new File(filepath);
            model.put("fileSize", file.length() + "");
        } catch (Exception e) {

        }

        return model;
    }

    public static void main(String[] args) {
        Map<String, String> map = AppInfoUtils.obtainApkInfo("C:\\Users\\Administrator\\Desktop\\YW\\TVhelperForOTT.apk");
        System.out.println(map);
    }
}
