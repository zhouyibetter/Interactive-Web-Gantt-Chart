-- MySQL dump 10.13  Distrib 8.4.2, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gantt_db
-- ------------------------------------------------------
-- Server version	8.4.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `link` (
  `link_uuid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '连接线的类型',
  `color` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '连接线的颜色',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`link_uuid`),
  KEY `source` (`source`),
  KEY `target` (`target`),
  CONSTRAINT `link_ibfk_1` FOREIGN KEY (`source`) REFERENCES `task` (`task_uuid`),
  CONSTRAINT `link_ibfk_2` FOREIGN KEY (`target`) REFERENCES `task` (`task_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `task_uuid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '项目名',
  `start_time` datetime NOT NULL,
  `duration` int NOT NULL,
  `progress` float NOT NULL DEFAULT '0',
  `parent` int NOT NULL,
  `sort_order` int NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`task_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `team_id` int NOT NULL AUTO_INCREMENT,
  `team_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_owner` int NOT NULL,
  `team_role` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'member',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `team_project`
--

DROP TABLE IF EXISTS `team_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_project` (
  `team_id` int NOT NULL,
  `team_project_uuid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`team_project_uuid`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `team_project_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `team_project_links`
--

DROP TABLE IF EXISTS `team_project_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_project_links` (
  `team_project_uuid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_uuid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`team_project_uuid`,`link_uuid`),
  KEY `link_uuid` (`link_uuid`),
  CONSTRAINT `team_project_links_ibfk_1` FOREIGN KEY (`team_project_uuid`) REFERENCES `team_project` (`team_project_uuid`) ON DELETE CASCADE,
  CONSTRAINT `team_project_links_ibfk_2` FOREIGN KEY (`link_uuid`) REFERENCES `link` (`link_uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `team_project_tasks`
--

DROP TABLE IF EXISTS `team_project_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_project_tasks` (
  `team_project_uuid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_uuid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`team_project_uuid`,`task_uuid`),
  KEY `task_uuid` (`task_uuid`),
  CONSTRAINT `team_project_tasks_ibfk_1` FOREIGN KEY (`team_project_uuid`) REFERENCES `team_project` (`team_project_uuid`) ON DELETE CASCADE,
  CONSTRAINT `team_project_tasks_ibfk_2` FOREIGN KEY (`task_uuid`) REFERENCES `task` (`task_uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_project`
--

DROP TABLE IF EXISTS `user_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_project` (
  `user_id` int NOT NULL,
  `user_project_uuid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_project_uuid`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_project_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_project_links`
--

DROP TABLE IF EXISTS `user_project_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_project_links` (
  `user_project_uuid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_uuid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_project_uuid`,`link_uuid`),
  KEY `link_uuid` (`link_uuid`),
  CONSTRAINT `user_project_links_ibfk_1` FOREIGN KEY (`user_project_uuid`) REFERENCES `user_project` (`user_project_uuid`) ON DELETE CASCADE,
  CONSTRAINT `user_project_links_ibfk_2` FOREIGN KEY (`link_uuid`) REFERENCES `link` (`link_uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_project_tasks`
--

DROP TABLE IF EXISTS `user_project_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_project_tasks` (
  `user_project_uuid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_uuid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_project_uuid`,`task_uuid`),
  KEY `task_uuid` (`task_uuid`),
  CONSTRAINT `user_project_tasks_ibfk_1` FOREIGN KEY (`user_project_uuid`) REFERENCES `user_project` (`user_project_uuid`) ON DELETE CASCADE,
  CONSTRAINT `user_project_tasks_ibfk_2` FOREIGN KEY (`task_uuid`) REFERENCES `task` (`task_uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'gantt_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-16 14:48:30
