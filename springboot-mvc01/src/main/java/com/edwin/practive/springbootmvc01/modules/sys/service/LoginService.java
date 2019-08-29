package com.edwin.practive.springbootmvc01.modules.sys.service;

import com.edwin.practive.springbootmvc01.common.json.AjaxJson;
import com.edwin.practive.springbootmvc01.common.utils.PropertiesUtil;
import com.edwin.practive.springbootmvc01.common.utils.StringUtils;
import com.edwin.practive.springbootmvc01.common.utils.misc.AESUtil;
import com.edwin.practive.springbootmvc01.modules.sys.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedHashMap;

/**
 * 登陆 Service
 */
@Service
public class LoginService {


    @Autowired
    private UserService userService;

    // 验证登陆账号密码
    public AjaxJson validataLogin(String username,String password){
        AjaxJson j = new AjaxJson();
        LinkedHashMap<String, Object> body = new LinkedHashMap<String, Object>();
        if(!StringUtils.isEmpty(username) && !StringUtils.isEmpty(password)){

            //加密 密码用来解析
            String encyPassword = AESUtil.encrypt(password, PropertiesUtil.getConfig("aeskey"));

            User user = userService.validataLogin(new User(username,encyPassword));
            if(user != null){
                j.setSuccess(true);
                body.put("user",user);
                j.setBody(body);
            }else{
                j.setSuccess(false);
                j.setMsg("账号/密码不正确！");
            }

        }else{
            j.setSuccess(false);
            j.setMsg("登陆账号/密码不可为空！");
        }
        return j;
    }

}
