package com.zhouyibetter.pojo;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;


import java.time.LocalDateTime;


@Data
public class GanttTask {
    // @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String text;
    private LocalDateTime startDate;
    private Integer duration;
    private Float progress;
    private Integer parent;
    private Integer sortorder;
    private LocalDateTime createDate;
    private LocalDateTime updateDate;
}
