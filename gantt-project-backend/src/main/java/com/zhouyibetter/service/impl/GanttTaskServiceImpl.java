package com.zhouyibetter.service.impl;

import com.zhouyibetter.mapper.GanttTaskMapper;
import com.zhouyibetter.pojo.GanttTask;
import com.zhouyibetter.service.GanttTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GanttTaskServiceImpl implements GanttTaskService {
    @Autowired
    private GanttTaskMapper ganttTaskMapper;

    @Override
    public GanttTask getGanttTaskById(int id) {
        return ganttTaskMapper.findById(id);
    }

    @Override
    public Integer addGanttTask(GanttTask ganttTask) {
        return ganttTaskMapper.add(ganttTask);
    }

    @Override
    public Integer getNextId() {
        return ganttTaskMapper.getNextId();
    }
}
