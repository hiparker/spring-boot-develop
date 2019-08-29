/**
 * Copyright &copy; Edwin All rights reserved.
 */
package com.edwin.practive.springbootmvc01.core.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.edwin.practive.springbootmvc01.core.persistence.BaseMapper;
import com.edwin.practive.springbootmvc01.core.persistence.DataEntity;
import com.edwin.practive.springbootmvc01.core.persistence.Page;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
/*
import org.springframework.transaction.annotation.Transactional;
*/



/**
 * Service基类
 * @author Edwin
 * @version 2017-05-16
 */
//@Transactional(readOnly = true)
public abstract class CrudService<M extends BaseMapper<T>, T extends DataEntity<T>> extends BaseService {

    /**
     * 持久层对象
     */
    @Autowired
    protected M mapper;

    /**
     * 获取单条数据
     * @param id
     * @return
     */
    public T get(String id) {
        return mapper.get(id);
    }

    /**
     * 获取单条数据
     * @param entity
     * @return
     */
    public T get(T entity) {
        return mapper.get(entity);
    }

    /**
     * 查询列表数据
     * @param entity
     * @return
     */
    public List<T> findList(T entity) {
        return mapper.findList(entity);
    }


    /**
     * 查询所有列表数据
     * @param entity
     * @return
     */
    public List<T> findAllList(T entity) {
        return mapper.findAllList(entity);
    }

    /**
     * 查询分页数据
     * @param page 分页对象
     * @param t
     * @return
     */
    public Page findPage(Page page, T t){
        page.pageHelperNow();
        List<T> list = this.findList(t);
        PageInfo<T> pageInfo = new PageInfo<>(list);
        page.instance(pageInfo);
        return page;
    }

    /**
     * 保存数据（插入或更新）
     * @param entity
     */
    //@Transactional(readOnly = false)
    public int save(T entity) {
        if (entity.getIsNewRecord()){
            entity.preInsert();
            return mapper.insert(entity);
        }else{
            entity.preUpdate();
            return mapper.update(entity);
        }
    }



    /**
     * 删除数据
     * @param entity
     */
    //@Transactional(readOnly = false)
    public int delete(T entity) {
        return mapper.delete(entity);
    }



    /**
     * 删除全部数据
     * @param entitys
     */
    //@Transactional(readOnly = false)
    public void deleteAll(Collection<T> entitys) {
        for (T entity : entitys) {
            mapper.delete(entity);
        }
    }

    /**
     * 删除全部数据
     * @param entitys
     */
    //@Transactional(readOnly = false)
    public void deleteAllByLogic(Collection<T> entitys) {
        for (T entity : entitys) {
            mapper.deleteByLogic(entity);
        }
    }


    /**
     * 获取单条数据
     * @param propertyName, value
     * @return
     */
    public T findUniqueByProperty(String propertyName, Object value){
        return mapper.findUniqueByProperty(propertyName, value);
    }

    /**
     * 动态sql
     * @param sql
     */

    public List<Map<String, Object>>  executeSelectSql(String sql){
        return mapper.execSelectSql(sql);
    }

    //@Transactional(readOnly = false)
    public void executeInsertSql(String sql){
        mapper.execInsertSql(sql);
    }

    //@Transactional(readOnly = false)
    public void executeUpdateSql(String sql){
        mapper.execUpdateSql(sql);
    }

    //@Transactional(readOnly = false)
    public void executeDeleteSql(String sql){
        mapper.execDeleteSql(sql);
    }

}
