package com.zhouyibetter.controller;

import com.zhouyibetter.pojo.Result;
import com.zhouyibetter.pojo.User;
import com.zhouyibetter.pojo.UserLoginRequest;
import com.zhouyibetter.service.UserService;
import com.zhouyibetter.utils.JwtUtil;
import com.zhouyibetter.utils.Md5Util;
import com.zhouyibetter.utils.ThreadLocalUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Pattern;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.util.StringUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/user")
@Validated
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @PostMapping("/auth")
    public Result Auth(HttpServletRequest request) {
        // 令牌验证
        String token = request.getHeader("Authorization");
        if (token == null) {
            return Result.error("未登录");
        }
        // 从Redis中获取相同的token
        ValueOperations<String, String> operations = stringRedisTemplate.opsForValue();
        String redisToken = operations.get(token);
        if (redisToken == null) {
            // token已经失效
            return Result.error("已失效");
        }
        return Result.success();
    }

    @PostMapping("/register")
    public Result Register(@Pattern(regexp = "^\\S{5,16}$") String username, @Pattern(regexp = "^\\S{5,16}$") String password) {
        // 1. 查询用户
        User u = userService.findByUserName(username);
        if (u == null) {
            // 没有重名用户
            userService.register(username, password);
            return Result.success();
        } else {
            return Result.error("用户名已占用");
        }
    }

    @PostMapping("/login")
    public Result Login(String username, String password) {
        // 根据用户名查询用户
        User loginUser = userService.findByUserName(username);
        // 判断用户是否存在
        if (loginUser == null) {
            return Result.error("用户名错误");
        }

        // 判断密码是否正确
        if (Md5Util.getMD5String(password).equals(loginUser.getPassword())) {
            // 登录成功
            Map<String, Object> claims = new HashMap<>();
            claims.put("id", loginUser.getUserId());
            claims.put("username", loginUser.getUsername());
            String token = JwtUtil.genToken(claims);

            ValueOperations<String, String> operations = stringRedisTemplate.opsForValue();
            operations.set(token, token, 2, TimeUnit.HOURS);

            return Result.success(token);
        }

        return Result.error("密码错误");
    }

    @GetMapping("/userInfo")
    public Result<User> userInfo() {
        // ThreadLocal 获取用户名
        Map<String, Object> map = ThreadLocalUtil.get();
        String username = (String) map.get("username");

        User user = userService.findByUserName(username);
        return Result.success(user);
    }

    @PutMapping("/update")
    public Result update(@RequestBody @Validated User user) {
        userService.update(user);
        return Result.success();
    }

    @PatchMapping("/updatePwd")
    public Result updatePwd(@RequestBody Map<String, String> params, @RequestHeader("Authorization") String token) {
        // 1. 校验参数
        String oldPwd = params.get("old_pwd");
        String newPwd = params.get("new_pwd");
        String rePwd = params.get("re_pwd");

        if (!StringUtils.hasLength(oldPwd) || !StringUtils.hasLength(newPwd) || !StringUtils.hasLength(rePwd)) {
            return Result.error("缺少必要参数");
        }

        // 1.2 原密码是否正确
        // 根据用户名获取原密码
        Map<String, Object> map = ThreadLocalUtil.get();
        String username = (String) map.get("username");
        User loginUser = userService.findByUserName(username);

        if (!Md5Util.getMD5String(oldPwd).equals(loginUser.getPassword())) {
            return Result.error("原密码不正确");
        }

        // 1.3 newPwd =? rePwd
        if (!newPwd.equals(rePwd)) {
            return Result.error("两次填写的密码不相同");
        }

        // 2. 调用service层
        userService.updatePassword(newPwd);

        // 3. 删除Redis中对应的token
        ValueOperations<String, String> operations = stringRedisTemplate.opsForValue();
        operations.getOperations().delete(token);

        return Result.success();
    }
}
