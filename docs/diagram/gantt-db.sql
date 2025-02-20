-- 创建数据库
CREATE DATABASE IF NOT EXISTS ganttdb 
DEFAULT CHARACTER SET = utf8mb4    
DEFAULT COLLATE = utf8mb4_unicode_ci;

USE ganttdb;

-- 用户表（必须存在）
CREATE TABLE IF NOT EXISTS `User` (
    `user_id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(32) NOT NULL,
    `password` VARCHAR(32) NOT NULL,
    `nickname` VARCHAR(32) NOT NULL,
    `email` varchar(128),
    `create_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `update_date` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- GanttTask表
CREATE TABLE IF NOT EXISTS `GanttTasks` (
    `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `text` VARCHAR(255) NOT NULL,
    `start_date` DATETIME NOT NULL,
    `duration` INT(11) NOT NULL,
    `progress` FLOAT NOT NULL DEFAULT 0,
    `parent` INT(11) NOT NULL,
    `sortorder` INT(11) NOT NULL,
    `create_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `update_date` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- GanttLink表
CREATE TABLE IF NOT EXISTS `GanttLinks` (
    `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `source` INT(11) NOT NULL,
    `target` INT(11) NOT NULL,
    `type` VARCHAR(1) NOT NULL,
    `create_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `update_date` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`source`) REFERENCES GanttTasks(`id`),
    FOREIGN KEY (`target`) REFERENCES GanttTasks(`id`)
);

-- 团队表
CREATE TABLE IF NOT EXISTS `Team` (
    `team_id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT(11) NOT NULL,
    `owner_id` INT(11) NOT NULL COMMENT "Onwer of the team",
    `teamname` VARCHAR(32) NOT NULL,
    `role` ENUM("admin", "member", "viewer") NOT NULL DEFAULT 'viewer',
    `create_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `update_date` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`user_id`) REFERENCES User(`user_id`)
);

-- 团队项目表
CREATE TABLE IF NOT EXISTS `TeamProject` (
    `tprj_id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "ID of the Team Project",
    `team_id` INT(11) NOT NULL,
    `gantt_task_id` INT(11) NOT NULL, -- 关联任务
    `gantt_link_id` INT(11) NOT NULL, -- 关联关系
    FOREIGN KEY (`team_id`) REFERENCES Team(`team_id`),
    FOREIGN KEY (`gantt_task_id`) REFERENCES GanttTasks(`id`),
    FOREIGN KEY (`gantt_link_id`) REFERENCES GanttLinks(`id`)
);

-- 用户项目表
CREATE TABLE IF NOT EXISTS `UserProject` (
    `uprj_id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT(11) NOT NULL,
    `gantt_task_id` INT(11) NOT NULL,
    `gantt_link_id` INT(11) DEFAULT NULL,
    FOREIGN KEY (`user_id`) REFERENCES User(`user_id`),
    FOREIGN KEY (`gantt_task_id`) REFERENCES GanttTasks(`id`),
    FOREIGN KEY (`gantt_link_id`) REFERENCES GanttLinks(`id`)
);