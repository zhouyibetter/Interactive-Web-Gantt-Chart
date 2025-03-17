package com.zhouyibetter.service.impl;

import com.zhouyibetter.mapper.UserMapper;
import com.zhouyibetter.pojo.User;
import com.zhouyibetter.service.UserService;
import com.zhouyibetter.utils.Md5Util;
import com.zhouyibetter.utils.ThreadLocalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User findByUserName(String username) {
        return userMapper.findByUserName(username);
    }

    @Override
    public void register(String username, String password) {
        String md5String = Md5Util.getMD5String(password);
        userMapper.add(username, md5String);
    }

    @Override
    public void update(User user) {
        user.setUpdateTime(LocalDateTime.now());
        userMapper.update(user);
    }

    @Override
    public void updatePassword(String newPassword) {
        Map<String, Object> map = ThreadLocalUtil.get();
        Integer userId = (Integer) map.get("userId");

        userMapper.updatePassword(Md5Util.getMD5String(newPassword), userId);
    }
}
