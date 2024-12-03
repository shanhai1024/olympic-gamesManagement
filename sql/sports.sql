-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: sports
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '表描述',
  `have_sub_column` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否含有关联字段',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '使用的模板类型',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `sub_column_table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联表名称',
  `sub_column_fk_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联字段名称',
  `sub_column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '映射字段名称',
  `sub_column_java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '映射字段JAVA字段名',
  `sub_column_java_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '映射字段JAVA类型',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_mb`
--

DROP TABLE IF EXISTS `online_mb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `online_mb` (
  `mb_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标签名',
  `tag_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标签id',
  `parameter_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '参数类型',
  `result_map` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '结果类型',
  `sql` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'sql语句',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '请求路径',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '请求方式',
  `result_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '响应类型',
  `actuator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '执行器',
  `user_id` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否需要userId',
  `dept_id` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否需要deptId',
  `permission_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '许可类型',
  `permission_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '许可值',
  `del_flag` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`mb_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='在线接口';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_mb`
--

LOCK TABLES `online_mb` WRITE;
/*!40000 ALTER TABLE `online_mb` DISABLE KEYS */;
INSERT INTO `online_mb` VALUES (1,'select','查询赛事名称',NULL,NULL,'select id value,event_name label from sports_event_schedule','/query_eventName','GET',NULL,'selectList',NULL,NULL,'无',NULL,'0'),(2,'select','查询运动员名称',NULL,NULL,'SELECT id `value`,athlete_name label FROM `sports_athlete_personal_info`','/query_athelteName','GET',NULL,'selectList',NULL,NULL,'无',NULL,'0'),(3,'select','查询志愿者名称',NULL,NULL,'SELECT id `value`,volunteer_name label FROM `sports_volunteer_application_approval`','/query_volunteerName','GET',NULL,'selectList',NULL,NULL,'无',NULL,'0');
/*!40000 ALTER TABLE `online_mb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_accommodation_arrangement`
--

DROP TABLE IF EXISTS `sports_accommodation_arrangement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_accommodation_arrangement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `person_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '人员类型（运动员/工作人员/媒体代表）',
  `accommodation_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '住宿名称',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '住宿地址',
  `check_in_date` date DEFAULT NULL COMMENT '入住时间',
  `check_out_date` date DEFAULT NULL COMMENT '退房时间',
  `number_of_rooms` int(11) DEFAULT NULL COMMENT '房间数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='住宿与交通调度-住宿安排';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_accommodation_arrangement`
--

LOCK TABLES `sports_accommodation_arrangement` WRITE;
/*!40000 ALTER TABLE `sports_accommodation_arrangement` DISABLE KEYS */;
INSERT INTO `sports_accommodation_arrangement` VALUES (1,'John Doe','2024-06-06 10:00:16','John Doe','2024-06-13 11:00:48','运动员住宿，巴黎市区','2','Athletes Village','Paris, France','2024-07-25','2024-08-10',50),(2,'Jane Smith','2024-06-06 10:00:16','Jane Smith','2024-06-18 14:04:57','工作人员住宿，近奥运村','2','Staff Lodging','Paris, France','2024-07-20','2024-08-15',30),(3,'Mike Johnson','2024-06-06 10:00:16','Mike Johnson','2024-06-18 14:05:01','媒体代表住宿，市中心','2','Media Hotel','Paris, France','2024-07-22','2024-08-12',20),(4,'Emily Davis','2024-06-06 10:00:16','Emily Davis','2024-06-18 14:05:04','备用住宿点，近机场','0','Backup Lodging','Paris, France','2024-07-27','2024-08-08',10),(5,'Tom Brown','2024-06-06 10:00:16','Tom Brown','2024-06-18 14:05:08','运动员住宿，巴黎市区','0','Athletes Village','Paris, France','2024-07-23','2024-08-14',15),(6,'王强','2024-06-06 10:00:16','王强','2024-06-18 14:05:37','工作人员住宿，近奥运村','1','员工住宿','法国巴黎','2024-07-24','2024-08-11',25),(7,'李华','2024-06-06 10:00:16','李华','2024-06-18 14:05:45','媒体代表住宿，市中心','2','媒体酒店','法国巴黎','2024-07-18','2024-08-20',35),(8,'刘刚','2024-06-06 10:00:16','刘刚','2024-06-18 14:05:57','运动员住宿，巴黎市区','0','奥运村','法国巴黎','2024-07-26','2024-08-09',40),(9,'克勤','2024-06-06 10:00:16','克勤','2024-06-06 10:00:16','运动员住宿，巴黎市区','运动员','奥运村','法国巴黎','2024-07-21','2024-08-13',25),(10,'滕菲','2024-06-06 10:00:16','滕菲','2024-06-06 10:00:16','工作人员住宿，近奥运村','工作人员','员工住宿','法国巴黎','2024-07-28','2024-08-16',15);
/*!40000 ALTER TABLE `sports_accommodation_arrangement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_accommodation_scheduling`
--

DROP TABLE IF EXISTS `sports_accommodation_scheduling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_accommodation_scheduling` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `accommodation_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '住宿类型',
  `accommodation_details` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '住宿详情',
  `number_of_rooms` int(11) DEFAULT NULL COMMENT '房间数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='住宿与交通调度-住宿调度';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_accommodation_scheduling`
--

LOCK TABLES `sports_accommodation_scheduling` WRITE;
/*!40000 ALTER TABLE `sports_accommodation_scheduling` DISABLE KEYS */;
INSERT INTO `sports_accommodation_scheduling` VALUES (1,'John Doe','2024-06-06 16:30:45','John Doe','2024-06-13 10:53:14','运动员住宿，巴黎市区','0','Athletes Village',50),(2,'Jane Smith','2024-06-06 16:30:45','Jane Smith','2024-06-13 10:53:18','工作人员住宿，近奥运村','1','Staff Lodging',30),(3,'Mike Johnson','2024-06-06 16:30:45','Mike Johnson','2024-06-13 10:53:21','媒体代表住宿，市中心','0','Media Hotel',20),(5,'Tom Brown','2024-06-06 16:30:45','Tom Brown','2024-06-13 10:53:24','运动员住宿，巴黎市区','1','Athletes Village',15),(6,'王强','2024-06-06 16:30:45','王强','2024-06-13 10:53:30','工作人员住宿，近奥运村','0','员工住宿',25),(7,'李华','2024-06-06 16:30:45','李华','2024-06-13 10:53:33','媒体代表住宿，市中心','0','媒体酒店',35),(8,'刘刚','2024-06-06 16:30:45','刘刚','2024-06-13 10:53:40','运动员住宿，巴黎市区','0','奥运村',40),(9,'克勤','2024-06-06 16:30:45','克勤','2024-06-13 10:53:43','运动员住宿，巴黎市区','1','奥运村',25),(10,'滕菲','2024-06-06 16:30:45','滕菲','2024-06-13 10:53:46','工作人员住宿，近奥运村','0','员工住宿',15);
/*!40000 ALTER TABLE `sports_accommodation_scheduling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_athlete_eligibility_review`
--

DROP TABLE IF EXISTS `sports_athlete_eligibility_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_athlete_eligibility_review` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `athlete_id` bigint(20) DEFAULT NULL COMMENT '运动员ID',
  `eligibility_criteria` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '资格标准',
  `doping_test_info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '药检信息',
  `eligibility_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '资格状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='运动员管理-参赛资格审核';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_athlete_eligibility_review`
--

LOCK TABLES `sports_athlete_eligibility_review` WRITE;
/*!40000 ALTER TABLE `sports_athlete_eligibility_review` DISABLE KEYS */;
INSERT INTO `sports_athlete_eligibility_review` VALUES (1,'John ','2024-06-06 16:30:08','John ','2024-06-06 16:30:08','Athlete eligibility review',1,'Meets all criteria for participation','Negative doping test result','Eligible'),(2,'Jane ','2024-06-06 16:30:08','Jane ','2024-06-06 16:30:08','Athlete eligibility review',1,'Meets all criteria for participation','Positive doping test result','Not eligible'),(3,'Mike ','2024-06-06 16:30:08','Mike ','2024-06-06 16:30:08','Athlete eligibility review',2,'Meets all criteria for participation','Negative doping test result','Eligible'),(4,'Emily ','2024-06-06 16:30:08','Emily ','2024-06-06 16:30:08','Athlete eligibility review',2,'Meets all criteria for participation','Negative doping test result','Eligible'),(5,'David ','2024-06-06 16:30:08','David ','2024-06-06 16:30:08','Athlete eligibility review',2,'Meets all criteria for participation','Negative doping test result','Eligible'),(6,'张三','2024-06-06 16:30:08','张三','2024-06-06 16:30:08','运动员资格审核',3,'符合所有参赛标准','药检结果为阴性','合格'),(7,'李四','2024-06-06 16:30:08','李四','2024-06-06 16:30:08','运动员资格审核',3,'符合所有参赛标准','药检结果为阴性','合格'),(8,'王五','2024-06-06 16:30:08','王五','2024-06-06 16:30:08','运动员资格审核',3,'符合所有参赛标准','药检结果为阴性','合格'),(9,'赵六','2024-06-06 16:30:08','赵六','2024-06-06 16:30:08','运动员资格审核',3,'符合所有参赛标准','药检结果为阳性','不合格'),(10,'孙七','2024-06-06 16:30:08','孙七','2024-06-06 16:30:08','备用运动员资格检查',4,'符合所有参赛标准','药检结果为阴性','合格');
/*!40000 ALTER TABLE `sports_athlete_eligibility_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_athlete_performance_tracking`
--

DROP TABLE IF EXISTS `sports_athlete_performance_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_athlete_performance_tracking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `athlete_id` bigint(20) DEFAULT NULL COMMENT '运动员ID',
  `training_performance` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '训练表现',
  `competition_performance` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '比赛表现',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='运动员管理-表现追踪';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_athlete_performance_tracking`
--

LOCK TABLES `sports_athlete_performance_tracking` WRITE;
/*!40000 ALTER TABLE `sports_athlete_performance_tracking` DISABLE KEYS */;
INSERT INTO `sports_athlete_performance_tracking` VALUES (1,'John ','2024-06-06 16:29:27','John ','2024-06-06 16:29:27','Athlete training and competition review',1,'Consistently high performance in training','Strong showing in recent competitions'),(2,'Mike ','2024-06-06 16:29:27','Mike ','2024-06-06 16:29:27','Athlete training and competition review',1,'Excellent progress in training sessions','Top-tier performance in major events'),(3,'Emily ','2024-06-06 16:29:27','Emily ','2024-06-06 16:29:27','Athlete training and competition review',2,'Steady improvement in training','Promising results in competitions'),(4,'David ','2024-06-06 16:29:27','David ','2024-06-06 16:29:27','Athlete training and competition review',2,'Excellent endurance and stamina','Consistently good in competitions'),(5,'张三','2024-06-06 16:29:27','张三','2024-06-06 16:29:27','运动员训练与比赛表现追踪',2,'训练中表现稳定','比赛中表现良好'),(6,'李四','2024-06-06 16:29:27','李四','2024-06-06 16:29:27','运动员训练与比赛表现追踪',3,'训练成绩突出','在比赛中取得优异成绩'),(7,'王五','2024-06-06 16:29:27','王五','2024-06-06 16:29:27','运动员训练与比赛表现追踪',3,'训练成果显著','在重要赛事中表现强劲'),(8,'孙七','2024-06-06 16:29:27','孙七','2024-06-06 16:29:27','备用运动员训练与比赛表现追踪',3,'训练状态良好','在比赛中表现稳定');
/*!40000 ALTER TABLE `sports_athlete_performance_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_athlete_personal_info`
--

DROP TABLE IF EXISTS `sports_athlete_personal_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_athlete_personal_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `athlete_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '运动员姓名',
  `athlete_gender` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '性别',
  `athlete_age` int(11) DEFAULT NULL COMMENT '年龄',
  `athlete_height` decimal(5,2) DEFAULT NULL COMMENT '身高',
  `athlete_weight` decimal(5,2) DEFAULT NULL COMMENT '体重',
  `athlete_nationality` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '国籍',
  `performance_history` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '成绩历史',
  `health_status` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '健康状况',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='运动员管理-个人信息管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_athlete_personal_info`
--

LOCK TABLES `sports_athlete_personal_info` WRITE;
/*!40000 ALTER TABLE `sports_athlete_personal_info` DISABLE KEYS */;
INSERT INTO `sports_athlete_personal_info` VALUES (1,'Jane Smith','2024-06-06 16:28:36','Jane Smith','2024-06-12 15:17:40','Track and field athletes','John','2',25,180.50,72.00,'USA','Multiple medals in regional competitions','Good overall health'),(2,'Tom Brown','2024-06-06 16:28:36','Tom Brown','2024-06-06 16:28:36','Weightlifters','Mike','1',28,190.00,90.00,'Canada','Multiple medals in regional competitions','No major injuries'),(3,'Jane Smith','2024-06-06 16:28:36','Jane Smith','2024-06-06 16:28:36','Track and field athletes','Emily','1',22,170.00,65.00,'UK','Rising star in her sport','Minor knee injury in the past'),(4,'Emily Davis','2024-06-06 16:28:36','Emily Davis','2024-06-06 16:28:36','Swimmers','David','0',30,185.00,85.00,'Australia','World-class athlete','Excellent physical condition'),(5,'Jane Smith','2024-06-06 16:28:36','Jane Smith','2024-06-06 16:28:36','田径运动员','张三','0',27,178.00,70.00,'China','全国冠军','身体素质优异'),(6,'Emily Davis','2024-06-06 16:28:36','Emily Davis','2024-06-06 16:28:36','游泳运动员','李四','0',24,182.00,75.00,'China','欧洲锦标赛季军','身体素质优异'),(7,'Tom Brown','2024-06-06 16:28:36','Tom Brown','2024-06-06 16:28:36','举重运动员','王五','0',29,168.00,80.00,'China','亚洲锦标赛冠军','从手腕伤势中恢复'),(8,'Tom Brown','2024-06-06 16:28:36','Tom Brown','2024-06-06 16:28:36','举重备用运动员','孙七','0',26,195.00,100.00,'China','全国冠军','身体素质优异');
/*!40000 ALTER TABLE `sports_athlete_personal_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_audience_guide`
--

DROP TABLE IF EXISTS `sports_audience_guide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_audience_guide` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `event_id` bigint(20) DEFAULT NULL COMMENT '赛事ID',
  `venue_map` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '场馆地图',
  `transportation_guide` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '交通指南',
  `safety_notice` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '安全须知',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='门票与观众服务-观众指南';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_audience_guide`
--

LOCK TABLES `sports_audience_guide` WRITE;
/*!40000 ALTER TABLE `sports_audience_guide` DISABLE KEYS */;
INSERT INTO `sports_audience_guide` VALUES (1,'Sophia','2023-06-25 10:00:00','Sophia','2023-06-25 10:00:00','A Spectator Guide for Athletics Events / 田径赛事观众指南',1,' ','Take Metro Line X to Station A, exit the station and walk along Road B to the venue / 乘坐地铁X号线到A站，出站后沿B路步行至场馆','Please follow the rules of the venue and do not bring any contraband. In case of emergency, please follow the instructions of the staff / 请遵守场馆规定，不要携带违禁品。如遇紧急情况，请听从工作人员指挥'),(2,'Ava','2023-06-26 10:00:00','Ava','2023-06-26 10:00:00','Spectator Guide for Swimming Events / 游泳赛事观众指南',1,' ','Take Metro Line X to Station C, exit the station and walk along Road D to the venue / 乘坐地铁X号线到C站，出站后沿D路步行至场馆','Please follow the rules of the venue and do not bring any contraband. In case of emergency, please follow the instructions of the staff / 请遵守场馆规定，不要携带违禁品。如遇紧急情况，请听从工作人员指挥'),(3,'Logan ','2023-06-27 10:00:00','Logan ','2023-06-27 10:00:00','A guide for spectators at weightlifting events / 举重赛事观众指南',1,' ','Take Metro Line X to Station E, exit the station and walk along Road F to the venue / 乘坐地铁X号线到E站，出站后沿F路步行至场馆','Please follow the rules of the venue and do not bring any contraband. In case of emergency, please follow the instructions of the staff / 请遵守场馆规定，不要携带违禁品。如遇紧急情况，请听从工作人员指挥'),(4,'Sophia','2023-06-25 10:00:00','Sophia','2023-06-25 10:00:00','A Spectator Guide for Athletics Events / 田径赛事观众指南',2,' ','Take Metro Line X to Station A, exit the station and walk along Road B to the venue / 乘坐地铁X号线到A站，出站后沿B路步行至场馆','Please follow the rules of the venue and do not bring any contraband. In case of emergency, please follow the instructions of the staff / 请遵守场馆规定，不要携带违禁品。如遇紧急情况，请听从工作人员指挥'),(5,'Ava','2023-06-26 10:00:00','Ava','2023-06-26 10:00:00','Spectator Guide for Swimming Events / 游泳赛事观众指南',2,' ','Take Metro Line X to Station C, exit the station and walk along Road D to the venue / 乘坐地铁X号线到C站，出站后沿D路步行至场馆','Please follow the rules of the venue and do not bring any contraband. In case of emergency, please follow the instructions of the staff / 请遵守场馆规定，不要携带违禁品。如遇紧急情况，请听从工作人员指挥'),(6,'Logan ','2023-06-27 10:00:00','Logan ','2023-06-27 10:00:00','A guide for spectators at weightlifting events / 举重赛事观众指南',3,' ','Take Metro Line X to Station E, exit the station and walk along Road F to the venue / 乘坐地铁X号线到E站，出站后沿F路步行至场馆','Please follow the rules of the venue and do not bring any contraband. In case of emergency, please follow the instructions of the staff / 请遵守场馆规定，不要携带违禁品。如遇紧急情况，请听从工作人员指挥'),(7,NULL,'2024-06-12 17:06:17',NULL,NULL,NULL,2,'/profile/upload/2024/06/12/87efdcfc-128c-465f-9bc2-8f39fd5aab82_20240612170614A002.jpg','1','1');
/*!40000 ALTER TABLE `sports_audience_guide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_audience_navigation`
--

DROP TABLE IF EXISTS `sports_audience_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_audience_navigation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `accommodation_info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '住宿信息',
  `transportation_info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '交通信息',
  `audience_guide` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '观众指南',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='住宿与交通调度-观众导航';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_audience_navigation`
--

LOCK TABLES `sports_audience_navigation` WRITE;
/*!40000 ALTER TABLE `sports_audience_navigation` DISABLE KEYS */;
INSERT INTO `sports_audience_navigation` VALUES (1,'Sophia','2023-06-25 10:00:00','Sophia','2023-06-25 10:00:00','观众住宿交通导航',' Hotel Regina Louvre','步行可达2024年巴黎奥运会场馆Grand Palais和Pont Alexandre III等主要举办场馆，以及埃菲尔铁塔、巴黎圣母院等多个著名景点','拥有98间客房和套房，每一间都独具特色，其中许多房间都可以欣赏到巴黎最美丽的地标性建筑,位于巴黎市中心，距离巴黎奥运会的主要场馆和著名景点近'),(2,'Ava','2023-06-26 10:00:00','Ava','2023-06-26 10:00:00','观众住宿交通导航',' Grand Hôtel du Palais Royal','坐拥巴黎最显赫的地理位置，左邻皇家园林，右靠卢浮宫','酒店外墙雄伟，内部则是设计师发挥奇思妙想的地方。极尽优雅的客房、精致绝伦的餐厅和完美无瑕的服务足以令人为之心动,位于巴黎市中心，距离巴黎奥运会的主要场馆和著名景点近'),(3,'Logan ','2023-06-27 10:00:00','Logan ','2023-06-27 10:00:00','观众住宿交通导航','索菲特巴黎凯旋门酒店',' 步行四百米可到地铁站，交通便利','精心挑选的艺术品和华丽的装饰所吸引，每个细节都体现着法国的奢华和品味,位于巴黎市中心，距离巴黎奥运会的主要场馆和著名景点近'),(4,'Sophia','2023-06-25 10:00:00','Sophia','2023-06-25 10:00:00','观众住宿交通导航',' Hotel Regina Louvre','步行可达2024年巴黎奥运会场馆Grand Palais和Pont Alexandre III等主要举办场馆，以及埃菲尔铁塔、巴黎圣母院等多个著名景点','拥有98间客房和套房，每一间都独具特色，其中许多房间都可以欣赏到巴黎最美丽的地标性建筑,位于巴黎市中心，距离巴黎奥运会的主要场馆和著名景点近'),(5,'Ava','2023-06-26 10:00:00','Ava','2023-06-26 10:00:00','观众住宿交通导航',' Grand Hôtel du Palais Royal','坐拥巴黎最显赫的地理位置，左邻皇家园林，右靠卢浮宫','酒店外墙雄伟，内部则是设计师发挥奇思妙想的地方。极尽优雅的客房、精致绝伦的餐厅和完美无瑕的服务足以令人为之心动,位于巴黎市中心，距离巴黎奥运会的主要场馆和著名景点近'),(6,'Logan ','2023-06-27 10:00:00','Logan ','2023-06-27 10:00:00','观众住宿交通导航','索菲特巴黎凯旋门酒店',' 步行四百米可到地铁站，交通便利','精心挑选的艺术品和华丽的装饰所吸引，每个细节都体现着法国的奢华和品味,位于巴黎市中心，距离巴黎奥运会的主要场馆和著名景点近');
/*!40000 ALTER TABLE `sports_audience_navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_audience_service`
--

DROP TABLE IF EXISTS `sports_audience_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_audience_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `service_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '服务类型',
  `service_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '服务描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='门票与观众服务-观众服务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_audience_service`
--

LOCK TABLES `sports_audience_service` WRITE;
/*!40000 ALTER TABLE `sports_audience_service` DISABLE KEYS */;
INSERT INTO `sports_audience_service` VALUES (1,'Sophia','2023-06-25 10:00:00','Sophia','2023-06-25 10:00:00','门票与观众服务','0','提供巴黎奥运会相关场次比赛的门票销售服务，包括在线购票、线下售票点购票等'),(2,'Ava','2023-06-26 10:00:00','Ava','2023-06-26 10:00:00','门票与观众服务','0','在巴黎奥运会的官方网站和合作平台上公示相关场次比赛的票务信息，包括票价、座位图、购票须知等'),(3,'Logan ','2023-06-27 10:00:00','Logan ','2023-06-27 10:00:00','门票与观众服务','1','提供已售门票的退改服务，包括退票、换票、改签等服务，确保观众能够顺利观看比赛'),(4,'Sophia','2023-06-25 10:00:00','Sophia','2023-06-25 10:00:00','门票与观众服务','1','提供巴黎奥运会相关场次比赛的门票销售服务，包括在线购票、线下售票点购票等'),(5,'Ava','2023-06-26 10:00:00','Ava','2023-06-26 10:00:00','门票与观众服务','2','在巴黎奥运会的官方网站和合作平台上公示相关场次比赛的票务信息，包括票价、座位图、购票须知等'),(6,'Logan ','2023-06-27 10:00:00','Logan ','2023-06-27 10:00:00','门票与观众服务','2','提供已售门票的退改服务，包括退票、换票、改签等服务，确保观众能够顺利观看比赛');
/*!40000 ALTER TABLE `sports_audience_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_brand_cooperation`
--

DROP TABLE IF EXISTS `sports_brand_cooperation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_brand_cooperation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `sponsor_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '赞助商名称',
  `cooperation_details` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '合作详情',
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='媒体与公关-品牌合作';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_brand_cooperation`
--

LOCK TABLES `sports_brand_cooperation` WRITE;
/*!40000 ALTER TABLE `sports_brand_cooperation` DISABLE KEYS */;
INSERT INTO `sports_brand_cooperation` VALUES (1,'巴黎奥运会管理员','2023-06-25 10:00:00','巴黎奥运会管理员','2023-06-25 10:00:00','主要赞助商','阿迪达斯','阿迪达斯将为巴黎奥运会提供官方运动装备，并共同推出奥运系列商品。','2023-07-01','2024-08-31'),(2,'巴黎奥运会管理员','2023-06-26 11:00:00','巴黎奥运会管理员','2023-06-26 11:00:00','官方合作伙伴','可口可乐','可口可乐作为官方饮料赞助商，将在巴黎奥运会期间提供饮料支持。','2023-07-01','2024-08-31'),(3,'巴黎奥运会管理员','2023-06-27 12:00:00','巴黎奥运会管理员','2023-06-27 12:00:00','技术支持赞助商','华为','华为将为巴黎奥运会提供先进的通信和信息技术支持。','2023-07-01','2024-08-31'),(4,'巴黎奥运会管理员','2023-06-28 13:00:00','巴黎奥运会管理员','2023-06-28 13:00:00','交通合作伙伴','法国国家铁路','法国国家铁路将为巴黎奥运会的运动员和观众提供便捷的交通服务。','2023-07-01','2024-08-31'),(5,'巴黎奥运会管理员','2023-06-29 14:00:00','巴黎奥运会管理员','2023-06-29 14:00:00','官方酒店合作伙伴','巴黎希尔顿酒店','巴黎希尔顿酒店将为巴黎奥运会的运动员和官员提供舒适的住宿环境。','2023-07-01','2024-08-31'),(6,'巴黎奥运会管理员','2023-07-01 10:00:00','巴黎奥运会管理员','2023-07-01 10:00:00','官方服装赞助商','耐克','耐克将为巴黎奥运会的运动员和工作人员提供官方服装，并共同推出奥运系列运动装备。','2023-07-01','2024-08-31'),(7,'巴黎奥运会管理员','2023-07-02 11:00:00','巴黎奥运会管理员','2023-07-02 11:00:00','官方餐饮供应商','麦当劳','麦当劳将为巴黎奥运会的运动员、工作人员和观众提供健康美味的餐饮服务。','2023-07-01','2024-08-31'),(8,'巴黎奥运会管理员','2023-07-03 12:00:00','巴黎奥运会管理员','2023-07-03 12:00:00','官方计时合作伙伴','欧米茄','欧米茄将为巴黎奥运会提供精确的计时服务，确保比赛的公正和准确。','2023-07-01','2024-08-31'),(9,'巴黎奥运会管理员','2023-07-04 13:00:00','巴黎奥运会管理员','2023-07-04 13:00:00','官方陶瓷用品赞助商','法国皇家瓷器','法国皇家瓷器将为巴黎奥运会提供官方陶瓷用品，包括奖杯、纪念品等，展示法国陶瓷艺术的魅力。','2023-07-01','2024-08-31'),(10,'巴黎奥运会管理员','2023-07-05 14:00:00','巴黎奥运会管理员','2023-07-05 14:00:00','官方摄影器材合作伙伴','佳能','佳能将为巴黎奥运会提供专业的摄影器材和技术支持，记录每一个精彩的瞬间。','2023-07-01','2024-08-31');
/*!40000 ALTER TABLE `sports_brand_cooperation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_crisis_response`
--

DROP TABLE IF EXISTS `sports_crisis_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_crisis_response` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `response_team_info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '危机响应小组信息',
  `communication_mechanism` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '通讯机制',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='安全与健康协议-危机响应';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_crisis_response`
--

LOCK TABLES `sports_crisis_response` WRITE;
/*!40000 ALTER TABLE `sports_crisis_response` DISABLE KEYS */;
INSERT INTO `sports_crisis_response` VALUES (1,'巴黎奥运会管理员','2023-07-01 10:00:00','巴黎奥运会管理员','2023-07-01 10:00:00','管理','危机响应小组包含10名成员，专注于安全和医疗响应','采用即时通讯工具和电话进行内部沟通，并通过媒体发布信息'),(2,'巴黎奥运会安全团队','2023-07-03 14:30:00','巴黎奥运会安全团队','2023-07-03 14:30:00','安全','由15名专家组成的团队，负责应对紧急情况和危机管理','建立紧急联络热线、内部通讯系统和社交媒体渠道'),(3,'巴黎奥运会医疗组','2023-07-05 09:00:00','巴黎奥运会医疗组','2023-07-05 09:00:00','医疗','医疗响应团队包括20名医护人员，确保运动员和观众的安全','采用无线通信、手机短信和内部公告板进行通讯'),(4,'巴黎奥运会通信部门','2023-07-07 12:00:00','巴黎奥运会通信部门','2023-07-07 12:00:00','通信','通信小组负责危机时的信息发布和媒体沟通','通过新闻稿、社交媒体和电视广播进行信息传递'),(5,'巴黎奥运会后勤组','2023-07-10 15:30:00','巴黎奥运会后勤组','2023-07-10 15:30:00','后勤','后勤团队确保危机时资源供应和设施的正常运行','建立内部协调机制，确保信息的准确传递和执行效率'),(6,'巴黎奥运会志愿者团队','2023-07-12 08:00:00','巴黎奥运会志愿者团队','2023-07-12 08:00:00','志愿者','志愿者团队协助各小组，提供紧急支援和信息传递','通过内部通讯软件和口头传达进行信息传递和协调');
/*!40000 ALTER TABLE `sports_crisis_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_customer_support`
--

DROP TABLE IF EXISTS `sports_customer_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_customer_support` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户姓名',
  `contact_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `inquiry_details` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '咨询详情',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '处理状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='门票与观众服务-客服支持';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_customer_support`
--

LOCK TABLES `sports_customer_support` WRITE;
/*!40000 ALTER TABLE `sports_customer_support` DISABLE KEYS */;
INSERT INTO `sports_customer_support` VALUES (1,'巴黎奥运会客服','2023-07-01 10:00:00','巴黎奥运会客服','2023-07-01 10:05:00','关于门票购买的咨询','张三','13800138000','请问如何购买开幕式门票？','0'),(2,'巴黎奥运会客服','2023-07-02 14:30:00','巴黎奥运会客服','2023-07-02 14:35:00','咨询观众入场政策','李四','13912345678','请问观众入场需要携带哪些证件？','0'),(3,'巴黎奥运会客服','2023-07-03 09:00:00','巴黎奥运会客服','2023-07-03 09:05:00','关于退票的咨询','王五','13579246800','我购买的门票因为个人原因需要退票，请问如何操作？','0'),(4,'巴黎奥运会客服','2023-07-04 12:00:00','巴黎奥运会客服','2023-07-04 12:10:00','询问无障碍服务信息','赵六','13789012345','我是残疾人，想了解奥运会的无障碍服务信息。','0'),(5,'巴黎奥运会客服','2023-07-05 15:30:00','巴黎奥运会客服','2023-07-05 15:35:00','咨询停车场位置','孙七','13654321098','请问奥运会期间附近的停车场在哪里？','1'),(6,'巴黎奥运会客服','2023-07-06 08:00:00','巴黎奥运会客服','2023-07-06 08:10:00','询问座位分布图','周八','13287654321','我想了解不同场馆的座位分布图。','1');
/*!40000 ALTER TABLE `sports_customer_support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_event_schedule`
--

DROP TABLE IF EXISTS `sports_event_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_event_schedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `event_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '赛事名称',
  `event_date` date DEFAULT NULL COMMENT '赛事日期',
  `event_time` time DEFAULT NULL COMMENT '赛事时间',
  `event_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '赛事地点',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='赛事管理-赛程规划';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_event_schedule`
--

LOCK TABLES `sports_event_schedule` WRITE;
/*!40000 ALTER TABLE `sports_event_schedule` DISABLE KEYS */;
INSERT INTO `sports_event_schedule` VALUES (1,'男子100米决赛','2024-07-29','20:00:00','巴黎奥林匹克体育场','巴黎奥运会管理员','2024-06-06 16:05:21','巴黎奥运会管理员','2024-06-06 16:05:21','全球瞩目的赛事'),(2,'女子4x100米接力决赛','2024-07-30','20:30:00','巴黎奥林匹克体育场','巴黎奥运会管理员','2024-06-06 16:05:21','巴黎奥运会管理员','2024-06-06 16:05:21','团队协作的较量'),(3,'男子跳高决赛','2024-07-31','19:00:00','巴黎奥林匹克体育场','巴黎奥运会管理员','2024-06-06 16:05:21','巴黎奥运会管理员','2024-06-06 16:05:21','跳高运动员的技艺展示'),(4,'女子体操全能决赛','2024-08-01','15:00:00','巴黎奥林匹克体育馆','巴黎奥运会管理员','2024-06-06 16:05:21','巴黎奥运会管理员','2024-06-06 16:05:21','体操艺术的盛宴'),(5,'男子举重决赛','2024-08-02','21:00:00','巴黎奥林匹克体育馆','巴黎奥运会管理员','2024-06-06 16:05:21','巴黎奥运会管理员','2024-06-06 16:05:21','举重巨星的终极对决'),(6,'游泳项目闭幕式','2024-08-03','18:00:00','巴黎奥林匹克水上中心','巴黎奥运会管理员','2024-06-06 16:05:21','巴黎奥运会管理员','2024-06-06 16:05:21','游泳项目的完美收官');
/*!40000 ALTER TABLE `sports_event_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_feedback`
--

DROP TABLE IF EXISTS `sports_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标题',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '状态',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '内容',
  `contacts` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户反馈';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_feedback`
--

LOCK TABLES `sports_feedback` WRITE;
/*!40000 ALTER TABLE `sports_feedback` DISABLE KEYS */;
INSERT INTO `sports_feedback` VALUES (1,1,'问题反馈','待处理','奥运场馆设备有问题，请尽快解决。','张三','1234567890','管理员A','2024-06-18 09:12:16','管理员A','2024-06-18 09:12:16'),(2,1,'建议意见','已处理','增加更多的饮水设施会更好。','李四','9876543210','管理员B','2024-06-18 09:12:16','管理员B','2024-06-18 09:12:16'),(3,1,'问题反馈','待处理','请提供更多的停车位。','王五','1357924680','管理员A','2024-06-18 09:12:16','管理员A','2024-06-18 09:12:16'),(4,1,'建议意见','已处理','增加更多的儿童娱乐设施。','赵六','2468135790','管理员B','2024-06-18 09:12:16','管理员B','2024-06-18 09:12:16'),(5,1,'问题反馈','待处理','请加强安全检查工作，确保观众安全。','钱七','3698521470','管理员A','2024-06-18 09:12:16','管理员A','2024-06-18 09:12:16'),(6,1,'建议意见','已处理','增加更多的餐饮选择。','孙八','4816325907','管理员B','2024-06-18 09:12:16','管理员B','2024-06-18 09:12:16'),(7,1,'问题反馈','待处理','请提供更多的卫生间。','周九','5937418260','管理员A','2024-06-18 09:12:16','管理员A','2024-06-18 09:12:16'),(8,1,'建议意见','已处理','增加更多的观赛座位。','吴十','7068592734','管理员B','2024-06-18 09:12:16','管理员B','2024-06-18 09:12:16'),(9,1,'问题反馈','待处理','请提供更多的休息区域。','郑十一','8199675203','管理员A','2024-06-18 09:12:16','管理员A','2024-06-18 09:12:16'),(10,1,'建议意见','已处理','增加更多的指示标识。','王十二','9203751648','管理员B','2024-06-18 09:12:16','管理员B','2024-06-18 09:12:16'),(11,1,'问题反馈','待处理','请提供更多的游戏娱乐项目。','李十三','1032847569','管理员A','2024-06-18 09:12:16','管理员A','2024-06-18 09:12:16'),(12,1,'建议意见','已处理','增加更多的休息座椅。','赵十四','1146938275','管理员B','2024-06-18 09:12:16','管理员B','2024-06-18 09:12:16'),(13,1,'问题反馈','待处理','请提供更多的饮食选择。','钱十五','1260834957','管理员A','2024-06-18 09:12:16','管理员A','2024-06-18 09:12:16'),(14,1,'建议意见','已处理','增加更多的赛事解说。','孙十六','1374925680','管理员B','2024-06-18 09:12:16','管理员B','2024-06-18 09:12:16'),(15,1,'问题反馈','待处理','请提供更多的观赛区域。','周十七','1489016372','管理员A','2024-06-18 09:12:16','管理员A','2024-06-18 09:12:16'),(16,1,'建议意见','已处理','增加更多的电子导览牌。','吴十八','1503107264','管理员B','2024-06-18 09:12:16','管理员B','2024-06-18 09:12:16'),(17,1,'问题反馈','待处理','请提供更多的便利设施。','郑十九','1517198356','管理员A','2024-06-18 09:12:16','管理员A','2024-06-18 09:12:16'),(18,1,'建议意见','已处理','增加更多的交通指引。','王二十','1531289047','管理员B','2024-06-18 09:12:16','管理员B','2024-06-18 09:12:16'),(19,1,'问题反馈','待处理','请提供更多的音响设备。','李二十一','1545379738','管理员A','2024-06-18 09:12:16','管理员A','2024-06-18 09:12:16'),(20,1,'建议意见','已处理','增加更多的安全警示牌。','赵二十二','1559470429','管理员B','2024-06-18 09:12:16','管理员B','2024-06-18 09:12:16');
/*!40000 ALTER TABLE `sports_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_health_monitoring`
--

DROP TABLE IF EXISTS `sports_health_monitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_health_monitoring` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `person_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '人员类型（运动员/工作人员）',
  `monitoring_details` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '健康监测详情',
  `medical_support_info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '医疗支持信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='安全与健康协议-健康监测';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_health_monitoring`
--

LOCK TABLES `sports_health_monitoring` WRITE;
/*!40000 ALTER TABLE `sports_health_monitoring` DISABLE KEYS */;
INSERT INTO `sports_health_monitoring` VALUES (1,'巴黎奥运会管理员','2024-07-21 00:00:00','巴黎奥运会医疗组','2024-07-21 00:00:00','运动员日常健康监测','0','体温正常，无异常症状','提供紧急医疗服务和专业医疗咨询'),(2,'巴黎奥运会管理员','2024-07-21 00:00:00','巴黎奥运会医疗组','2024-07-21 00:00:00','工作人员日常健康监测','0','体温正常，无异常症状','提供基础医疗服务和急救指导'),(3,'巴黎奥运会管理员','2024-07-22 00:00:00','巴黎奥运会医疗组','2024-07-22 00:00:00','运动员赛前健康监测','1','心电图正常，体能状况良好','配备专业医疗团队和急救设备'),(4,'巴黎奥运会管理员','2024-07-22 00:00:00','巴黎奥运会医疗组','2024-07-22 00:00:00','工作人员赛前健康监测','1','血压正常，精神状态良好','提供现场医疗支持和紧急救援'),(5,'巴黎奥运会管理员','2024-07-23 00:00:00','巴黎奥运会医疗组','2024-07-23 00:00:00','运动员赛后健康监测','1','身体无不适，需注意休息','提供康复指导和营养建议'),(6,'巴黎奥运会管理员','2024-07-23 00:00:00','巴黎奥运会医疗组','2024-07-23 00:00:00','工作人员赛后健康监测','0','体能状况良好，需保持充足休息','提供健康检查和疲劳缓解建议');
/*!40000 ALTER TABLE `sports_health_monitoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_news`
--

DROP TABLE IF EXISTS `sports_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '新闻标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '新闻内容',
  `views` int(11) DEFAULT '0' COMMENT '浏览量',
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '附件路径',
  `create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='新闻公告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_news`
--

LOCK TABLES `sports_news` WRITE;
/*!40000 ALTER TABLE `sports_news` DISABLE KEYS */;
INSERT INTO `sports_news` VALUES (2,'奥运会开幕式安排公告','奥运会开幕式将于2022年7月23日在体育场举行，敬请关注。',1001,'/attachments/2022_opening_ceremony.pdf','管理员A','2024-06-18 09:15:01','管理员A','2024-06-18 09:15:01'),(3,'奥运会闭幕式安排公告','奥运会闭幕式将于2022年8月8日在体育场举行，敬请关注。',952,'/attachments/2022_closing_ceremony.pdf','管理员B','2024-06-18 09:15:01','管理员B','2024-06-18 09:15:01'),(4,'奥运会比赛日程公告','请查看附件获取详细的奥运会比赛日程安排。',1200,'/attachments/2022_schedule.pdf','管理员A','2024-06-18 09:15:01','管理员A','2024-06-18 09:15:01'),(5,'奥运会门票销售公告','奥运会门票将于2022年6月1日开始销售，敬请关注官方网站。',800,'/attachments/ticket_sales.pdf','管理员B','2024-06-18 09:15:01','管理员B','2024-06-18 09:15:01'),(6,'奥运会志愿者招募公告','奥运会志愿者招募工作即将开始，请有意愿的人员密切关注。',952,'/attachments/volunteer_recruitment.pdf','管理员A','2024-06-18 09:15:01','管理员A','2024-06-18 09:15:01'),(7,'奥运会场馆安全通告','请所有参与奥运会的工作人员注意场馆安全，保障观众的安全和秩序。',1101,'/attachments/venue_safety_notice.pdf','管理员B','2024-06-18 09:15:01','管理员B','2024-06-18 09:15:01'),(8,'奥运会交通指引公告','请查看附件获取奥运会期间的交通指引信息。',900,'/attachments/transportation_guide.pdf','管理员A','2024-06-18 09:15:01','管理员A','2024-06-18 09:15:01'),(9,'奥运会餐饮服务公告','奥运会期间将提供多种餐饮服务，请查看附件了解更多信息。',1000,'/attachments/catering_services.pdf','管理员B','2024-06-18 09:15:01','管理员B','2024-06-18 09:15:01'),(10,'奥运会赛事解说公告','请查看附件获取奥运会期间的赛事解说安排。',800,'/attachments/commentary_schedule.pdf','管理员A','2024-06-18 09:15:01','管理员A','2024-06-18 09:15:01'),(11,'奥运会安全警示公告','请所有参与奥运会的人员注意安全警示，及时报告异常情况。',950,'/attachments/security_alert.pdf','管理员B','2024-06-18 09:15:01','管理员B','2024-06-18 09:15:01'),(12,'奥运会摄影比赛公告','奥运会组织摄影比赛，欢迎摄影爱好者积极参与。',1000,'/attachments/photography_contest.pdf','管理员A','2024-06-18 09:15:01','管理员A','2024-06-18 09:15:01'),(13,'奥运会闭幕式演出公告','闭幕式演出将呈现精彩的节目，敬请期待。',900,'/attachments/closing_ceremony_performance.pdf','管理员B','2024-06-18 09:15:01','管理员B','2024-06-18 09:15:01'),(14,'奥运会新闻发布会公告','奥运会新闻发布会将于2022年7月20日举行，请记者朋友们提前准备好。',1100,'/attachments/press_conference_notice.pdf','管理员A','2024-06-18 09:15:01','管理员A','2024-06-18 09:15:01'),(15,'奥运会航班安排公告','请查看附件获取奥运会期间的航班安排信息。',950,'/attachments/flight_arrangements.pdf','管理员B','2024-06-18 09:15:01','管理员B','2024-06-18 09:15:01'),(16,'奥运会赞助商公告','感谢所有奥运会的赞助商和合作伙伴的支持与关注。',1000,'/attachments/sponsors_notice.pdf','管理员A','2024-06-18 09:15:01','管理员A','2024-06-18 09:15:01'),(17,'奥运会开闭幕式彩排公告','请参与开闭幕式的工作人员务必按时参加彩排，确保活动顺利进行。',900,'/attachments/rehearsal_notice.pdf','管理员B','2024-06-18 09:15:01','管理员B','2024-06-18 09:15:01'),(18,'奥运会赛事结果公告','请查看附件获取奥运会各项赛事的最新结果信息。',1000,'/attachments/game_results.pdf','管理员A','2024-06-18 09:15:01','管理员A','2024-06-18 09:15:01'),(19,'奥运会志愿者培训公告','奥运会志愿者培训工作即将开始，请有意愿的志愿者提前做好准备。',950,'/attachments/volunteer_training_notice.pdf','管理员B','2024-06-18 09:15:01','管理员B','2024-06-18 09:15:01'),(20,'奥运会会徽设计公告','奥运会会徽设计比赛已经开始，欢迎广大设计师积极参与。',1000,'/attachments/emblem_design_contest.pdf','管理员A','2024-06-18 09:15:01','管理员A','2024-06-18 09:15:01'),(21,'奥运会闭幕式倒计时公告','距离奥运会闭幕式还有5天，敬请期待闭幕式盛况。',900,'/attachments/closing_ceremony_countdown.pdf','管理员B','2024-06-18 09:15:01','管理员B','2024-06-18 09:15:01');
/*!40000 ALTER TABLE `sports_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_press_release`
--

DROP TABLE IF EXISTS `sports_press_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_press_release` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `news_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '新闻标题',
  `news_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '新闻内容',
  `publish_date` datetime DEFAULT NULL COMMENT '发布日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='媒体与公关-新闻发布';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_press_release`
--

LOCK TABLES `sports_press_release` WRITE;
/*!40000 ALTER TABLE `sports_press_release` DISABLE KEYS */;
INSERT INTO `sports_press_release` VALUES (1,'巴黎奥运会管理员','2024-07-25 10:00:00','新华社','2024-07-25 11:00:00','开幕式新闻稿','巴黎奥运会盛大开幕','今日，巴黎奥运会正式拉开帷幕，全球瞩目...','2024-07-25 12:00:00'),(2,'巴黎奥运会管理员','2024-07-26 15:30:00','人民日报','2024-07-26 16:30:00','游泳项目新闻稿','中国游泳队再获佳绩','在今日的游泳比赛中，中国游泳队选手再次展现出强劲实力...','2024-07-26 16:30:00'),(3,'巴黎奥运会管理员','2024-07-28 09:15:00','中央广播电视总台','2024-07-28 10:15:00','田径项目新闻稿','百米飞人大战，中国选手夺冠','在备受瞩目的百米飞人大战中，中国选手以出色的表现夺冠...','2024-07-28 10:00:00'),(4,'巴黎奥运会管理员','2024-07-30 14:00:00','中新社','2024-07-30 15:00:00','体操项目新闻','中国体操女队勇夺金牌','在今日的女子体操全能决赛中，中国女队以完美的表现摘得金牌...','2024-07-30 15:00:00'),(5,'巴黎奥运会管理员','2024-08-10 12:30:00','中国体育报','2024-08-10 13:30:00','闭幕式新闻稿','巴黎奥运会圆满闭幕','经过多日的激烈角逐，巴黎奥运会今日圆满闭幕，感谢大家的支持...','2024-08-10 18:00:00'),(6,'巴黎奥运会管理员','2024-08-05 11:00:00','环球时报','2024-08-05 12:00:00','志愿者风采新闻稿','志愿者无私奉献，助力奥运','在巴黎奥运会的背后，有一群默默奉献的志愿者，他们为奥运会的顺利进行付出了巨大努力...','2024-08-05 13:00:00');
/*!40000 ALTER TABLE `sports_press_release` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_result_record`
--

DROP TABLE IF EXISTS `sports_result_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_result_record` (
  `jie` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `match_id` bigint(20) DEFAULT NULL COMMENT '比赛ID',
  `winner_athlete_id` bigint(20) DEFAULT NULL COMMENT '获胜运动员ID',
  `loser_athlete_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '失败运动员ID',
  `result` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '比赛结果',
  PRIMARY KEY (`jie`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='赛事管理-结果记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_result_record`
--

LOCK TABLES `sports_result_record` WRITE;
/*!40000 ALTER TABLE `sports_result_record` DISABLE KEYS */;
INSERT INTO `sports_result_record` VALUES (1,'巴黎奥运会管理员','2024-07-25 10:30:00','新华社','2024-06-13 11:28:36','男子100米决赛结果',1,1,'1,2,3','苏炳添 9.87秒 冠军'),(2,'巴黎奥运会管理员','2024-07-25 14:15:00','人民日报','2024-06-13 13:20:46','女子100米决赛结果',1,1,'3,5,6','李雪莲 11.05秒 冠军'),(3,'巴黎奥运会管理员','2024-07-26 12:00:00','中国体育报','2024-07-26 13:00:00','男子跳高决赛结果',1,1,'3017, 3052, 3026, 3019','张国伟 2.35米 冠军'),(4,'巴黎奥运会管理员','2024-07-28 16:45:00','中央电视台','2024-07-28 17:45:00','女子乒乓球单打决赛结果',2,1,'4011, 4012, 4035, 4012','孙颖莎 4-2 战胜 王曼昱 冠军'),(5,'巴黎奥运会管理员','2024-07-30 09:30:00','环球时报','2024-07-30 10:30:00','游泳男子100米自由泳决赛结果',3,2,'5005, 5022, 5031, 5051','宁泽涛 48.2秒 冠军'),(6,'巴黎奥运会管理员','2024-08-05 13:15:00','体育世界','2024-08-05 14:15:00','男子举重决赛结果',4,2,'6009, 6015, 6031, 6007','李发彬 总成绩313公斤 冠军');
/*!40000 ALTER TABLE `sports_result_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_rule_update`
--

DROP TABLE IF EXISTS `sports_rule_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_rule_update` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `rule_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '规则内容',
  `rule_effect_date` date DEFAULT NULL COMMENT '规则生效日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='赛事管理-规则更新';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_rule_update`
--

LOCK TABLES `sports_rule_update` WRITE;
/*!40000 ALTER TABLE `sports_rule_update` DISABLE KEYS */;
INSERT INTO `sports_rule_update` VALUES (1,'巴黎奥运会管理员1','2024-07-01 09:00:00','巴黎奥运会审核员A','2024-07-01 10:00:00','关于100米赛跑起跑规则的更新','新增电子起跑器使用规则，确保公平起跑。','2024-07-15'),(2,'巴黎奥运会管理员2','2024-07-05 14:30:00','巴黎奥运会审核员B','2024-07-05 15:30:00','跳高比赛器材更新通知','更新跳高比赛使用的横杆和垫子，提升运动员安全。','2024-07-20'),(3,'巴黎奥运会管理员3','2024-07-10 10:15:00','巴黎奥运会审核员C','2024-07-10 11:15:00','乒乓球比赛用球变更','更换为更耐用的比赛用球，确保比赛质量。','2024-07-25'),(4,'巴黎奥运会管理员4','2024-07-15 16:45:00','巴黎奥运会审核员D','2024-07-15 17:45:00','举重比赛评分规则调整','调整举重比赛评分细节，更加公平公正。','2024-08-01'),(5,'巴黎奥运会管理员5','2024-07-20 12:30:00','巴黎奥运会审核员E','2024-07-20 13:30:00','游泳比赛赛道划分优化','优化游泳比赛赛道划分，提升比赛流畅度。','2024-08-05'),(6,'巴黎奥运会管理员6','2024-07-25 08:45:00','巴黎奥运会审核员F','2024-07-25 09:45:00','田赛项目成绩统计规则更新','更新田赛项目成绩统计方法，确保成绩准确公正。','2024-08-10');
/*!40000 ALTER TABLE `sports_rule_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_safety_health_protocol`
--

DROP TABLE IF EXISTS `sports_safety_health_protocol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_safety_health_protocol` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `protocol_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '协议内容',
  `effective_date` date DEFAULT NULL COMMENT '生效日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='安全与健康协议';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_safety_health_protocol`
--

LOCK TABLES `sports_safety_health_protocol` WRITE;
/*!40000 ALTER TABLE `sports_safety_health_protocol` DISABLE KEYS */;
INSERT INTO `sports_safety_health_protocol` VALUES (1,'巴黎奥运会组委会','2024-07-01 10:00:00','健康协议审核员A','2024-07-01 11:00:00','关于运动员入场前健康检查的规定','所有运动员必须提交入场前72小时内核酸检测阴性证明。','2024-07-15'),(2,'巴黎奥运会医疗团队','2024-07-05 15:30:00','健康协议审核员B','2024-07-05 16:30:00','运动员比赛期间健康监测方案','每日进行体温检测，并密切关注运动员身体状况。','2024-07-20'),(3,'巴黎奥运会安全部门','2024-07-10 09:15:00','健康协议审核员C','2024-07-10 10:15:00','观众入场防疫规定','观众需提供入场前48小时内核酸检测阴性证明，并佩戴口罩入场。','2024-07-25'),(4,'巴黎奥运会后勤团队','2024-07-15 14:45:00','健康协议审核员D','2024-07-15 15:45:00','比赛场地消毒方案','每日比赛结束后对比赛场地进行全面消毒。','2024-08-01'),(5,'巴黎奥运会赛事管理部门','2024-07-20 11:30:00','健康协议审核员E','2024-07-20 12:30:00','运动员餐饮健康规定','运动员餐厅将提供营养均衡且安全的餐食。','2024-08-05'),(6,'巴黎奥运会新闻宣传部','2024-07-25 08:45:00','健康协议审核员F','2024-07-25 09:45:00','媒体工作人员健康协议','媒体工作人员需遵守同样的健康和安全规定。','2024-08-10');
/*!40000 ALTER TABLE `sports_safety_health_protocol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_safety_planning`
--

DROP TABLE IF EXISTS `sports_safety_planning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_safety_planning` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `emergency_plan` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '突发事件安全预案',
  `evacuation_plan` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '撤离计划',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='安全与健康协议-安全规划';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_safety_planning`
--

LOCK TABLES `sports_safety_planning` WRITE;
/*!40000 ALTER TABLE `sports_safety_planning` DISABLE KEYS */;
INSERT INTO `sports_safety_planning` VALUES (1,'巴黎奥运会安全部门','2024-07-01 10:00:00','安全预案审核员A','2024-07-01 11:00:00','关于火灾的安全预案','在发现火灾时，立即启动警报系统，疏散人群至安全区域，并联系消防部门。','根据火灾发生位置，规划多个撤离路线，确保观众和运动员安全撤离。'),(2,'巴黎奥运会赛事管理部门','2024-07-05 15:30:00','安全预案审核员B','2024-07-05 16:30:00','针对医疗突发事件的预案','在运动员或观众突发疾病时，立即提供急救措施，并联系医疗部门。','通过指定通道将病患转移至医疗区域，确保救治及时。'),(3,'巴黎奥运会场馆管理团队','2024-07-10 09:15:00','安全预案审核员C','2024-07-10 10:15:00','针对恐怖袭击的应急计划','加强安保措施，确保比赛场馆安全，遇到紧急情况，立即启动安全预案。','通过紧急通道和安全出口，组织人员有序撤离。'),(4,'巴黎奥运会电力保障团队','2024-07-15 14:45:00','安全预案审核员D','2024-07-15 15:45:00','电力故障应急预案','准备备用电源，确保在电力故障时，关键设施能够正常运行。','在电力恢复前，组织关键人员撤离至安全区域。'),(5,'巴黎奥运会交通管理团队','2024-07-20 11:30:00','安全预案审核员E','2024-07-20 12:30:00','交通事故应急预案','在交通事故发生时，立即启动紧急救援，并疏导交通。','规划备用路线，确保人员能够迅速撤离事故现场。'),(6,'巴黎奥运会新闻宣传部','2024-07-25 08:45:00','安全预案审核员F','2024-07-25 09:45:00','媒体应对安全计划','在紧急情况下，为媒体提供及时准确的信息，并引导媒体采访。','在紧急情况下，组织媒体人员有序撤离至安全区域。');
/*!40000 ALTER TABLE `sports_safety_planning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_social_media_interaction`
--

DROP TABLE IF EXISTS `sports_social_media_interaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_social_media_interaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `social_media_platform` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '社交媒体平台',
  `post_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '帖子内容',
  `post_date` datetime DEFAULT NULL COMMENT '发布日期',
  `engagement_count` int(11) DEFAULT '0' COMMENT '互动次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='媒体与公关-社交媒体互动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_social_media_interaction`
--

LOCK TABLES `sports_social_media_interaction` WRITE;
/*!40000 ALTER TABLE `sports_social_media_interaction` DISABLE KEYS */;
INSERT INTO `sports_social_media_interaction` VALUES (1,'巴黎奥运会社交媒体团队','2024-07-01 10:00:00','内容审核员A','2024-07-01 11:00:00','奥运会开幕式预告','微博','奥运会开幕式即将到来，敬请期待！','2024-07-25 20:00:00',10000),(2,'巴黎奥运会社交媒体团队','2024-07-02 12:30:00','内容审核员B','2024-07-02 13:30:00','精彩瞬间回顾','抖音','昨晚的体操比赛真是太精彩了！','2024-07-02 18:00:00',15000),(3,'巴黎奥运会社交媒体团队','2024-07-05 15:00:00','内容审核员C','2024-07-05 16:00:00','游泳冠军诞生','推特','恭喜张三获得游泳金牌！','2024-07-05 14:30:00',8000),(4,'巴黎奥运会社交媒体团队','2024-07-10 09:45:00','内容审核员D','2024-07-10 10:45:00','羽毛球决赛预告','Instagram','羽毛球决赛即将开始，谁将笑到最后？','2024-07-10 19:00:00',12000),(5,'巴黎奥运会社交媒体团队','2024-07-15 14:15:00','内容审核员E','2024-07-15 15:15:00','观众互动活动','微信','参与我们的有奖竞猜，赢取精美礼品！','2024-07-15 10:00:00',20000),(6,'巴黎奥运会社交媒体团队','2024-07-20 11:00:00','内容审核员F','2024-07-20 12:00:00','闭幕式预告','脸书','奥运会闭幕式即将开始，感谢大家的陪伴！','2024-07-30 20:00:00',18000),(7,'巴黎奥运会社交媒体团队','2024-07-22 16:30:00','内容审核员G','2024-07-22 17:30:00','运动员采访','哔哩哔哩','听听冠军们的心声！','2024-07-22 15:00:00',13000),(8,'巴黎奥运会社交媒体团队','2024-07-25 08:45:00','内容审核员H','2024-07-25 09:45:00','志愿者风采','小红书','感谢所有辛勤付出的志愿者！','2024-07-25 07:00:00',16000);
/*!40000 ALTER TABLE `sports_social_media_interaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_ticket_management`
--

DROP TABLE IF EXISTS `sports_ticket_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_ticket_management` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `event_id` bigint(20) DEFAULT NULL COMMENT '赛事ID',
  `ticket_price` decimal(10,2) DEFAULT NULL COMMENT '票价',
  `ticket_quantity` int(11) DEFAULT NULL COMMENT '票量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='门票与观众服务-门票管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_ticket_management`
--

LOCK TABLES `sports_ticket_management` WRITE;
/*!40000 ALTER TABLE `sports_ticket_management` DISABLE KEYS */;
INSERT INTO `sports_ticket_management` VALUES (1,'巴黎奥运会票务团队','2024-07-01 10:00:00','票务审核员A','2024-07-01 11:00:00','开幕式门票',1,1000.00,5000),(2,'巴黎奥运会票务团队','2024-07-02 12:30:00','票务审核员B','2024-07-02 13:30:00','男子100米决赛门票',2,300.00,2000),(3,'巴黎奥运会票务团队','2024-07-05 15:00:00','票务审核员C','2024-07-05 16:00:00','女子体操全能决赛门票',3,200.00,1500),(4,'巴黎奥运会票务团队','2024-07-10 09:45:00','票务审核员D','2024-07-10 10:45:00','跳水比赛门票',4,150.00,3000),(5,'巴黎奥运会票务团队','2024-07-15 14:15:00','票务审核员E','2024-07-15 15:15:00','篮球半决赛门票',5,500.00,4000),(6,'巴黎奥运会票务团队','2024-07-20 11:00:00','票务审核员F','2024-07-20 12:00:00','闭幕式门票',6,800.00,3500),(7,'巴黎奥运会票务团队','2024-07-22 16:30:00','票务审核员G','2024-07-22 17:30:00','举重比赛门票',7,100.00,8000),(8,'巴黎奥运会票务团队','2024-07-25 08:45:00','票务审核员H','2024-07-25 09:45:00','游泳比赛门票',8,250.00,5500),(9,'巴黎奥运会票务团队','2024-07-28 13:15:00','票务审核员I','2024-07-28 14:15:00','田径全能赛门票',9,400.00,2800),(10,'巴黎奥运会票务团队','2024-07-30 19:00:00','票务审核员J','2024-07-30 20:00:00','残奥会开幕式门票',10,50.00,6000);
/*!40000 ALTER TABLE `sports_ticket_management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_ticket_sales`
--

DROP TABLE IF EXISTS `sports_ticket_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_ticket_sales` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `event_id` bigint(20) DEFAULT NULL COMMENT '赛事ID',
  `ticket_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '票种类别',
  `ticket_price` decimal(10,2) DEFAULT NULL COMMENT '票价',
  `total_quantity` int(11) DEFAULT NULL COMMENT '总票量',
  `sold_quantity` int(11) DEFAULT '0' COMMENT '已售票量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='门票与观众服务-门票销售';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_ticket_sales`
--

LOCK TABLES `sports_ticket_sales` WRITE;
/*!40000 ALTER TABLE `sports_ticket_sales` DISABLE KEYS */;
INSERT INTO `sports_ticket_sales` VALUES (1,'巴黎奥运会票务团队','2024-07-01 09:00:00','票务审核员A','2024-07-01 10:00:00','开幕式门票销售',1,'1',2000.00,1000,500),(2,'巴黎奥运会票务团队','2024-07-02 11:30:00','票务审核员B','2024-07-02 12:30:00','100米决赛门票销售',2,'1',800.00,2000,1500),(3,'巴黎奥运会票务团队','2024-07-05 14:00:00','票务审核员C','2024-07-05 15:00:00','跳水决赛门票销售',3,'0',500.00,1500,1000),(4,'巴黎奥运会票务团队','2024-07-10 10:45:00','票务审核员D','2024-07-10 11:45:00','篮球半决赛门票销售',4,'0',300.00,3000,2500),(5,'巴黎奥运会票务团队','2024-07-15 15:15:00','票务审核员E','2024-07-15 16:15:00','闭幕式门票销售',5,'0',1500.00,800,700),(6,'巴黎奥运会票务团队','2024-07-20 12:00:00','票务审核员F','2024-07-20 13:00:00','马拉松门票销售',6,'2',100.00,5000,4000),(7,'巴黎奥运会票务团队','2024-07-22 16:30:00','票务审核员G','2024-07-22 17:30:00','体操决赛门票销售',7,'2',600.00,1200,1100),(8,'巴黎奥运会票务团队','2024-07-25 13:45:00','票务审核员H','2024-07-25 14:45:00','游泳决赛门票销售',8,'2',400.00,1800,1600),(9,'巴黎奥运会票务团队','2024-07-28 18:15:00','票务审核员I','2024-07-28 19:15:00','拳击半决赛门票销售',9,'3',2000.00,500,400);
/*!40000 ALTER TABLE `sports_ticket_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_transportation_scheduling`
--

DROP TABLE IF EXISTS `sports_transportation_scheduling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_transportation_scheduling` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `transportation_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交通类型',
  `schedule_details` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '调度详情',
  `capacity` int(11) DEFAULT NULL COMMENT '容量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='住宿与交通调度-交通调度';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_transportation_scheduling`
--

LOCK TABLES `sports_transportation_scheduling` WRITE;
/*!40000 ALTER TABLE `sports_transportation_scheduling` DISABLE KEYS */;
INSERT INTO `sports_transportation_scheduling` VALUES (1,'巴黎奥运会交通调度团队','2024-07-01 08:00:00','交通调度审核员A','2024-06-13 11:00:25','开幕式专车调度','1','从机场至开幕式场地，预计搭载200人',200),(2,'巴黎奥运会交通调度团队','2024-07-02 10:30:00','交通调度审核员B','2024-06-13 11:00:29','田径赛事观众接送','2','往返于赛场与住宿酒店，每车可载50人',50),(3,'巴黎奥运会交通调度团队','2024-07-05 13:00:00','交通调度审核员C','2024-06-13 15:20:28','游泳赛事交通调度','3','利用地铁网络疏导观众',2000),(4,'巴黎奥运会交通调度团队','2024-07-10 11:45:00','交通调度审核员D','2024-07-10 12:45:00','自行车赛事观众交通','自行车租赁','提供自行车租赁服务给短途观众',100),(5,'巴黎奥运会交通调度团队','2024-07-15 16:15:00','交通调度审核员E','2024-07-15 17:15:00','闭幕式专车及大巴调度','专车,大巴','提供多种交通工具满足闭幕式观众需求',300),(6,'巴黎奥运会交通调度团队','2024-07-20 09:00:00','交通调度审核员F','2024-07-20 10:00:00','马拉松观众接驳','接驳车','沿途设置多个接驳点，方便观众观赛',30),(7,'巴黎奥运会交通调度团队','2024-07-22 14:30:00','交通调度审核员G','2024-07-22 15:30:00','体操赛事观众交通','出租车','提供出租车服务给需要快速到达的观众',4),(8,'巴黎奥运会交通调度团队','2024-07-25 12:45:00','交通调度审核员H','2024-07-25 13:45:00','水上项目观众轮渡','轮渡','提供轮渡服务给水上项目观众',1000),(9,'巴黎奥运会交通调度团队','2024-07-28 17:15:00','交通调度审核员I','2024-07-28 18:15:00','残奥会交通调度','专车,大巴,地铁','提供全方位交通服务给残奥会观众',450);
/*!40000 ALTER TABLE `sports_transportation_scheduling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_transportation_service`
--

DROP TABLE IF EXISTS `sports_transportation_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_transportation_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `service_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '服务类型（场馆间接送）',
  `vehicle_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '车辆类型',
  `capacity` int(11) DEFAULT NULL COMMENT '容量',
  `schedule_details` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '调度详情（时间表）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='住宿与交通调度-交通服务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_transportation_service`
--

LOCK TABLES `sports_transportation_service` WRITE;
/*!40000 ALTER TABLE `sports_transportation_service` DISABLE KEYS */;
INSERT INTO `sports_transportation_service` VALUES (1,'巴黎奥运会交通服务团队','2024-07-01 09:00:00','交通服务审核员A','2024-06-13 10:59:38','主场馆至酒店接送服务','0','0',50,'每日早晚高峰时段提供从主场馆至指定酒店的大巴接送服务'),(2,'巴黎奥运会交通服务团队','2024-07-02 11:30:00','交通服务审核员B','2024-06-13 11:00:11','水上运动中心专车服务','0','1',4,'为水上运动中心观众提供专车接送服务'),(3,'巴黎奥运会交通服务团队','2024-07-05 14:00:00','交通服务审核员C','2024-07-05 15:00:00','自行车租赁点至赛场服务','场馆间接送','自行车',100,'设立自行车租赁点，方便观众骑行至赛场'),(4,'巴黎奥运会交通服务团队','2024-07-10 10:45:00','交通服务审核员D','2024-07-10 11:45:00','地铁线路导览服务','场馆间接送','地铁',2000,'提供地铁线路导览服务，方便观众快速到达赛场'),(5,'巴黎奥运会交通服务团队','2024-07-15 15:15:00','交通服务审核员E','2024-07-15 16:15:00','残奥会无障碍车辆服务','场馆间接送','无障碍巴士',30,'为残奥会观众提供无障碍巴士服务'),(6,'巴黎奥运会交通服务团队','2024-07-20 12:00:00','交通服务审核员F','2024-07-20 13:00:00','夜间公交加开服务','场馆间接送','公交车',60,'为夜间赛事提供加开的公交服务'),(7,'巴黎奥运会交通服务团队','2024-07-22 16:30:00','交通服务审核员G','2024-07-22 17:30:00','酒店穿梭巴士服务','场馆间接送','穿梭巴士',20,'在酒店间提供穿梭巴士服务，方便观众和运动员'),(8,'巴黎奥运会交通服务团队','2024-07-25 13:45:00','交通服务审核员H','2024-07-25 14:45:00','观众应急交通服务','场馆间接送','应急车辆',10,'为遇到紧急情况的观众提供应急交通服务'),(9,'巴黎奥运会交通服务团队','2024-07-28 18:15:00','交通服务审核员I','2024-07-28 19:15:00','贵宾专车服务','场馆间接送','豪华专车',2,'为贵宾提供豪华专车接送服务');
/*!40000 ALTER TABLE `sports_transportation_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_volunteer`
--

DROP TABLE IF EXISTS `sports_volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_volunteer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '内容',
  `views` int(11) DEFAULT '0' COMMENT '浏览量',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='志愿者信息中心';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_volunteer`
--

LOCK TABLES `sports_volunteer` WRITE;
/*!40000 ALTER TABLE `sports_volunteer` DISABLE KEYS */;
INSERT INTO `sports_volunteer` VALUES (2,'志愿者招募通知','奥运会志愿者招募工作即将开始，请有意愿的人员密切关注。',1001,'管理员A','2024-06-18 09:23:18','管理员A','2024-06-18 09:23:18'),(3,'志愿者培训通知','奥运会志愿者培训工作即将开始，请有意愿的志愿者提前做好准备。',951,'管理员B','2024-06-18 09:23:18','管理员B','2024-06-18 09:23:18'),(4,'志愿者工作安排','请志愿者们参照附件中的工作安排表，准时到岗参与工作。',1200,'管理员A','2024-06-18 09:23:18','管理员A','2024-06-18 09:23:18'),(5,'志愿者活动通知','请志愿者们关注附件中的活动通知，参加相关活动。',800,'管理员B','2024-06-18 09:23:18','管理员B','2024-06-18 09:23:18'),(6,'志愿者聚会安排','请所有志愿者留意附件中的聚会安排，准时参加聚会活动。',950,'管理员A','2024-06-18 09:23:18','管理员A','2024-06-18 09:23:18'),(7,'志愿者心得分享','感谢志愿者们对奥运会的付出，欢迎大家分享志愿者心得。',1100,'管理员B','2024-06-18 09:23:18','管理员B','2024-06-18 09:23:18'),(8,'志愿者感谢信','感谢所有志愿者为奥运会所做出的贡献，你们是最棒的！',1001,'管理员A','2024-06-18 09:23:18','管理员A','2024-06-18 09:23:18'),(9,'志愿者福利待遇','请志愿者们查看附件中的福利待遇通知，享受志愿者特殊待遇。',900,'管理员B','2024-06-18 09:23:18','管理员B','2024-06-18 09:23:18'),(10,'志愿者勤奋奖励','恭喜以下志愿者获得勤奋奖励，请查看附件获取详细信息。',1000,'管理员A','2024-06-18 09:23:18','管理员A','2024-06-18 09:23:18'),(11,'志愿者感谢晚宴','感谢所有志愿者的辛勤付出，邀请大家参加志愿者感谢晚宴。',950,'管理员B','2024-06-18 09:23:18','管理员B','2024-06-18 09:23:18'),(12,'志愿者协议签署','请所有志愿者务必签署志愿者服务协议，确保服务质量和安全。',1000,'管理员A','2024-06-18 09:23:18','管理员A','2024-06-18 09:23:18'),(13,'志愿者服务说明','请志愿者们仔细阅读附件中的志愿者服务说明，了解相关要求。',900,'管理员B','2024-06-18 09:23:18','管理员B','2024-06-18 09:23:18'),(14,'志愿者安全培训','请所有志愿者参加附件中的安全培训课程，确保安全意识。',1100,'管理员A','2024-06-18 09:23:18','管理员A','2024-06-18 09:23:18'),(15,'志愿者服务时间','请志愿者们查看附件中的服务时间安排表，按时参与志愿者工作。',950,'管理员B','2024-06-18 09:23:18','管理员B','2024-06-18 09:23:18'),(16,'志愿者工作指南','请志愿者们仔细阅读附件中的工作指南，了解具体工作要求。',1000,'管理员A','2024-06-18 09:23:18','管理员A','2024-06-18 09:23:18'),(17,'志愿者活动策划','欢迎志愿者们提出活动策划方案，一起为奥运会增添色彩。',900,'管理员B','2024-06-18 09:23:18','管理员B','2024-06-18 09:23:18'),(18,'志愿者服务感言','请志愿者们分享自己的志愿者服务感言，鼓励更多人加入志愿者行列。',1000,'管理员A','2024-06-18 09:23:18','管理员A','2024-06-18 09:23:18'),(19,'志愿者工作评分','请所有参与志愿者工作的人员留意附件中的工作评分细则，及时反馈。',950,'管理员B','2024-06-18 09:23:18','管理员B','2024-06-18 09:23:18'),(20,'志愿者联系方式更新','请志愿者们更新自己的联系方式，确保及时沟通和联系。',1000,'管理员A','2024-06-18 09:23:18','管理员A','2024-06-18 09:23:18'),(21,'志愿者退役申请','请有退役意愿的志愿者们填写附件中的退役申请表，谢谢合作。',900,'管理员B','2024-06-18 09:23:18','管理员B','2024-06-18 09:23:18'),(22,'志愿者工作总结','感谢所有志愿者为奥运会付出的辛勤努力，欢迎大家总结工作体会。',1000,'管理员A','2024-06-18 09:23:18','管理员A','2024-06-18 09:23:18');
/*!40000 ALTER TABLE `sports_volunteer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_volunteer_activity_assignment`
--

DROP TABLE IF EXISTS `sports_volunteer_activity_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_volunteer_activity_assignment` (
  `zho` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `volunteer_id` bigint(20) DEFAULT NULL COMMENT '志愿者ID',
  `event_id` bigint(20) DEFAULT NULL COMMENT '赛事ID',
  `assignment_detail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '工作分配详情',
  PRIMARY KEY (`zho`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='志愿者管理-活动分配';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_volunteer_activity_assignment`
--

LOCK TABLES `sports_volunteer_activity_assignment` WRITE;
/*!40000 ALTER TABLE `sports_volunteer_activity_assignment` DISABLE KEYS */;
INSERT INTO `sports_volunteer_activity_assignment` VALUES (1,'巴黎奥运会志愿者分配团队','2024-06-20 09:00:00','志愿者分配员A','2024-06-13 11:08:51','开幕式现场引导',2,1,'负责开幕式入场引导工作'),(2,'巴黎奥运会志愿者分配团队','2024-06-25 11:30:00','志愿者分配员B','2024-06-18 09:00:57','游泳比赛检录',1,2,'负责游泳比赛的检录工作'),(3,'巴黎奥运会志愿者分配团队','2024-07-01 14:15:00','志愿者分配员C','2024-06-18 09:01:01','田径比赛看台服务',4,3,'负责田径比赛看台区域的观众服务工作'),(4,'巴黎奥运会志愿者分配团队','2024-07-05 08:45:00','志愿者分配员D','2024-06-18 09:01:05','篮球比赛计分',8,4,'负责篮球比赛的计分工作'),(5,'巴黎奥运会志愿者分配团队','2024-07-10 10:30:00','志愿者分配员E','2024-06-18 09:01:09','媒体中心接待',7,5,'负责媒体中心的接待和咨询工作'),(6,'巴黎奥运会志愿者分配团队','2024-07-15 13:00:00','志愿者分配员F','2024-06-18 09:01:13','闭幕式安保',3,6,'负责闭幕式的安保工作'),(7,'巴黎奥运会志愿者分配团队','2024-07-20 15:30:00','志愿者分配员G','2024-06-18 09:01:20','运动员休息区服务',6,2,'负责运动员休息区的服务工作'),(8,'巴黎奥运会志愿者分配团队','2024-07-25 09:15:00','志愿者分配员H','2024-06-18 09:01:28','餐饮服务协助',6,3,'协助餐饮服务团队进行餐饮服务'),(9,'巴黎奥运会志愿者分配团队','2024-07-30 11:45:00','志愿者分配员I','2024-06-18 09:01:37','交通站点指引',3,4,'负责交通站点的指引工作'),(10,'巴黎奥运会志愿者分配团队','2024-08-02 14:00:00','志愿者分配员J','2024-06-18 09:01:41','环保宣传',4,3,'负责环保宣传，鼓励观众和运动员');
/*!40000 ALTER TABLE `sports_volunteer_activity_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_volunteer_application_approval`
--

DROP TABLE IF EXISTS `sports_volunteer_application_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_volunteer_application_approval` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `volunteer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '志愿者姓名',
  `application_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '申请状态',
  `qualification_review` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '资格审查',
  `assignment_info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '分配信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='志愿者管理-申请与审批';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_volunteer_application_approval`
--

LOCK TABLES `sports_volunteer_application_approval` WRITE;
/*!40000 ALTER TABLE `sports_volunteer_application_approval` DISABLE KEYS */;
INSERT INTO `sports_volunteer_application_approval` VALUES (1,'巴黎奥运会志愿者招募团队','2024-05-01 09:00:00','审核员A','2024-06-13 11:16:02','申请已提交','张三','0','资格审查通过，具备基本语言能力','待分配'),(2,'巴黎奥运会志愿者招募团队','2024-05-05 10:30:00','审核员B','2024-06-13 11:16:06','申请人具备相关经验','李四','1','经验丰富，适合担任翻译工作','开幕式翻译'),(3,'巴黎奥运会志愿者招募团队','2024-05-10 12:15:00','审核员C','2024-06-18 09:01:56','需要补充材料','王五','0','需补充语言能力证明',NULL),(4,'巴黎奥运会志愿者招募团队','2024-05-15 14:00:00','审核员D','2024-05-15 15:00:00','年龄不符合要求','赵六','未通过','年龄超过限制',NULL),(5,'巴黎奥运会志愿者招募团队','2024-05-20 15:45:00','审核员E','2024-05-20 16:45:00','申请人具备医疗知识','孙七','已通过','适合担任医疗志愿者','比赛现场医疗支持'),(6,'巴黎奥运会志愿者招募团队','2024-05-25 08:30:00','审核员F','2024-05-25 09:30:00','申请信息填写不完整','周八','待完善','缺少联系方式',NULL),(7,'巴黎奥运会志愿者招募团队','2024-05-30 10:15:00','审核员G','2024-05-30 11:15:00','具备体育专业知识','吴九','已通过','适合担任体育竞赛志愿者','田径比赛裁判助理'),(8,'巴黎奥运会志愿者招募团队','2024-06-05 11:45:00','审核员H','2024-06-05 12:45:00','申请人已接受培训','郑十','已通过','已完成志愿者培训','媒体中心志愿者'),(9,'巴黎奥运会志愿者招募团队','2024-06-10 13:30:00','审核员I','2024-06-10 14:30:00','申请材料已齐全','陈十一','待审核','资料齐全，等待进一步审核',NULL);
/*!40000 ALTER TABLE `sports_volunteer_application_approval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_volunteer_training_management`
--

DROP TABLE IF EXISTS `sports_volunteer_training_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports_volunteer_training_management` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `training_material` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '在线培训材料',
  `offline_training_schedule` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '线下培训课程安排',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='志愿者管理-培训管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_volunteer_training_management`
--

LOCK TABLES `sports_volunteer_training_management` WRITE;
/*!40000 ALTER TABLE `sports_volunteer_training_management` DISABLE KEYS */;
INSERT INTO `sports_volunteer_training_management` VALUES (1,'巴黎奥运会培训团队','2024-04-01 09:00:00','管理员A','2024-06-13 11:18:40','基础培训材料','/profile/upload/2024/06/13/河北工业_20240613111839A001.pdf','2024年4月5日，上午9点至下午5点'),(2,'巴黎奥运会培训团队','2024-04-05 10:30:00','管理员B','2024-04-05 11:30:00','体育安全知识','《体育安全知识手册》.pdf','2024年4月10日，全天'),(3,'巴黎奥运会培训团队','2024-04-10 12:15:00','管理员C','2024-04-10 13:15:00','语言沟通技巧','《语言沟通技巧》.pptx','2024年4月15日，上午9点至下午3点'),(4,'巴黎奥运会培训团队','2024-04-15 14:00:00','管理员D','2024-04-15 15:00:00','急救知识培训','《急救知识培训视频》.mp4','2024年4月20日，下午2点至4点'),(5,'巴黎奥运会培训团队','2024-04-20 15:45:00','管理员E','2024-04-20 16:45:00','残疾人服务培训','《残疾人服务手册》.pdf','2024年4月25日，上午9点至12点'),(6,'巴黎奥运会培训团队','2024-04-25 08:30:00','管理员F','2024-04-25 09:30:00','消防安全知识','《消防安全知识手册》.pdf','2024年5月1日，下午2点至5点'),(7,'巴黎奥运会培训团队','2024-05-01 10:15:00','管理员G','2024-05-01 11:15:00','场馆设施介绍','《场馆设施介绍》.docx','2024年5月5日，全天'),(8,'巴黎奥运会培训团队','2024-05-05 11:45:00','管理员H','2024-05-05 12:45:00','媒体应对技巧','《媒体应对技巧》.mp4','2024年5月10日，上午9点至下午1点'),(9,'巴黎奥运会培训团队','2024-05-10 13:30:00','管理员I','2024-05-10 14:30:00','文化礼仪培训','《文化礼仪手册》.pdf','2024年5月15日，下午2点至5点');
/*!40000 ALTER TABLE `sports_volunteer_training_management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-green','Y','admin','2023-04-13 20:46:20','admin','2023-04-22 00:45:19','蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2023-04-13 20:46:20','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-light','Y','admin','2023-04-13 20:46:20','admin','2023-04-22 00:45:25','深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2023-04-13 20:46:20','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','true','Y','admin','2023-04-13 20:46:20','admin','2023-04-22 00:41:41','是否开启注册用户功能（true开启，false关闭）'),(100,'主题颜色','sys.index.theme','#11A983','Y','admin','2023-04-22 00:57:18','admin','2023-04-22 00:58:23',NULL),(101,'开启TopNav','sys.index.topNav','true','Y','admin','2023-04-22 00:58:59','',NULL,NULL),(102,'开启Tags-Views','sys.index.tagsView','true','Y','admin','2023-04-22 00:59:40','',NULL,NULL),(103,'显示Logo','sys.index.sidebarLogo','true','Y','admin','2023-04-22 01:00:20','',NULL,NULL),(104,'固定Header','sys.index.fixedHeader','true','Y','admin','2023-04-22 01:00:53','',NULL,NULL),(105,'动态标题','sys.index.dynamicTitle','true','Y','admin','2023-04-22 01:01:26','admin','2023-04-22 01:01:41',NULL);
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-12 11:14:17','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-12 11:14:17','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-12 11:14:17','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-12 11:14:17','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-12 11:14:17','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-12 11:14:17','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-12 11:14:17','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-12 11:14:17','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-12 11:14:17','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-12 11:14:17','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-06-12 11:14:17','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-06-12 11:14:17','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-06-12 11:14:17','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-06-12 11:14:17','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-06-12 11:14:17','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-06-12 11:14:17','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-06-12 11:14:17','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-06-12 11:14:17','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-06-12 11:14:17','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-06-12 11:14:17','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-06-12 11:14:17','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-06-12 11:14:17','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-06-12 11:14:17','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-06-12 11:14:17','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-06-12 11:14:17','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-06-12 11:14:17','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-06-12 11:14:17','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-06-12 11:14:17','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-06-12 11:14:17','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-06-12 11:14:17','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-06-12 11:14:17','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-06-12 11:14:17','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-06-12 11:14:17','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-06-12 11:14:17','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-06-12 11:14:17','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-06-12 11:14:17','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-06-12 11:14:17','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-06-12 11:14:17','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-06-12 11:14:17','',NULL,'停用状态'),(100,0,'运动员','0','person_type',NULL,'default','N','0','admin','2024-06-12 14:26:13','',NULL,NULL),(101,0,'工作人员','1','person_type',NULL,'default','N','0','admin','2024-06-12 14:26:22','',NULL,NULL),(102,0,'销售','0','service_type',NULL,'default','N','0','admin','2024-06-12 14:51:05','',NULL,NULL),(103,0,'售后','1','service_type',NULL,'default','N','0','admin','2024-06-12 14:51:12','',NULL,NULL),(104,0,'展示','2','service_type',NULL,'default','N','0','admin','2024-06-12 14:51:17','',NULL,NULL),(105,0,'未处理','0','dis_status','','default','N','0','admin','2024-06-12 14:58:34','admin','2024-06-13 16:25:05',NULL),(106,0,'已处理','1','dis_status',NULL,'default','N','0','admin','2024-06-12 14:58:40','',NULL,NULL),(107,0,'POST','POST','online_api_method',NULL,'default','N','0','admin','2024-02-21 18:23:23','',NULL,NULL),(108,0,'GET','GET','online_api_method',NULL,'default','N','0','admin','2024-02-21 18:23:30','',NULL,NULL),(109,0,'PUT','PUT','online_api_method',NULL,'default','N','0','admin','2024-02-21 18:23:37','',NULL,NULL),(110,0,'DELETE','DELETE','online_api_method',NULL,'default','N','0','admin','2024-02-21 18:23:49','',NULL,NULL),(111,0,'select','select','online_api_tag',NULL,'default','N','0','admin','2024-02-21 18:24:06','',NULL,NULL),(112,0,'update','update','online_api_tag',NULL,'default','N','0','admin','2024-02-21 18:24:12','',NULL,NULL),(113,0,'insert','insert','online_api_tag',NULL,'default','N','0','admin','2024-02-21 18:24:18','',NULL,NULL),(114,0,'delete','delete','online_api_tag',NULL,'default','N','0','admin','2024-02-21 18:24:26','',NULL,NULL),(115,0,'selectList','selectList','online_api_actuator',NULL,'default','N','0','admin','2024-02-21 18:25:00','',NULL,NULL),(116,0,'insert','insert','online_api_actuator',NULL,'default','N','0','admin','2024-02-21 18:25:05','',NULL,NULL),(117,0,'selectOne','selectOne','online_api_actuator',NULL,'default','N','0','admin','2024-02-21 18:25:11','',NULL,NULL),(118,0,'update','update','online_api_actuator',NULL,'default','N','0','admin','2024-02-21 18:25:16','',NULL,NULL),(119,0,'delete','delete','online_api_actuator',NULL,'default','N','0','admin','2024-02-21 18:25:21','',NULL,NULL),(120,0,'VIP座位','0','ticket_type',NULL,'default','N','0','admin','2024-06-12 17:18:36','',NULL,NULL),(121,0,'A级座位','1','ticket_type',NULL,'default','N','0','admin','2024-06-12 17:18:46','',NULL,NULL),(122,0,'B级座位','2','ticket_type',NULL,'default','N','0','admin','2024-06-12 17:18:54','',NULL,NULL),(123,0,'普通座位','3','ticket_type',NULL,'default','N','0','admin','2024-06-12 17:19:10','',NULL,NULL),(124,0,'看台座位','4','ticket_type',NULL,'default','N','0','admin','2024-06-12 17:19:17','',NULL,NULL),(125,0,'媒体人员','2','person_type',NULL,'default','N','0','admin','2024-06-13 08:44:55','',NULL,NULL),(126,0,'酒店','0','accommodation_type',NULL,'default','N','0','admin','2024-06-13 09:03:22','',NULL,NULL),(127,0,'民俗','1','accommodation_type',NULL,'default','N','0','admin','2024-06-13 09:03:29','',NULL,NULL),(128,0,'专车','0','transportation_type',NULL,'default','N','0','admin','2024-06-13 09:11:59','',NULL,NULL),(129,0,'大巴','1','transportation_type',NULL,'default','N','0','admin','2024-06-13 09:12:03','',NULL,NULL),(130,0,'地铁','2','transportation_type',NULL,'default','N','0','admin','2024-06-13 09:12:10','',NULL,NULL),(131,0,'自行车租借','3','transportation_type',NULL,'default','N','0','admin','2024-06-13 09:12:32','',NULL,NULL),(133,0,'场馆间接送','0','traffic_service_type',NULL,'default','N','0','admin','2024-06-13 10:58:54','',NULL,NULL),(134,0,'待审核','0','application_status',NULL,'default','N','0','admin','2024-06-13 11:10:34','',NULL,NULL),(135,0,'已通过','1','application_status',NULL,'default','N','0','admin','2024-06-13 11:10:47','',NULL,NULL),(136,0,'未通过','2','application_status',NULL,'default','N','0','admin','2024-06-13 11:10:52','',NULL,NULL),(137,0,'处理中','0','feedback_status',NULL,'default','N','0','admin','2024-06-13 13:26:40','',NULL,NULL),(138,0,'处理完成','1','feedback_status',NULL,'default','N','0','admin','2024-06-13 13:26:45','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-06-12 11:14:17','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-06-12 11:14:17','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-06-12 11:14:17','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-06-12 11:14:17','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-06-12 11:14:17','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-06-12 11:14:17','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-06-12 11:14:17','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-06-12 11:14:17','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-06-12 11:14:17','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-06-12 11:14:17','',NULL,'登录状态列表'),(100,'人员类型','person_type','0','admin','2024-06-12 14:25:58','',NULL,NULL),(101,'服务类型','service_type','0','admin','2024-06-12 14:50:50','',NULL,NULL),(102,'处理状态','dis_status','0','admin','2024-06-12 14:58:23','',NULL,NULL),(103,'请求方式','online_api_method','0','admin','2024-02-21 18:22:03','admin','2024-02-21 18:22:13',NULL),(104,'标签名','online_api_tag','0','admin','2024-02-21 18:22:29','',NULL,NULL),(105,'响应类型','online_api_result','0','admin','2024-02-21 18:22:46','',NULL,NULL),(106,'执行器','online_api_actuator','0','admin','2024-02-21 18:23:03','',NULL,NULL),(107,'票种类别','ticket_type','0','admin','2024-06-12 17:18:02','',NULL,NULL),(108,'住宿类型','accommodation_type','0','admin','2024-06-13 09:01:00','',NULL,NULL),(109,'交通类型','transportation_type','0','admin','2024-06-13 09:11:30','',NULL,NULL),(110,'交通服务类型','traffic_service_type','0','admin','2024-06-13 09:18:50','',NULL,NULL),(111,'志愿者申请状态','application_status','0','admin','2024-06-13 11:10:06','',NULL,NULL),(112,'反馈状态','feedback_status','0','admin','2024-06-13 13:26:17','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-06-12 11:14:17','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-06-12 11:14:17','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-06-12 11:14:17','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  KEY `idx_sys_logininfor_s` (`status`) USING BTREE,
  KEY `idx_sys_logininfor_lt` (`login_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-12 11:22:04'),(101,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-13 08:43:43'),(102,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-13 10:17:52'),(103,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-13 15:10:50'),(104,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-13 15:11:02'),(105,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-13 15:11:14'),(106,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-13 15:11:20'),(107,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-13 15:12:45'),(108,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-13 15:13:01'),(109,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-13 15:13:19'),(110,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-13 15:14:00'),(111,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-13 16:15:21'),(112,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-13 18:03:39'),(113,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-13 18:26:12'),(114,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-13 18:29:33'),(115,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-13 18:29:38'),(116,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 08:32:23'),(117,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 08:33:50'),(118,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 08:34:43'),(119,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 09:05:44'),(120,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-14 10:20:04'),(121,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 10:22:08'),(122,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-14 10:34:45'),(123,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 10:36:44'),(124,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-14 10:36:52'),(125,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 10:38:01'),(126,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-14 10:38:06'),(127,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 10:38:09'),(128,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-14 10:40:03'),(129,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 10:40:19'),(130,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-14 10:40:29'),(131,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 10:40:33'),(132,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-14 10:45:11'),(133,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 10:46:06'),(134,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-14 10:54:52'),(135,'admin','10.199.14.164','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 11:08:28'),(136,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 11:11:12'),(137,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-14 11:12:56'),(138,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 11:13:02'),(139,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 13:35:31'),(140,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 14:04:53'),(141,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-14 14:14:33'),(142,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 14:15:38'),(143,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-14 14:42:23'),(144,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 14:43:48'),(145,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-14 14:48:42'),(146,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 14:53:29'),(147,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-14 15:06:18'),(148,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 15:11:36'),(149,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-14 15:29:33'),(150,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-14 15:29:48'),(151,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 15:29:52'),(152,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-14 15:30:31'),(153,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 15:30:36'),(154,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-14 15:30:57'),(155,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 15:31:06'),(156,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-14 15:31:10'),(157,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 15:31:14'),(158,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-14 16:09:39'),(159,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 16:09:52'),(160,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 16:28:53'),(161,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-17 08:36:48'),(162,'admin','10.199.13.110','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-17 08:40:49'),(163,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-18 09:00:10'),(164,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-18 09:23:53'),(165,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-18 13:54:06'),(166,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-18 13:59:55'),(167,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-18 13:59:58'),(168,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-18 15:38:40');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2045 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2024-06-12 11:14:17','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2024-06-12 11:14:17','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2024-06-12 11:14:17','',NULL,'系统工具目录'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2024-06-12 11:14:17','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2024-06-12 11:14:17','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-06-12 11:14:17','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2024-06-12 11:14:17','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2024-06-12 11:14:17','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2024-06-12 11:14:17','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2024-06-12 11:14:17','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2024-06-12 11:14:17','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2024-06-12 11:14:17','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2024-06-12 11:14:17','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2024-06-12 11:14:17','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-06-12 11:14:17','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2024-06-12 11:14:17','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-06-12 11:14:17','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-06-12 11:14:17','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2024-06-12 11:14:17','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2024-06-12 11:14:27','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-06-12 11:14:17','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-06-12 11:14:17','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-06-12 11:14:17','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2024-06-12 11:14:17','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2024-06-12 11:14:17','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2024-06-12 11:14:17','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2024-06-12 11:14:17','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2024-06-12 11:14:17','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2024-06-12 11:14:17','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-06-12 11:14:17','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2024-06-12 11:14:17','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2024-06-12 11:14:17','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2024-06-12 11:14:17','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2024-06-12 11:14:17','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2024-06-12 11:14:17','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2024-06-12 11:14:17','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2024-06-12 11:14:17','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-06-12 11:14:17','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-06-12 11:14:17','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2024-06-12 11:14:17','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2024-06-12 11:14:17','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-06-12 11:14:17','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-06-12 11:14:17','',NULL,''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2024-06-12 11:14:17','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2024-06-12 11:14:17','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2024-06-12 11:14:17','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2024-06-12 11:14:17','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2024-06-12 11:14:17','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2024-06-12 11:14:17','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2024-06-12 11:14:17','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-06-12 11:14:17','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-06-12 11:14:17','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2024-06-12 11:14:17','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2024-06-12 11:14:17','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2024-06-12 11:14:17','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2024-06-12 11:14:17','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2024-06-12 11:14:17','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2024-06-12 11:14:17','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2024-06-12 11:14:17','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2024-06-12 11:14:17','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-06-12 11:14:17','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-06-12 11:14:17','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-06-12 11:14:17','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-06-12 11:14:17','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-06-12 11:14:17','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-06-12 11:14:17','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-06-12 11:14:17','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-06-12 11:14:17','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-06-12 11:14:17','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-06-12 11:14:17','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-06-12 11:14:17','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-06-12 11:14:17','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-06-12 11:14:17','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-06-12 11:14:17','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-06-12 11:14:17','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-06-12 11:14:17','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-06-12 11:14:17','',NULL,''),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-06-12 11:14:17','',NULL,''),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-06-12 11:14:27','',NULL,''),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-06-12 11:14:27','',NULL,''),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-06-12 11:14:27','',NULL,''),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-06-12 11:14:27','',NULL,''),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-06-12 11:14:27','',NULL,''),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-06-12 11:14:27','',NULL,''),(2000,'安全与健康',0,4,'safeAndHealthy',NULL,NULL,1,0,'M','0','0',NULL,'#','admin','2024-06-12 13:27:27','',NULL,''),(2001,'媒体与公关',0,5,'mediaAndPublic',NULL,NULL,1,0,'M','0','0',NULL,'#','admin','2024-06-12 13:28:55','',NULL,''),(2002,'门票与观众服务',0,6,'ticketsAndAudience',NULL,NULL,1,0,'M','0','0',NULL,'#','admin','2024-06-12 13:29:43','',NULL,''),(2003,'赛事管理',0,7,'competition',NULL,NULL,1,0,'M','0','0',NULL,'#','admin','2024-06-12 13:30:26','',NULL,''),(2004,'运动员管理',0,8,'athletes',NULL,NULL,1,0,'M','0','0',NULL,'#','admin','2024-06-12 13:31:03','',NULL,''),(2005,'志愿者管理',0,9,'volunteer',NULL,NULL,1,0,'M','0','0',NULL,'#','admin','2024-06-12 13:31:32','',NULL,''),(2006,'住宿与交通调度',0,10,'stayAndTraffic',NULL,NULL,1,0,'M','0','0',NULL,'#','admin','2024-06-12 13:32:12','',NULL,''),(2007,'住宿安排',2006,1,'accommodationArrangement','stayAndTraffic/accommodationArrangement/index',NULL,1,0,'C','0','0','stayAndTraffic:accommodationArrangement:list','#','admin','2024-06-12 13:59:37','admin','2024-06-12 14:09:05','住宿与交通调度-住宿安排菜单'),(2008,'住宿调度',2006,1,'accommodationScheduling','stayAndTraffic/accommodationScheduling/index',NULL,1,0,'C','0','0','stayAndTraffic:accommodationScheduling:list','#','admin','2024-06-12 13:59:46','admin','2024-06-12 14:09:09','住宿与交通调度-住宿调度菜单'),(2009,'活动分配',2005,1,'activityAssignment','volunteer/activityAssignment/index',NULL,1,0,'C','0','0','volunteer:activityAssignment:list','#','admin','2024-06-12 13:59:54','admin','2024-06-12 14:08:49','志愿者管理-活动分配菜单'),(2010,'申请与审批',2005,1,'applicationApproval','volunteer/applicationApproval/index',NULL,1,0,'C','0','0','volunteer:applicationApproval:list','#','admin','2024-06-12 14:00:03','admin','2024-06-12 14:08:53','志愿者管理-申请与审批菜单'),(2011,'个人信息管理',2004,1,'athletesPersonalInfo','athletes/athletesPersonalInfo/index',NULL,1,0,'C','0','0','athletes:athletesPersonalInfo:list','#','admin','2024-06-12 14:00:10','admin','2024-06-12 14:08:17','运动员管理-个人信息管理菜单'),(2012,'观众指南',2002,1,'audienceGuide','ticketsAndAudience/audienceGuide/index',NULL,1,0,'C','0','0','ticketsAndAudience:audienceGuide:list','#','admin','2024-06-12 14:00:19','admin','2024-06-12 14:07:40','门票与观众服务-观众指南菜单'),(2013,'观众导航',2006,1,'audienceNavigation','stayAndTraffic/audienceNavigation/index',NULL,1,0,'C','0','0','stayAndTraffic:audienceNavigation:list','#','admin','2024-06-12 14:00:25','admin','2024-06-12 14:09:13','住宿与交通调度-观众导航菜单'),(2014,'观众服务',2002,1,'audienceService','ticketsAndAudience/audienceService/index',NULL,1,0,'C','0','0','ticketsAndAudience:audienceService:list','#','admin','2024-06-12 14:00:32','admin','2024-06-12 14:07:44','门票与观众服务-观众服务菜单'),(2015,'品牌合作',2001,1,'brandCooperation','mediaAndPublic/brandCooperation/index',NULL,1,0,'C','0','0','mediaAndPublic:brandCooperation:list','#','admin','2024-06-12 14:00:40','admin','2024-06-12 14:07:25','媒体与公关-品牌合作菜单'),(2016,'危机响应',2000,1,'crisisResponse','safeAndHealthy/crisisResponse/index',NULL,1,0,'C','0','0','safeAndHealthy:crisisResponse:list','#','admin','2024-06-12 14:01:33','admin','2024-06-12 14:07:06','安全与健康协议-危机响应菜单'),(2017,'客服支持',2002,1,'customerSupport','ticketsAndAudience/customerSupport/index',NULL,1,0,'C','0','0','ticketsAndAudience:customerSupport:list','#','admin','2024-06-12 14:01:41','admin','2024-06-12 14:07:48','门票与观众服务-客服支持菜单'),(2018,'参赛资格审核',2004,1,'eligibilityReview','athletes/eligibilityReview/index',NULL,1,0,'C','0','0','athletes:eligibilityReview:list','#','admin','2024-06-12 14:01:48','admin','2024-06-12 14:08:21','运动员管理-参赛资格审核菜单'),(2019,'赛程规划',2003,1,'eventSchedule','competition/eventSchedule/index',NULL,1,0,'C','0','0','competition:eventSchedule:list','#','admin','2024-06-12 14:01:54','admin','2024-06-12 14:08:02','赛事管理-赛程规划菜单'),(2020,'健康监测',2000,1,'healthyMonitoring','safeAndHealthy/healthyMonitoring/index',NULL,1,0,'C','0','0','safeAndHealthy:healthyMonitoring:list','#','admin','2024-06-12 14:02:02','admin','2024-06-12 14:07:10','安全与健康协议-健康监测菜单'),(2021,'安全与健康协议',2000,1,'healthyProtocol','safeAndHealthy/healthyProtocol/index',NULL,1,0,'C','0','0','safeAndHealthy:healthyProtocol:list','#','admin','2024-06-12 14:02:09','',NULL,'安全与健康协议菜单'),(2022,'社交媒体互动',2001,1,'mediaInteraction','mediaAndPublic/mediaInteraction/index',NULL,1,0,'C','0','0','mediaAndPublic:mediaInteraction:list','#','admin','2024-06-12 14:02:18','admin','2024-06-12 14:07:29','媒体与公关-社交媒体互动菜单'),(2023,'表现追踪',2004,1,'performanceTracking','athletes/performanceTracking/index',NULL,1,0,'C','0','0','athletes:performanceTracking:list','#','admin','2024-06-12 14:02:25','admin','2024-06-12 14:08:31','运动员管理-现追踪菜单'),(2024,'新闻发布',2001,1,'pressRelease','mediaAndPublic/pressRelease/index',NULL,1,0,'C','0','0','mediaAndPublic:pressRelease:list','#','admin','2024-06-12 14:02:43','admin','2024-06-12 14:07:33','媒体与公关-新闻发布菜单'),(2025,'结果记录',2003,1,'resultRecord','competition/resultRecord/index',NULL,1,0,'C','0','0','competition:resultRecord:list','#','admin','2024-06-12 14:02:53','admin','2024-06-12 14:08:06','赛事管理-结果记录菜单'),(2026,'规则更新',2003,1,'ruleUpdate','competition/ruleUpdate/index',NULL,1,0,'C','0','0','competition:ruleUpdate:list','#','admin','2024-06-12 14:03:02','admin','2024-06-12 14:08:11','赛事管理-规则更新菜单'),(2027,'安全规划',2000,1,'safetyPlanning','safeAndHealthy/safetyPlanning/index',NULL,1,0,'C','0','0','safeAndHealthy:safetyPlanning:list','#','admin','2024-06-12 14:03:09','admin','2024-06-12 14:07:17','安全与健康协议-安全规划菜单'),(2028,'门票管理',2002,1,'ticketManagement','ticketsAndAudience/ticketManagement/index',NULL,1,0,'C','0','0','ticketsAndAudience:ticketManagement:list','#','admin','2024-06-12 14:03:16','admin','2024-06-12 14:07:52','门票与观众服务-门票管理菜单'),(2029,'门票销售',2002,1,'ticketSales','ticketsAndAudience/ticketSales/index',NULL,1,0,'C','0','0','ticketsAndAudience:ticketSales:list','#','admin','2024-06-12 14:03:23','admin','2024-06-12 14:07:56','门票与观众服务-门票销售菜单'),(2030,'培训管理',2005,1,'trainingManagement','volunteer/trainingManagement/index',NULL,1,0,'C','0','0','volunteer:trainingManagement:list','#','admin','2024-06-12 14:03:31','admin','2024-06-12 14:08:57','志愿者管理-培训管理菜单'),(2031,'交通调度',2006,1,'transportationScheduling','stayAndTraffic/transportationScheduling/index',NULL,1,0,'C','0','0','stayAndTraffic:transportationScheduling:list','#','admin','2024-06-12 14:03:40','admin','2024-06-12 14:09:16','住宿与交通调度-交通调度菜单'),(2032,'交通服务',2006,1,'transportationService','stayAndTraffic/transportationService/index',NULL,1,0,'C','0','0','stayAndTraffic:transportationService:list','#','admin','2024-06-12 14:03:47','admin','2024-06-12 14:09:20','住宿与交通调度-交通服务菜单'),(2034,'mybatis在线接口',3,1,'mb','online/mb/index',NULL,1,0,'C','0','0','online:mb:list','code','admin','2024-06-12 15:24:40','admin','2024-06-12 15:27:30','mybatis在线接口菜单'),(2041,'信息网管理',0,11,'message',NULL,NULL,1,0,'M','0','0',NULL,'#','admin','2024-06-13 10:33:16','',NULL,''),(2042,'用户反馈',2041,1,'feedback','message/feedback/index',NULL,1,0,'C','0','0','message:feedback:list','#','admin','2024-06-13 10:37:12','',NULL,'用户反馈菜单'),(2043,'新闻公告',2041,1,'news','message/news/index',NULL,1,0,'C','0','0','message:news:list','#','admin','2024-06-13 10:37:19','',NULL,'新闻公告菜单'),(2044,'志愿者信息中心',2041,1,'volunteerMessage','message/volunteer/index',NULL,1,0,'C','0','0','message:volunteer:list','#','admin','2024-06-13 10:37:27','admin','2024-06-13 11:02:30','志愿者信息中心菜单');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2024-06-12 11:14:18','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2024-06-12 11:14:18','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  KEY `idx_sys_oper_log_bt` (`business_type`) USING BTREE,
  KEY `idx_sys_oper_log_s` (`status`) USING BTREE,
  KEY `idx_sys_oper_log_ot` (`oper_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'代码生成',6,'com.neuedu.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"sports_transportation_scheduling\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 11:23:53',477),(101,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"scheduling\",\"className\":\"SportsTransportationScheduling\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 11:23:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":2,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 11:23:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":3,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 11:23:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":4,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 11:23:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 11:26:21',310),(102,'代码生成',6,'com.neuedu.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"sports_athlete_personal_info,sports_brand_cooperation,sports_crisis_response,sports_customer_support,sports_result_record,sports_event_schedule,sports_volunteer_training_management,sports_volunteer_application_approval,sports_volunteer_activity_assignment,sports_transportation_service\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:23:22',1426),(103,'代码生成',6,'com.neuedu.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"sports_ticket_management,sports_social_media_interaction,sports_safety_planning,sports_safety_health_protocol,sports_rule_update,sports_press_release,sports_health_monitoring,sports_audience_service,sports_audience_navigation,sports_audience_guide\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:23:28',1103),(104,'代码生成',6,'com.neuedu.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"sports_accommodation_arrangement,sports_ticket_sales\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:23:40',285),(105,'代码生成',6,'com.neuedu.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"sports_accommodation_scheduling,sports_athlete_eligibility_review,sports_athlete_performance_tracking\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:23:54',471),(106,'菜单管理',3,'com.neuedu.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/4','127.0.0.1','内网IP','{}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2024-06-12 13:24:37',31),(107,'菜单管理',1,'com.neuedu.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"安全与健康\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"safeAndHealthy\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:27:27',106),(108,'菜单管理',1,'com.neuedu.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"媒体与公关\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"mediaAndPublic\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:28:55',129),(109,'菜单管理',1,'com.neuedu.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"门票与观众服务\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"ticketsAndAudience\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:29:43',143),(110,'菜单管理',1,'com.neuedu.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"赛事管理\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"competition\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:30:26',146),(111,'菜单管理',1,'com.neuedu.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"运动员管理\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"athletes\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:31:03',98),(112,'菜单管理',1,'com.neuedu.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"志愿者管理\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"volunteer\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:31:32',151),(113,'菜单管理',1,'com.neuedu.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"住宿与交通调度\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"stayAndTraffic\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:32:12',131),(114,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"scheduling\",\"className\":\"SportsTransportationScheduling\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 11:23:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-12 11:26:21\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":2,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 11:23:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-12 11:26:21\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":3,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 11:23:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-12 11:26:21\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":4,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 11:23:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:35:19',142),(115,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"athletes\",\"className\":\"SportsAthletePersonalInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":10,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":11,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":12,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":13,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"q','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:38:33',281),(116,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"trafficDispatching\",\"className\":\"SportsTransportationScheduling\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 11:23:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-12 13:35:19\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":2,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 11:23:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-12 13:35:19\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":3,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 11:23:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-12 13:35:19\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":4,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 11:23:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInser','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:39:06',177),(117,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"brandCooperation\",\"className\":\"SportsBrandCooperation\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":24,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":25,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":26,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":27,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":fal','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:40:02',139),(118,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"transportationScheduling\",\"className\":\"SportsTransportationScheduling\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 11:23:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-12 13:39:06\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":2,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 11:23:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-12 13:39:06\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":3,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 11:23:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-12 13:39:06\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":4,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 11:23:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"i','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:41:35',119),(119,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"athletesPersonalInfo\",\"className\":\"SportsAthletePersonalInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":10,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-12 13:38:33\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":11,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-12 13:38:33\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":12,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-12 13:38:33\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":13,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInse','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:41:58',169),(120,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"crisisResponse\",\"className\":\"SportsCrisisResponse\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":34,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":35,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":36,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":37,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:42:43',180),(121,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"customerSupport\",\"className\":\"SportsCustomerSupport\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":42,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":43,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":44,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":45,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:43:23',209),(122,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"eventSchedule\",\"className\":\"SportsEventSchedule\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":52,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EventName\",\"columnComment\":\"赛事名称\",\"columnId\":53,\"columnName\":\"event_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"eventName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EventDate\",\"columnComment\":\"赛事日期\",\"columnId\":54,\"columnName\":\"event_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"eventDate\",\"javaType\":\"LocalDate\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EventTime\",\"columnComment\":\"赛事时间\",\"columnId\":55,\"columnName\":\"event_time\",\"columnType\":\"time\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:44:03',140),(123,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"resultRecord\",\"className\":\"SportsResultRecord\",\"columns\":[{\"capJavaField\":\"Jie\",\"columnComment\":\"ID\",\"columnId\":62,\"columnName\":\"jie\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"jie\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":63,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":64,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":65,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"q','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:44:21',169),(124,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"transportationService\",\"className\":\"SportsTransportationService\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":72,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":73,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":74,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":75,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,\"params\":{','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:44:59',114),(125,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"activityAssignment\",\"className\":\"SportsVolunteerActivityAssignment\",\"columns\":[{\"capJavaField\":\"Zho\",\"columnComment\":\"ID\",\"columnId\":82,\"columnName\":\"zho\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"zho\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":83,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":84,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":85,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,\"par','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:45:51',131),(126,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"applicationApproval\",\"className\":\"SportsVolunteerApplicationApproval\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":91,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":92,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":93,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":94,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,\"p','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:46:23',149),(127,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"trainingManagement\",\"className\":\"SportsVolunteerTrainingManagement\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":101,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":102,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":103,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":104,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:46:48',119),(128,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"audienceGuide\",\"className\":\"SportsAudienceGuide\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":109,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":110,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":111,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":112,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":fa','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:47:27',129),(129,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"audienceNavigation\",\"className\":\"SportsAudienceNavigation\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":119,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":120,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":121,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":122,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,\"params\":','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:48:09',160),(130,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"audienceService\",\"className\":\"SportsAudienceService\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":128,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":129,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":130,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":131,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:49:08',121),(131,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"healthyMonitoring\",\"className\":\"SportsHealthMonitoring\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":136,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":137,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":138,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":139,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:49:38',127),(132,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"pressRelease\",\"className\":\"SportsPressRelease\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":145,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":146,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":147,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":148,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":fals','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:50:19',138),(133,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"ruleUpdate\",\"className\":\"SportsRuleUpdate\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":154,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":155,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":156,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":157,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"q','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:50:54',144),(134,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"healthyProtocol\",\"className\":\"SportsSafetyHealthProtocol\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":162,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":163,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":164,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":165,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,\"params\":{','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:51:45',149),(135,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"safetyPlanning\",\"className\":\"SportsSafetyPlanning\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":170,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":19,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":171,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":19,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":172,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":19,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":173,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:52:09',138),(136,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"mediaInteraction\",\"className\":\"SportsSocialMediaInteraction\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":178,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":20,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":179,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":20,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":180,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":20,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":181,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,\"params','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:52:45',172),(137,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"ticketManagement\",\"className\":\"SportsTicketManagement\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":188,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":21,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":189,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":21,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":190,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":21,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":191,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:53:21',147),(138,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"accommodationArrangement\",\"className\":\"SportsAccommodationArrangement\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":197,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":198,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":22,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":199,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":22,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":200,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":fal','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:53:57',154),(139,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"ticketSales\",\"className\":\"SportsTicketSales\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":209,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":23,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":210,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":23,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":211,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":23,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":212,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:54:27',167),(140,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"accommodationScheduling\",\"className\":\"SportsAccommodationScheduling\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":220,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:54\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":24,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":221,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:54\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":24,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":222,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:54\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":24,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":223,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:54\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:55:25',125),(141,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"eligibilityReview\",\"className\":\"SportsAthleteEligibilityReview\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":229,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:54\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":25,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":230,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:54\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":25,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":231,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:54\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":25,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":232,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:54\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,\"par','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:56:03',182),(142,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"performanceTracking\",\"className\":\"SportsAthletePerformanceTracking\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":239,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:54\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":26,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":240,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:54\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":26,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":241,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:54\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":26,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":242,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:54\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateBy\",\"javaType\":\"String\",\"list\":false,','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 13:56:26',142),(143,'代码生成',8,'com.neuedu.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"sports_transportation_scheduling,sports_athlete_personal_info,sports_brand_cooperation,sports_crisis_response,sports_customer_support,sports_event_schedule,sports_result_record,sports_transportation_service,sports_volunteer_activity_assignment,sports_volunteer_application_approval,sports_volunteer_training_management,sports_audience_guide,sports_audience_navigation,sports_audience_service,sports_health_monitoring,sports_press_release,sports_rule_update,sports_safety_health_protocol,sports_safety_planning,sports_social_media_interaction,sports_ticket_management,sports_accommodation_arrangement,sports_ticket_sales,sports_accommodation_scheduling,sports_athlete_eligibility_review,sports_athlete_performance_tracking\"}',NULL,0,NULL,'2024-06-12 13:56:33',1525),(144,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"safeAndHealthy/crisisResponse/index\",\"createTime\":\"2024-06-12 14:01:33\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2016,\"menuName\":\"危机响应\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"crisisResponse\",\"perms\":\"safeAndHealthy:crisisResponse:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:07:06',69),(145,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"safeAndHealthy/healthyMonitoring/index\",\"createTime\":\"2024-06-12 14:02:02\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2020,\"menuName\":\"健康监测\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"healthyMonitoring\",\"perms\":\"safeAndHealthy:healthyMonitoring:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:07:10',51),(146,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"safeAndHealthy/safetyPlanning/index\",\"createTime\":\"2024-06-12 14:03:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"安全规划\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"safetyPlanning\",\"perms\":\"safeAndHealthy:safetyPlanning:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:07:17',46),(147,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"mediaAndPublic/brandCooperation/index\",\"createTime\":\"2024-06-12 14:00:40\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"品牌合作\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"brandCooperation\",\"perms\":\"mediaAndPublic:brandCooperation:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:07:25',49),(148,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"mediaAndPublic/mediaInteraction/index\",\"createTime\":\"2024-06-12 14:02:18\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"社交媒体互动\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"mediaInteraction\",\"perms\":\"mediaAndPublic:mediaInteraction:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:07:29',55),(149,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"mediaAndPublic/pressRelease/index\",\"createTime\":\"2024-06-12 14:02:43\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"新闻发布\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"pressRelease\",\"perms\":\"mediaAndPublic:pressRelease:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:07:33',34),(150,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"ticketsAndAudience/audienceGuide/index\",\"createTime\":\"2024-06-12 14:00:19\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"观众指南\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"audienceGuide\",\"perms\":\"ticketsAndAudience:audienceGuide:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:07:40',51),(151,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"ticketsAndAudience/audienceService/index\",\"createTime\":\"2024-06-12 14:00:32\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"观众服务\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"audienceService\",\"perms\":\"ticketsAndAudience:audienceService:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:07:44',64),(152,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"ticketsAndAudience/customerSupport/index\",\"createTime\":\"2024-06-12 14:01:41\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2017,\"menuName\":\"客服支持\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"customerSupport\",\"perms\":\"ticketsAndAudience:customerSupport:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:07:48',65),(153,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"ticketsAndAudience/ticketManagement/index\",\"createTime\":\"2024-06-12 14:03:16\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2028,\"menuName\":\"门票管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"ticketManagement\",\"perms\":\"ticketsAndAudience:ticketManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:07:52',20),(154,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"ticketsAndAudience/ticketSales/index\",\"createTime\":\"2024-06-12 14:03:23\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2029,\"menuName\":\"门票销售\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"ticketSales\",\"perms\":\"ticketsAndAudience:ticketSales:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:07:56',33),(155,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"competition/eventSchedule/index\",\"createTime\":\"2024-06-12 14:01:54\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"赛程规划\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"path\":\"eventSchedule\",\"perms\":\"competition:eventSchedule:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:08:02',44),(156,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"competition/resultRecord/index\",\"createTime\":\"2024-06-12 14:02:53\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"结果记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"path\":\"resultRecord\",\"perms\":\"competition:resultRecord:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:08:06',50),(157,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"competition/ruleUpdate/index\",\"createTime\":\"2024-06-12 14:03:02\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2026,\"menuName\":\"规则更新\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"path\":\"ruleUpdate\",\"perms\":\"competition:ruleUpdate:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:08:11',33),(158,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"athletes/athletesPersonalInfo/index\",\"createTime\":\"2024-06-12 14:00:10\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"个人信息管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"athletesPersonalInfo\",\"perms\":\"athletes:athletesPersonalInfo:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:08:17',59),(159,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"athletes/eligibilityReview/index\",\"createTime\":\"2024-06-12 14:01:48\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"参赛资格审核\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"eligibilityReview\",\"perms\":\"athletes:eligibilityReview:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:08:21',48),(160,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"athletes/performanceTracking/index\",\"createTime\":\"2024-06-12 14:02:25\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"表现追踪\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"performanceTracking\",\"perms\":\"athletes:performanceTracking:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:08:31',80),(161,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"volunteer/activityAssignment/index\",\"createTime\":\"2024-06-12 13:59:54\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"活动分配\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"path\":\"activityAssignment\",\"perms\":\"volunteer:activityAssignment:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:08:49',75),(162,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"volunteer/applicationApproval/index\",\"createTime\":\"2024-06-12 14:00:03\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"申请与审批\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"path\":\"applicationApproval\",\"perms\":\"volunteer:applicationApproval:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:08:53',75),(163,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"volunteer/trainingManagement/index\",\"createTime\":\"2024-06-12 14:03:31\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"培训管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"path\":\"trainingManagement\",\"perms\":\"volunteer:trainingManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:08:57',41),(164,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"stayAndTraffic/accommodationArrangement/index\",\"createTime\":\"2024-06-12 13:59:37\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"住宿安排\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"accommodationArrangement\",\"perms\":\"stayAndTraffic:accommodationArrangement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:09:05',52),(165,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"stayAndTraffic/accommodationScheduling/index\",\"createTime\":\"2024-06-12 13:59:46\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"住宿调度\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"accommodationScheduling\",\"perms\":\"stayAndTraffic:accommodationScheduling:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:09:09',44),(166,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"stayAndTraffic/audienceNavigation/index\",\"createTime\":\"2024-06-12 14:00:25\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"观众导航\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"audienceNavigation\",\"perms\":\"stayAndTraffic:audienceNavigation:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:09:13',26),(167,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"stayAndTraffic/transportationScheduling/index\",\"createTime\":\"2024-06-12 14:03:40\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2031,\"menuName\":\"交通调度\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"transportationScheduling\",\"perms\":\"stayAndTraffic:transportationScheduling:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:09:16',39),(168,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"stayAndTraffic/transportationService/index\",\"createTime\":\"2024-06-12 14:03:47\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2032,\"menuName\":\"交通服务\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"transportationService\",\"perms\":\"stayAndTraffic:transportationService:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:09:20',49),(169,'字典类型',1,'com.neuedu.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"人员类型\",\"dictType\":\"person_type\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:25:58',83),(170,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"运动员\",\"dictSort\":0,\"dictType\":\"person_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:26:14',101),(171,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"工作人员\",\"dictSort\":0,\"dictType\":\"person_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:26:22',46),(172,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"healthyMonitoring\",\"className\":\"SportsHealthMonitoring\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":136,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2024-06-12 13:49:38\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":137,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2024-06-12 13:49:38\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":138,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"LocalDate\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2024-06-12 13:49:38\",\"usableColumn\":false},{\"capJavaField\":\"UpdateBy\",\"columnComment\":\"更新者\",\"columnId\":139,\"columnName\":\"update_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-12 13:23:28\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isIns','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:30:17',218),(173,'安全与健康协议-健康监测',1,'com.neuedu.sports.controller.SportsHealthMonitoringController.add()','POST',1,'admin','研发部门','/safeAndHealthy/healthyMonitoring','127.0.0.1','内网IP','{\"createTime\":\"2024-06-12 14:34:20\",\"id\":7,\"medicalSupportInfo\":\"1\",\"monitoringDetails\":\"1\",\"params\":{},\"personType\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:34:26',108),(174,'安全与健康协议-健康监测',3,'com.neuedu.sports.controller.SportsHealthMonitoringController.remove()','DELETE',1,'admin','研发部门','/safeAndHealthy/healthyMonitoring/7','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:34:28',24),(175,'字典类型',1,'com.neuedu.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"服务类型\",\"dictType\":\"service_type\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:50:50',55),(176,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"销售\",\"dictSort\":0,\"dictType\":\"service_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:51:05',78),(177,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"售后\",\"dictSort\":0,\"dictType\":\"service_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:51:12',48),(178,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"展示\",\"dictSort\":0,\"dictType\":\"service_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:51:17',28),(179,'门票与观众服务-观众服务',1,'com.neuedu.sports.controller.SportsAudienceServiceController.add()','POST',1,'admin','研发部门','/ticketsAndAudience/audienceService','127.0.0.1','内网IP','{\"createTime\":\"2024-06-12 14:55:17\",\"id\":7,\"params\":{},\"serviceDescription\":\"22\",\"serviceType\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:55:23',35),(180,'门票与观众服务-观众服务',3,'com.neuedu.sports.controller.SportsAudienceServiceController.remove()','DELETE',1,'admin','研发部门','/ticketsAndAudience/audienceService/7','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:55:25',31),(181,'字典类型',1,'com.neuedu.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"处理状态\",\"dictType\":\"dis_status\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:58:23',95),(182,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未处理\",\"dictSort\":0,\"dictType\":\"dis_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:58:34',117),(183,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已处理\",\"dictSort\":0,\"dictType\":\"dis_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 14:58:40',43),(184,'运动员管理-个人信息管理',2,'com.neuedu.sports.controller.SportsAthletePersonalInfoController.edit()','PUT',1,'admin','研发部门','/athletes/athletesPersonalInfo','127.0.0.1','内网IP','{\"athleteAge\":25,\"athleteGender\":\"男\",\"athleteHeight\":180.5,\"athleteName\":\"John\",\"athleteNationality\":\"USA\",\"athleteWeight\":72,\"createBy\":\"Jane Smith\",\"createTime\":\"2024-06-06 16:28:36\",\"healthStatus\":\"Good overall health\",\"id\":1,\"params\":{},\"performanceHistory\":\"Multiple medals in regional competitions\",\"remark\":\"Track and field athletes\",\"updateBy\":\"Jane Smith\",\"updateTime\":\"2024-06-12 15:14:02\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 15:14:08',36),(185,'运动员管理-个人信息管理',1,'com.neuedu.sports.controller.SportsAthletePersonalInfoController.add()','POST',1,'admin','研发部门','/athletes/athletesPersonalInfo','127.0.0.1','内网IP','{\"athleteAge\":1,\"athleteGender\":\"0\",\"athleteHeight\":1,\"athleteName\":\"1\",\"athleteNationality\":\"1\",\"athleteWeight\":1,\"createTime\":\"2024-06-12 15:17:26\",\"id\":9,\"params\":{},\"performanceHistory\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 15:17:32',30),(186,'运动员管理-个人信息管理',3,'com.neuedu.sports.controller.SportsAthletePersonalInfoController.remove()','DELETE',1,'admin','研发部门','/athletes/athletesPersonalInfo/9','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 15:17:39',25),(187,'运动员管理-个人信息管理',2,'com.neuedu.sports.controller.SportsAthletePersonalInfoController.edit()','PUT',1,'admin','研发部门','/athletes/athletesPersonalInfo','127.0.0.1','内网IP','{\"athleteAge\":25,\"athleteGender\":\"2\",\"athleteHeight\":180.5,\"athleteName\":\"John\",\"athleteNationality\":\"USA\",\"athleteWeight\":72,\"createBy\":\"Jane Smith\",\"createTime\":\"2024-06-06 16:28:36\",\"healthStatus\":\"Good overall health\",\"id\":1,\"params\":{},\"performanceHistory\":\"Multiple medals in regional competitions\",\"remark\":\"Track and field athletes\",\"updateBy\":\"Jane Smith\",\"updateTime\":\"2024-06-12 15:17:39\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 15:17:44',27),(188,'菜单管理',3,'com.neuedu.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2035','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2024-06-12 15:27:05',21),(189,'菜单管理',3,'com.neuedu.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2036','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 15:27:10',42),(190,'菜单管理',3,'com.neuedu.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2037','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 15:27:12',102),(191,'菜单管理',3,'com.neuedu.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2038','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 15:27:14',79),(192,'菜单管理',3,'com.neuedu.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2039','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 15:27:16',32),(193,'菜单管理',3,'com.neuedu.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2040','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 15:27:19',39),(194,'菜单管理',3,'com.neuedu.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2035','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 15:27:21',68),(195,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"online/mb/index\",\"createTime\":\"2024-06-12 15:24:40\",\"icon\":\"code\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2034,\"menuName\":\"mybatis在线接口\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"mb\",\"perms\":\"online:mb:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 15:27:30',34),(196,'菜单管理',3,'com.neuedu.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2033','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 15:27:33',134),(197,'mybatis在线接口',1,'com.neuedu.online.controller.OnlineMbController.add()','POST',1,'admin','研发部门','/online/mb','127.0.0.1','内网IP','{\"actuator\":\"selectList\",\"method\":\"GET\",\"params\":{},\"path\":\"/event/schedule/name\",\"permissionType\":\"无\",\"sql\":\"select id value,event_name label from sports_event_schedule\",\"tag\":\"select\",\"tagId\":\"查询赛事名称\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'del_flag\' doesn\'t have a default value\r\n### The error may exist in file [D:\\workspace\\巴黎奥运会\\neuedu-sports\\server\\neuedu-online\\target\\classes\\mapper\\online\\OnlineMbMapper.xml]\r\n### The error may involve com.neuedu.online.mapper.OnlineMbMapper.insertOnlineMb-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into online_mb          ( tag,             tag_id,                                       `sql`,             path,             method,                          actuator,                                       permission_type )           values ( ?,             ?,                                       ?,             ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'del_flag\' doesn\'t have a default value\n; Field \'del_flag\' doesn\'t have a default value','2024-06-12 15:30:25',324),(198,'mybatis在线接口',1,'com.neuedu.online.controller.OnlineMbController.add()','POST',1,'admin','研发部门','/online/mb','127.0.0.1','内网IP','{\"actuator\":\"selectList\",\"method\":\"GET\",\"params\":{},\"path\":\"/query_eventName\",\"permissionType\":\"无\",\"sql\":\"select id value,event_name label from sports_event_schedule\",\"tag\":\"select\",\"tagId\":\"查询赛事名称\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'del_flag\' doesn\'t have a default value\r\n### The error may exist in file [D:\\workspace\\巴黎奥运会\\neuedu-sports\\server\\neuedu-online\\target\\classes\\mapper\\online\\OnlineMbMapper.xml]\r\n### The error may involve com.neuedu.online.mapper.OnlineMbMapper.insertOnlineMb-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into online_mb          ( tag,             tag_id,                                       `sql`,             path,             method,                          actuator,                                       permission_type )           values ( ?,             ?,                                       ?,             ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'del_flag\' doesn\'t have a default value\n; Field \'del_flag\' doesn\'t have a default value','2024-06-12 15:30:57',12),(199,'mybatis在线接口',1,'com.neuedu.online.controller.OnlineMbController.add()','POST',1,'admin','研发部门','/online/mb','127.0.0.1','内网IP','{\"actuator\":\"selectList\",\"method\":\"GET\",\"params\":{},\"path\":\"/query_eventName\",\"permissionType\":\"无\",\"sql\":\"select id value,event_name label from sports_event_schedule\",\"tag\":\"select\",\"tagId\":\"查询赛事名称\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 15:31:26',31),(200,'mybatis在线接口',2,'com.neuedu.online.controller.OnlineMbController.edit()','PUT',1,'admin','研发部门','/online/mb','127.0.0.1','内网IP','{\"actuator\":\"selectOne\",\"mbId\":1,\"method\":\"GET\",\"params\":{},\"path\":\"/query_eventName\",\"permissionType\":\"无\",\"sql\":\"select id value,event_name label from sports_event_schedule\",\"tag\":\"select\",\"tagId\":\"查询赛事名称\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 16:35:58',98),(201,'mybatis在线接口',2,'com.neuedu.online.controller.OnlineMbController.edit()','PUT',1,'admin','研发部门','/online/mb','127.0.0.1','内网IP','{\"actuator\":\"selectList\",\"mbId\":1,\"method\":\"GET\",\"params\":{},\"path\":\"/query_eventName\",\"permissionType\":\"无\",\"sql\":\"select id value,event_name label from sports_event_schedule\",\"tag\":\"select\",\"tagId\":\"查询赛事名称\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 16:36:32',76),(202,'门票与观众服务-观众指南',1,'com.neuedu.sports.controller.SportsAudienceGuideController.add()','POST',1,'admin','研发部门','/ticketsAndAudience/audienceGuide','127.0.0.1','内网IP','{\"createTime\":\"2024-06-12 17:06:16\",\"eventId\":2,\"id\":7,\"params\":{},\"safetyNotice\":\"1\",\"transportationGuide\":\"1\",\"venueMap\":\"/profile/upload/2024/06/12/87efdcfc-128c-465f-9bc2-8f39fd5aab82_20240612170614A002.jpg\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 17:06:21',81),(203,'门票与观众服务-门票管理',1,'com.neuedu.sports.controller.SportsTicketManagementController.add()','POST',1,'admin','研发部门','/ticketsAndAudience/ticketManagement','127.0.0.1','内网IP','{\"createTime\":\"2024-06-12 17:12:14\",\"eventId\":2,\"id\":11,\"params\":{},\"ticketPrice\":1111,\"ticketQuantity\":111}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 17:12:19',35),(204,'门票与观众服务-门票管理',3,'com.neuedu.sports.controller.SportsTicketManagementController.remove()','DELETE',1,'admin','研发部门','/ticketsAndAudience/ticketManagement/11','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 17:12:24',87),(205,'字典类型',1,'com.neuedu.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"票种类别\",\"dictType\":\"ticket_type\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 17:18:02',71),(206,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"VIP座位\",\"dictSort\":0,\"dictType\":\"ticket_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 17:18:36',62),(207,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"A级座位\",\"dictSort\":0,\"dictType\":\"ticket_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 17:18:47',77),(208,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"B级座位\",\"dictSort\":0,\"dictType\":\"ticket_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 17:18:54',49),(209,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"普通座位\",\"dictSort\":0,\"dictType\":\"ticket_type\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 17:19:10',39),(210,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"看台座位\",\"dictSort\":0,\"dictType\":\"ticket_type\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 17:19:18',52),(211,'mybatis在线接口',1,'com.neuedu.online.controller.OnlineMbController.add()','POST',1,'admin','研发部门','/online/mb','127.0.0.1','内网IP','{\"actuator\":\"selectList\",\"method\":\"GET\",\"params\":{},\"path\":\"/athelteName\",\"permissionType\":\"无\",\"sql\":\"SELECT id `value`,athlete_name label FROM `sports_athlete_personal_info`\",\"tag\":\"select\",\"tagId\":\"查询运动员名称\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 17:46:19',86),(212,'mybatis在线接口',2,'com.neuedu.online.controller.OnlineMbController.edit()','PUT',1,'admin','研发部门','/online/mb','127.0.0.1','内网IP','{\"actuator\":\"selectList\",\"mbId\":2,\"method\":\"GET\",\"params\":{},\"path\":\"/query_athelteName\",\"permissionType\":\"无\",\"sql\":\"SELECT id `value`,athlete_name label FROM `sports_athlete_personal_info`\",\"tag\":\"select\",\"tagId\":\"查询运动员名称\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 17:47:27',139),(213,'mybatis在线接口',1,'com.neuedu.online.controller.OnlineMbController.add()','POST',1,'admin','研发部门','/online/mb','127.0.0.1','内网IP','{\"actuator\":\"selectList\",\"method\":\"GET\",\"params\":{},\"path\":\"/volunteerName\",\"permissionType\":\"无\",\"sql\":\"SELECT id `value`,volunteer_name label FROM `sports_volunteer_application_approval`\",\"tag\":\"select\",\"tagId\":\"查询志愿者名称\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 17:54:57',50),(214,'mybatis在线接口',2,'com.neuedu.online.controller.OnlineMbController.edit()','PUT',1,'admin','研发部门','/online/mb','127.0.0.1','内网IP','{\"actuator\":\"selectList\",\"mbId\":3,\"method\":\"GET\",\"params\":{},\"path\":\"/query_volunteerName\",\"permissionType\":\"无\",\"sql\":\"SELECT id `value`,volunteer_name label FROM `sports_volunteer_application_approval`\",\"tag\":\"select\",\"tagId\":\"查询志愿者名称\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-12 17:55:06',54),(215,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"媒体人员\",\"dictSort\":0,\"dictType\":\"person_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 08:44:55',605),(216,'字典类型',1,'com.neuedu.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"住宿类型\",\"dictType\":\"accommodation_type\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 09:01:00',58),(217,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"酒店\",\"dictSort\":0,\"dictType\":\"accommodation_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 09:03:22',69),(218,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"民俗\",\"dictSort\":0,\"dictType\":\"accommodation_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 09:03:29',34),(219,'字典类型',1,'com.neuedu.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"交通类型\",\"dictType\":\"transportation_type\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 09:11:30',104),(220,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"专车\",\"dictSort\":0,\"dictType\":\"transportation_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 09:11:59',103),(221,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"大巴\",\"dictSort\":0,\"dictType\":\"transportation_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 09:12:04',29),(222,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"地铁\",\"dictSort\":0,\"dictType\":\"transportation_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 09:12:10',76),(223,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"自行车租借\",\"dictSort\":0,\"dictType\":\"transportation_type\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 09:12:33',48),(224,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"交通服务类型\",\"dictSort\":0,\"dictType\":\"service_type\",\"dictValue\":\"traffic_service_type\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 09:18:31',38),(225,'字典类型',3,'com.neuedu.web.controller.system.SysDictDataController.remove()','DELETE',1,'admin','研发部门','/system/dict/data/132','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 09:18:39',85),(226,'字典类型',1,'com.neuedu.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"交通服务类型\",\"dictType\":\"traffic_service_type\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 09:18:51',46),(227,'菜单管理',1,'com.neuedu.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"信息网管理\",\"menuType\":\"M\",\"orderNum\":11,\"params\":{},\"parentId\":0,\"path\":\"message\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 10:33:17',109),(228,'代码生成',6,'com.neuedu.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"sports_feedback,sports_news,sports_volunteer\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 10:33:31',548),(229,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"feedback\",\"className\":\"SportsFeedback\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":248,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-13 10:33:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":27,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":249,\"columnName\":\"title\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-13 10:33:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":27,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"状态\",\"columnId\":250,\"columnName\":\"status\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-13 10:33:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"status\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":27,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"内容\",\"columnId\":251,\"columnName\":\"content\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-13 10:33:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"co','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 10:34:50',152),(230,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"news\",\"className\":\"SportsNews\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":258,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-13 10:33:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":28,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"新闻标题\",\"columnId\":259,\"columnName\":\"title\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-13 10:33:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":28,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"新闻内容\",\"columnId\":260,\"columnName\":\"content\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-13 10:33:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"content\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":28,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Views\",\"columnComment\":\"浏览量\",\"columnId\":261,\"columnName\":\"views\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-13 10:33:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"views\",\"ja','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 10:35:31',214),(231,'代码生成',2,'com.neuedu.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"volunteer\",\"className\":\"SportsVolunteer\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":267,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-13 10:33:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":29,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":268,\"columnName\":\"title\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-13 10:33:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":29,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"内容\",\"columnId\":269,\"columnName\":\"content\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-13 10:33:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"content\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":29,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Views\",\"columnComment\":\"浏览量\",\"columnId\":270,\"columnName\":\"views\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-13 10:33:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"view','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 10:35:49',135),(232,'代码生成',8,'com.neuedu.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"sports_feedback,sports_news,sports_volunteer\"}',NULL,0,NULL,'2024-06-13 10:36:03',704),(233,'住宿与交通调度-住宿调度',2,'com.neuedu.sports.controller.SportsAccommodationSchedulingController.edit()','PUT',1,'admin','研发部门','/stayAndTraffic/accommodationScheduling','127.0.0.1','内网IP','{\"accommodationDetails\":\"Athletes Village\",\"accommodationType\":\"0\",\"createBy\":\"John Doe\",\"createTime\":\"2024-06-06 16:30:45\",\"id\":1,\"numberOfRooms\":50,\"params\":{},\"remark\":\"运动员住宿，巴黎市区\",\"updateBy\":\"John Doe\",\"updateTime\":\"2024-06-13 10:53:14\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 10:53:21',48),(234,'住宿与交通调度-住宿调度',2,'com.neuedu.sports.controller.SportsAccommodationSchedulingController.edit()','PUT',1,'admin','研发部门','/stayAndTraffic/accommodationScheduling','127.0.0.1','内网IP','{\"accommodationDetails\":\"Staff Lodging\",\"accommodationType\":\"1\",\"createBy\":\"Jane Smith\",\"createTime\":\"2024-06-06 16:30:45\",\"id\":2,\"numberOfRooms\":30,\"params\":{},\"remark\":\"工作人员住宿，近奥运村\",\"updateBy\":\"Jane Smith\",\"updateTime\":\"2024-06-13 10:53:17\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 10:53:25',24),(235,'住宿与交通调度-住宿调度',2,'com.neuedu.sports.controller.SportsAccommodationSchedulingController.edit()','PUT',1,'admin','研发部门','/stayAndTraffic/accommodationScheduling','127.0.0.1','内网IP','{\"accommodationDetails\":\"Media Hotel\",\"accommodationType\":\"0\",\"createBy\":\"Mike Johnson\",\"createTime\":\"2024-06-06 16:30:45\",\"id\":3,\"numberOfRooms\":20,\"params\":{},\"remark\":\"媒体代表住宿，市中心\",\"updateBy\":\"Mike Johnson\",\"updateTime\":\"2024-06-13 10:53:20\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 10:53:27',19),(236,'住宿与交通调度-住宿调度',2,'com.neuedu.sports.controller.SportsAccommodationSchedulingController.edit()','PUT',1,'admin','研发部门','/stayAndTraffic/accommodationScheduling','127.0.0.1','内网IP','{\"accommodationDetails\":\"Athletes Village\",\"accommodationType\":\"1\",\"createBy\":\"Tom Brown\",\"createTime\":\"2024-06-06 16:30:45\",\"id\":5,\"numberOfRooms\":15,\"params\":{},\"remark\":\"运动员住宿，巴黎市区\",\"updateBy\":\"Tom Brown\",\"updateTime\":\"2024-06-13 10:53:23\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 10:53:30',42),(237,'住宿与交通调度-住宿调度',3,'com.neuedu.sports.controller.SportsAccommodationSchedulingController.remove()','DELETE',1,'admin','研发部门','/stayAndTraffic/accommodationScheduling/4','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 10:53:33',21),(238,'住宿与交通调度-住宿调度',2,'com.neuedu.sports.controller.SportsAccommodationSchedulingController.edit()','PUT',1,'admin','研发部门','/stayAndTraffic/accommodationScheduling','127.0.0.1','内网IP','{\"accommodationDetails\":\"员工住宿\",\"accommodationType\":\"0\",\"createBy\":\"王强\",\"createTime\":\"2024-06-06 16:30:45\",\"id\":6,\"numberOfRooms\":25,\"params\":{},\"remark\":\"工作人员住宿，近奥运村\",\"updateBy\":\"王强\",\"updateTime\":\"2024-06-13 10:53:30\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 10:53:37',18),(239,'住宿与交通调度-住宿调度',2,'com.neuedu.sports.controller.SportsAccommodationSchedulingController.edit()','PUT',1,'admin','研发部门','/stayAndTraffic/accommodationScheduling','127.0.0.1','内网IP','{\"accommodationDetails\":\"媒体酒店\",\"accommodationType\":\"0\",\"createBy\":\"李华\",\"createTime\":\"2024-06-06 16:30:45\",\"id\":7,\"numberOfRooms\":35,\"params\":{},\"remark\":\"媒体代表住宿，市中心\",\"updateBy\":\"李华\",\"updateTime\":\"2024-06-13 10:53:33\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 10:53:40',16),(240,'住宿与交通调度-住宿调度',2,'com.neuedu.sports.controller.SportsAccommodationSchedulingController.edit()','PUT',1,'admin','研发部门','/stayAndTraffic/accommodationScheduling','127.0.0.1','内网IP','{\"accommodationDetails\":\"奥运村\",\"accommodationType\":\"酒店\",\"createBy\":\"克勤\",\"createTime\":\"2024-06-06 16:30:45\",\"id\":9,\"numberOfRooms\":25,\"params\":{},\"remark\":\"运动员住宿，巴黎市区\",\"updateBy\":\"克勤\",\"updateTime\":\"2024-06-13 10:53:36\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 10:53:43',36),(241,'住宿与交通调度-住宿调度',2,'com.neuedu.sports.controller.SportsAccommodationSchedulingController.edit()','PUT',1,'admin','研发部门','/stayAndTraffic/accommodationScheduling','127.0.0.1','内网IP','{\"accommodationDetails\":\"奥运村\",\"accommodationType\":\"0\",\"createBy\":\"刘刚\",\"createTime\":\"2024-06-06 16:30:45\",\"id\":8,\"numberOfRooms\":40,\"params\":{},\"remark\":\"运动员住宿，巴黎市区\",\"updateBy\":\"刘刚\",\"updateTime\":\"2024-06-13 10:53:39\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 10:53:46',25),(242,'住宿与交通调度-住宿调度',2,'com.neuedu.sports.controller.SportsAccommodationSchedulingController.edit()','PUT',1,'admin','研发部门','/stayAndTraffic/accommodationScheduling','127.0.0.1','内网IP','{\"accommodationDetails\":\"奥运村\",\"accommodationType\":\"1\",\"createBy\":\"克勤\",\"createTime\":\"2024-06-06 16:30:45\",\"id\":9,\"numberOfRooms\":25,\"params\":{},\"remark\":\"运动员住宿，巴黎市区\",\"updateBy\":\"克勤\",\"updateTime\":\"2024-06-13 10:53:43\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 10:53:50',18),(243,'住宿与交通调度-住宿调度',2,'com.neuedu.sports.controller.SportsAccommodationSchedulingController.edit()','PUT',1,'admin','研发部门','/stayAndTraffic/accommodationScheduling','127.0.0.1','内网IP','{\"accommodationDetails\":\"员工住宿\",\"accommodationType\":\"0\",\"createBy\":\"滕菲\",\"createTime\":\"2024-06-06 16:30:45\",\"id\":10,\"numberOfRooms\":15,\"params\":{},\"remark\":\"工作人员住宿，近奥运村\",\"updateBy\":\"滕菲\",\"updateTime\":\"2024-06-13 10:53:46\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 10:53:53',44),(244,'住宿与交通调度-交通服务',2,'com.neuedu.sports.controller.SportsTransportationServiceController.edit()','PUT',1,'admin','研发部门','/stayAndTraffic/transportationService','127.0.0.1','内网IP','{\"capacity\":50,\"createBy\":\"巴黎奥运会交通服务团队\",\"createTime\":\"2024-07-01 09:00:00\",\"id\":1,\"params\":{},\"remark\":\"主场馆至酒店接送服务\",\"scheduleDetails\":\"每日早晚高峰时段提供从主场馆至指定酒店的大巴接送服务\",\"serviceType\":\"场馆间接送\",\"updateBy\":\"交通服务审核员A\",\"updateTime\":\"2024-06-13 10:58:16\",\"vehicleType\":\"大巴\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 10:58:23',28),(245,'住宿与交通调度-交通服务',2,'com.neuedu.sports.controller.SportsTransportationServiceController.edit()','PUT',1,'admin','研发部门','/stayAndTraffic/transportationService','127.0.0.1','内网IP','{\"capacity\":50,\"createBy\":\"巴黎奥运会交通服务团队\",\"createTime\":\"2024-07-01 09:00:00\",\"id\":1,\"params\":{},\"remark\":\"主场馆至酒店接送服务\",\"scheduleDetails\":\"每日早晚高峰时段提供从主场馆至指定酒店的大巴接送服务\",\"serviceType\":\"场馆间接送\",\"updateBy\":\"交通服务审核员A\",\"updateTime\":\"2024-06-13 10:58:19\",\"vehicleType\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 10:58:27',19),(246,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"场馆间接送\",\"dictSort\":0,\"dictType\":\"traffic_service_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 10:58:54',121),(247,'住宿与交通调度-交通服务',2,'com.neuedu.sports.controller.SportsTransportationServiceController.edit()','PUT',1,'admin','研发部门','/stayAndTraffic/transportationService','127.0.0.1','内网IP','{\"capacity\":50,\"createBy\":\"巴黎奥运会交通服务团队\",\"createTime\":\"2024-07-01 09:00:00\",\"id\":1,\"params\":{},\"remark\":\"主场馆至酒店接送服务\",\"scheduleDetails\":\"每日早晚高峰时段提供从主场馆至指定酒店的大巴接送服务\",\"serviceType\":\"0\",\"updateBy\":\"交通服务审核员A\",\"updateTime\":\"2024-06-13 10:59:38\",\"vehicleType\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 10:59:45',31),(248,'住宿与交通调度-交通服务',2,'com.neuedu.sports.controller.SportsTransportationServiceController.edit()','PUT',1,'admin','研发部门','/stayAndTraffic/transportationService','127.0.0.1','内网IP','{\"capacity\":4,\"createBy\":\"巴黎奥运会交通服务团队\",\"createTime\":\"2024-07-02 11:30:00\",\"id\":2,\"params\":{},\"remark\":\"水上运动中心专车服务\",\"scheduleDetails\":\"为水上运动中心观众提供专车接送服务\",\"serviceType\":\"0\",\"updateBy\":\"交通服务审核员B\",\"updateTime\":\"2024-06-13 11:00:10\",\"vehicleType\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 11:00:18',44),(249,'住宿与交通调度-交通调度',2,'com.neuedu.sports.controller.SportsTransportationSchedulingController.edit()','PUT',1,'admin','研发部门','/stayAndTraffic/transportationScheduling','127.0.0.1','内网IP','{\"capacity\":200,\"createBy\":\"巴黎奥运会交通调度团队\",\"createTime\":\"2024-07-01 08:00:00\",\"id\":1,\"params\":{},\"remark\":\"开幕式专车调度\",\"scheduleDetails\":\"从机场至开幕式场地，预计搭载200人\",\"transportationType\":\"1\",\"updateBy\":\"交通调度审核员A\",\"updateTime\":\"2024-06-13 11:00:25\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 11:00:32',40),(250,'住宿与交通调度-交通调度',2,'com.neuedu.sports.controller.SportsTransportationSchedulingController.edit()','PUT',1,'admin','研发部门','/stayAndTraffic/transportationScheduling','127.0.0.1','内网IP','{\"capacity\":50,\"createBy\":\"巴黎奥运会交通调度团队\",\"createTime\":\"2024-07-02 10:30:00\",\"id\":2,\"params\":{},\"remark\":\"田径赛事观众接送\",\"scheduleDetails\":\"往返于赛场与住宿酒店，每车可载50人\",\"transportationType\":\"2\",\"updateBy\":\"交通调度审核员B\",\"updateTime\":\"2024-06-13 11:00:28\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 11:00:35',23),(251,'住宿与交通调度-住宿安排',2,'com.neuedu.sports.controller.SportsAccommodationArrangementController.edit()','PUT',1,'admin','研发部门','/stayAndTraffic/accommodationArrangement','127.0.0.1','内网IP','{\"accommodationName\":\"Athletes Village\",\"address\":\"Paris, France\",\"checkInDate\":\"2024-07-25\",\"checkOutDate\":\"2024-08-10\",\"createBy\":\"John Doe\",\"createTime\":\"2024-06-06 10:00:16\",\"id\":1,\"numberOfRooms\":50,\"params\":{},\"personType\":\"2\",\"remark\":\"运动员住宿，巴黎市区\",\"updateBy\":\"John Doe\",\"updateTime\":\"2024-06-13 11:00:48\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 11:00:55',42),(252,'菜单管理',2,'com.neuedu.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"message/volunteer/index\",\"createTime\":\"2024-06-13 10:37:27\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2044,\"menuName\":\"志愿者信息中心\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2041,\"path\":\"volunteerMessage\",\"perms\":\"message:volunteer:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 11:02:30',82),(253,'志愿者管理-活动分配',2,'com.neuedu.sports.controller.SportsVolunteerActivityAssignmentController.edit()','PUT',1,'admin','研发部门','/volunteer/activityAssignment','127.0.0.1','内网IP','{\"assignmentDetail\":\"负责开幕式入场引导工作\",\"createBy\":\"巴黎奥运会志愿者分配团队\",\"createTime\":\"2024-06-20 09:00:00\",\"eventId\":1,\"params\":{},\"remark\":\"开幕式现场引导\",\"updateBy\":\"志愿者分配员A\",\"updateTime\":\"2024-06-13 11:08:51\",\"volunteerId\":2,\"zho\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 11:08:58',30),(254,'字典类型',1,'com.neuedu.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"志愿者申请状态\",\"dictType\":\"application_status\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 11:10:06',99),(255,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"待审核\",\"dictSort\":0,\"dictType\":\"application_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 11:10:34',79),(256,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已通过\",\"dictSort\":0,\"dictType\":\"application_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 11:10:47',115),(257,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未通过\",\"dictSort\":0,\"dictType\":\"application_status\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 11:10:52',45),(258,'志愿者管理-申请与审批',2,'com.neuedu.sports.controller.SportsVolunteerApplicationApprovalController.edit()','PUT',1,'admin','研发部门','/volunteer/applicationApproval','127.0.0.1','内网IP','{\"applicationStatus\":\"0\",\"assignmentInfo\":\"待分配\",\"createBy\":\"巴黎奥运会志愿者招募团队\",\"createTime\":\"2024-05-01 09:00:00\",\"id\":1,\"params\":{},\"qualificationReview\":\"资格审查通过，具备基本语言能力\",\"remark\":\"申请已提交\",\"updateBy\":\"审核员A\",\"updateTime\":\"2024-06-13 11:16:02\",\"volunteerName\":\"张三\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 11:16:09',29),(259,'志愿者管理-申请与审批',2,'com.neuedu.sports.controller.SportsVolunteerApplicationApprovalController.edit()','PUT',1,'admin','研发部门','/volunteer/applicationApproval','127.0.0.1','内网IP','{\"applicationStatus\":\"1\",\"assignmentInfo\":\"开幕式翻译\",\"createBy\":\"巴黎奥运会志愿者招募团队\",\"createTime\":\"2024-05-05 10:30:00\",\"id\":2,\"params\":{},\"qualificationReview\":\"经验丰富，适合担任翻译工作\",\"remark\":\"申请人具备相关经验\",\"updateBy\":\"审核员B\",\"updateTime\":\"2024-06-13 11:16:06\",\"volunteerName\":\"李四\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 11:16:13',51),(260,'志愿者管理-培训管理',2,'com.neuedu.sports.controller.SportsVolunteerTrainingManagementController.edit()','PUT',1,'admin','研发部门','/volunteer/trainingManagement','127.0.0.1','内网IP','{\"createBy\":\"巴黎奥运会培训团队\",\"createTime\":\"2024-04-01 09:00:00\",\"id\":1,\"offlineTrainingSchedule\":\"2024年4月5日，上午9点至下午5点\",\"params\":{},\"remark\":\"基础培训材料\",\"trainingMaterial\":\"/profile/upload/2024/06/13/河北工业_20240613111839A001.pdf\",\"updateBy\":\"管理员A\",\"updateTime\":\"2024-06-13 11:18:40\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 11:18:47',34),(261,'赛事管理-结果记录',2,'com.neuedu.sports.controller.SportsResultRecordController.edit()','PUT',1,'admin','研发部门','/competition/resultRecord','127.0.0.1','内网IP','{\"createBy\":\"巴黎奥运会管理员\",\"createTime\":\"2024-07-25 10:30:00\",\"jie\":1,\"loserAthleteId\":\"1007, 1004, 1005, 1008\",\"matchId\":1,\"params\":{},\"remark\":\"男子100米决赛结果\",\"result\":\"苏炳添 9.87秒 冠军\",\"updateBy\":\"新华社\",\"updateTime\":\"2024-06-13 11:22:36\",\"winnerAthleteId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 11:22:43',201),(262,'赛事管理-结果记录',2,'com.neuedu.sports.controller.SportsResultRecordController.edit()','PUT',1,'admin','研发部门','/competition/resultRecord','127.0.0.1','内网IP','{\"createBy\":\"巴黎奥运会管理员\",\"createTime\":\"2024-07-25 10:30:00\",\"jie\":1,\"loserAthleteId\":\"1,2,3\",\"matchId\":1,\"params\":{},\"remark\":\"男子100米决赛结果\",\"result\":\"苏炳添 9.87秒 冠军\",\"updateBy\":\"新华社\",\"updateTime\":\"2024-06-13 11:28:35\",\"winnerAthleteId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 11:28:43',28),(263,'赛事管理-结果记录',2,'com.neuedu.sports.controller.SportsResultRecordController.edit()','PUT',1,'admin','研发部门','/competition/resultRecord','127.0.0.1','内网IP','{\"createBy\":\"巴黎奥运会管理员\",\"createTime\":\"2024-07-25 14:15:00\",\"jie\":2,\"loserAthleteId\":\"3,5,6\",\"matchId\":1,\"params\":{},\"remark\":\"女子100米决赛结果\",\"result\":\"李雪莲 11.05秒 冠军\",\"updateBy\":\"人民日报\",\"updateTime\":\"2024-06-13 13:20:46\",\"winnerAthleteId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 13:20:53',34),(264,'用户反馈',1,'com.neuedu.sports.controller.SportsFeedbackController.add()','POST',1,'admin','研发部门','/message/feedback','127.0.0.1','内网IP','{\"contactPhone\":\"1\",\"contacts\":\"1\",\"content\":\"1\",\"createTime\":\"2024-06-13 13:24:50\",\"id\":1,\"params\":{},\"title\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 13:24:57',103),(265,'字典类型',1,'com.neuedu.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"反馈状态\",\"dictType\":\"feedback_status\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 13:26:17',85),(266,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"处理中\",\"dictSort\":0,\"dictType\":\"feedback_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 13:26:40',99),(267,'字典数据',1,'com.neuedu.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"处理完成\",\"dictSort\":0,\"dictType\":\"feedback_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 13:26:45',52),(268,'新闻公告',1,'com.neuedu.sports.controller.SportsNewsController.add()','POST',1,'admin','研发部门','/message/news','127.0.0.1','内网IP','{\"content\":\"<p>11</p>\",\"createTime\":\"2024-06-13 13:32:23\",\"file\":\"/profile/upload/2024/06/13/河北工业_20240613133219A002.pdf\",\"id\":1,\"params\":{},\"title\":\"11\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 13:32:30',50),(269,'新闻公告',2,'com.neuedu.sports.controller.SportsNewsController.edit()','PUT',1,'admin','研发部门','/message/news','127.0.0.1','内网IP','{\"content\":\"<p><strong>11的撒旦</strong></p>\",\"createTime\":\"2024-06-13 13:32:23\",\"file\":\"/profile/upload/2024/06/13/河北工业_20240613133219A002.pdf\",\"id\":1,\"params\":{},\"title\":\"11\",\"updateTime\":\"2024-06-13 13:35:20\",\"views\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 13:35:28',22),(270,'志愿者信息中心',1,'com.neuedu.sports.controller.SportsVolunteerController.add()','POST',1,'admin','研发部门','/message/volunteer','127.0.0.1','内网IP','{\"content\":\"<p>11</p>\",\"createTime\":\"2024-06-13 13:49:30\",\"id\":1,\"params\":{},\"title\":\"11\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 13:49:38',58),(271,'住宿与交通调度-交通调度',2,'com.neuedu.sports.controller.SportsTransportationSchedulingController.edit()','PUT',1,'admin','研发部门','/stayAndTraffic/transportationScheduling','127.0.0.1','内网IP','{\"capacity\":2000,\"createBy\":\"巴黎奥运会交通调度团队\",\"createTime\":\"2024-07-05 13:00:00\",\"id\":3,\"params\":{},\"remark\":\"游泳赛事交通调度\",\"scheduleDetails\":\"利用地铁网络疏导观众\",\"transportationType\":\"3\",\"updateBy\":\"交通调度审核员C\",\"updateTime\":\"2024-06-13 15:20:28\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 15:20:35',145),(272,'用户反馈',1,'com.neuedu.sports.controller.SportsFeedbackController.add()','POST',1,'admin','研发部门','/message/feedback','127.0.0.1','内网IP','{\"contactPhone\":\"2\",\"contacts\":\"2\",\"content\":\"2\",\"createBy\":\"admin\",\"createTime\":\"2024-06-13 15:52:03\",\"id\":2,\"params\":{},\"title\":\"2\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 15:52:10',105),(273,'字典数据',2,'com.neuedu.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-06-12 14:58:34\",\"cssClass\":\"red\",\"default\":false,\"dictCode\":105,\"dictLabel\":\"未处理\",\"dictSort\":0,\"dictType\":\"dis_status\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 16:24:52',90),(274,'字典数据',2,'com.neuedu.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-06-12 14:58:34\",\"cssClass\":\"\",\"default\":false,\"dictCode\":105,\"dictLabel\":\"未处理\",\"dictSort\":0,\"dictType\":\"dis_status\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-13 16:25:05',71),(275,'志愿者管理-活动分配',2,'com.neuedu.sports.controller.SportsVolunteerActivityAssignmentController.edit()','PUT',1,'admin','研发部门','/volunteer/activityAssignment','127.0.0.1','内网IP','{\"assignmentDetail\":\"负责游泳比赛的检录工作\",\"createBy\":\"巴黎奥运会志愿者分配团队\",\"createTime\":\"2024-06-25 11:30:00\",\"eventId\":2,\"params\":{},\"remark\":\"游泳比赛检录\",\"updateBy\":\"志愿者分配员B\",\"updateTime\":\"2024-06-18 09:00:56\",\"volunteerId\":1,\"zho\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 09:00:57',94),(276,'志愿者管理-活动分配',2,'com.neuedu.sports.controller.SportsVolunteerActivityAssignmentController.edit()','PUT',1,'admin','研发部门','/volunteer/activityAssignment','127.0.0.1','内网IP','{\"assignmentDetail\":\"负责田径比赛看台区域的观众服务工作\",\"createBy\":\"巴黎奥运会志愿者分配团队\",\"createTime\":\"2024-07-01 14:15:00\",\"eventId\":3,\"params\":{},\"remark\":\"田径比赛看台服务\",\"updateBy\":\"志愿者分配员C\",\"updateTime\":\"2024-06-18 09:01:00\",\"volunteerId\":4,\"zho\":3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 09:01:00',0),(277,'志愿者管理-活动分配',2,'com.neuedu.sports.controller.SportsVolunteerActivityAssignmentController.edit()','PUT',1,'admin','研发部门','/volunteer/activityAssignment','127.0.0.1','内网IP','{\"assignmentDetail\":\"负责篮球比赛的计分工作\",\"createBy\":\"巴黎奥运会志愿者分配团队\",\"createTime\":\"2024-07-05 08:45:00\",\"eventId\":4,\"params\":{},\"remark\":\"篮球比赛计分\",\"updateBy\":\"志愿者分配员D\",\"updateTime\":\"2024-06-18 09:01:05\",\"volunteerId\":8,\"zho\":4}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 09:01:05',15),(278,'志愿者管理-活动分配',2,'com.neuedu.sports.controller.SportsVolunteerActivityAssignmentController.edit()','PUT',1,'admin','研发部门','/volunteer/activityAssignment','127.0.0.1','内网IP','{\"assignmentDetail\":\"负责媒体中心的接待和咨询工作\",\"createBy\":\"巴黎奥运会志愿者分配团队\",\"createTime\":\"2024-07-10 10:30:00\",\"eventId\":5,\"params\":{},\"remark\":\"媒体中心接待\",\"updateBy\":\"志愿者分配员E\",\"updateTime\":\"2024-06-18 09:01:09\",\"volunteerId\":7,\"zho\":5}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 09:01:09',0),(279,'志愿者管理-活动分配',2,'com.neuedu.sports.controller.SportsVolunteerActivityAssignmentController.edit()','PUT',1,'admin','研发部门','/volunteer/activityAssignment','127.0.0.1','内网IP','{\"assignmentDetail\":\"负责闭幕式的安保工作\",\"createBy\":\"巴黎奥运会志愿者分配团队\",\"createTime\":\"2024-07-15 13:00:00\",\"eventId\":6,\"params\":{},\"remark\":\"闭幕式安保\",\"updateBy\":\"志愿者分配员F\",\"updateTime\":\"2024-06-18 09:01:13\",\"volunteerId\":3,\"zho\":6}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 09:01:13',12),(280,'志愿者管理-活动分配',2,'com.neuedu.sports.controller.SportsVolunteerActivityAssignmentController.edit()','PUT',1,'admin','研发部门','/volunteer/activityAssignment','127.0.0.1','内网IP','{\"assignmentDetail\":\"负责运动员休息区的服务工作\",\"createBy\":\"巴黎奥运会志愿者分配团队\",\"createTime\":\"2024-07-20 15:30:00\",\"eventId\":7,\"params\":{},\"remark\":\"运动员休息区服务\",\"updateBy\":\"志愿者分配员G\",\"updateTime\":\"2024-06-18 09:01:16\",\"volunteerId\":6,\"zho\":7}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 09:01:16',0),(281,'志愿者管理-活动分配',2,'com.neuedu.sports.controller.SportsVolunteerActivityAssignmentController.edit()','PUT',1,'admin','研发部门','/volunteer/activityAssignment','127.0.0.1','内网IP','{\"assignmentDetail\":\"负责运动员休息区的服务工作\",\"createBy\":\"巴黎奥运会志愿者分配团队\",\"createTime\":\"2024-07-20 15:30:00\",\"eventId\":2,\"params\":{},\"remark\":\"运动员休息区服务\",\"updateBy\":\"志愿者分配员G\",\"updateTime\":\"2024-06-18 09:01:20\",\"volunteerId\":6,\"zho\":7}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 09:01:20',10),(282,'志愿者管理-活动分配',2,'com.neuedu.sports.controller.SportsVolunteerActivityAssignmentController.edit()','PUT',1,'admin','研发部门','/volunteer/activityAssignment','127.0.0.1','内网IP','{\"assignmentDetail\":\"协助餐饮服务团队进行餐饮服务\",\"createBy\":\"巴黎奥运会志愿者分配团队\",\"createTime\":\"2024-07-25 09:15:00\",\"eventId\":8,\"params\":{},\"remark\":\"餐饮服务协助\",\"updateBy\":\"志愿者分配员H\",\"updateTime\":\"2024-06-18 09:01:24\",\"volunteerId\":6,\"zho\":8}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 09:01:24',1),(283,'志愿者管理-活动分配',2,'com.neuedu.sports.controller.SportsVolunteerActivityAssignmentController.edit()','PUT',1,'admin','研发部门','/volunteer/activityAssignment','127.0.0.1','内网IP','{\"assignmentDetail\":\"协助餐饮服务团队进行餐饮服务\",\"createBy\":\"巴黎奥运会志愿者分配团队\",\"createTime\":\"2024-07-25 09:15:00\",\"eventId\":3,\"params\":{},\"remark\":\"餐饮服务协助\",\"updateBy\":\"志愿者分配员H\",\"updateTime\":\"2024-06-18 09:01:28\",\"volunteerId\":6,\"zho\":8}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 09:01:28',16),(284,'志愿者管理-活动分配',2,'com.neuedu.sports.controller.SportsVolunteerActivityAssignmentController.edit()','PUT',1,'admin','研发部门','/volunteer/activityAssignment','127.0.0.1','内网IP','{\"assignmentDetail\":\"负责交通站点的指引工作\",\"createBy\":\"巴黎奥运会志愿者分配团队\",\"createTime\":\"2024-07-30 11:45:00\",\"eventId\":9,\"params\":{},\"remark\":\"交通站点指引\",\"updateBy\":\"志愿者分配员I\",\"updateTime\":\"2024-06-18 09:01:31\",\"volunteerId\":3,\"zho\":9}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 09:01:31',0),(285,'志愿者管理-活动分配',2,'com.neuedu.sports.controller.SportsVolunteerActivityAssignmentController.edit()','PUT',1,'admin','研发部门','/volunteer/activityAssignment','127.0.0.1','内网IP','{\"assignmentDetail\":\"负责交通站点的指引工作\",\"createBy\":\"巴黎奥运会志愿者分配团队\",\"createTime\":\"2024-07-30 11:45:00\",\"eventId\":4,\"params\":{},\"remark\":\"交通站点指引\",\"updateBy\":\"志愿者分配员I\",\"updateTime\":\"2024-06-18 09:01:36\",\"volunteerId\":3,\"zho\":9}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 09:01:36',9),(286,'志愿者管理-活动分配',2,'com.neuedu.sports.controller.SportsVolunteerActivityAssignmentController.edit()','PUT',1,'admin','研发部门','/volunteer/activityAssignment','127.0.0.1','内网IP','{\"assignmentDetail\":\"负责环保宣传，鼓励观众和运动员\",\"createBy\":\"巴黎奥运会志愿者分配团队\",\"createTime\":\"2024-08-02 14:00:00\",\"eventId\":3,\"params\":{},\"remark\":\"环保宣传\",\"updateBy\":\"志愿者分配员J\",\"updateTime\":\"2024-06-18 09:01:41\",\"volunteerId\":4,\"zho\":10}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 09:01:41',15),(287,'志愿者管理-申请与审批',2,'com.neuedu.sports.controller.SportsVolunteerApplicationApprovalController.edit()','PUT',1,'admin','研发部门','/volunteer/applicationApproval','127.0.0.1','内网IP','{\"applicationStatus\":\"0\",\"createBy\":\"巴黎奥运会志愿者招募团队\",\"createTime\":\"2024-05-10 12:15:00\",\"id\":3,\"params\":{},\"qualificationReview\":\"需补充语言能力证明\",\"remark\":\"需要补充材料\",\"updateBy\":\"审核员C\",\"updateTime\":\"2024-06-18 09:01:56\",\"volunteerName\":\"王五\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 09:01:56',0),(288,'新闻公告',3,'com.neuedu.sports.controller.SportsNewsController.remove()','DELETE',1,'admin','研发部门','/message/news/1','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 09:15:13',2),(289,'志愿者信息中心',3,'com.neuedu.sports.controller.SportsVolunteerController.remove()','DELETE',1,'admin','研发部门','/message/volunteer/1','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 09:23:28',0),(290,'代码生成',3,'com.neuedu.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/1,2,3,4,5,6,7,8,9,10','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 13:55:17',0),(291,'代码生成',3,'com.neuedu.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/11,12,13,14,15,16,17,18,19,20','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 13:55:19',0),(292,'代码生成',3,'com.neuedu.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/21,22,23,24,25,26,27,28,29','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 13:55:22',0),(293,'住宿与交通调度-住宿安排',2,'com.neuedu.sports.controller.SportsAccommodationArrangementController.edit()','PUT',1,'admin',NULL,'/stayAndTraffic/accommodationArrangement','127.0.0.1','内网IP','{\"accommodationName\":\"Staff Lodging\",\"address\":\"Paris, France\",\"checkInDate\":\"2024-07-20\",\"checkOutDate\":\"2024-08-15\",\"createBy\":\"Jane Smith\",\"createTime\":\"2024-06-06 10:00:16\",\"id\":2,\"numberOfRooms\":30,\"params\":{},\"personType\":\"2\",\"remark\":\"工作人员住宿，近奥运村\",\"updateBy\":\"Jane Smith\",\"updateTime\":\"2024-06-18 14:04:57\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 14:04:57',0),(294,'住宿与交通调度-住宿安排',2,'com.neuedu.sports.controller.SportsAccommodationArrangementController.edit()','PUT',1,'admin',NULL,'/stayAndTraffic/accommodationArrangement','127.0.0.1','内网IP','{\"accommodationName\":\"Media Hotel\",\"address\":\"Paris, France\",\"checkInDate\":\"2024-07-22\",\"checkOutDate\":\"2024-08-12\",\"createBy\":\"Mike Johnson\",\"createTime\":\"2024-06-06 10:00:16\",\"id\":3,\"numberOfRooms\":20,\"params\":{},\"personType\":\"2\",\"remark\":\"媒体代表住宿，市中心\",\"updateBy\":\"Mike Johnson\",\"updateTime\":\"2024-06-18 14:05:00\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 14:05:00',0),(295,'住宿与交通调度-住宿安排',2,'com.neuedu.sports.controller.SportsAccommodationArrangementController.edit()','PUT',1,'admin',NULL,'/stayAndTraffic/accommodationArrangement','127.0.0.1','内网IP','{\"accommodationName\":\"Backup Lodging\",\"address\":\"Paris, France\",\"checkInDate\":\"2024-07-27\",\"checkOutDate\":\"2024-08-08\",\"createBy\":\"Emily Davis\",\"createTime\":\"2024-06-06 10:00:16\",\"id\":4,\"numberOfRooms\":10,\"params\":{},\"personType\":\"0\",\"remark\":\"备用住宿点，近机场\",\"updateBy\":\"Emily Davis\",\"updateTime\":\"2024-06-18 14:05:04\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 14:05:04',0),(296,'住宿与交通调度-住宿安排',2,'com.neuedu.sports.controller.SportsAccommodationArrangementController.edit()','PUT',1,'admin',NULL,'/stayAndTraffic/accommodationArrangement','127.0.0.1','内网IP','{\"accommodationName\":\"Athletes Village\",\"address\":\"Paris, France\",\"checkInDate\":\"2024-07-23\",\"checkOutDate\":\"2024-08-14\",\"createBy\":\"Tom Brown\",\"createTime\":\"2024-06-06 10:00:16\",\"id\":5,\"numberOfRooms\":15,\"params\":{},\"personType\":\"0\",\"remark\":\"运动员住宿，巴黎市区\",\"updateBy\":\"Tom Brown\",\"updateTime\":\"2024-06-18 14:05:08\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 14:05:08',0),(297,'住宿与交通调度-住宿安排',2,'com.neuedu.sports.controller.SportsAccommodationArrangementController.edit()','PUT',1,'admin',NULL,'/stayAndTraffic/accommodationArrangement','127.0.0.1','内网IP','{\"accommodationName\":\"员工住宿\",\"address\":\"法国巴黎\",\"checkInDate\":\"2024-07-24\",\"checkOutDate\":\"2024-08-11\",\"createBy\":\"王强\",\"createTime\":\"2024-06-06 10:00:16\",\"id\":6,\"numberOfRooms\":25,\"params\":{},\"personType\":\"1\",\"remark\":\"工作人员住宿，近奥运村\",\"updateBy\":\"王强\",\"updateTime\":\"2024-06-18 14:05:12\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 14:05:12',0),(298,'住宿与交通调度-住宿安排',2,'com.neuedu.sports.controller.SportsAccommodationArrangementController.edit()','PUT',1,'admin',NULL,'/stayAndTraffic/accommodationArrangement','127.0.0.1','内网IP','{\"accommodationName\":\"员工住宿\",\"address\":\"法国巴黎\",\"checkInDate\":\"2024-07-24\",\"checkOutDate\":\"2024-08-11\",\"createBy\":\"王强\",\"createTime\":\"2024-06-06 10:00:16\",\"id\":6,\"numberOfRooms\":25,\"params\":{},\"personType\":\"1\",\"remark\":\"工作人员住宿，近奥运村\",\"updateBy\":\"王强\",\"updateTime\":\"2024-06-18 14:05:37\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 14:05:37',0),(299,'住宿与交通调度-住宿安排',2,'com.neuedu.sports.controller.SportsAccommodationArrangementController.edit()','PUT',1,'admin',NULL,'/stayAndTraffic/accommodationArrangement','127.0.0.1','内网IP','{\"accommodationName\":\"媒体酒店\",\"address\":\"法国巴黎\",\"checkInDate\":\"2024-07-18\",\"checkOutDate\":\"2024-08-20\",\"createBy\":\"李华\",\"createTime\":\"2024-06-06 10:00:16\",\"id\":7,\"numberOfRooms\":35,\"params\":{},\"personType\":\"2\",\"remark\":\"媒体代表住宿，市中心\",\"updateBy\":\"李华\",\"updateTime\":\"2024-06-18 14:05:45\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 14:05:45',0),(300,'住宿与交通调度-住宿安排',2,'com.neuedu.sports.controller.SportsAccommodationArrangementController.edit()','PUT',1,'admin',NULL,'/stayAndTraffic/accommodationArrangement','127.0.0.1','内网IP','{\"accommodationName\":\"奥运村\",\"address\":\"法国巴黎\",\"checkInDate\":\"2024-07-26\",\"checkOutDate\":\"2024-08-09\",\"createBy\":\"刘刚\",\"createTime\":\"2024-06-06 10:00:16\",\"id\":8,\"numberOfRooms\":40,\"params\":{},\"personType\":\"0\",\"remark\":\"运动员住宿，巴黎市区\",\"updateBy\":\"刘刚\",\"updateTime\":\"2024-06-18 14:05:51\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 14:05:51',0),(301,'住宿与交通调度-住宿安排',2,'com.neuedu.sports.controller.SportsAccommodationArrangementController.edit()','PUT',1,'admin',NULL,'/stayAndTraffic/accommodationArrangement','127.0.0.1','内网IP','{\"accommodationName\":\"奥运村\",\"address\":\"法国巴黎\",\"checkInDate\":\"2024-07-26\",\"checkOutDate\":\"2024-08-09\",\"createBy\":\"刘刚\",\"createTime\":\"2024-06-06 10:00:16\",\"id\":8,\"numberOfRooms\":40,\"params\":{},\"personType\":\"0\",\"remark\":\"运动员住宿，巴黎市区\",\"updateBy\":\"刘刚\",\"updateTime\":\"2024-06-18 14:05:57\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 14:05:57',0);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2024-06-12 11:14:17','',NULL,''),(2,'se','项目经理',2,'0','admin','2024-06-12 11:14:17','',NULL,''),(3,'hr','人力资源',3,'0','admin','2024-06-12 11:14:17','',NULL,''),(4,'user','普通员工',4,'0','admin','2024-06-12 11:14:17','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-06-12 11:14:17','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2024-06-12 11:14:17','',NULL,'普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-06-18 15:38:39','admin','2024-06-12 11:14:17','','2024-06-18 15:38:39','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-06-12 11:14:17','admin','2024-06-12 11:14:17','',NULL,'测试员');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-18 17:07:37
