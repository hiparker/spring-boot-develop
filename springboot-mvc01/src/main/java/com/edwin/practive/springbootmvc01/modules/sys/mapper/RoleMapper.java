/**
 * Copyright &copy; Edwin All rights reserved.
 */
package com.edwin.practive.springbootmvc01.modules.sys.mapper;

import com.edwin.practive.springbootmvc01.core.persistence.BaseMapper;
import com.edwin.practive.springbootmvc01.modules.sys.entity.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 角色MAPPER接口
 * @author Edwin
 * @version 2019-08-29
 */
@Mapper
public interface RoleMapper extends BaseMapper<Role> {

    int deleteRoleMenu(Role role);

    int deleteRoleUser(Role role);

    // 添加菜单权限
    int insertRoleMenu(@Param("id") String id, @Param("roleId") String roleId, @Param("menuId") String menuId);

    // 获取菜单权限
    String[] getRoleMenu(Role role);

}
