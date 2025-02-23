package com.zhouyibetter.service.impl;

import com.zhouyibetter.mapper.UserMapper;
import com.zhouyibetter.pojo.User;
import com.zhouyibetter.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User findByUserName(String username) {
        return null;
    }

    @Override
    public void register(String username, String password) {

    }

    @Override
    public void update(User user) {

    }

    @Override
    public void updatePassword(String newPassword) {

    }
}
