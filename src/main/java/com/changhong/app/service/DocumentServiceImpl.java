package com.changhong.app.service;

import com.changhong.app.domain.AppFile;
import com.changhong.app.domain.AppIcon;
import com.changhong.app.domain.AppPoster;
import com.changhong.app.utils.AppInfoUtils;
import com.changhong.app.web.facade.dto.MarketAppDTO;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * User: Jack Wang
 * Date: 15-12-28
 * Time: 上午11:18
 */
@Service("")
public class DocumentServiceImpl implements DocumentService {

    private static final Log logger = LogFactory.getLog(DocumentServiceImpl.class);

    private final static String UPLOAD_APK_PATH = "upload";

    @Value("${application.upload.file.path}")
    private String baseStorePath;

    public MarketAppDTO uploadAppApkData(MarketAppDTO app, MultipartFile uploadApkFile, MultipartFile uploadIconFile, MultipartFile uploadPosterFile) {
        File directory = new File(baseStorePath + UPLOAD_APK_PATH + File.separator + app.getAppKey());
        if (!directory.exists()) {
            directory.mkdirs();
        }

        //save apk
        File saveApkFile = null;
        if(uploadApkFile != null && uploadApkFile.getSize() > 0) {
            AppFile apk = new AppFile(uploadApkFile, "");
            saveApkFile = new File(directory, apk.getActualFileName());
            try {
                OutputStream dataOut = new FileOutputStream(saveApkFile.getAbsolutePath());
                FileCopyUtils.copy(apk.getFile().getInputStream(), dataOut);

                logger.info("finish upload app apk file for" + apk.getActualFileName());
            } catch (Exception e) {
                logger.error(e);
                throw new RuntimeException("exception app apk failed for app " + apk.getActualFileName(), e);
            }
            app.setApkActualFileName(apk.getActualFileName());
            app.setApkUploadFileName(apk.getUploadFileName());
        }

        //save icon
        if(uploadIconFile != null && uploadIconFile.getSize() > 0) {
            AppIcon icon = new AppIcon(uploadIconFile, "");
            File saveIconFile = new File(directory, icon.getActualFileName());
            try {
                OutputStream dataOut = new FileOutputStream(saveIconFile.getAbsolutePath());
                FileCopyUtils.copy(icon.getFile().getInputStream(), dataOut);

                logger.info("finish upload app icon file for" + icon.getActualFileName());
            } catch (Exception e) {
                logger.error(e);
                throw new RuntimeException("exception app icon failed for app " + icon.getActualFileName(), e);
            }
            app.setIconActualFileName(icon.getActualFileName());
            app.setIconUploadFileName(icon.getUploadFileName());
        }

        //save icon
        if(uploadPosterFile != null && uploadPosterFile.getSize() > 0) {
            AppPoster poster = new AppPoster(uploadPosterFile, "");
            File savePosterFile = new File(directory, poster.getActualFileName());
            try {
                OutputStream dataOut = new FileOutputStream(savePosterFile.getAbsolutePath());
                FileCopyUtils.copy(poster.getFile().getInputStream(), dataOut);

                logger.info("finish upload app poster file for" + poster.getActualFileName());
            } catch (Exception e) {
                logger.error(e);
                throw new RuntimeException("exception app poster failed for app " + poster.getActualFileName(), e);
            }
            app.setPosterActualFileName(poster.getActualFileName());
            app.setPosterUploadFileName(poster.getUploadFileName());
        }

        //get app information
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        if (saveApkFile != null) {
            Map<String, String> map = AppInfoUtils.obtainApkInfo(saveApkFile.getAbsolutePath());

            //set app info
            app.setAppVersionInt(Integer.valueOf(map.get("versionCode")));
            app.setAppVersion(map.get("versionName"));
            app.setAppPackage(map.get("packageName"));
            app.setAppSize(map.get("fileSize"));
        }

        return app;
    }

    public void deleteNotUsedFiles(MarketAppDTO app) {
        List<String> usedFilenames = new ArrayList<String>();
        usedFilenames.add(app.getApkActualFileName());
        usedFilenames.add(app.getIconActualFileName());
        usedFilenames.add(app.getPosterActualFileName());

        logger.info("should keeped files " + usedFilenames.toString());

        File directory = new File(baseStorePath + UPLOAD_APK_PATH + File.separator + app.getAppKey());
        if (directory.exists()) {
            File[] files = directory.listFiles();
            if (files.length > 0) {
                for (File file : files) {
                    String fileName = file.getName();
                    String fileFullName = file.getAbsolutePath();
                    if (!usedFilenames.contains(fileName)) {
                        logger.info("delete this file " + fileFullName + " for app " + app.getAppName());
                        file.delete();
                    }
                }
            }
        }
    }
}
