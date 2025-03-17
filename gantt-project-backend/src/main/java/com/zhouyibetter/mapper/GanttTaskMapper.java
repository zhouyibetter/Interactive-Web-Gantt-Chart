package com.zhouyibetter.mapper;

import com.zhouyibetter.pojo.GanttTask;
import org.apache.ibatis.annotations.*;

@Mapper
public interface GanttTaskMapper {
    @Select("SELECT * FROM `gantttasks` WHERE id=#{id}")
    GanttTask findById(Integer id);

    @Insert("INSERT INTO `gantttasks` (id, text, start_date, duration, progress, parent, sortorder)" +
            "VALUES (#{id}, #{text}, ${startDate}, #{duration}, #{progress}, #{parent}, #{sortorder})")
    Integer add(GanttTask ganttTask);

    @Update("UPDATE `gantttasks` SET " +
            "text=#{text}, start_date=#{startDate}, duration=#{duration}, " +
            "progress=#{progress}, parent=#{parent}, sortorder=#{sortorder}, update_date=now()")
    void update(GanttTask ganttTask);

    @Delete("DELETE FROM `gantttasks` WHERE id=#{id}")
    void deleteById(Integer id);

    @Select("SELECT COUNT(*) FROM `gantttasks`")
    Integer getNextId();
}
