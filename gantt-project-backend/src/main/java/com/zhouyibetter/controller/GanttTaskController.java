package com.zhouyibetter.controller;

import com.zhouyibetter.pojo.GanttTask;
import com.zhouyibetter.pojo.Result;
import com.zhouyibetter.service.GanttTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/ganttTask")
public class GanttTaskController {
    @Autowired
    private GanttTaskService ganttTaskService;

    @GetMapping
    public Result<GanttTask> GetGanttTasks(@RequestBody Integer id){
        GanttTask ganttTask = ganttTaskService.getGanttTaskById(id);
        return Result.success(ganttTask);
    }

    @PostMapping("/userAdd")
    public Result UserAddGanttTask(@RequestBody GanttTask ganttTask){
        System.out.println("[Debug] ganttTask");

        // 获取待添加记录的id
        Integer nextId = ganttTaskService.getNextId() + 1;

        // 将待添加的记录保存到user-gantttasks表中

        return Result.success(ganttTaskService.addGanttTask(ganttTask));
    }
}
