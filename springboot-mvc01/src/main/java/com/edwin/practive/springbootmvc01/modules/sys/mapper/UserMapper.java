package com.edwin.practive.springbootmvc01.modules.sys.mapper;

import com.edwin.practive.springbootmvc01.core.persistence.BaseMapper;
import com.edwin.practive.springbootmvc01.modules.sys.entity.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper extends BaseMapper<User>{

    // 检查账号密码
    User validataLogin(User user);

    int updatePassword(User user);

}
