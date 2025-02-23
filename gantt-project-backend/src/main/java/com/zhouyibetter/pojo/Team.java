package com.zhouyibetter.pojo;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Team {
     @NotNull
    private Integer teamId;
    private String userId;
    private String ownerId;
    private String teamname;
    private String role;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
}
