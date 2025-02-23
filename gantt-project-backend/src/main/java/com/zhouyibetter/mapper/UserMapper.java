package com.zhouyibetter.mapper;

import com.zhouyibetter.pojo.User;
import org.apache.ibatis.annotations.*;

@Mapper
public interface UserMapper {
    // 根据用户名查询用户
    @Select("SELECT * FROM user WHERE username=#{username}")
    User findByUserName(@Param("username")String username);

    // 注册
    @Insert("insert into user(username, password, create_time, update_time)" +
            " values(#{username}, #{password}, now(), now())")
    void add(@Param("username") String username, @Param("password") String password);

    // 更新用户信息
    @Update("update user set nickname=#{nickname}, email=#{email}, update_time=#{updateTime} where id = #{id}")
    void update(User user);

    // 更新密码
    @Update("update user set password=#{password}, update_time=now() where id=#{id}")
    void updatePassword(String password, Integer id);
}
