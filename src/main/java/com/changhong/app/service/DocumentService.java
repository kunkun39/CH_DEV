package com.changhong.app.service;

import com.changhong.app.web.facade.dto.MarketAppDTO;
import org.springframework.web.multipart.MultipartFile;

/**
 * User: Jack Wang
 * Date: 15-12-28
 * Time: 上午11:11
 */
public interface DocumentService {

    MarketAppDTO uploadAppApkData(MarketAppDTO app, MultipartFile uploadApkFile, MultipartFile uploadIconFile, MultipartFile uploadPosterFile);

    void deleteNotUsedFiles(MarketAppDTO app);
}
