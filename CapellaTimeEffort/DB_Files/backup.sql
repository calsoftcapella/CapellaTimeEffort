-- MySQL dump 10.13  Distrib 5.1.73, for Win32 (ia32)
--
-- Host: localhost    Database: timesheetdatabase
-- ------------------------------------------------------
-- Server version	5.1.73-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appraisal`
--

DROP TABLE IF EXISTS `appraisal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appraisal` (
  `id_app` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `comm_obj` varchar(4000) DEFAULT NULL,
  `spec_obj` varchar(4000) DEFAULT NULL,
  `apollo_manager` varchar(45) DEFAULT NULL,
  `objective_role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_app`),
  KEY `fk_app_userid` (`user_id`),
  CONSTRAINT `fk_app_userid` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appraisal`
--

LOCK TABLES `appraisal` WRITE;
/*!40000 ALTER TABLE `appraisal` DISABLE KEYS */;
/*!40000 ALTER TABLE `appraisal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_feedback`
--

DROP TABLE IF EXISTS `client_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_feedback` (
  `c_fd_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `image_loc` varchar(1000) NOT NULL,
  `time_of_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `viewed_users` varchar(90) DEFAULT NULL,
  `feedback_summary` varchar(1000) NOT NULL,
  PRIMARY KEY (`c_fd_id`),
  KEY `c_fd_fk_1` (`user_id`),
  CONSTRAINT `fk_cfb1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_feedback`
--

LOCK TABLES `client_feedback` WRITE;
/*!40000 ALTER TABLE `client_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_access_mapping`
--

DROP TABLE IF EXISTS `comment_access_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_access_mapping` (
  `comment_access_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_Id` int(11) NOT NULL,
  `valid_user` int(11) NOT NULL,
  PRIMARY KEY (`comment_access_id`),
  KEY `comment_mapping_fk2` (`comment_Id`),
  CONSTRAINT `comment_mapping_fk3` FOREIGN KEY (`comment_Id`) REFERENCES `user_comments` (`comment_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_access_mapping`
--

LOCK TABLES `comment_access_mapping` WRITE;
/*!40000 ALTER TABLE `comment_access_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_access_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `contact_no` varchar(90) NOT NULL,
  `team` varchar(45) DEFAULT NULL,
  `apo_mang` varchar(45) NOT NULL,
  `sk_id` varchar(45) DEFAULT NULL,
  `location` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1` (`user_id`),
  CONSTRAINT `fk_con1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (48,5033,'8754475168','','','test','Chennai'),(63,5035,'8754475168','','','jaisankar.arumugam','Bangalore'),(64,5032,'9884734532','','','chandrasekar.p2','Chennai'),(65,5036,'8754475168','','','anucia.mary','Bangalore'),(66,5037,'8754475168','','','jaisankar.arumugam','Bangalore'),(68,5034,'8754475168','','','jaisankar.arumugam','Chennai'),(72,5029,'8754475168','Course Products','punithas@calsoftlabs.com','jaisankar.arumugam','Chennai');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_project_task_details`
--

DROP TABLE IF EXISTS `emp_project_task_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_project_task_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crmId` varchar(255) DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `plannedDays` varchar(255) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `taskDesc` varchar(255) DEFAULT NULL,
  `v1StoryId` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `complexity` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK38F188056672593F` (`user_id`),
  CONSTRAINT `FK38F188056672593F` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_project_task_details`
--

LOCK TABLES `emp_project_task_details` WRITE;
/*!40000 ALTER TABLE `emp_project_task_details` DISABLE KEYS */;
INSERT INTO `emp_project_task_details` VALUES (2,'1','2012-05-15 08:06:26','2','2012-05-15 08:06:26','desc','1',5040,'1','1','Open');
/*!40000 ALTER TABLE `emp_project_task_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_task_detail`
--

DROP TABLE IF EXISTS `employee_task_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_task_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `backlog_id` varchar(20) DEFAULT NULL,
  `task_id` varchar(20) DEFAULT NULL,
  `task_description` varchar(5000) DEFAULT NULL,
  `time` time NOT NULL,
  `task_date` date NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `work_status` varchar(45) DEFAULT NULL,
  `entry_time` datetime DEFAULT NULL,
  `actual_time` time NOT NULL,
  `comments` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_fk` (`user_id`),
  CONSTRAINT `user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2568 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_task_detail`
--

LOCK TABLES `employee_task_detail` WRITE;
/*!40000 ALTER TABLE `employee_task_detail` DISABLE KEYS */;
INSERT INTO `employee_task_detail` VALUES (2563,'11','12','11-task','07:00:00','2015-01-21','Development',5037,'home','2015-02-11 19:57:58','06:00:00','12-comments'),(2564,'123','321','123-task','08:00:00','2015-01-01','Maintenance/Release support',5037,'home','2015-02-11 18:14:44','07:00:00','321-comments'),(2566,'1','1','1','01:00:00','2015-01-13','Code Review',5040,'office','2015-02-12 19:22:00','01:00:00','1'),(2567,'22','33','22','02:00:00','2015-01-19','Code Review',5040,'office','2015-02-13 19:13:13','01:00:00','33');
/*!40000 ALTER TABLE `employee_task_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_detail`
--

DROP TABLE IF EXISTS `leave_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_month` varchar(20) NOT NULL,
  `leave_date` varchar(5) NOT NULL,
  `updated_on` date NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_detail`
--

LOCK TABLES `leave_detail` WRITE;
/*!40000 ALTER TABLE `leave_detail` DISABLE KEYS */;
INSERT INTO `leave_detail` VALUES (1,'Feb-2014','10','2014-02-05',5018),(2,'Feb-2014','6','2014-02-05',5011),(3,'Feb-2014','21','2014-02-05',5011),(5,'Apr-2014','28','2014-04-29',5007),(6,'Apr-2014','24','2014-04-29',5021),(7,'Apr-2014','28','2014-04-29',5021),(9,'Apr-2014','24','2014-04-29',5016),(11,'Apr-2014','24','2014-04-30',5022),(16,'Apr-2014','24','2014-05-05',5003),(17,'May-2014','1','2014-05-05',5016),(18,'May-2014','2','2014-05-05',5016),(19,'May-2014','12','2014-05-13',5023),(20,'May-2014','9','2014-05-14',5023),(23,'May-2014','28','2014-05-20',5022),(24,'May-2014','1','2014-05-20',5022),(25,'May-2014','13','2014-05-20',5022),(26,'May-2014','27','2014-05-29',5022),(27,'May-2014','30','2014-06-02',5016),(28,'Jun-2014','9','2014-06-10',5007),(29,'Jun-2014','16','2014-06-18',5007),(30,'Jun-2014','17','2014-06-18',5007),(31,'Jun-2014','17','2014-06-18',5016),(32,'Jun-2014','16','2014-06-18',5016),(34,'Jun-2014','17','2014-06-20',5023),(36,'Jul-2014','2','2014-07-07',5015),(38,'Jul-2014','3','2014-07-07',5015),(40,'Jul-2014','4','2014-07-07',5015),(41,'Jul-2014','9','2014-07-10',5026),(42,'Jul-2014','16','2014-07-17',5026),(44,'Jul-2014','16','2014-07-17',5016),(45,'Jul-2014','15','2014-07-17',5016),(46,'Jul-2014','21','2014-07-22',5007),(49,'Sep-2014','12','2014-08-04',5022),(50,'Sep-2014','15','2014-08-04',5022),(51,'Aug-2014','8','2014-08-04',5022),(52,'Aug-2014','11','2014-08-12',5007),(53,'Aug-2014','15','2014-08-18',5016),(55,'Aug-2014','20','2014-08-22',5026),(56,'Aug-2014','27','2014-09-01',5007),(57,'Aug-2014','28','2014-09-01',5007),(58,'Aug-2014','15','2014-09-01',5022),(59,'Aug-2014','29','2014-09-01',5022),(60,'Aug-2014','29','2014-09-01',5016),(62,'Aug-2014','27','2014-09-01',5015),(63,'Aug-2014','28','2014-09-01',5015),(64,'Sep-2014','2','2014-09-03',5022),(65,'Sep-2014','4','2014-09-05',5026),(67,'Sep-2014','11','2014-09-10',5022),(68,'Sep-2014','15','2014-09-16',5016),(69,'Sep-2014','23','2014-09-24',5023),(70,'Sep-2014','26','2014-09-29',5016),(71,'Oct-2014','2','2014-10-08',5016),(72,'Oct-2014','3','2014-10-08',5016),(73,'Oct-2014','21','2014-10-21',5023),(74,'Oct-2014','22','2014-10-23',5022),(75,'Oct-2014','22','2014-10-24',5016),(76,'Oct-2014','23','2014-10-27',5026),(77,'Oct-2014','24','2014-10-27',5026),(81,'Oct-2014','21','2014-10-27',5015),(82,'Oct-2014','23','2014-10-27',5015),(83,'Oct-2014','24','2014-10-27',5015),(84,'Oct-2014','2','2014-11-03',5022),(85,'Oct-2014','3','2014-11-03',5022),(86,'Oct-2014','21','2014-11-03',5022),(87,'Nov-2014','3','2014-11-04',5026),(88,'Nov-2014','11','2014-11-12',5022),(89,'Oct-2014','23','2014-11-26',5027),(90,'Oct-2014','24','2014-11-26',5027),(91,'Oct-2014','1','2014-11-26',5028),(92,'Oct-2014','2','2014-11-26',5028),(93,'Oct-2014','3','2014-11-26',5028),(94,'Oct-2014','6','2014-11-26',5028),(95,'Oct-2014','7','2014-11-26',5028),(96,'Oct-2014','8','2014-11-26',5028),(97,'Oct-2014','9','2014-11-26',5028),(98,'Oct-2014','10','2014-11-26',5028),(99,'Oct-2014','13','2014-11-26',5028),(100,'Oct-2014','14','2014-11-26',5028),(101,'Oct-2014','15','2014-11-26',5028),(102,'Oct-2014','16','2014-11-26',5028),(103,'Oct-2014','17','2014-11-26',5028),(104,'Oct-2014','20','2014-11-26',5028),(105,'Oct-2014','21','2014-11-26',5028),(106,'Oct-2014','22','2014-11-26',5028),(107,'Nov-2014','19','2014-11-26',5028),(108,'Nov-2014','20','2014-11-26',5028),(109,'Dec-2014','2','2014-12-03',5026),(111,'Dec-2014','15','2014-12-22',5028),(115,'Dec-2014','25','2014-12-24',5022),(116,'Dec-2014','26','2014-12-24',5022),(118,'Dec-2014','24','2014-12-29',5027),(119,'Dec-2014','26','2014-12-29',5027),(121,'Dec-2014','30','2015-01-02',5016),(122,'Dec-2014','31','2015-01-02',5016),(123,'Dec-2014','24','2015-01-02',5016),(124,'Dec-2014','26','2015-01-02',5016),(126,'Dec-2014','18','2015-01-07',5022),(127,'Dec-2014','31','2015-01-09',5023),(128,'Dec-2014','30','2015-01-09',5023),(129,'Dec-2014','29','2015-01-09',5023),(130,'Dec-2014','26','2015-01-09',5023),(131,'Jan-2015','5','2015-01-09',5023),(132,'Jan-2015','2','2015-01-09',5023),(133,'Jan-2015','12','2015-01-14',5026),(134,'Jan-2015','2','2015-02-05',5029),(135,'Feb-2015','3','2015-02-05',5029);
/*!40000 ALTER TABLE `leave_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_detail`
--

DROP TABLE IF EXISTS `project_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_detail` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(45) NOT NULL,
  `project_start_date` date DEFAULT NULL,
  `project_completion_date` date DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_detail`
--

LOCK TABLES `project_detail` WRITE;
/*!40000 ALTER TABLE `project_detail` DISABLE KEYS */;
INSERT INTO `project_detail` VALUES (1,'Capella',NULL,NULL);
/*!40000 ALTER TABLE `project_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_mapping`
--

DROP TABLE IF EXISTS `report_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `report_map_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_mapping`
--

LOCK TABLES `report_mapping` WRITE;
/*!40000 ALTER TABLE `report_mapping` DISABLE KEYS */;
INSERT INTO `report_mapping` VALUES (2,5003,5003),(3,5005,5005),(4,5002,5002),(5,5012,5012),(7,5008,5008),(8,5007,5007),(9,5015,5015),(10,5020,5020),(11,5021,5021),(12,5016,5016),(13,5013,5013),(14,5017,5017),(15,5009,5009),(16,5019,5019),(17,5014,5014),(18,5011,5011),(19,5002,5012),(20,5002,5008),(21,5002,5007),(22,5002,5015),(23,5002,5020),(24,5002,5021),(25,5002,5016),(26,5002,5013),(27,5002,5017),(28,5002,5009),(29,5002,5019),(30,5002,5001),(31,5002,5005),(32,5002,5003),(33,5002,5006),(34,5002,5014),(35,5002,5011),(36,5002,5018),(37,5002,5010),(38,5018,5018),(39,5010,5010),(63,5002,5023),(64,5002,5022),(65,5013,5012),(66,5013,5008),(67,5013,5007),(68,5013,5023),(69,5013,5015),(70,5013,5020),(71,5013,5021),(72,5013,5016),(73,5013,5022),(74,5013,5017),(75,5013,5009),(76,5013,5019),(77,5013,5005),(78,5013,5003),(79,5013,5006),(80,5013,5014),(81,5013,5011),(82,5013,5002),(83,5013,5018),(84,5013,5010),(85,5013,5004),(87,5004,5023),(89,5004,5016),(90,5004,5022),(93,5003,5007),(94,5003,5023),(95,5003,5021),(96,5003,5016),(97,5003,5022),(98,5003,5009),(101,5004,5026),(102,5003,5026),(103,5004,5012),(104,5004,5015),(105,5004,5017),(106,5004,5005),(107,5004,5011),(108,5004,5018),(109,5004,5028),(110,5004,5027),(113,5029,5029),(114,5032,5029),(116,5032,5032),(117,5040,5040);
/*!40000 ALTER TABLE `report_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` varchar(40) NOT NULL,
  `role_name` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('1001','Admin'),('1002','User'),('1003','Client'),('1004','Manager'),('1005','Account Manager'),('1006','Onsite Project Manager'),('1007','Admin User');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_comments`
--

DROP TABLE IF EXISTS `user_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_comments` (
  `comment_Id` int(15) NOT NULL AUTO_INCREMENT,
  `userPerformanceLog_id` int(11) DEFAULT NULL,
  `user_comment` varchar(5000) DEFAULT NULL,
  `date` varchar(10) DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `manager` varchar(45) DEFAULT NULL,
  `client` varchar(45) DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  `acc_Manager` varchar(45) DEFAULT NULL,
  `comment_logged_by` int(11) NOT NULL,
  PRIMARY KEY (`comment_Id`),
  KEY `id` (`userPerformanceLog_id`),
  KEY `appraisal_id` (`userPerformanceLog_id`),
  KEY `appr_fk1` (`userPerformanceLog_id`),
  CONSTRAINT `appr_fk1` FOREIGN KEY (`userPerformanceLog_id`) REFERENCES `appraisal` (`id_app`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_comments`
--

LOCK TABLES `user_comments` WRITE;
/*!40000 ALTER TABLE `user_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `role_id` varchar(40) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES ('1001',5001),('1001',5024),('1001',5032),('1002',5005),('1002',5006),('1002',5007),('1002',5008),('1002',5009),('1002',5010),('1002',5011),('1002',5012),('1002',5013),('1002',5014),('1002',5015),('1002',5016),('1002',5017),('1002',5018),('1002',5019),('1002',5020),('1002',5021),('1002',5022),('1002',5023),('1002',5025),('1002',5026),('1002',5027),('1002',5028),('1002',5029),('1002',5031),('1002',5040),('1003',5036),('1004',5003),('1004',5037),('1005',5002),('1005',5033),('1006',5034),('1006',5041),('1007',5004),('1007',5035);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `email` varchar(90) NOT NULL,
  `password` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL,
  `defpass` varchar(60) DEFAULT NULL,
  `exit_date` date DEFAULT NULL,
  `freeze_timesheet` date DEFAULT NULL,
  `apollo_id` varchar(90) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `project_detailfk1` (`project_id`),
  CONSTRAINT `project_detailfk1` FOREIGN KEY (`project_id`) REFERENCES `project_detail` (`project_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5042 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5029,'Jaisankar Arumugam','jaisankar.a@calsoftlabs.com','calsoftlabs','InActive','timesheet','2020-02-28','2017-07-12','jai@Capella.edu','2015-02-13',1),(5032,'chandrasekar','chandrasekar.p@calsoftlabs.com','calsoftlabs','Active','timesheet',NULL,NULL,'chandra@Capella.edu',NULL,1),(5033,'Account Manager','accountmanager@calsoftlabs.com','calsoftlabs','InActive','timesheet',NULL,NULL,'accountmanager@Capella.edu',NULL,1),(5034,'Onsite Project Manager','onsiteprojectmanager@calsoftlabs.com','calsoftlabs','Active','timesheet',NULL,NULL,'onsite@Capella.edu',NULL,1),(5035,'admin user1','adminuser@calsoftlabs.com','calsoftlabs','Active','timesheet',NULL,NULL,'adminuser1@Capella.edu',NULL,1),(5036,'client','client@calsoftlabs.com','calsoftlabs','InActive','timesheet',NULL,NULL,'jai@Capella.edu',NULL,1),(5037,'Manager','manager@calsoftlabs.com','calsoftlabs','InActive','timesheet',NULL,NULL,'manager@Capella.edu',NULL,1),(5040,'testuser','jaisankar.arumugam@gmail.com','calsoftlabs','Active','timesheet',NULL,NULL,NULL,NULL,1),(5041,'tt','ee@calsoftlabs.com','d3f06yp','Active','timesheet',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-16 12:05:07
