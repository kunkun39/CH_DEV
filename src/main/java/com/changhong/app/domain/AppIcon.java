package com.changhong.app.domain;

import org.springframework.web.multipart.MultipartFile;

/**
 * User: Jack Wang
 * Date: 14-4-10
 * Time: 下午3:06
 */
public class AppIcon extends Document {

    public AppIcon() {
        super();
    }

    public AppIcon(MultipartFile file, String actualFilePath) {
        super(file, actualFilePath);
    }
}
