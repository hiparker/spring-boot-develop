package com.edwin.practive.springbootmvc01.modules.sys.service;

import com.edwin.practive.springbootmvc01.common.json.AjaxJson;
import com.edwin.practive.springbootmvc01.common.utils.PropertiesUtil;
import com.edwin.practive.springbootmvc01.common.utils.StringUtils;
import com.edwin.practive.springbootmvc01.common.utils.misc.AESUtil;
import com.edwin.practive.springbootmvc01.core.persistence.Page;
import com.edwin.practive.springbootmvc01.core.service.CrudService;
import com.edwin.practive.springbootmvc01.modules.sys.entity.Menu;
import com.edwin.practive.springbootmvc01.modules.sys.entity.User;
import com.edwin.practive.springbootmvc01.modules.sys.mapper.MenuMapper;
import com.edwin.practive.springbootmvc01.modules.sys.mapper.UserMapper;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.LinkedBlockingQueue;

//import org.springframework.transaction.annotation.Transactional;

@Service
//@Transactional(readOnly = true)
public class MenuService extends CrudService<MenuMapper,Menu>{


    private List<Menu> menuList;
    private Map<String,Menu> menuMap;


    /**
     * 增加/修改
     * @param menu
     * @return
     */
    //@Transactional(readOnly = false)
    @Override
    public int save(Menu menu){

        if(StringUtils.isEmpty(menu.getId())){
            Menu parent = this.getMenuMap(menu.getParent().getId());
            menu.setParentIds(parent.getParentIds()+parent.getId()+",");
        }

        int count = super.save(menu);
        menuList.clear();
        menuMap.clear();
        this.findListAll();
        return count;
    }


    /**
     * 删除
     * @param menu
     * @return
     */
    //@Transactional(readOnly = false)
    public int remove(Menu menu){
        if(menu.getParentId().equals(0)){
            return 0;
        }
        int count = super.delete(menu);
        menuList.clear();
        menuMap.clear();
        this.findListAll();
        return count;
    }
    public int remove(String id){
        Menu menu = this.get(id);
        if(menu.getParentId().equals(0)){
            return 0;
        }
        int count = super.delete(menu);
        menuList.clear();
        menuMap.clear();
        this.findListAll();
        return count;
    }

    /**
     * 批量查询
     * @param
     * @return
     */
    public List<Menu> findListAll(){
        if(null == menuList || menuList.isEmpty()){
            menuList = Collections.synchronizedList(super.findAllList(new Menu()));
            menuMap = Collections.synchronizedMap(new HashMap<>());
            for (Menu menu : menuList) {
                menuMap.put(menu.getId(),menu);
            }
        }
        return menuList;
    }



    /**
     * 批量查询
     * @param menu
     * @return
     */
    @Override
    public Menu get(Menu menu){
        return super.get(menu);
    }


    // 获取菜单信息
    public Map<String, Menu> getMenuMaps() {
        return menuMap;
    }
    public Menu getMenuMap(String key) {
        return menuMap.get(key);
    }

}
