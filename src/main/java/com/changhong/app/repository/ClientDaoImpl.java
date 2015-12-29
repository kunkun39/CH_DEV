package com.changhong.app.repository;

import com.changhong.app.domain.AppCategory;
import com.changhong.app.domain.MarketApp;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

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

    public List<MarketApp> loadMarketApps(int clientId, String appName, String appStatus, int startPosition, int pageSize) {
        StringBuilder builder = new StringBuilder();
        builder.append("from MarketApp m where m.owner.id = " + clientId);
        if (StringUtils.hasText(appName)) {
            builder.append(" and m.appName like '%" + appName + "%'");
        }
        if (!"ALL".equals(appStatus)) {
            builder.append(" and m.appStatus = '" + appStatus + "'");
        }

        builder.append(" order by m.id desc");

        Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
        Query query = session.createQuery(builder.toString());
        query.setMaxResults(pageSize);
        query.setFirstResult(startPosition);

        List<MarketApp> apps = query.list();
        return apps;
    }

    public int loadMarketAppSize(int clientId, String appName, String appStatus) {
        StringBuilder builder = new StringBuilder();
        builder.append("select count(m.id) from MarketApp m where m.owner.id = " + clientId);
        if (StringUtils.hasText(appName)) {
            builder.append(" and m.appName like '%" + appName + "%'");
        }
        if (!"ALL".equals(appStatus)) {
            builder.append(" and m.appStatus = '" + appStatus + "'");
        }
        Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
        Query query = session.createQuery(builder.toString());

        return ((Long)query.list().get(0)).intValue();
    }
}
