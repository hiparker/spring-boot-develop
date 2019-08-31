package com.edwin.practive.springbootmvc01.modules.sys.service;

import com.edwin.practive.springbootmvc01.common.utils.IdGen;
import com.edwin.practive.springbootmvc01.common.utils.StringUtils;
import com.edwin.practive.springbootmvc01.core.persistence.Page;
import com.edwin.practive.springbootmvc01.core.service.CrudService;
import com.edwin.practive.springbootmvc01.modules.sys.entity.Menu;
import com.edwin.practive.springbootmvc01.modules.sys.entity.Role;
import com.edwin.practive.springbootmvc01.modules.sys.mapper.MenuMapper;
import com.edwin.practive.springbootmvc01.modules.sys.mapper.RoleMapper;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import org.springframework.transaction.annotation.Transactional;

@Service
//@Transactional(readOnly = true)
public class RoleService extends CrudService<RoleMapper,Role>{

    private final static String YES = "1";
    private final static String NO = "0";


    /**
     * 增加/修改
     * @param role
     * @return
     */
    //@Transactional(readOnly = false)
    @Override
    public int save(Role role){
        return super.save(role);
    }

    /**
     * 增加/修改 角色与菜单
     * @param role
     * @return
     */
    //@Transactional(readOnly = false)
    public int roleMenuSave(Role role){
        // 删除已有菜单权限
        mapper.deleteRoleMenu(role);

        int count = 0;
        String[] menuIds = role.getMenuIds().split(",");
        for (String menuId : menuIds) {
            if(!StringUtils.isEmpty(menuId)){
                // 添加现有菜单权限
                mapper.insertRoleMenu(IdGen.uuid(),role.getId(),menuId);
                count++;
            }
        }
        return count;
    }



    /**
     * 删除
     * @param role
     * @return
     */
    //@Transactional(readOnly = false)
    public int remove(Role role){
        // 删除已有菜单权限
        mapper.deleteRoleMenu(role);
        mapper.deleteRoleUser(role);
        return super.delete(role);
    }
    public int remove(String id){
        Role role = new Role();
        role.setId(id);
        // 删除已有菜单权限
        mapper.deleteRoleMenu(role);
        mapper.deleteRoleUser(role);
        return super.delete(role);
    }

    /**
     * 批量查询
     * @param role
     * @return
     */
    @Override
    public List<Role> findList(Role role){
        return super.findList(role);
    }

    /**
     * 批量查询
     * @param role
     * @return
     */
    @Override
    public Page findPage(Page page, Role role){
        return super.findPage(page,role);
    }



    /**
     * 查询
     * @param role
     * @return
     */
    @Override
    public Role get(Role role){
        return super.get(role);
    }

    /**
     * 获取菜单权限
     * @param role
     * @return
     */
    public String[] getRoleMenu(Role role){
        return mapper.getRoleMenu(role);
    }

}
