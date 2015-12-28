package com.changhong.app.repository;

import com.changhong.app.domain.AppCategory;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * User: Jack Wang
 * Date: 15-12-28
 * Time: 上午10:42
 */
@Repository("clientDao")
public class ClientDaoImpl extends HibernateEntityObjectDao implements ClientDao {

    public List<AppCategory> loadAllFirstLevelCategory() {
        return getHibernateTemplate().find("from AppCategory a where a.parent is NULL");
    }

    public boolean loadAppPackageDuplicate(int appId, String appPackage) {
        List list = getHibernateTemplate().find("select count(a.id) from MarketApp a where a.id <> ? and a.appPackage = ?", new Object[]{appId, appPackage});
        return ((Long)list.get(0)).intValue() > 0 ? true : false;
    }
}
