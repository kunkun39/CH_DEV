package com.changhong.app.repository;

import com.changhong.app.domain.AppCategory;
import com.changhong.app.domain.AppHistory;
import com.changhong.app.domain.MarketApp;

import java.util.List;

/**
 * User: Jack Wang
 * Date: 15-12-28
 * Time: 上午10:41
 */
public interface ClientDao extends EntityObjectDao {

    List<AppCategory> loadAllFirstLevelCategory();

    boolean loadAppPackageDuplicate(int appId, String appPackage);

    List<MarketApp> loadMarketApps(int clientId, String appName, String appStatus, int startPosition, int pageSize);

    int loadMarketAppSize(int clientId, String appName, String appStatus);

    List<AppHistory> loadAppHistoryByPage(int startNumber, int appId);
}
