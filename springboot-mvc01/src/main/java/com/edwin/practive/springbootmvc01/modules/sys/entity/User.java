package com.edwin.practive.springbootmvc01.modules.sys.entity;

import com.edwin.practive.springbootmvc01.core.mapper.JsonMapper;
import com.edwin.practive.springbootmvc01.core.persistence.DataEntity;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.List;

public class User extends DataEntity<User>{

    private static final long serialVersionUID = 1L;

    //名称
    private String name;
    //编号
    private String code;
    //登录账号
    private String account;
    //登录密码
    private String password;
    //旧登录密码
    private String oldPassword;

    //手机号
    private String tel;

    //角色Ids
    private String roleIds;

    //角色Names
    private String roleNames;

    private boolean isAdmin;

    // 权限菜单 （包含按钮）
    private Menu menu;

    // 权限菜单 （包含按钮）
    private String menuStr;

    // 权限菜单 （集合）
    private List<Menu> menus;

    // 菜单 （集合）
    private List<Menu> menuAll;

    public User(){
        super();
    }
    public User(String account,String password){
        this.account = account;
        this.password = password;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(String roleIds) {
        this.roleIds = roleIds;
    }

    public String getRoleNames() {
        return roleNames;
    }

    public void setRoleNames(String roleNames) {
        this.roleNames = roleNames;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }

    public String getMenuStr() {
        return menuStr;
    }

    public void setMenuStr(String menuStr) {
        this.menuStr = menuStr;
    }

    @JsonIgnore//返回对象时忽略此属性
    public String getJsonStr() {//返回json字符串数组，将访问msg和key的方式统一化，都使用data.key的方式直接访问。
        String json = JsonMapper.getInstance().toJson(this.getMenu());
        return json;
    }

    public List<Menu> getMenus() {
        return menus;
    }

    public void setMenus(List<Menu> menus) {
        this.menus = menus;
    }

    public List<Menu> getMenuAll() {
        return menuAll;
    }

    public void setMenuAll(List<Menu> menuAll) {
        this.menuAll = menuAll;
    }
}
