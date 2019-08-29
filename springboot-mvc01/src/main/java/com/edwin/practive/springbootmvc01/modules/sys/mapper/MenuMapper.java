/**
 * Copyright &copy; Edwin All rights reserved.
 */
package com.edwin.practive.springbootmvc01.modules.sys.mapper;

import com.edwin.practive.springbootmvc01.core.persistence.BaseMapper;
import com.edwin.practive.springbootmvc01.modules.sys.entity.Menu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 菜单MAPPER接口
 * @author Edwin
 * @version 2019-08-29
 */
@Mapper
public interface MenuMapper extends BaseMapper<Menu> {

	public int updateParentIds(Menu menu);
	
	public int updateSort(Menu menu);

}
