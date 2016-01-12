package com.changhong.app.repository;

import com.changhong.app.domain.*;
import com.changhong.app.web.facade.dto.ClientUserDTO;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
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
    private static  final Log log= LogFactory.getLog(UserDaoImpl.class);

    public UserDetails findUserByName(String username) {
        List<Auth> auths = getHibernateTemplate().find("from AdminUser u where u.username = ? and u.enabled = true", username);
        if (!auths.isEmpty()) {
            return auths.get(0);
        }
        auths = getHibernateTemplate().find("from ClientUser u where u.username = ? and u.enabled = true and u.active = true", username);
        return auths.isEmpty() ? null : auths.get(0);
    }

    @Override
    public EntityBase findById(int id, Class clazz) {
        return super.findById(id, clazz);
    }

    @Override
    public void saveOrUpdate(EntityBase entity) {
        super.saveOrUpdate(entity);
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
            builder.append(" where u.username like '%" + keyWords + "%' or u.contactWay like '%" + keyWords + "%'");
        }
        builder.append(" order by u.id desc");

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
        List list = getHibernateTemplate().find(builder.toString());
        return ((Long) list.get(0)).intValue();
    }

    public int loadAdminUserSizeByNameOrContactway(String keyWords) {
        StringBuilder builder = new StringBuilder();
        builder.append("select count(u.id) from AdminUser u");
        if (StringUtils.hasText(keyWords)) {
            builder.append(" where u.username like '%" + keyWords + "%' or u.contactWay like '%" + keyWords + "%'");
        }
        List list = getHibernateTemplate().find(builder.toString());
        return ((Long) list.get(0)).intValue();
    }

    public List<ClientUser> loadAdminDevelopers(String name, int startPosition, int pageSize) {
        StringBuilder builder = new StringBuilder();
        builder.append("from ClientUser u");
        if (StringUtils.hasText(name)) {
            builder.append(" where u.name like '%" + name + "%' or u.username like '%" + name + "%'");
        }
        builder.append(" order by u.active desc , u.id asc");

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
        List list = getHibernateTemplate().find(builder.toString());
        return ((Long) list.get(0)).intValue();
    }

    public List<AdminUser> loadAdminUserByName(String userName) {
        StringBuilder builder = new StringBuilder();
        builder.append("from AdminUser u");
        if (StringUtils.hasText(userName)) {
            builder.append(" where u.username='" + userName + "'");
        }
        List<AdminUser> users = getHibernateTemplate().find(builder.toString());
        return users;
    }


    public boolean loadClientUserExist(String username) {
        List userList = getHibernateTemplate().find("select  count(u.id) from ClientUser u where u.username = ?", new Object[]{username});
        return ((Long) userList.get(0)).intValue() > 0 ? true : false;
    }


    @Override
    public ClientUser loadClientUser(String username) {
        List<ClientUser> userList = getHibernateTemplate().find("from ClientUser u where u.username = ? ", new Object[]{username});
        return userList.isEmpty() ? null : userList.get(0);
    }

    public boolean loadClientUserEnable(String username) {
        if (StringUtils.hasText(username) && username.indexOf("@") > 0) {
            List userList = getHibernateTemplate().find("select  count(u.id) from ClientUser u where u.username = ? and u.enabled = true", new Object[]{username});
            return ((Long) userList.get(0)).intValue() > 0 ? true : false;
        }
        return true;
    }

    @Override
    public RegisterConfirm loadClientUserRegisterConfirm(String validateNumber) {
        //and r.validateConfirm = false 去掉改查询语句，因为之前加上改查询语句就默认判断空的时候是已经注册成功，但是没考虑到用户乱注册情况
        List<RegisterConfirm> confirms = getHibernateTemplate().find("from RegisterConfirm r where r.validateNumber = ?  order by r.timestamp desc", new Object[]{validateNumber});
        if (confirms.isEmpty()) {
            return null;
        }
        return confirms.get(0);
    }

    @Override
    public RegisterConfirm loadRegisterConfirmByUsername(String username) {
        List<RegisterConfirm> confirms = getHibernateTemplate().find("from RegisterConfirm r where r.username = ?  order by r.timestamp desc", new Object[]{username});
        if (confirms.isEmpty()) {
            return null;
        }
        return confirms.get(0);
    }


    public void updateUserPassword(String username, String newPassword) {
        ClientUser clientUser=loadClientUser(username);
        clientUser.setPassword(newPassword);
        getHibernateTemplate().update(clientUser);
    }

}
