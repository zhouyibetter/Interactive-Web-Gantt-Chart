package com.zhouyibetter.pojo;

import lombok.Data;

@Data
public class UserProject {
    //@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "uprj_id")
    Integer id;
    //@Column(name = "user_id")
    Integer userId;
    //@Column(name = "gantt_task_id")
    Integer ganttTaskId;
    //@Column(name = "gantt_link_id")
    Integer ganttLinkId;
}
