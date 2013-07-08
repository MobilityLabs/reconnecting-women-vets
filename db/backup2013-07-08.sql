-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: reconnecting-production.cuxx0vtbyol5.us-east-1.rds.amazonaws.com    Database: reconnecting_production
-- ------------------------------------------------------
-- Server version	5.5.31-log

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admins_on_email` (`email`),
  UNIQUE KEY `index_admins_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (2,'sean@mobility-labs.com','$2a$10$Dp3dOBGp.xqDVQ0Jr0d1getnt14.qaOSq9ZCrCINow0dJsQU8VFQ2',NULL,NULL,NULL,4,'2013-07-04 00:01:37','2013-07-02 15:18:59','173.13.234.140','76.21.211.162','J2Bz42mAMy6zSNuTinjW','2013-07-02 03:33:41','2013-07-02 03:31:43',NULL,'2013-07-02 03:31:43','2013-07-04 00:01:37'),(3,'rickymetz@gmail.com','$2a$10$JimLr25/oiMd2zJjL/da0u.xw/U0zGjw.9BiqUgQefPmJp1MuRQUm',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2013-07-02 04:05:10',NULL,NULL,'2013-07-02 04:05:12','2013-07-02 04:05:12'),(8,'marlon.nelson@gmail.com','$2a$10$5fIXKOsAZWH/NRPtC686h.aopEDC92et888zzkCic7TpAXVMU1RmK',NULL,NULL,'2013-07-08 16:15:25',1,'2013-07-08 16:15:25','2013-07-08 16:15:25','173.13.234.140','173.13.234.140',NULL,'2013-07-08 16:14:53','2013-07-08 16:09:22',NULL,'2013-07-08 16:09:22','2013-07-08 16:15:25');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8_unicode_ci,
  `question_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `pathway_id` int(11) DEFAULT NULL,
  `reassurance` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,'Yes',1,NULL,NULL,'','2013-07-02 03:35:17','2013-07-02 03:35:17'),(2,'No',1,NULL,NULL,'You are not alone. 93,000 other women veterans are looking for work right now.','2013-07-02 03:35:17','2013-07-02 03:35:17'),(3,'High School or GED',2,NULL,2,'','2013-07-02 03:37:21','2013-07-02 03:51:43'),(4,'Some College',2,NULL,2,'','2013-07-02 03:37:21','2013-07-02 04:20:29'),(5,'Associates Degree',2,NULL,2,'','2013-07-02 03:37:21','2013-07-02 04:21:15'),(6,'Bachelors Degree',2,NULL,2,'','2013-07-02 03:37:21','2013-07-02 04:21:47'),(7,'Masters Degree',2,NULL,2,'','2013-07-02 03:37:21','2013-07-02 04:22:05'),(8,'Doctorate',2,NULL,2,'','2013-07-02 03:37:21','2013-07-02 04:22:38'),(9,'College',3,NULL,3,'','2013-07-02 03:57:42','2013-07-02 04:23:03'),(10,'Job Specific',3,NULL,4,'','2013-07-02 03:57:42','2013-07-02 04:00:14'),(11,'I would like to provide mentoring',4,NULL,NULL,'','2013-07-02 04:01:40','2013-07-02 04:01:40'),(12,'I would like to receive mentoring',4,NULL,NULL,'','2013-07-02 04:01:40','2013-07-02 04:01:40'),(13,'I just haven\'t found the right job yet',5,NULL,NULL,'','2013-07-02 04:18:43','2013-07-02 04:18:43'),(14,'I don\'t think I can find a job',5,NULL,NULL,'','2013-07-02 04:18:43','2013-07-02 04:18:43'),(15,'There are serious barriers to me finding employment',5,NULL,NULL,'','2013-07-02 04:18:43','2013-07-02 04:18:43'),(16,'Yes, please!',6,NULL,NULL,'','2013-07-02 04:26:16','2013-07-02 04:26:16'),(17,'No thank you',6,NULL,NULL,'','2013-07-02 04:26:16','2013-07-02 04:26:16'),(18,'Yes',7,NULL,3,'','2013-07-02 04:26:16','2013-07-02 15:03:04'),(19,'No',7,NULL,NULL,'','2013-07-02 04:26:16','2013-07-02 04:26:16'),(20,'Construction',8,NULL,4,'','2013-07-02 04:28:41','2013-07-02 15:21:02'),(21,'Management',8,NULL,NULL,'','2013-07-02 04:28:41','2013-07-02 04:28:41'),(22,'Sales',8,NULL,NULL,'','2013-07-02 04:28:41','2013-07-02 04:28:41'),(23,'Technology',8,NULL,NULL,'','2013-07-02 04:28:41','2013-07-02 04:28:41');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answers_pathways`
--

DROP TABLE IF EXISTS `answers_pathways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers_pathways` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_id` int(11) DEFAULT NULL,
  `pathway_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers_pathways`
--

LOCK TABLES `answers_pathways` WRITE;
/*!40000 ALTER TABLE `answers_pathways` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers_pathways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answers_resources`
--

DROP TABLE IF EXISTS `answers_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers_resources`
--

LOCK TABLES `answers_resources` WRITE;
/*!40000 ALTER TABLE `answers_resources` DISABLE KEYS */;
INSERT INTO `answers_resources` VALUES (1,3,2,NULL,NULL),(2,3,1,NULL,NULL),(3,3,6,NULL,NULL),(4,4,2,NULL,NULL),(5,4,1,NULL,NULL),(6,4,6,NULL,NULL),(7,9,2,NULL,NULL),(8,9,1,NULL,NULL),(9,10,2,NULL,NULL),(10,10,1,NULL,NULL),(11,10,4,NULL,NULL),(12,10,6,NULL,NULL),(13,5,2,NULL,NULL),(14,5,1,NULL,NULL),(15,6,2,NULL,NULL),(16,6,1,NULL,NULL),(17,7,2,NULL,NULL),(18,7,1,NULL,NULL),(19,8,2,NULL,NULL),(20,8,1,NULL,NULL),(21,18,1,NULL,NULL),(22,20,4,NULL,NULL);
/*!40000 ALTER TABLE `answers_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Education','2013-07-02 03:39:09','2013-07-02 03:39:09'),(2,'Childcare','2013-07-02 03:39:15','2013-07-02 03:39:15'),(3,'Transportation','2013-07-02 03:39:21','2013-07-02 03:39:21'),(4,'Mental Health','2013-07-02 03:40:28','2013-07-02 03:40:28'),(5,'Employment','2013-07-02 03:40:35','2013-07-02 03:40:35'),(6,'Mentoring','2013-07-02 03:48:41','2013-07-02 03:48:41');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pathways`
--

DROP TABLE IF EXISTS `pathways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pathways` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pathways`
--

LOCK TABLES `pathways` WRITE;
/*!40000 ALTER TABLE `pathways` DISABLE KEYS */;
INSERT INTO `pathways` VALUES (1,'General Employment','2013-07-02 03:34:26','2013-07-02 03:34:26'),(2,'General Education','2013-07-02 03:37:21','2013-07-02 03:37:21'),(3,'College Education','2013-07-02 03:58:55','2013-07-02 03:58:55'),(4,'Job Focused Education','2013-07-02 03:59:27','2013-07-02 03:59:27');
/*!40000 ALTER TABLE `pathways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8_unicode_ci,
  `pathway_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'Are you currently employed?',1,1,'2013-07-02 03:35:17','2013-07-02 04:31:16'),(2,'What is your highest level of education?',2,1,'2013-07-02 03:37:21','2013-07-02 04:30:41'),(3,'Are you interested in college or job specific training?',2,2,'2013-07-02 03:57:42','2013-07-02 04:30:41'),(4,'Would you be interested in providing mentoring or being mentored?',2,3,'2013-07-02 04:01:40','2013-07-02 04:30:41'),(5,'Which of these is true?',1,2,'2013-07-02 04:18:43','2013-07-02 04:31:16'),(6,'Would you like recommendations on a school?',3,1,'2013-07-02 04:26:16','2013-07-02 04:30:58'),(7,'Would you like help finding a way to pay for school?',3,2,'2013-07-02 04:26:16','2013-07-02 04:30:58'),(8,'What type of work are you interested in?',4,NULL,'2013-07-02 04:28:41','2013-07-02 04:28:41');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `starting_weight` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (1,'GI Bill','http://www.gibill.va.gov/',3,1,'2013-07-02 03:39:00','2013-07-02 03:40:51'),(2,'Department of Education Information','http://www.ed.gov/veterans-and-military-families/information%23benefits',3,1,'2013-07-02 03:41:52','2013-07-02 03:41:52'),(3,'V-Wise','http://whitman.syr.edu/vwise/',2,1,'2013-07-02 03:42:28','2013-07-02 03:42:28'),(4,'Helmets to Hardhats','http://www.helmetstohardhats.org/',1,1,'2013-07-02 03:43:07','2013-07-02 03:43:07'),(5,'Transportation Careers','http://www.dot.gov/veteranstransportationcareers',2,1,'2013-07-02 03:43:54','2013-07-02 03:43:54'),(6,'Licensing and Credentials','http://www.onetonline.org/crosswalk/',3,NULL,'2013-07-02 03:44:58','2013-07-02 03:44:58'),(7,'US Vets Inc','http://www.usvetsinc.org/veteran-services/women-specific-programs/',2,2,'2013-07-02 03:45:52','2013-07-02 03:45:52'),(8,'Veterans Inc','http://www.veteransinc.org/services/supportive-services-for-veteran-families/',2,2,'2013-07-02 03:46:31','2013-07-02 03:46:31'),(9,'Homeless Veterans','http://www.va.gov/homeless/ssvf.asp',2,NULL,'2013-07-02 03:47:16','2013-07-02 03:47:16'),(10,'Academy Women','http://academywomen.org/index.php',2,6,'2013-07-02 03:48:29','2013-07-02 03:49:25');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20130601183621'),('20130601183805'),('20130601185332'),('20130601192316'),('20130602123928'),('20130605190356'),('20130608180924'),('20130624154806');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-07-08 16:39:03
