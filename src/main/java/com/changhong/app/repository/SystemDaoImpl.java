package com.changhong.app.repository;

import com.changhong.app.domain.MarketApp;
import com.changhong.app.utils.EscapesUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 15-12-25
 * Time: 下午2:59
 * To change this template use File | Settings | File Templates.
 */
@Repository("systemDao")
public class SystemDaoImpl extends HibernateEntityObjectDao implements SystemDao {

    public List<MarketApp> loadMarketApps(String appName, String appStatus, int startPosition, int pageSize) {
        StringBuilder builder = new StringBuilder();
        builder.append("from MarketApp m where 1=1");
        if (StringUtils.hasText(appName)) {
        builder.append(" and m.appName like '" + EscapesUtils.escapesLikeQueryForSQL(appName) + "%'");
        }
        if (StringUtils.hasText(appStatus)) {
            builder.append(" and m.appStatus='" + appStatus + "'");
        }
        builder.append(" order by m.id desc");

        Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
        Query query = session.createQuery(builder.toString());
        query.setMaxResults(pageSize);
        query.setFirstResult(startPosition);

        List<MarketApp> appList = query.list();
        return appList;
    }

    public int loadMarketAppSize(String appName, String appStatus) {
        StringBuilder builder = new StringBuilder();
        builder.append("select count(m.id) from MarketApp m where 1=1");
        if (StringUtils.hasText(appName)) {
            builder.append(" and m.appName like '" + EscapesUtils.escapesLikeQueryForSQL(appName) + "%'");
        }
        if (StringUtils.hasText(appStatus)) {
            builder.append(" and m.appStatus='" + appStatus + "'");
        }
        List list = getHibernateTemplate().find(builder.toString());
        return ((Long) list.get(0)).intValue();
    }
}
