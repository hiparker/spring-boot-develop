package com.edwin.practive.springbootmvc01.modules.sys.service;

import com.edwin.practive.springbootmvc01.common.json.AjaxJson;
import com.edwin.practive.springbootmvc01.common.utils.PropertiesUtil;
import com.edwin.practive.springbootmvc01.common.utils.StringUtils;
import com.edwin.practive.springbootmvc01.common.utils.misc.AESUtil;
import com.edwin.practive.springbootmvc01.core.persistence.Page;
import com.edwin.practive.springbootmvc01.core.service.CrudService;
import com.edwin.practive.springbootmvc01.modules.sys.entity.User;
import com.edwin.practive.springbootmvc01.modules.sys.mapper.UserMapper;
import org.springframework.stereotype.Service;

import java.util.List;

//import org.springframework.transaction.annotation.Transactional;

@Service
//@Transactional(readOnly = true)
public class UserService extends CrudService<UserMapper,User>{


    /**
     * 检查密码
     */
    public User validataLogin(User user){
        return mapper.validataLogin(user);
    }

    /**
     * 修改密码
     * @param user
     * @return
     */
    //@Transactional(readOnly = false)
    public AjaxJson updatePassword(User user){
        AjaxJson j = new AjaxJson();
        User temp = this.get(user);
        if(temp != null){
            if(temp.getPassword().equals(AESUtil.encrypt(user.getOldPassword(), PropertiesUtil.getConfig("aeskey")))){
                //加密 密码用来解析
                String encyPassword = AESUtil.encrypt(user.getPassword(), PropertiesUtil.getConfig("aeskey"));
                user.setPassword(encyPassword);
                user.preUpdate();
                mapper.updatePassword(user);
                j.setMsg("修改成功！");
            }else{
                j.setSuccess(false);
                j.setMsg("旧密码不正确！");
            }
        }else{
            j.setSuccess(false);
            j.setMsg("找不到该用户！");
        }
        return j;
    }


    /**
     * 增加/修改
     * @param user
     * @return
     */
    //@Transactional(readOnly = false)
    @Override
    public int save(User user){

        if(StringUtils.isEmpty(user.getPassword())){
            user.setPassword(this.get(user).getPassword());
        }else{
            //加密 密码用来解析
            String encyPassword = AESUtil.encrypt(user.getPassword(), PropertiesUtil.getConfig("aeskey"));
            user.setPassword(encyPassword);
        }
        return super.save(user);
    }


    /**
     * 删除
     * @param user
     * @return
     */
    //@Transactional(readOnly = false)
    public int remove(User user){
        return super.delete(user);
    }
    public int remove(String id){
        User user = new User();
        user.setId(id);
        return super.delete(user);
    }

    /**
     * 批量查询
     * @param user
     * @return
     */
    @Override
    public List<User> findList(User user){
        return super.findList(user);
    }

    /**
     * 批量查询
     * @param user
     * @return
     */
    @Override
    public Page findPage(Page page,User user){
        return super.findPage(page,user);
    }



    /**
     * 批量查询
     * @param user
     * @return
     */
    @Override
    public User get(User user){
        return super.get(user);
    }



}
