package com.edwin.practive.springbootmvc01.modules.sys.entity;

import com.edwin.practive.springbootmvc01.core.persistence.DataEntity;

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
}
