package com.zhouyibetter.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.Data;
import java.time.LocalDateTime;

@Data
public class User {
    @NotNull
    private Integer userId;
    private String username;
    @JsonIgnore
    private String password;

    @NotEmpty
    @Pattern(regexp = "^\\S{1,18}$")
    private String nickname;

    @NotEmpty
    @Email
    private String email;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
}
