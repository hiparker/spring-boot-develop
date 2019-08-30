/**
 * Copyright &copy; Edwin All rights reserved.
 */
package com.edwin.practive.springbootmvc01.modules.sys.entity;

import com.edwin.practive.springbootmvc01.core.persistence.DataEntity;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * 菜单Entity
 * @author Edwin
 * @version 2019-08-29
 */
public class Menu extends DataEntity<Menu> {

	private static final long serialVersionUID = 1L;

	private Menu parent;	// 父级菜单
    private String parentId; // 父级编号
	private String parentIds; // 所有父级编号
	private List<Menu> children;	// 父级菜单
	private String name; 	// 名称
	private String href; 	// 链接
	private String target; 	// 目标（ mainFrame、_blank、_self、_parent、_top）
	private String icon; 	// 图标
	private Integer sort; 	// 排序
	private String isVisible; 	// 是否在菜单中显示（1：显示；0：不显示）
	private String type;    // 按钮类型
	private String permission; // 权限标识


	public Menu(){
		super();
		this.sort = 30;
		this.isVisible = "1";
		this.type="1";
	}
	
	public Menu(String id){
		super(id);
	}
	
	@JsonBackReference
	@NotNull
	public Menu getParent() {
		return parent;
	}

	public void setParent(Menu parent) {
		this.parent = parent;
	}

	@Length(min=1, max=2000)
	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}
	
	@Length(min=1, max=100)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Length(min=0, max=2000)
	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	@Length(min=0, max=20)
	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}
	
	@Length(min=0, max=100)
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	@NotNull
	public Integer getSort() {
		return sort;
	}
	
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	
	@Length(min=1, max=1)
	public String getIsVisible() {
		return isVisible;
	}

	public void setIsVisible(String isVisible) {
		this.isVisible = isVisible;
	}

	@Length(min=0, max=200)
	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}



	@Override
	public String toString() {
		return name;
	}

	public void setChildren(List<Menu> children) {
		this.children = children;
	}

	public List<Menu> getChildren() {
		return children;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}


    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }
}