-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: study
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clazz`
--

DROP TABLE IF EXISTS `clazz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clazz` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID,主键',
  `name` varchar(30) NOT NULL COMMENT '班级名称',
  `room` varchar(20) DEFAULT NULL COMMENT '班级教室',
  `begin_date` date NOT NULL COMMENT '开课时间',
  `end_date` date NOT NULL COMMENT '结课时间',
  `master_id` int unsigned DEFAULT NULL COMMENT '班主任ID, 关联员工表ID',
  `subject` tinyint unsigned NOT NULL COMMENT '学科, 1:java, 2:前端, 3:大数据, 4:Python, 5:Go, 6: 嵌入式',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='班级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clazz`
--

LOCK TABLES `clazz` WRITE;
/*!40000 ALTER TABLE `clazz` DISABLE KEYS */;
INSERT INTO `clazz` VALUES (1,'JavaEE就业163期','212','2023-04-30','2023-06-29',10,1,'2023-06-01 17:08:23','2023-06-01 17:39:58'),(4,'前端就业90期','210','2023-07-10','2024-01-20',3,2,'2023-06-01 17:45:12','2023-06-01 17:45:12'),(5,'JavaEE就业165期','108','2023-06-15','2023-12-25',6,1,'2023-06-01 17:45:40','2023-06-01 17:45:40'),(6,'JavaEE就业166期','105','2023-07-20','2024-02-20',20,1,'2023-06-01 17:46:10','2023-06-01 17:46:10'),(7,'大数据就业58期','209','2023-08-01','2024-02-15',7,3,'2023-06-01 17:51:21','2023-06-01 17:51:21'),(8,'JavaEE就业167期','325','2023-11-20','2024-05-10',36,1,'2023-11-15 11:35:46','2023-12-13 14:31:24');
/*!40000 ALTER TABLE `clazz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID, 主键',
  `name` varchar(10) NOT NULL COMMENT '部门名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES (5,'人事部','2024-09-25 09:47:40','2024-09-25 09:47:40'),(6,'行政部','2024-11-30 20:56:37','2024-09-30 20:56:37');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID,主键',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) DEFAULT '123456' COMMENT '密码',
  `name` varchar(10) NOT NULL COMMENT '姓名',
  `gender` tinyint unsigned NOT NULL COMMENT '性别, 1:男, 2:女',
  `phone` char(11) NOT NULL COMMENT '手机号',
  `job` tinyint unsigned DEFAULT NULL COMMENT '职位, 1 班主任, 2 讲师 , 3 学工主管, 4 教研主管, 5 咨询师',
  `salary` int unsigned DEFAULT NULL COMMENT '薪资',
  `image` varchar(255) DEFAULT NULL COMMENT '头像',
  `entry_date` date DEFAULT NULL COMMENT '入职日期',
  `dept_id` int unsigned DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='员工表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES (1,'admin','123456','管理员',1,'13888888888',5,5000,'/static/img/default.png','2023-05-01',1,'2023-05-01 00:00:00','2023-05-01 00:00:00'),(2,'zhangwuji','123456','张无忌1234',1,'13309090002',2,8600,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2015-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:35:37'),(3,'大大牛马','123456','张牛',1,'13309090003',2,8900,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2008-05-01',2,'2023-10-20 16:35:33','2023-10-20 16:35:39'),(4,'wuyong','123456','吴用',1,'13309090004',2,9200,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2007-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:35:41'),(5,'gongsunsheng','123456','公孙胜',1,'13309090005',2,9500,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2012-12-05',2,'2023-10-20 16:35:33','2023-10-20 16:35:43'),(6,'huosanniang','123456','扈三娘',2,'13309090006',3,6500,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2013-09-05',1,'2023-10-20 16:35:33','2023-10-20 16:35:45'),(7,'chaijin','123456','柴进',1,'13309090007',1,4700,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2005-08-01',1,'2023-10-20 16:35:33','2023-10-20 16:35:47'),(8,'likui','123456','李逵',1,'13309090008',1,4800,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2014-11-09',1,'2023-10-20 16:35:33','2023-10-20 16:35:49'),(9,'wusong','123456','武松',1,'13309090009',1,4900,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2011-03-11',1,'2023-10-20 16:35:33','2023-10-20 16:35:51'),(10,'linchong','123456','林冲',1,'13309090010',1,5000,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2013-09-05',1,'2023-10-20 16:35:33','2023-10-20 16:35:53'),(11,'huyanzhuo','123456','呼延灼',1,'13309090011',2,9700,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2007-02-01',2,'2023-10-20 16:35:33','2023-10-20 16:35:55'),(12,'xiaoliguang','123456','小李广',1,'13309090012',2,10000,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2008-08-18',2,'2023-10-20 16:35:33','2023-10-20 16:35:57'),(13,'yangzhi','123456','杨志',1,'13309090013',1,5300,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2012-11-01',1,'2023-10-20 16:35:33','2023-10-20 16:35:59'),(14,'shijin','123456','史进',1,'13309090014',2,10600,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2002-08-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:01'),(15,'sunerniang','123456','孙二娘',2,'13309090015',2,10900,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2011-05-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:03'),(16,'luzhishen','123456','鲁智深',1,'13309090016',2,9600,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2010-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:05'),(17,'liying','12345678','李应',1,'13309090017',1,5800,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2015-03-21',1,'2023-10-20 16:35:33','2023-10-20 16:36:07'),(18,'shiqian','123456','时迁',1,'13309090018',2,10200,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2015-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:09'),(19,'gudasao','123456','顾大嫂',2,'13309090019',2,10500,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2008-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:11'),(20,'ruanxiaoer','123456','阮小二',1,'13309090020',2,10800,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2018-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:13'),(21,'ruanxiaowu','123456','阮小五',1,'13309090021',5,5200,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2015-01-01',3,'2023-10-20 16:35:33','2023-10-20 16:36:15'),(22,'ruanxiaoqi','123456','阮小七',1,'13309090022',5,5500,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2016-01-01',3,'2023-10-20 16:35:33','2023-10-20 16:36:17'),(23,'ruanji','123456','阮籍',1,'13309090023',5,5800,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2012-01-01',3,'2023-10-20 16:35:33','2023-10-20 16:36:19'),(24,'tongwei','123456','童威',1,'13309090024',5,5000,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2006-01-01',3,'2023-10-20 16:35:33','2023-10-20 16:36:21'),(25,'tongmeng','123456','童猛',1,'13309090025',5,4800,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2002-01-01',3,'2023-10-20 16:35:33','2023-10-20 16:36:23'),(26,'yanshun','123456','燕顺',1,'13309090026',5,5400,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2011-01-01',3,'2023-10-20 16:35:33','2023-11-08 22:12:46'),(28,'lizhong','123456','李忠',1,'13309090028',5,5000,'https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg','2007-01-01',3,'2023-10-20 16:35:33','2023-11-17 16:34:22');
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_expr`
--

DROP TABLE IF EXISTS `emp_expr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_expr` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID, 主键',
  `emp_id` int unsigned DEFAULT NULL COMMENT '员工ID',
  `begin` date DEFAULT NULL COMMENT '开始时间',
  `end` date DEFAULT NULL COMMENT '结束时间',
  `company` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `job` varchar(50) DEFAULT NULL COMMENT '职位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='工作经历';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_expr`
--

LOCK TABLES `emp_expr` WRITE;
/*!40000 ALTER TABLE `emp_expr` DISABLE KEYS */;
INSERT INTO `emp_expr` VALUES (1,1,'2015-01-01','2015-03-01','上海乐高','员工'),(2,1,'2015-03-01','2015-05-01','上海乐高','员工'),(3,1,'2015-05-01','2015-07-01','上海乐高','员工'),(4,1,'2015-07-01','2015-09-01','上海乐高','员工'),(10,2,'2012-07-01','2015-06-20','中软国际股份有限公司','java开发'),(11,2,'2015-07-01','2019-03-03','百度科技股份有限公司','java开发'),(12,2,'2019-03-15','2023-03-01','阿里巴巴科技股份有限公司','架构师'),(16,3,'2012-07-01','2015-06-20','中软国际股份有限公司','java开发'),(17,3,'2015-07-01','2019-03-03','百度科技股份有限公司','java开发'),(18,3,'2019-03-15','2023-03-01','阿里巴巴科技股份有限公司','架构师');
/*!40000 ALTER TABLE `emp_expr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_log`
--

DROP TABLE IF EXISTS `emp_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID, 主键',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `info` varchar(2000) DEFAULT NULL COMMENT '日志信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='员工日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_log`
--

LOCK TABLES `emp_log` WRITE;
/*!40000 ALTER TABLE `emp_log` DISABLE KEYS */;
INSERT INTO `emp_log` VALUES (1,'2025-07-10 20:46:30','添加员工Emp(id=null, username=牢大, password=null, name=大大大, gender=1, phone=18591754513, job=1, salary=1000, image=, entryDate=2025-07-06, deptId=3, createTime=2025-07-10T20:46:29.960659900, updateTime=2025-07-10T20:46:29.960659900, deptName=null, exprList=[EmpExpr(id=null, empId=null, begin=2025-07-06, end=2025-08-07, company=嗡嗡嗡, job=11)])'),(2,'2025-07-10 20:46:44','添加员工Emp(id=null, username=牢大, password=null, name=大大大, gender=1, phone=18591754513, job=1, salary=1000, image=, entryDate=2025-07-06, deptId=3, createTime=2025-07-10T20:46:43.605515900, updateTime=2025-07-10T20:46:43.605515900, deptName=null, exprList=[EmpExpr(id=null, empId=null, begin=2025-07-06, end=2025-08-07, company=嗡嗡嗡, job=11)])'),(3,'2025-07-10 21:10:58','添加员工Emp(id=44, username=牢大123, password=null, name=大大大12, gender=1, phone=18591754118, job=1, salary=1000, image=https://java1816087.oss-cn-beijing.aliyuncs.com/2025/07/dd55e7b1-4406-40c7-8e8e-8a9d8e3824c3.jpg, entryDate=2025-07-06, deptId=3, createTime=2025-07-10T21:10:58.379194900, updateTime=2025-07-10T21:10:58.379194900, deptName=null, exprList=[EmpExpr(id=null, empId=44, begin=2025-07-06, end=2025-08-07, company=嗡嗡嗡, job=11)])'),(4,'2025-07-11 17:24:14','添加员工Emp(id=null, username=牢大123, password=null, name=大大大12, gender=1, phone=13888888888, job=1, salary=1, image=https://java1816087.oss-cn-beijing.aliyuncs.com/2025/07/01e6f145-15e2-4711-96b8-7effb1f54226.jpg, entryDate=2025-07-01, deptId=3, createTime=2025-07-11T17:24:13.781376500, updateTime=2025-07-11T17:24:13.781376500, deptName=null, exprList=[])'),(5,'2025-07-11 17:24:32','添加员工Emp(id=null, username=牢大123, password=null, name=大大大12, gender=1, phone=13888888888, job=1, salary=1, image=https://java1816087.oss-cn-beijing.aliyuncs.com/2025/07/01e6f145-15e2-4711-96b8-7effb1f54226.jpg, entryDate=2025-07-01, deptId=3, createTime=2025-07-11T17:24:32.245613600, updateTime=2025-07-11T17:24:32.245613600, deptName=null, exprList=[])'),(6,'2025-07-11 17:25:02','添加员工Emp(id=null, username=牢大123, password=null, name=大大大12, gender=1, phone=13888888888, job=1, salary=1, image=https://java1816087.oss-cn-beijing.aliyuncs.com/2025/07/01e6f145-15e2-4711-96b8-7effb1f54226.jpg, entryDate=2025-07-01, deptId=3, createTime=2025-07-11T17:25:01.892666300, updateTime=2025-07-11T17:25:01.892666300, deptName=null, exprList=[])'),(7,'2025-07-11 19:21:18','添加员工Emp(id=null, username=牢大123, password=null, name=大大大12, gender=1, phone=13888888888, job=1, salary=1, image=https://java1816087.oss-cn-beijing.aliyuncs.com/2025/07/01e6f145-15e2-4711-96b8-7effb1f54226.jpg, entryDate=2025-07-01, deptId=3, createTime=2025-07-11T19:21:17.212443200, updateTime=2025-07-11T19:21:17.212443200, deptName=null, exprList=[])'),(8,'2025-07-11 19:22:30','添加员工Emp(id=null, username=牢大123, password=null, name=大大大12, gender=1, phone=13888888888, job=1, salary=1, image=https://java1816087.oss-cn-beijing.aliyuncs.com/2025/07/01e6f145-15e2-4711-96b8-7effb1f54226.jpg, entryDate=2025-07-01, deptId=3, createTime=2025-07-11T19:22:29.349829900, updateTime=2025-07-11T19:22:29.349829900, deptName=null, exprList=[])'),(9,'2025-07-11 19:25:02','添加员工Emp(id=null, username=牢大123, password=null, name=大大大12, gender=1, phone=13888888888, job=1, salary=1, image=https://java1816087.oss-cn-beijing.aliyuncs.com/2025/07/01e6f145-15e2-4711-96b8-7effb1f54226.jpg, entryDate=2025-07-01, deptId=3, createTime=2025-07-11T19:25:01.307126200, updateTime=2025-07-11T19:25:01.307126200, deptName=null, exprList=[])'),(10,'2025-07-11 19:26:33','添加员工Emp(id=null, username=牢大123, password=null, name=大大大12, gender=1, phone=13888888888, job=1, salary=1, image=https://java1816087.oss-cn-beijing.aliyuncs.com/2025/07/01e6f145-15e2-4711-96b8-7effb1f54226.jpg, entryDate=2025-07-01, deptId=3, createTime=2025-07-11T19:26:32.670085900, updateTime=2025-07-11T19:26:32.670085900, deptName=null, exprList=[])'),(11,'2025-07-11 19:31:46','添加员工Emp(id=null, username=牢大123, password=null, name=大大大12, gender=1, phone=13888888888, job=1, salary=1, image=https://java1816087.oss-cn-beijing.aliyuncs.com/2025/07/01e6f145-15e2-4711-96b8-7effb1f54226.jpg, entryDate=2025-07-01, deptId=3, createTime=2025-07-11T19:31:45.402750500, updateTime=2025-07-11T19:31:45.402750500, deptName=null, exprList=[])'),(12,'2025-07-11 19:32:09','添加员工Emp(id=null, username=牢大123, password=null, name=大大大12, gender=1, phone=13888888888, job=1, salary=1, image=https://java1816087.oss-cn-beijing.aliyuncs.com/2025/07/01e6f145-15e2-4711-96b8-7effb1f54226.jpg, entryDate=2025-07-01, deptId=3, createTime=2025-07-11T19:32:08.940891800, updateTime=2025-07-11T19:32:08.940891800, deptName=null, exprList=[])'),(13,'2025-07-11 19:32:37','添加员工Emp(id=null, username=牢大12345, password=null, name=大大大1234, gender=1, phone=13888888888, job=1, salary=1, image=https://java1816087.oss-cn-beijing.aliyuncs.com/2025/07/01e6f145-15e2-4711-96b8-7effb1f54226.jpg, entryDate=2025-07-01, deptId=3, createTime=2025-07-11T19:32:36.586220, updateTime=2025-07-11T19:32:36.586220, deptName=null, exprList=[])'),(14,'2025-07-11 19:33:45','添加员工Emp(id=null, username=牢大12345, password=null, name=大大大1234, gender=1, phone=13888888888, job=1, salary=1, image=https://java1816087.oss-cn-beijing.aliyuncs.com/2025/07/01e6f145-15e2-4711-96b8-7effb1f54226.jpg, entryDate=2025-07-01, deptId=3, createTime=2025-07-11T19:33:44.061666900, updateTime=2025-07-11T19:33:44.061666900, deptName=null, exprList=[])'),(15,'2025-07-11 19:36:07','添加员工Emp(id=null, username=牢大12345, password=null, name=大大大1234, gender=1, phone=13888888888, job=1, salary=1, image=https://java1816087.oss-cn-beijing.aliyuncs.com/2025/07/01e6f145-15e2-4711-96b8-7effb1f54226.jpg, entryDate=2025-07-01, deptId=3, createTime=2025-07-11T19:36:06.662772, updateTime=2025-07-11T19:36:06.662772, deptName=null, exprList=[])'),(16,'2025-07-11 19:40:48','添加员工Emp(id=null, username=牢大12345, password=null, name=大大大1234, gender=1, phone=13888888888, job=1, salary=1, image=https://java1816087.oss-cn-beijing.aliyuncs.com/2025/07/01e6f145-15e2-4711-96b8-7effb1f54226.jpg, entryDate=2025-07-01, deptId=3, createTime=2025-07-11T19:40:47.072576300, updateTime=2025-07-11T19:40:47.072576300, deptName=null, exprList=[])'),(17,'2025-07-11 19:41:10','添加员工Emp(id=null, username=牢大12345, password=null, name=大大大1234, gender=1, phone=13888888888, job=1, salary=1, image=https://java1816087.oss-cn-beijing.aliyuncs.com/2025/07/01e6f145-15e2-4711-96b8-7effb1f54226.jpg, entryDate=2025-07-01, deptId=3, createTime=2025-07-11T19:41:09.511329, updateTime=2025-07-11T19:41:09.511329, deptName=null, exprList=[])');
/*!40000 ALTER TABLE `emp_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operate_log`
--

DROP TABLE IF EXISTS `operate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operate_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `operate_emp_id` int unsigned DEFAULT NULL COMMENT '操作人ID',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `class_name` varchar(100) DEFAULT NULL COMMENT '操作的类名',
  `method_name` varchar(100) DEFAULT NULL COMMENT '操作的方法名',
  `method_params` varchar(2000) DEFAULT NULL COMMENT '方法参数',
  `return_value` varchar(2000) DEFAULT NULL COMMENT '返回值',
  `cost_time` bigint unsigned DEFAULT NULL COMMENT '方法执行耗时, 单位:ms',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operate_log`
--

LOCK TABLES `operate_log` WRITE;
/*!40000 ALTER TABLE `operate_log` DISABLE KEYS */;
INSERT INTO `operate_log` VALUES (6,1,'2025-07-13 13:46:18','com.kaka.controller.DeptController','delete','[1]','Result(code=1, msg=success, data=null)',283),(7,1,'2025-07-13 18:36:59','com.kaka.controller.DeptController','delete','[4]','Result(code=1, msg=success, data=null)',81);
/*!40000 ALTER TABLE `operate_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID,主键',
  `name` varchar(10) NOT NULL COMMENT '姓名',
  `no` char(10) NOT NULL COMMENT '学号',
  `gender` tinyint unsigned NOT NULL COMMENT '性别, 1: 男, 2: 女',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `id_card` char(18) NOT NULL COMMENT '身份证号',
  `is_college` tinyint unsigned NOT NULL COMMENT '是否来自于院校, 1:是, 0:否',
  `address` varchar(100) DEFAULT NULL COMMENT '联系地址',
  `degree` tinyint unsigned DEFAULT NULL COMMENT '最高学历, 1:初中, 2:高中, 3:大专, 4:本科, 5:硕士, 6:博士',
  `graduation_date` date DEFAULT NULL COMMENT '毕业时间',
  `clazz_id` int unsigned NOT NULL COMMENT '班级ID, 关联班级表ID',
  `violation_count` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '违纪次数',
  `violation_score` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '违纪扣分',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `no` (`no`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `id_card` (`id_card`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'段誉','2022000001',1,'18800000001','110120000300200001',1,'北京市昌平区建材城西路1号',1,'2021-07-01',2,0,0,'2023-11-14 21:22:19','2023-11-15 16:20:59'),(2,'萧峰','2022000002',1,'18800210003','110120000300200002',1,'北京市昌平区建材城西路2号',2,'2022-07-01',1,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(3,'虚竹','2022000003',1,'18800013001','110120000300200003',1,'北京市昌平区建材城西路3号',2,'2023-07-01',1,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(4,'萧远山','2022000004',1,'18800003211','110120000300200004',1,'北京市昌平区建材城西路4号',3,'2024-07-01',1,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(5,'阿朱','2022000005',2,'18800160002','110120000300200005',1,'北京市昌平区建材城西路5号',4,'2020-07-01',1,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(6,'阿紫','2022000006',2,'18800000034','110120000300200006',1,'北京市昌平区建材城西路6号',4,'2021-07-01',2,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(7,'游坦之','2022000007',1,'18800000067','110120000300200007',1,'北京市昌平区建材城西路7号',4,'2022-07-01',2,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(8,'康敏','2022000008',2,'18800000077','110120000300200008',1,'北京市昌平区建材城西路8号',5,'2023-07-01',2,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(9,'徐长老','2022000009',1,'18800000341','110120000300200009',1,'北京市昌平区建材城西路9号',3,'2024-07-01',2,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(10,'云中鹤','2022000010',1,'18800006571','110120000300200010',1,'北京市昌平区建材城西路10号',2,'2020-07-01',2,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(11,'钟万仇','2022000011',1,'18800000391','110120000300200011',1,'北京市昌平区建材城西路11号',4,'2021-07-01',1,0,0,'2023-11-14 21:22:19','2023-11-15 16:21:24'),(12,'崔百泉','2022000012',1,'18800000781','110120000300200018',1,'北京市昌平区建材城西路12号',4,'2022-07-05',8,6,17,'2023-11-14 21:22:19','2023-12-13 14:33:58'),(13,'耶律洪基','2022000013',1,'18800008901','110120000300200013',1,'北京市昌平区建材城西路13号',4,'2023-07-01',2,0,0,'2023-11-14 21:22:19','2023-11-15 16:21:21'),(14,'天山童姥','2022000014',2,'18800009201','110120000300200014',1,'北京市昌平区建材城西路14号',4,'2024-07-01',1,0,0,'2023-11-14 21:22:19','2023-11-15 16:21:17'),(15,'刘竹庄','2022000015',1,'18800009401','110120000300200015',1,'北京市昌平区建材城西路15号',3,'2020-07-01',4,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(16,'李春来','2022000016',1,'18800008501','110120000300200016',1,'北京市昌平区建材城西路16号',4,'2021-07-01',4,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(17,'王语嫣','2022000017',2,'18800007601','110120000300200017',1,'北京市昌平区建材城西路17号',2,'2022-07-01',4,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(18,'郑成功','2023001101',1,'13309092345','110110110110110110',0,'北京市昌平区回龙观街道88号',5,'2021-07-01',8,2,7,'2023-11-15 16:26:18','2023-11-15 16:40:10');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID,主键',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `name` varchar(10) DEFAULT NULL COMMENT '姓名',
  `age` tinyint unsigned DEFAULT NULL COMMENT '年龄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'xiaoqiao','123456','小乔',18),(9,'kakahh','123456','kaka1',18),(10,'kakahh','123456','kaka2',18),(11,'kakahh','123456','kaka3',18);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-13 21:26:55
