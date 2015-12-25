package com.changhong.app.repository;

import com.changhong.app.domain.AdminUser;
import com.changhong.app.domain.Auth;
import com.changhong.app.domain.ClientUser;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * User: Jack Wang
 * Date: 15-10-15
 * Time: 上午10:38
 */
@Repository("userDao")
public class UserDaoImpl extends HibernateEntityObjectDao implements UserDao {

    public UserDetails findUserByName(String username) {
        List<Auth> auths = getHibernateTemplate().find("from AdminUser u where u.username = ? and u.enabled = true", username);
        if (!auths.isEmpty()) {
            return auths.get(0);
        }
        auths = getHibernateTemplate().find("from ClientUser u where u.username = ? and u.enabled = true and u.active = true", username);
        return auths.isEmpty() ? null : auths.get(0);
    }

    public List<AdminUser> loadAdminUsersByName(String name, int startPosition, int pageSize) {
        StringBuilder builder = new StringBuilder();
        builder.append("from AdminUser u");
        if (StringUtils.hasText(name)) {
            builder.append(" where u.name like '%" + name + "%' or u.username like '%" + name + "%'");
        }

        Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
        Query query = session.createQuery(builder.toString());
        query.setMaxResults(pageSize);
        query.setFirstResult(startPosition);

        List<AdminUser> users = query.list();
        return users;
    }

    public List<AdminUser> loadAdminUsersByNameOrContactway(String keyWords, int startPosition, int pageSize) {
        StringBuilder builder = new StringBuilder();
        builder.append("from AdminUser u");
        if (StringUtils.hasText(keyWords)) {
            builder.append(" where u.username like '%" + keyWords + "%' or u.contactway like '%" + keyWords + "%'");
        }

        Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
        Query query = session.createQuery(builder.toString());
        query.setMaxResults(pageSize);
        query.setFirstResult(startPosition);

        List<AdminUser> users = query.list();

        return users;
    }

    public int loadAdminUserSize(String name) {
        StringBuilder builder = new StringBuilder();
        builder.append("select count(u.id) from AdminUser u");
        if (StringUtils.hasText(name)) {
            builder.append(" where u.name like '%" + name + "%' or u.username like '%" + name + "%'");
        }
        List list =  getHibernateTemplate().find(builder.toString());
        return ((Long)list.get(0)).intValue();
    }

    public int loadAdminUserSizeByNameOrContactway(String keyWords) {
        StringBuilder builder = new StringBuilder();
        builder.append("select count(u.id) from AdminUser u");
        if(StringUtils.hasText(keyWords)) {
            builder.append(" where u.username like '%" + keyWords + "%' or u.contactway like '%" + keyWords + "%'");
        }
        List list = getHibernateTemplate().find(builder.toString());
        return ((Long)list.get(0)).intValue();
    }

    public List<ClientUser> loadAdminDevelopers(String name, int startPosition, int pageSize) {
        StringBuilder builder = new StringBuilder();
        builder.append("from ClientUser u");
        if (StringUtils.hasText(name)) {
            builder.append(" where u.name like '%" + name + "%' or u.username like '%" + name + "%'");
        }

        Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
        Query query = session.createQuery(builder.toString());
        query.setMaxResults(pageSize);
        query.setFirstResult(startPosition);

        List<ClientUser> users = query.list();
        return users;
    }

    public int loadAdminDeveloperSize(String name) {
        StringBuilder builder = new StringBuilder();
        builder.append("select count(u.id) from ClientUser u");
        if (StringUtils.hasText(name)) {
            builder.append(" where u.name like '%" + name + "%' or u.username like '%" + name + "%'");
        }
        List list =  getHibernateTemplate().find(builder.toString());
        return ((Long)list.get(0)).intValue();
    }
}
