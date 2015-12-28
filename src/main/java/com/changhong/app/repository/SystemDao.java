package com.changhong.app.repository;

import com.changhong.app.domain.MarketApp;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 15-12-25
 * Time: 下午2:55
 * To change this template use File | Settings | File Templates.
 */
public interface SystemDao extends EntityObjectDao{

    List<MarketApp> loadMarketApps(String appName, String appStatus, int startPosition, int pageSize);

    int loadMarketAppSize(String appName, String appStatus);
}
