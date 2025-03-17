package com.zhouyibetter.service;

import com.zhouyibetter.pojo.GanttTask;

public interface GanttTaskService {
    // 通过id查询gantt_tasks信息
    GanttTask getGanttTaskById(int id);

    // 添加gantt tasks
    Integer addGanttTask(GanttTask ganttTask);

    // 获取下一个id
    Integer getNextId();
}
