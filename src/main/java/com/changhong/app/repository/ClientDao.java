package com.changhong.app.repository;

import com.changhong.app.domain.AppCategory;

import java.util.List;

/**
 * User: Jack Wang
 * Date: 15-12-28
 * Time: 上午10:41
 */
public interface ClientDao extends EntityObjectDao {

    List<AppCategory> loadAllFirstLevelCategory();
}
