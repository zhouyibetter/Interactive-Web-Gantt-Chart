package com.zhouyibetter.mapper;

import com.zhouyibetter.pojo.UserProject;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserProjectMapper {
    @Select("INSERT INTO `userproject` (user_id, gantt_task_id, gantt_link_id)")
    void add(UserProject userProject);
}
