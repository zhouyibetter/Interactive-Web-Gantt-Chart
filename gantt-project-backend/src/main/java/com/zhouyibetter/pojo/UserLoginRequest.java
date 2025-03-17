package com.zhouyibetter.pojo;

import jakarta.validation.constraints.Pattern;

public class UserLoginRequest {
    @Pattern(regexp = "^\\S{5,16}$")
    private String username;

    @Pattern(regexp = "^\\S{5,16}$")
    private String password;

    // Getter and Setter methods
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
