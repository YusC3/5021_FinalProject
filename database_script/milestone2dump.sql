CREATE DATABASE  IF NOT EXISTS `volunteerdb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `volunteerdb`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: volunteerdb
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `AreaID` int unsigned NOT NULL AUTO_INCREMENT,
  `Country` varchar(50) NOT NULL,
  `State` varchar(80) NOT NULL,
  `City` varchar(80) NOT NULL,
  `ZIP` varchar(10) NOT NULL,
  PRIMARY KEY (`AreaID`),
  UNIQUE KEY `AreaID_UNIQUE` (`AreaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (100,'USA','Texas','Houston','85161'),(101,'USA','Georgia','Detroit','66988'),(102,'USA','Michigan','Miami','54649'),(103,'USA','North Carolina','Detroit','53108'),(104,'USA','Georgia','Charlotte','22742'),(105,'USA','California','Detroit','36608'),(106,'USA','Texas','Chicago','19664'),(107,'USA','Ohio','Columbus','78682'),(108,'USA','Texas','Chicago','91180'),(109,'USA','New York','Chicago','50293'),(110,'USA','Illinois','Columbus','32590'),(111,'USA','New York','Chicago','70404'),(112,'USA','California','New York','79611'),(113,'USA','North Carolina','Houston','61324'),(114,'USA','New York','Detroit','84384'),(115,'USA','Florida','Houston','18660'),(116,'USA','Pennsylvania','Philadelphia','23975'),(117,'USA','Michigan','Detroit','57615'),(118,'USA','Florida','Detroit','99099'),(119,'USA','California','Houston','77033'),(120,'USA','Texas','Chicago','90045'),(121,'USA','North Carolina','Philadelphia','53681'),(122,'USA','Pennsylvania','Miami','54163'),(123,'USA','New York','Detroit','26311'),(124,'USA','Pennsylvania','Chicago','58172'),(125,'USA','Ohio','New York','57022'),(126,'USA','Illinois','Chicago','13196'),(127,'USA','Texas','Charlotte','56294'),(128,'USA','Georgia','Columbus','18427'),(129,'USA','Ohio','Atlanta','81071'),(130,'USA','New York','Houston','53625'),(131,'USA','Texas','Houston','65462'),(132,'USA','Florida','Chicago','10239'),(133,'USA','Ohio','Charlotte','57414'),(134,'USA','Georgia','Miami','58911'),(135,'USA','Pennsylvania','New York','82951'),(136,'USA','Pennsylvania','Chicago','16095'),(137,'USA','North Carolina','Charlotte','66492'),(138,'USA','New York','Charlotte','16851'),(139,'USA','Florida','Detroit','64951'),(140,'USA','Illinois','Detroit','89002'),(141,'USA','Texas','Columbus','82965'),(142,'USA','Illinois','Charlotte','33462'),(143,'USA','Ohio','Atlanta','70200'),(144,'USA','Georgia','Columbus','97920'),(145,'USA','Florida','Columbus','67628'),(146,'USA','Ohio','Miami','44165'),(147,'USA','Florida','Detroit','99518'),(148,'USA','North Carolina','Atlanta','99741'),(149,'USA','Texas','Detroit','26297'),(150,'USA','New York','Columbus','39314'),(151,'USA','Texas','Los Angeles','24005'),(152,'USA','North Carolina','Los Angeles','27953'),(153,'USA','Pennsylvania','Atlanta','26288'),(154,'USA','North Carolina','Detroit','81121'),(155,'USA','Pennsylvania','Chicago','72755'),(156,'USA','Georgia','New York','37571'),(157,'USA','Michigan','Atlanta','12224'),(158,'USA','Georgia','Chicago','83599'),(159,'USA','North Carolina','Columbus','63252'),(160,'USA','Texas','New York','65993'),(161,'USA','Ohio','Charlotte','10464'),(162,'USA','Ohio','New York','74191'),(163,'USA','Pennsylvania','Atlanta','66793'),(164,'USA','Ohio','Atlanta','27038'),(165,'USA','Texas','Philadelphia','60399'),(166,'USA','Illinois','Los Angeles','18040'),(167,'USA','California','Atlanta','77880'),(168,'USA','California','Charlotte','50017'),(169,'USA','Florida','Columbus','70683'),(170,'USA','Georgia','Los Angeles','12279'),(171,'USA','Texas','Atlanta','81290'),(172,'USA','Florida','Houston','88407'),(173,'USA','Florida','Philadelphia','28116'),(174,'USA','Florida','Miami','78573'),(175,'USA','Texas','Columbus','93929'),(176,'USA','Pennsylvania','Chicago','73700'),(177,'USA','Texas','Miami','48439'),(178,'USA','North Carolina','Atlanta','80146'),(179,'USA','Ohio','Los Angeles','27616'),(180,'USA','Pennsylvania','Philadelphia','27741'),(181,'USA','New York','Chicago','68068'),(182,'USA','California','Atlanta','98007'),(183,'USA','Illinois','Atlanta','91791'),(184,'USA','Michigan','Charlotte','78348'),(185,'USA','Ohio','Philadelphia','11026'),(186,'USA','Texas','Detroit','45910'),(187,'USA','Georgia','New York','60582'),(188,'USA','Illinois','Atlanta','25706'),(189,'USA','Texas','Philadelphia','89834'),(190,'USA','Georgia','Chicago','32040'),(191,'USA','Illinois','Columbus','87901'),(192,'USA','California','Los Angeles','92000'),(193,'USA','Ohio','Chicago','86044'),(194,'USA','Georgia','Houston','44349'),(195,'USA','Pennsylvania','Houston','96868'),(196,'USA','Pennsylvania','Chicago','67262'),(197,'USA','California','Detroit','53647'),(198,'USA','Pennsylvania','Miami','11921'),(199,'USA','North Carolina','Columbus','67396'),(400,'USA','Texas','Houston','85161'),(401,'USA','Georgia','Detroit','66988'),(402,'USA','Michigan','Miami','54649'),(403,'USA','North Carolina','Detroit','53108'),(404,'USA','Georgia','Charlotte','22742'),(405,'USA','California','Detroit','36608'),(406,'USA','Texas','Chicago','19664'),(407,'USA','Ohio','Columbus','78682'),(408,'USA','Texas','Chicago','91180'),(409,'USA','New York','Chicago','50293'),(410,'USA','Illinois','Columbus','32590'),(411,'USA','New York','Chicago','70404'),(412,'USA','California','New York','79611'),(413,'USA','North Carolina','Houston','61324'),(414,'USA','New York','Detroit','84384'),(415,'USA','Florida','Houston','18660'),(416,'USA','Pennsylvania','Philadelphia','23975'),(417,'USA','Michigan','Detroit','57615'),(418,'USA','Florida','Detroit','99099'),(419,'USA','California','Houston','77033'),(420,'USA','Texas','Chicago','90045'),(421,'USA','North Carolina','Philadelphia','53681'),(422,'USA','Pennsylvania','Miami','54163'),(423,'USA','New York','Detroit','26311'),(424,'USA','Pennsylvania','Chicago','58172'),(425,'USA','Ohio','New York','57022'),(426,'USA','Illinois','Chicago','13196'),(427,'USA','Texas','Charlotte','56294'),(428,'USA','Georgia','Columbus','18427'),(429,'USA','Ohio','Atlanta','81071'),(430,'USA','New York','Houston','53625'),(431,'USA','Texas','Houston','65462'),(432,'USA','Florida','Chicago','10239'),(433,'USA','Ohio','Charlotte','57414'),(434,'USA','Georgia','Miami','58911'),(435,'USA','Pennsylvania','New York','82951'),(436,'USA','Pennsylvania','Chicago','16095'),(437,'USA','North Carolina','Charlotte','66492'),(438,'USA','New York','Charlotte','16851'),(439,'USA','Florida','Detroit','64951'),(440,'USA','Illinois','Detroit','89002'),(441,'USA','Texas','Columbus','82965'),(442,'USA','Illinois','Charlotte','33462'),(443,'USA','Ohio','Atlanta','70200'),(444,'USA','Georgia','Columbus','97920'),(445,'USA','Florida','Columbus','67628'),(446,'USA','Ohio','Miami','44165'),(447,'USA','Florida','Detroit','99518'),(448,'USA','North Carolina','Atlanta','99741'),(449,'USA','Texas','Detroit','26297'),(450,'USA','New York','Columbus','39314'),(451,'USA','Texas','Los Angeles','24005'),(452,'USA','North Carolina','Los Angeles','27953'),(453,'USA','Pennsylvania','Atlanta','26288'),(454,'USA','North Carolina','Detroit','81121'),(455,'USA','Pennsylvania','Chicago','72755'),(456,'USA','Georgia','New York','37571'),(457,'USA','Michigan','Atlanta','12224'),(458,'USA','Georgia','Chicago','83599'),(459,'USA','North Carolina','Columbus','63252'),(460,'USA','Texas','New York','65993'),(461,'USA','Ohio','Charlotte','10464'),(462,'USA','Ohio','New York','74191'),(463,'USA','Pennsylvania','Atlanta','66793'),(464,'USA','Ohio','Atlanta','27038'),(465,'USA','Texas','Philadelphia','60399'),(466,'USA','Illinois','Los Angeles','18040'),(467,'USA','California','Atlanta','77880'),(468,'USA','California','Charlotte','50017'),(469,'USA','Florida','Columbus','70683'),(470,'USA','Georgia','Los Angeles','12279'),(471,'USA','Texas','Atlanta','81290'),(472,'USA','Florida','Houston','88407'),(473,'USA','Florida','Philadelphia','28116'),(474,'USA','Florida','Miami','78573'),(475,'USA','Texas','Columbus','93929'),(476,'USA','Pennsylvania','Chicago','73700'),(477,'USA','Texas','Miami','48439'),(478,'USA','North Carolina','Atlanta','80146'),(479,'USA','Ohio','Los Angeles','27616'),(480,'USA','Pennsylvania','Philadelphia','27741'),(481,'USA','New York','Chicago','68068'),(482,'USA','California','Atlanta','98007'),(483,'USA','Illinois','Atlanta','91791'),(484,'USA','Michigan','Charlotte','78348'),(485,'USA','Ohio','Philadelphia','11026'),(486,'USA','Texas','Detroit','45910'),(487,'USA','Georgia','New York','60582'),(488,'USA','Illinois','Atlanta','25706'),(489,'USA','Texas','Philadelphia','89834'),(490,'USA','Georgia','Chicago','32040'),(491,'USA','Illinois','Columbus','87901'),(492,'USA','California','Los Angeles','92000'),(493,'USA','Ohio','Chicago','86044'),(494,'USA','Georgia','Houston','44349'),(495,'USA','Pennsylvania','Houston','96868'),(496,'USA','Pennsylvania','Chicago','67262'),(497,'USA','California','Detroit','53647'),(498,'USA','Pennsylvania','Miami','11921'),(499,'USA','North Carolina','Columbus','67396');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `EventID` int unsigned NOT NULL AUTO_INCREMENT,
  `EventType` varchar(45) NOT NULL,
  `EventTime` datetime NOT NULL,
  `OrgID` int unsigned NOT NULL,
  `AreaID` int unsigned NOT NULL,
  `Street` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`EventID`),
  UNIQUE KEY `EventID_UNIQUE` (`EventID`),
  KEY `fk_Event_Organization1_idx` (`OrgID`),
  KEY `fk_Event_Address1_idx` (`AreaID`),
  CONSTRAINT `fk_Event_Address1` FOREIGN KEY (`AreaID`) REFERENCES `area` (`AreaID`),
  CONSTRAINT `fk_Event_Organization1` FOREIGN KEY (`OrgID`) REFERENCES `organization` (`OrgID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Food Distribution','2021-05-24 11:47:00',1,100,'Cherry St'),(2,'Tutoring','2022-06-19 11:01:00',2,101,'Pine St'),(3,'Food Distribution','2020-04-22 19:50:00',3,102,'Main St'),(4,'Environmental Cleanup','2022-03-19 12:21:00',4,103,'Birch St'),(5,'Food Distribution','2023-04-09 07:06:00',5,104,'Oak St'),(6,'Environmental Cleanup','2021-07-31 03:08:00',6,105,'Walnut St'),(7,'Environmental Cleanup','2021-11-12 02:39:00',7,106,'Pine St'),(8,'Food Distribution','2021-11-28 16:30:00',8,107,'Cedar St'),(9,'Food Distribution','2023-12-25 04:11:00',9,108,'Main St'),(10,'Tutoring','2020-04-29 19:42:00',10,109,'Main St'),(11,'Tutoring','2022-06-25 04:25:00',11,110,'Cherry St'),(12,'Tutoring','2022-02-04 14:06:00',12,111,'Oak St'),(13,'Tutoring','2021-07-10 11:50:00',13,112,'Walnut St'),(14,'Tutoring','2020-12-15 14:47:00',14,113,'Main St'),(15,'Environmental Cleanup','2021-07-15 09:35:00',15,114,'Elm St'),(16,'Food Distribution','2022-01-06 00:46:00',16,115,'Pine St'),(17,'Environmental Cleanup','2023-05-28 02:04:00',17,116,'Maple St'),(18,'Community Outreach','2022-07-18 23:05:00',18,117,'Birch St'),(19,'Food Distribution','2020-08-03 16:50:00',19,118,'Birch St'),(20,'Environmental Cleanup','2020-04-08 02:12:00',20,119,'Walnut St'),(21,'Community Outreach','2023-04-18 19:25:00',21,120,'Pine St'),(22,'Food Distribution','2022-08-01 12:46:00',22,121,'Peach St'),(23,'Community Outreach','2021-02-13 07:35:00',23,122,'Elm St'),(24,'Environmental Cleanup','2022-05-16 03:09:00',24,123,'Birch St'),(25,'Environmental Cleanup','2021-09-02 17:48:00',25,124,'Cedar St'),(26,'Environmental Cleanup','2022-04-04 11:00:00',26,125,'Peach St'),(27,'Environmental Cleanup','2022-11-08 16:55:00',27,126,'Main St'),(28,'Environmental Cleanup','2023-08-28 21:02:00',28,127,'Main St'),(29,'Community Outreach','2021-12-22 20:03:00',29,128,'Oak St'),(30,'Community Outreach','2022-11-03 13:51:00',30,129,'Pine St'),(31,'Tutoring','2020-06-05 10:34:00',31,130,'Maple St'),(32,'Community Outreach','2023-05-12 14:52:00',32,131,'Birch St'),(33,'Fundraising','2022-02-25 18:41:00',33,132,'Peach St'),(34,'Food Distribution','2022-01-16 17:36:00',34,133,'Pine St'),(35,'Environmental Cleanup','2021-09-27 16:49:00',35,134,'Cedar St'),(36,'Fundraising','2022-06-27 16:18:00',36,135,'Walnut St'),(37,'Tutoring','2022-09-21 10:46:00',37,136,'Main St'),(38,'Tutoring','2020-11-06 08:24:00',38,137,'Maple St'),(39,'Fundraising','2022-07-30 20:14:00',39,138,'Main St'),(40,'Environmental Cleanup','2020-09-17 19:39:00',40,139,'Oak St'),(41,'Environmental Cleanup','2022-04-22 04:36:00',41,140,'Oak St'),(42,'Community Outreach','2021-05-28 04:01:00',42,141,'Main St'),(43,'Tutoring','2020-09-13 13:45:00',43,142,'Main St'),(44,'Tutoring','2020-03-03 20:39:00',44,143,'Oak St'),(45,'Tutoring','2021-07-04 05:06:00',45,144,'Pine St'),(46,'Fundraising','2020-09-01 16:10:00',46,145,'Cedar St'),(47,'Food Distribution','2023-06-23 01:40:00',47,146,'Walnut St'),(48,'Food Distribution','2020-05-04 14:08:00',48,147,'Main St'),(49,'Fundraising','2022-05-10 15:14:00',49,148,'Peach St'),(50,'Food Distribution','2020-08-29 22:59:00',50,149,'Walnut St'),(51,'Food Distribution','2021-09-11 15:16:00',51,150,'Maple St'),(52,'Community Outreach','2020-06-26 04:23:00',52,151,'Elm St'),(53,'Fundraising','2022-03-19 07:45:00',53,152,'Pine St'),(54,'Environmental Cleanup','2023-08-25 09:27:00',54,153,'Maple St'),(55,'Tutoring','2022-11-10 23:54:00',55,154,'Main St'),(56,'Community Outreach','2020-07-29 13:21:00',56,155,'Cedar St'),(57,'Environmental Cleanup','2023-01-22 13:57:00',57,156,'Peach St'),(58,'Environmental Cleanup','2020-01-04 11:27:00',58,157,'Pine St'),(59,'Food Distribution','2020-07-01 17:56:00',59,158,'Pine St'),(60,'Tutoring','2022-03-04 06:30:00',60,159,'Birch St'),(61,'Community Outreach','2022-08-05 08:47:00',61,160,'Birch St'),(62,'Environmental Cleanup','2022-11-28 23:33:00',62,161,'Walnut St'),(63,'Environmental Cleanup','2022-01-04 20:20:00',63,162,'Birch St'),(64,'Tutoring','2023-01-01 04:40:00',64,163,'Birch St'),(65,'Fundraising','2023-08-17 11:35:00',65,164,'Main St'),(66,'Community Outreach','2020-03-24 07:15:00',66,165,'Maple St'),(67,'Community Outreach','2020-05-18 11:34:00',67,166,'Walnut St'),(68,'Food Distribution','2022-05-22 14:54:00',68,167,'Walnut St'),(69,'Tutoring','2023-03-01 09:28:00',69,168,'Maple St'),(70,'Fundraising','2023-06-18 06:49:00',70,169,'Oak St'),(71,'Tutoring','2022-09-14 19:03:00',71,170,'Walnut St'),(72,'Food Distribution','2020-12-30 18:30:00',72,171,'Cherry St'),(73,'Environmental Cleanup','2023-10-27 17:10:00',73,172,'Pine St'),(74,'Environmental Cleanup','2020-04-18 11:22:00',74,173,'Walnut St'),(75,'Tutoring','2023-09-04 05:33:00',75,174,'Walnut St'),(76,'Tutoring','2020-06-24 13:06:00',76,175,'Oak St'),(77,'Fundraising','2023-06-14 17:20:00',77,176,'Main St'),(78,'Tutoring','2023-12-21 22:59:00',78,177,'Oak St'),(79,'Fundraising','2020-03-14 04:36:00',79,178,'Peach St'),(80,'Fundraising','2023-12-28 06:36:00',80,179,'Maple St'),(81,'Community Outreach','2020-07-29 14:37:00',81,180,'Elm St'),(82,'Fundraising','2020-12-01 22:17:00',82,181,'Pine St'),(83,'Community Outreach','2020-10-15 15:26:00',83,182,'Maple St'),(84,'Fundraising','2022-03-16 00:24:00',84,183,'Maple St'),(85,'Environmental Cleanup','2022-02-17 06:14:00',85,184,'Birch St'),(86,'Fundraising','2020-02-11 07:48:00',86,185,'Cedar St'),(87,'Food Distribution','2022-01-28 04:09:00',87,186,'Walnut St'),(88,'Community Outreach','2022-07-22 04:31:00',88,187,'Pine St'),(89,'Environmental Cleanup','2022-03-23 23:14:00',89,188,'Maple St'),(90,'Environmental Cleanup','2022-06-18 05:21:00',90,189,'Walnut St'),(91,'Community Outreach','2023-12-16 20:09:00',91,190,'Maple St'),(92,'Environmental Cleanup','2022-10-07 03:37:00',92,191,'Cedar St'),(93,'Community Outreach','2020-04-04 21:22:00',93,192,'Peach St'),(94,'Environmental Cleanup','2021-05-18 17:48:00',94,193,'Elm St'),(95,'Food Distribution','2023-06-15 02:42:00',95,194,'Cherry St'),(96,'Community Outreach','2021-10-25 04:04:00',96,195,'Birch St'),(97,'Environmental Cleanup','2023-12-21 09:35:00',97,196,'Cherry St'),(98,'Fundraising','2020-10-10 03:37:00',98,197,'Cherry St'),(99,'Fundraising','2022-08-28 11:43:00',99,198,'Oak St'),(100,'Tutoring','2020-04-13 10:47:00',100,199,'Pine St');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventvolunteerrating`
--

DROP TABLE IF EXISTS `eventvolunteerrating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventvolunteerrating` (
  `RatingID` int unsigned NOT NULL AUTO_INCREMENT,
  `Rating` tinyint NOT NULL,
  `Comment` varchar(500) DEFAULT NULL,
  `VolunteerID` int unsigned NOT NULL,
  `EventID` int unsigned NOT NULL,
  PRIMARY KEY (`RatingID`),
  UNIQUE KEY `RatingID_UNIQUE` (`RatingID`),
  KEY `fk_Event Volunteer Rating_Volunteer_idx` (`VolunteerID`),
  KEY `fk_Event Volunteer Rating_Event1_idx` (`EventID`),
  CONSTRAINT `fk_Event Volunteer Rating_Event1` FOREIGN KEY (`EventID`) REFERENCES `events` (`EventID`),
  CONSTRAINT `fk_Event Volunteer Rating_Volunteer` FOREIGN KEY (`VolunteerID`) REFERENCES `volunteer` (`VolunteerID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventvolunteerrating`
--

LOCK TABLES `eventvolunteerrating` WRITE;
/*!40000 ALTER TABLE `eventvolunteerrating` DISABLE KEYS */;
INSERT INTO `eventvolunteerrating` VALUES (1,3,'This event focuses on distributing food to those in need.',54,1),(2,5,'This event provides tutoring services to students.',63,2),(3,2,'This event focuses on distributing food to those in need.',50,3),(4,4,'This event involves cleaning up the environment.',28,4),(5,1,'This event focuses on distributing food to those in need.',54,5),(6,3,'This event involves cleaning up the environment.',3,6),(7,4,'This event involves cleaning up the environment.',51,7),(8,3,'This event focuses on distributing food to those in need.',71,8),(9,3,'This event focuses on distributing food to those in need.',79,9),(10,1,'This event provides tutoring services to students.',9,10),(11,5,'This event provides tutoring services to students.',89,11),(12,1,'This event provides tutoring services to students.',24,12),(13,4,'This event provides tutoring services to students.',28,13),(14,4,'This event provides tutoring services to students.',10,14),(15,2,'This event involves cleaning up the environment.',21,15),(16,1,'This event focuses on distributing food to those in need.',34,16),(17,5,'This event involves cleaning up the environment.',52,17),(18,4,'This event aims to reach out to the community and provide support.',25,18),(19,2,'This event focuses on distributing food to those in need.',80,19),(20,4,'This event involves cleaning up the environment.',46,20),(21,3,'This event aims to reach out to the community and provide support.',80,21),(22,5,'This event focuses on distributing food to those in need.',7,22),(23,5,'This event aims to reach out to the community and provide support.',17,23),(24,1,'This event involves cleaning up the environment.',76,24),(25,2,'This event involves cleaning up the environment.',73,25),(26,2,'This event involves cleaning up the environment.',87,26),(27,4,'This event involves cleaning up the environment.',99,27),(28,1,'This event involves cleaning up the environment.',16,28),(29,4,'This event aims to reach out to the community and provide support.',28,29),(30,5,'This event aims to reach out to the community and provide support.',28,30),(31,4,'This event provides tutoring services to students.',88,31),(32,4,'This event aims to reach out to the community and provide support.',45,32),(33,4,'This event is organized to raise funds for various causes.',10,33),(34,3,'This event focuses on distributing food to those in need.',29,34),(35,4,'This event involves cleaning up the environment.',3,35),(36,3,'This event is organized to raise funds for various causes.',86,36),(37,5,'This event provides tutoring services to students.',43,37),(38,4,'This event provides tutoring services to students.',58,38),(39,1,'This event is organized to raise funds for various causes.',29,39),(40,5,'This event involves cleaning up the environment.',22,40),(41,3,'This event involves cleaning up the environment.',51,41),(42,1,'This event aims to reach out to the community and provide support.',70,42),(43,5,'This event provides tutoring services to students.',38,43),(44,1,'This event provides tutoring services to students.',15,44),(45,5,'This event provides tutoring services to students.',51,45),(46,3,'This event is organized to raise funds for various causes.',68,46),(47,2,'This event focuses on distributing food to those in need.',70,47),(48,1,'This event focuses on distributing food to those in need.',64,48),(49,3,'This event is organized to raise funds for various causes.',10,49),(50,1,'This event focuses on distributing food to those in need.',21,50),(51,2,'This event focuses on distributing food to those in need.',56,51),(52,3,'This event aims to reach out to the community and provide support.',13,52),(53,1,'This event is organized to raise funds for various causes.',46,53),(54,5,'This event involves cleaning up the environment.',86,54),(55,4,'This event provides tutoring services to students.',99,55),(56,1,'This event aims to reach out to the community and provide support.',63,56),(57,5,'This event involves cleaning up the environment.',49,57),(58,4,'This event involves cleaning up the environment.',2,58),(59,2,'This event focuses on distributing food to those in need.',93,59),(60,2,'This event provides tutoring services to students.',12,60),(61,2,'This event aims to reach out to the community and provide support.',35,61),(62,4,'This event involves cleaning up the environment.',90,62),(63,2,'This event involves cleaning up the environment.',57,63),(64,1,'This event provides tutoring services to students.',3,64),(65,5,'This event is organized to raise funds for various causes.',15,65),(66,2,'This event aims to reach out to the community and provide support.',49,66),(67,4,'This event aims to reach out to the community and provide support.',24,67),(68,5,'This event focuses on distributing food to those in need.',75,68),(69,1,'This event provides tutoring services to students.',32,69),(70,5,'This event is organized to raise funds for various causes.',3,70),(71,4,'This event provides tutoring services to students.',75,71),(72,5,'This event focuses on distributing food to those in need.',22,72),(73,2,'This event involves cleaning up the environment.',43,73),(74,4,'This event involves cleaning up the environment.',42,74),(75,1,'This event provides tutoring services to students.',72,75),(76,2,'This event provides tutoring services to students.',17,76),(77,5,'This event is organized to raise funds for various causes.',12,77),(78,5,'This event provides tutoring services to students.',63,78),(79,3,'This event is organized to raise funds for various causes.',81,79),(80,1,'This event is organized to raise funds for various causes.',65,80),(81,1,'This event aims to reach out to the community and provide support.',51,81),(82,2,'This event is organized to raise funds for various causes.',22,82),(83,4,'This event aims to reach out to the community and provide support.',70,83),(84,4,'This event is organized to raise funds for various causes.',48,84),(85,4,'This event involves cleaning up the environment.',94,85),(86,5,'This event is organized to raise funds for various causes.',55,86),(87,1,'This event focuses on distributing food to those in need.',93,87),(88,3,'This event aims to reach out to the community and provide support.',73,88),(89,3,'This event involves cleaning up the environment.',64,89),(90,5,'This event involves cleaning up the environment.',93,90),(91,1,'This event aims to reach out to the community and provide support.',27,91),(92,5,'This event involves cleaning up the environment.',21,92),(93,3,'This event aims to reach out to the community and provide support.',58,93),(94,3,'This event involves cleaning up the environment.',30,94),(95,5,'This event focuses on distributing food to those in need.',75,95),(96,4,'This event aims to reach out to the community and provide support.',86,96),(97,2,'This event involves cleaning up the environment.',85,97),(98,2,'This event is organized to raise funds for various causes.',70,98),(99,1,'This event is organized to raise funds for various causes.',58,99),(100,4,'This event provides tutoring services to students.',54,100);
/*!40000 ALTER TABLE `eventvolunteerrating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `npotype`
--

DROP TABLE IF EXISTS `npotype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `npotype` (
  `NPOTypeID` int unsigned NOT NULL AUTO_INCREMENT,
  `Section` varchar(45) NOT NULL,
  `Profit` tinyint(1) NOT NULL,
  `Description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`NPOTypeID`),
  UNIQUE KEY `NPOTypeID_UNIQUE` (`NPOTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npotype`
--

LOCK TABLES `npotype` WRITE;
/*!40000 ALTER TABLE `npotype` DISABLE KEYS */;
INSERT INTO `npotype` VALUES (1,'Education',1,'Non-profit organization focused on education'),(2,'Healthcare',0,'Non-profit organization focused on healthcare'),(3,'Environment',1,'Non-profit organization focused on environmental conservation'),(4,'Poverty Alleviation',0,'Non-profit organization focused on poverty alleviation'),(5,'Animal Welfare',1,'Non-profit organization focused on animal welfare'),(6,'Arts & Culture',1,'Non-profit organization focused on promoting arts and culture'),(7,'Human Rights',0,'Non-profit organization focused on advocating for human rights'),(8,'Disaster Relief',1,'Non-profit organization focused on providing disaster relief'),(9,'Youth Development',0,'Non-profit organization focused on youth development programs'),(10,'Community Service',1,'Non-profit organization focused on community service and engagement'),(11,'Health Promotion',1,'Non-profit organization focused on health promotion'),(12,'Education Advancement',1,'Non-profit organization focused on advancing education'),(13,'Environmental Protection',0,'Non-profit organization focused on protecting the environment'),(14,'Poverty Reduction',0,'Non-profit organization focused on reducing poverty'),(15,'Animal Rescue',1,'Non-profit organization focused on rescuing animals'),(16,'Cultural Preservation',1,'Non-profit organization focused on preserving culture'),(17,'Arts Education',1,'Non-profit organization focused on arts education'),(18,'Humanitarian Aid',0,'Non-profit organization focused on providing humanitarian aid'),(19,'Disaster Management',1,'Non-profit organization focused on disaster management'),(20,'Youth Empowerment',0,'Non-profit organization focused on youth empowerment'),(21,'Community Development',1,'Non-profit organization focused on community development'),(22,'Health Education',1,'Non-profit organization focused on health education'),(23,'Educational Outreach',1,'Non-profit organization focused on educational outreach'),(24,'Environmental Conservation',0,'Non-profit organization focused on environmental conservation'),(25,'Poverty Alleviation',0,'Non-profit organization focused on alleviating poverty'),(26,'Animal Welfare',1,'Non-profit organization focused on animal welfare'),(27,'Cultural Awareness',1,'Non-profit organization focused on cultural awareness'),(28,'Arts & Culture',1,'Non-profit organization focused on arts and culture'),(29,'Human Rights Advocacy',0,'Non-profit organization focused on human rights advocacy'),(30,'Disaster Relief',1,'Non-profit organization focused on disaster relief'),(31,'Youth Development',0,'Non-profit organization focused on youth development'),(32,'Community Service',1,'Non-profit organization focused on community service'),(33,'Health Promotion',1,'Non-profit organization focused on health promotion'),(34,'Education Advancement',1,'Non-profit organization focused on education advancement'),(35,'Environmental Protection',0,'Non-profit organization focused on environmental protection'),(36,'Poverty Reduction',0,'Non-profit organization focused on poverty reduction'),(37,'Animal Rescue',1,'Non-profit organization focused on animal rescue'),(38,'Cultural Preservation',1,'Non-profit organization focused on cultural preservation'),(39,'Arts Education',1,'Non-profit organization focused on arts education'),(40,'Humanitarian Aid',0,'Non-profit organization focused on humanitarian aid'),(41,'Disaster Management',1,'Non-profit organization focused on disaster management'),(42,'Youth Empowerment',0,'Non-profit organization focused on youth empowerment'),(43,'Community Development',1,'Non-profit organization focused on community development'),(44,'Health Education',1,'Non-profit organization focused on health education'),(45,'Educational Outreach',1,'Non-profit organization focused on educational outreach'),(46,'Environmental Conservation',0,'Non-profit organization focused on environmental conservation'),(47,'Poverty Alleviation',0,'Non-profit organization focused on poverty alleviation'),(48,'Animal Welfare',1,'Non-profit organization focused on animal welfare'),(49,'Cultural Awareness',1,'Non-profit organization focused on cultural awareness'),(50,'Arts & Culture',1,'Non-profit organization focused on arts and culture'),(51,'Human Rights Advocacy',0,'Non-profit organization focused on human rights advocacy'),(52,'Disaster Relief',1,'Non-profit organization focused on disaster relief'),(53,'Youth Development',0,'Non-profit organization focused on youth development'),(54,'Community Service',1,'Non-profit organization focused on community service'),(55,'Health Promotion',1,'Non-profit organization focused on health promotion'),(56,'Education Advancement',1,'Non-profit organization focused on education advancement'),(57,'Environmental Protection',0,'Non-profit organization focused on environmental protection'),(58,'Poverty Reduction',0,'Non-profit organization focused on poverty reduction'),(59,'Animal Rescue',1,'Non-profit organization focused on animal rescue'),(60,'Cultural Preservation',1,'Non-profit organization focused on cultural preservation'),(61,'Arts Education',1,'Non-profit organization focused on arts education'),(62,'Humanitarian Aid',0,'Non-profit organization focused on humanitarian aid'),(63,'Disaster Management',1,'Non-profit organization focused on disaster management'),(64,'Youth Empowerment',0,'Non-profit organization focused on youth empowerment'),(65,'Community Development',1,'Non-profit organization focused on community development'),(66,'Health Education',1,'Non-profit organization focused on health education'),(67,'Educational Outreach',1,'Non-profit organization focused on educational outreach'),(68,'Environmental Conservation',0,'Non-profit organization focused on environmental conservation'),(69,'Poverty Alleviation',0,'Non-profit organization focused on poverty alleviation'),(70,'Animal Welfare',1,'Non-profit organization focused on animal welfare'),(71,'Cultural Awareness',1,'Non-profit organization focused on cultural awareness'),(72,'Arts & Culture',1,'Non-profit organization focused on arts and culture'),(73,'Human Rights Advocacy',0,'Non-profit organization focused on human rights advocacy'),(74,'Disaster Relief',1,'Non-profit organization focused on disaster relief'),(75,'Youth Development',0,'Non-profit organization focused on youth development'),(76,'Community Service',1,'Non-profit organization focused on community service'),(77,'Health Promotion',1,'Non-profit organization focused on health promotion'),(78,'Education Advancement',1,'Non-profit organization focused on education advancement'),(79,'Environmental Protection',0,'Non-profit organization focused on environmental protection'),(80,'Poverty Reduction',0,'Non-profit organization focused on poverty reduction'),(81,'Animal Rescue',1,'Non-profit organization focused on animal rescue'),(82,'Cultural Preservation',1,'Non-profit organization focused on cultural preservation'),(83,'Arts Education',1,'Non-profit organization focused on arts education'),(84,'Humanitarian Aid',0,'Non-profit organization focused on humanitarian aid'),(85,'Disaster Management',1,'Non-profit organization focused on disaster management'),(86,'Youth Empowerment',0,'Non-profit organization focused on youth empowerment'),(87,'Community Development',1,'Non-profit organization focused on community development'),(88,'Health Education',1,'Non-profit organization focused on health education'),(89,'Educational Outreach',1,'Non-profit organization focused on educational outreach'),(90,'Environmental Conservation',0,'Non-profit organization focused on environmental conservation'),(91,'Poverty Alleviation',0,'Non-profit organization focused on poverty alleviation'),(92,'Animal Welfare',1,'Non-profit organization focused on animal welfare'),(93,'Cultural Awareness',1,'Non-profit organization focused on cultural awareness'),(94,'Arts & Culture',1,'Non-profit organization focused on arts and culture'),(95,'Human Rights Advocacy',0,'Non-profit organization focused on human rights advocacy'),(96,'Disaster Relief',1,'Non-profit organization focused on disaster relief'),(97,'Youth Development',0,'Non-profit organization focused on youth development'),(98,'Community Service',1,'Non-profit organization focused on community service'),(99,'Health Promotion',1,'Non-profit organization focused on health promotion'),(100,'Education Advancement',1,'Non-profit organization focused on education advancement');
/*!40000 ALTER TABLE `npotype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization` (
  `OrgID` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(80) NOT NULL,
  `NPOTypeID` int unsigned NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(30) NOT NULL,
  `AreaID` int unsigned NOT NULL,
  `Street` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`OrgID`),
  UNIQUE KEY `OrgID_UNIQUE` (`OrgID`),
  KEY `fk_Organization_NPOType1_idx` (`NPOTypeID`),
  KEY `fk_Organization_Address1_idx` (`AreaID`),
  CONSTRAINT `fk_Organization_Address1` FOREIGN KEY (`AreaID`) REFERENCES `area` (`AreaID`),
  CONSTRAINT `fk_Organization_NPOType1` FOREIGN KEY (`NPOTypeID`) REFERENCES `npotype` (`NPOTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,'Human Rights Watch',1,'info@humanrightswatch.org','(166) 822-6378',100,'Cherry St'),(2,'Youth Leadership Network',1,'info@youthleadershipnetwork.org','(628) 335-9483',101,'Pine St'),(3,'Youth Leadership Academy',2,'info@youthleadershipacademy.org','(325) 889-8807',102,'Main St'),(4,'Rights Advocacy Group',1,'info@rightsadvocacygroup.org','(562) 651-4979',103,'Birch St'),(5,'Community Support Network',4,'info@communitysupportnetwork.org','(964) 374-6827',104,'Oak St'),(6,'Global Literacy Project',4,'info@globalliteracyproject.org','(314) 489-9591',105,'Walnut St'),(7,'Health Promotion Society',3,'info@healthpromotionsociety.org','(365) 608-3474',106,'Pine St'),(8,'Rights Advocacy Group',2,'info@rightsadvocacygroup.org','(873) 441-1671',107,'Cedar St'),(9,'Emergency Aid Network',4,'info@emergencyaidnetwork.org','(729) 719-1035',108,'Main St'),(10,'Medical Relief Fund',3,'info@medicalrelieffund.org','(558) 624-4899',109,'Main St'),(11,'Health Promotion Society',4,'info@healthpromotionsociety.org','(525) 807-6621',110,'Cherry St'),(12,'Green Planet Society',1,'info@greenplanetsociety.org','(596) 272-3643',111,'Oak St'),(13,'Environmental Protection Agency',2,'info@environmentalprotectionagency.org','(496) 231-4471',112,'Walnut St'),(14,'Education Advancement',5,'info@educationadvancement.org','(578) 690-9508',113,'Main St'),(15,'Poverty Fighters',1,'info@povertyfighters.org','(837) 811-7306',114,'Elm St'),(16,'Justice for All',1,'info@justiceforall.org','(797) 536-5567',115,'Pine St'),(17,'Health & Wellness Foundation',3,'info@health&wellnessfoundation.org','(154) 843-1341',116,'Maple St'),(18,'Animal Rescue League',2,'info@animalrescueleague.org','(396) 298-7523',117,'Birch St'),(19,'Human Rights Watch',3,'info@humanrightswatch.org','(343) 742-4610',118,'Birch St'),(20,'Cultural Preservation Society',3,'info@culturalpreservationsociety.org','(239) 585-6138',119,'Walnut St'),(21,'Arts & Culture Foundation',2,'info@arts&culturefoundation.org','(117) 927-2576',120,'Pine St'),(22,'Animal Rescue Society',3,'info@animalrescuesociety.org','(777) 528-4600',121,'Peach St'),(23,'Education Opportunity',5,'info@educationopportunity.org','(629) 595-8000',122,'Elm St'),(24,'Animal Rescue League',5,'info@animalrescueleague.org','(217) 255-6664',123,'Birch St'),(25,'Youth Mentorship Program',1,'info@youthmentorshipprogram.org','(943) 927-7680',124,'Cedar St'),(26,'Wildlife Protection Fund',4,'info@wildlifeprotectionfund.org','(274) 755-5209',125,'Peach St'),(27,'Green Planet Society',3,'info@greenplanetsociety.org','(397) 905-1085',126,'Main St'),(28,'Healthcare Access Project',2,'info@healthcareaccessproject.org','(151) 735-1558',127,'Main St'),(29,'Rights Advocacy Group',3,'info@rightsadvocacygroup.org','(287) 822-6266',128,'Oak St'),(30,'Cultural Heritage Fund',3,'info@culturalheritagefund.org','(610) 286-1601',129,'Pine St'),(31,'Environmental Action Group',2,'info@environmentalactiongroup.org','(464) 899-5064',130,'Maple St'),(32,'Poverty Reduction Program',4,'info@povertyreductionprogram.org','(142) 235-6928',131,'Birch St'),(33,'Healthcare Access Project',4,'info@healthcareaccessproject.org','(993) 714-6816',132,'Peach St'),(34,'Healthcare Access Project',2,'info@healthcareaccessproject.org','(502) 880-4751',133,'Pine St'),(35,'Wildlife Conservation Society',5,'info@wildlifeconservationsociety.org','(159) 831-4411',134,'Cedar St'),(36,'Education for All',3,'info@educationforall.org','(881) 637-8925',135,'Walnut St'),(37,'Environmental Protection Agency',4,'info@environmentalprotectionagency.org','(475) 785-9169',136,'Main St'),(38,'Animal Welfare Fund',3,'info@animalwelfarefund.org','(859) 610-9563',137,'Maple St'),(39,'Justice Reform Coalition',5,'info@justicereformcoalition.org','(838) 796-3119',138,'Main St'),(40,'Neighborhood Support Group',2,'info@neighborhoodsupportgroup.org','(804) 707-8386',139,'Oak St'),(41,'Youth Development Center',4,'info@youthdevelopmentcenter.org','(566) 830-6407',140,'Oak St'),(42,'Art & Culture Society',1,'info@art&culturesociety.org','(428) 391-5192',141,'Main St'),(43,'Poverty Eradication Initiative',2,'info@povertyeradicationinitiative.org','(654) 517-8391',142,'Main St'),(44,'Global Education Initiative',1,'info@globaleducationinitiative.org','(785) 200-5649',143,'Oak St'),(45,'Neighborhood Assistance Program',4,'info@neighborhoodassistanceprogram.org','(908) 619-4143',144,'Pine St'),(46,'Health Equity Alliance',3,'info@healthequityalliance.org','(712) 830-8734',145,'Cedar St'),(47,'Social Justice League',4,'info@socialjusticeleague.org','(350) 240-4731',146,'Walnut St'),(48,'Arts & Culture Foundation',5,'info@arts&culturefoundation.org','(776) 937-2484',147,'Main St'),(49,'Wildlife Protection Fund',5,'info@wildlifeprotectionfund.org','(614) 978-8472',148,'Peach St'),(50,'Animal Sanctuary',5,'info@animalsanctuary.org','(221) 458-6846',149,'Walnut St'),(51,'Justice for All',1,'info@justiceforall.org','(659) 223-8085',150,'Maple St'),(52,'Emergency Response Team',2,'info@emergencyresponseteam.org','(722) 853-7764',151,'Elm St'),(53,'Hunger Action Network',1,'info@hungeractionnetwork.org','(132) 903-3121',152,'Pine St'),(54,'Hunger Relief Organization',5,'info@hungerrelieforganization.org','(959) 435-6246',153,'Maple St'),(55,'Cultural Diversity Initiative',3,'info@culturaldiversityinitiative.org','(973) 742-1452',154,'Main St'),(56,'Humanitarian Aid Network',4,'info@humanitarianaidnetwork.org','(414) 609-3838',155,'Cedar St'),(57,'Hunger Relief Organization',4,'info@hungerrelieforganization.org','(912) 623-9029',156,'Peach St'),(58,'Hunger Action Network',1,'info@hungeractionnetwork.org','(222) 644-9429',157,'Pine St'),(59,'Global Education Fund',5,'info@globaleducationfund.org','(519) 153-8871',158,'Pine St'),(60,'Humanitarian Aid Network',5,'info@humanitarianaidnetwork.org','(908) 766-3553',159,'Birch St'),(61,'Healthcare Heroes',5,'info@healthcareheroes.org','(281) 900-4716',160,'Birch St'),(62,'Wildlife Rescue Organization',1,'info@wildliferescueorganization.org','(943) 735-2706',161,'Walnut St'),(63,'Disaster Relief Fund',3,'info@disasterrelieffund.org','(766) 343-1093',162,'Birch St'),(64,'Community Engagement Program',3,'info@communityengagementprogram.org','(837) 834-5486',163,'Birch St'),(65,'Cultural Heritage Preservation',5,'info@culturalheritagepreservation.org','(528) 416-5974',164,'Main St'),(66,'Community Service Corps',3,'info@communityservicecorps.org','(614) 380-3239',165,'Maple St'),(67,'Rights Advocacy Group',4,'info@rightsadvocacygroup.org','(874) 662-5374',166,'Walnut St'),(68,'Literacy Outreach',2,'info@literacyoutreach.org','(858) 672-1738',167,'Walnut St'),(69,'Poverty Reduction Program',3,'info@povertyreductionprogram.org','(345) 948-9402',168,'Maple St'),(70,'Cultural Preservation Society',1,'info@culturalpreservationsociety.org','(457) 987-1911',169,'Oak St'),(71,'Environmental Protection Agency',2,'info@environmentalprotectionagency.org','(809) 653-6064',170,'Walnut St'),(72,'Education Opportunity',1,'info@educationopportunity.org','(597) 662-3582',171,'Cherry St'),(73,'Hunger Prevention Society',4,'info@hungerpreventionsociety.org','(161) 393-6635',172,'Pine St'),(74,'Literacy for Life',1,'info@literacyforlife.org','(419) 271-6275',173,'Walnut St'),(75,'Youth Leadership Academy',5,'info@youthleadershipacademy.org','(230) 704-6939',174,'Walnut St'),(76,'Literacy for Life',2,'info@literacyforlife.org','(190) 832-3806',175,'Oak St'),(77,'Emergency Aid Network',5,'info@emergencyaidnetwork.org','(954) 183-7392',176,'Main St'),(78,'Community Service Corps',2,'info@communityservicecorps.org','(538) 545-5196',177,'Oak St'),(79,'Cultural Heritage Fund',3,'info@culturalheritagefund.org','(201) 635-1394',178,'Peach St'),(80,'Community Support Network',1,'info@communitysupportnetwork.org','(393) 488-5578',179,'Maple St'),(81,'Animal Rescue Society',3,'info@animalrescuesociety.org','(891) 633-9475',180,'Elm St'),(82,'Disaster Relief Network',4,'info@disasterreliefnetwork.org','(299) 949-6674',181,'Pine St'),(83,'Animal Sanctuary',3,'info@animalsanctuary.org','(225) 844-7847',182,'Maple St'),(84,'Education Advancement',3,'info@educationadvancement.org','(861) 850-8112',183,'Maple St'),(85,'Rights Advocacy Group',5,'info@rightsadvocacygroup.org','(964) 102-3727',184,'Birch St'),(86,'Green Planet Society',2,'info@greenplanetsociety.org','(698) 548-9164',185,'Cedar St'),(87,'Global Education Fund',2,'info@globaleducationfund.org','(855) 583-9375',186,'Walnut St'),(88,'Art & Culture Society',5,'info@art&culturesociety.org','(479) 336-1001',187,'Pine St'),(89,'Disaster Management Fund',3,'info@disastermanagementfund.org','(578) 467-7055',188,'Maple St'),(90,'Green Future Alliance',2,'info@greenfuturealliance.org','(270) 573-4580',189,'Walnut St'),(91,'Art & Culture Society',1,'info@art&culturesociety.org','(379) 311-2066',190,'Maple St'),(92,'Health & Wellness Foundation',1,'info@health&wellnessfoundation.org','(818) 545-5371',191,'Cedar St'),(93,'Rights Advocacy Group',1,'info@rightsadvocacygroup.org','(716) 594-2287',192,'Peach St'),(94,'Hunger Relief Organization',3,'info@hungerrelieforganization.org','(107) 593-6322',193,'Elm St'),(95,'Hunger Prevention Society',1,'info@hungerpreventionsociety.org','(880) 103-2893',194,'Cherry St'),(96,'Education Opportunity',3,'info@educationopportunity.org','(999) 857-1842',195,'Birch St'),(97,'Education Advancement',1,'info@educationadvancement.org','(106) 143-6097',196,'Cherry St'),(98,'Human Rights Advocacy',4,'info@humanrightsadvocacy.org','(835) 694-6029',197,'Cherry St'),(99,'Global Education Initiative',1,'info@globaleducationinitiative.org','(579) 132-1612',198,'Oak St'),(100,'Animal Rescue Society',5,'info@animalrescuesociety.org','(699) 818-7549',199,'Pine St');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `TicketID` int unsigned NOT NULL AUTO_INCREMENT,
  `VolunteerID` int unsigned NOT NULL,
  `EventID` int unsigned NOT NULL,
  `Attendance` tinyint NOT NULL,
  PRIMARY KEY (`TicketID`,`EventID`),
  KEY `fk_Ticket_Volunteer1_idx` (`VolunteerID`),
  KEY `fk_Ticket_Event1_idx` (`EventID`),
  CONSTRAINT `fk_Ticket_Event1` FOREIGN KEY (`EventID`) REFERENCES `events` (`EventID`),
  CONSTRAINT `fk_Ticket_Volunteer1` FOREIGN KEY (`VolunteerID`) REFERENCES `volunteer` (`VolunteerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,54,1,0),(2,63,2,1),(3,50,3,1),(4,28,4,1),(5,54,5,1),(6,3,6,0),(7,51,7,0),(8,71,8,0),(9,79,9,1),(10,9,10,0),(11,89,11,0),(12,24,12,0),(13,28,13,0),(14,10,14,0),(15,21,15,0),(16,34,16,1),(17,52,17,1),(18,25,18,1),(19,80,19,1),(20,46,20,1),(21,80,21,1),(22,7,22,0),(23,17,23,0),(24,76,24,1),(25,73,25,0),(26,87,26,1),(27,99,27,1),(28,16,28,1),(29,28,29,0),(30,28,30,1),(31,88,31,1),(32,45,32,1),(33,10,33,0),(34,29,34,0),(35,3,35,1),(36,86,36,0),(37,43,37,1),(38,58,38,1),(39,29,39,0),(40,22,40,0),(41,51,41,0),(42,70,42,1),(43,38,43,0),(44,15,44,1),(45,51,45,0),(46,68,46,0),(47,70,47,0),(48,64,48,1),(49,10,49,1),(50,21,50,0),(51,56,51,0),(52,13,52,1),(53,46,53,1),(54,86,54,1),(55,99,55,0),(56,63,56,1),(57,49,57,0),(58,2,58,1),(59,93,59,0),(60,12,60,1),(61,35,61,1),(62,90,62,1),(63,57,63,1),(64,3,64,0),(65,15,65,0),(66,49,66,1),(67,24,67,1),(68,75,68,1),(69,32,69,0),(70,3,70,0),(71,75,71,0),(72,22,72,1),(73,43,73,1),(74,42,74,0),(75,72,75,1),(76,17,76,1),(77,12,77,1),(78,63,78,1),(79,81,79,0),(80,65,80,0),(81,51,81,0),(82,22,82,0),(83,70,83,0),(84,48,84,1),(85,94,85,1),(86,55,86,1),(87,93,87,1),(88,73,88,1),(89,64,89,0),(90,93,90,1),(91,27,91,1),(92,21,92,1),(93,58,93,1),(94,30,94,1),(95,75,95,1),(96,86,96,0),(97,85,97,1),(98,70,98,1),(99,58,99,0),(100,54,100,0);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `VendorID` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `License` varchar(20) NOT NULL,
  `TypeID` int unsigned NOT NULL,
  `CanDeliver` tinyint NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(30) NOT NULL,
  `AreaID` int unsigned NOT NULL,
  `Street` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`VendorID`),
  UNIQUE KEY `VendorID_UNIQUE` (`VendorID`),
  KEY `fk_Vendor_VendorTYPE1_idx` (`TypeID`),
  KEY `fk_Vendor_Address1_idx` (`AreaID`),
  CONSTRAINT `fk_Vendor_Address1` FOREIGN KEY (`AreaID`) REFERENCES `area` (`AreaID`),
  CONSTRAINT `fk_Vendor_VendorTYPE1` FOREIGN KEY (`TypeID`) REFERENCES `vendortype` (`TypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=500 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (400,'Delectable Grill','AD3508',1,0,'delectablegrill@restaurant.com','358-919-8384',400,'Maple Avenue'),(401,'Flavorful Restaurant','Qe1332',5,0,'flavorfulrestaurant@restaurant.com','777-239-3541',401,'Oakwood Drive'),(402,'Savory Kitchen','Fm4495',10,1,'savorykitchen@restaurant.com','365-914-1154',402,'Pine Lane'),(403,'Flavorful Bistro','aR9181',7,1,'flavorfulbistro@restaurant.com','998-372-2467',403,'Birch Road'),(404,'Delicious Diner','XM3951',1,0,'deliciousdiner@restaurant.com','779-926-4187',404,'Cedar Street'),(405,'Tasty Tavern','ST5611',4,1,'tastytavern@restaurant.com','670-398-7359',405,'Walnut Avenue'),(406,'Mouthwatering Eatery','gU4163',3,1,'mouthwateringeatery@restaurant.com','680-276-1650',406,'Cherry Boulevard'),(407,'Scrumptious Diner','oK2691',6,0,'scrumptiousdiner@restaurant.com','685-308-3060',407,'Elm Street'),(408,'Tasty Diner','YC3741',7,1,'tastydiner@restaurant.com','210-224-8724',408,'Peach Drive'),(409,'Delicious Grill','Hw2443',8,0,'deliciousgrill@restaurant.com','202-909-8591',409,'Main Street'),(410,'Tasty Grill','vl9836',10,0,'tastygrill@restaurant.com','244-897-1658',410,'Chestnut Lane'),(411,'Scrumptious Kitchen','df1978',8,1,'scrumptiouskitchen@restaurant.com','889-561-5069',411,'Willow Road'),(412,'Flavorful Diner','Vh4988',9,1,'flavorfuldiner@restaurant.com','963-268-8413',412,'Spruce Street'),(413,'Delicious Restaurant','JK5018',3,1,'deliciousrestaurant@restaurant.com','263-753-2929',413,'Hickory Avenue'),(414,'Savory Restaurant','YU3022',7,0,'savoryrestaurant@restaurant.com','694-701-3238',414,'Magnolia Drive'),(415,'Mouthwatering Tavern','Ae7875',1,0,'mouthwateringtavern@restaurant.com','631-886-4255',415,'Sycamore Lane'),(416,'Delicious Diner','wT3610',4,0,'deliciousdiner@restaurant.com','269-579-7387',416,'Poplar Road'),(417,'Flavorful Cafe','Fd3624',4,0,'flavorfulcafe@restaurant.com','884-865-6986',417,'Aspen Street'),(418,'Delicious Grill','LJ0753',8,0,'deliciousgrill@restaurant.com','739-496-6844',418,'Fir Avenue'),(419,'Delectable Eatery','VD0307',4,0,'delectableeatery@restaurant.com','521-900-3022',419,'Juniper Drive'),(420,'Flavorful Bistro','ux4636',9,0,'flavorfulbistro@restaurant.com','938-310-8702',420,'Redwood Lane'),(421,'Delectable Diner','he3762',3,1,'delectablediner@restaurant.com','840-306-2544',421,'Dogwood Road'),(422,'Savory Bistro','pr8562',10,0,'savorybistro@restaurant.com','298-316-7147',422,'Alder Street'),(423,'Delectable Restaurant','Vl1327',3,1,'delectablerestaurant@restaurant.com','496-570-3930',423,'Beech Avenue'),(424,'Savory Cafe','qN3733',7,1,'savorycafe@restaurant.com','925-740-8631',424,'Cottonwood Drive'),(425,'Savory Diner','nT8036',6,1,'savorydiner@restaurant.com','577-841-9163',425,'Hazel Lane'),(426,'Delicious Eatery','mu2735',7,0,'deliciouseatery@restaurant.com','716-374-7446',426,'Linden Road'),(427,'Delectable Tavern','Hz1724',10,1,'delectabletavern@restaurant.com','407-632-1549',427,'Palm Street'),(428,'Mouthwatering Kitchen','wE2580',10,0,'mouthwateringkitchen@restaurant.com','623-375-1259',428,'Sequoia Avenue'),(429,'Delectable Grill','yR0066',6,0,'delectablegrill@restaurant.com','990-906-9627',429,'Tamarack Drive'),(430,'Flavorful Restaurant','EV0912',10,0,'flavorfulrestaurant@restaurant.com','871-835-9385',430,'Banyan Lane'),(431,'Tasty Diner','mZ3795',7,0,'tastydiner@restaurant.com','376-610-6846',431,'Cypress Road'),(432,'Tasty Grill','dJ5681',4,0,'tastygrill@restaurant.com','504-529-2735',432,'Eucalyptus Street'),(433,'Flavorful Kitchen','LJ8411',5,0,'flavorfulkitchen@restaurant.com','839-301-4178',433,'Holly Avenue'),(434,'Yummy Eatery','Kb1672',10,0,'yummyeatery@restaurant.com','686-559-2042',434,'Ivy Drive'),(435,'Scrumptious Eatery','MA6233',2,1,'scrumptiouseatery@restaurant.com','651-756-2904',435,'Laurel Lane'),(436,'Yummy Eatery','Lk3661',8,1,'yummyeatery@restaurant.com','705-806-6880',436,'Myrtle Road'),(437,'Mouthwatering Tavern','zZ5255',1,1,'mouthwateringtavern@restaurant.com','648-322-4931',437,'Olive Street'),(438,'Mouthwatering Cafe','LW2376',3,0,'mouthwateringcafe@restaurant.com','578-419-5844',438,'Plum Avenue'),(439,'Flavorful Kitchen','hw3448',7,0,'flavorfulkitchen@restaurant.com','738-497-3293',439,'Quince Drive'),(440,'Scrumptious Cafe','xz5931',3,0,'scrumptiouscafe@restaurant.com','362-393-2899',440,'Sassafras Lane'),(441,'Tasty Tavern','wC5907',2,0,'tastytavern@restaurant.com','338-706-8688',441,'Teak Road'),(442,'Savory Cafe','ae7625',9,0,'savorycafe@restaurant.com','710-600-8345',442,'Umbrella Street'),(443,'Delicious Tavern','XS3303',7,1,'delicioustavern@restaurant.com','846-534-5247',443,'Vine Avenue'),(444,'Delicious Restaurant','kl9904',9,1,'deliciousrestaurant@restaurant.com','506-992-9731',444,'Wisteria Drive'),(445,'Savory Eatery','RV3870',1,1,'savoryeatery@restaurant.com','270-313-6054',445,'Yew Lane'),(446,'Yummy Eatery','aT6900',8,1,'yummyeatery@restaurant.com','644-416-2778',446,'Zebrawood Road'),(447,'Delectable Bistro','iS0018',9,1,'delectablebistro@restaurant.com','832-887-2363',447,'Acacia Street'),(448,'Flavorful Cafe','Vm6810',3,1,'flavorfulcafe@restaurant.com','396-778-9136',448,'Bayberry Lane'),(449,'Delicious Tavern','sI9678',5,1,'delicioustavern@restaurant.com','587-262-5023',449,'Buckeye Road'),(450,'Savory Kitchen','rM4171',10,1,'savorykitchen@restaurant.com','799-351-3012',450,'Catalpa Drive'),(451,'Delectable Tavern','RD9149',8,0,'delectabletavern@restaurant.com','881-609-4711',451,'Dahlia Avenue'),(452,'Scrumptious Cafe','ok4305',5,0,'scrumptiouscafe@restaurant.com','711-462-3003',452,'Elderberry Lane'),(453,'Mouthwatering Eatery','og1922',10,1,'mouthwateringeatery@restaurant.com','810-714-7918',453,'Fennel Street'),(454,'Scrumptious Tavern','oe1337',10,0,'scrumptioustavern@restaurant.com','755-750-9315',454,'Gardenia Drive'),(455,'Delicious Diner','yn4698',9,1,'deliciousdiner@restaurant.com','799-724-2674',455,'Hawthorn Road'),(456,'Delectable Grill','NY8220',5,0,'delectablegrill@restaurant.com','281-946-4855',456,'Indigo Lane'),(457,'Savory Grill','fs0489',7,1,'savorygrill@restaurant.com','340-960-2799',457,'Jasmine Avenue'),(458,'Tasty Kitchen','ZH3764',6,1,'tastykitchen@restaurant.com','400-779-5888',458,'Kale Street'),(459,'Delicious Grill','Et1933',3,1,'deliciousgrill@restaurant.com','704-865-1617',459,'Lilac Drive'),(460,'Savory Grill','ra0863',9,1,'savorygrill@restaurant.com','596-333-1815',460,'Mulberry Lane'),(461,'Tasty Bistro','XZ3392',2,1,'tastybistro@restaurant.com','377-950-1978',461,'Nectarine Street'),(462,'Delectable Kitchen','GX4926',1,1,'delectablekitchen@restaurant.com','258-917-1554',462,'Orchid Avenue'),(463,'Mouthwatering Cafe','eK5760',9,1,'mouthwateringcafe@restaurant.com','906-631-3327',463,'Poppy Drive'),(464,'Delicious Diner','po2913',7,0,'deliciousdiner@restaurant.com','368-449-5457',464,'Quarry Lane'),(465,'Scrumptious Grill','Wf4492',7,1,'scrumptiousgrill@restaurant.com','274-259-6222',465,'Rosewood Road'),(466,'Tasty Restaurant','Ko3116',6,0,'tastyrestaurant@restaurant.com','255-272-2387',466,'Sandalwood Street'),(467,'Delicious Diner','Eb4044',10,0,'deliciousdiner@restaurant.com','889-664-6837',467,'Thistle Drive'),(468,'Tasty Diner','iX6123',10,0,'tastydiner@restaurant.com','371-756-8764',468,'Upland Lane'),(469,'Tasty Tavern','TP8056',4,1,'tastytavern@restaurant.com','483-804-2091',469,'Verbena Avenue'),(470,'Delicious Bistro','PX9314',7,0,'deliciousbistro@restaurant.com','673-710-9782',470,'Wheat Street'),(471,'Yummy Cafe','EI9085',5,1,'yummycafe@restaurant.com','999-800-5947',471,'Xanadu Lane'),(472,'Delicious Kitchen','fz4964',10,0,'deliciouskitchen@restaurant.com','530-397-5546',472,'Yellowwood Drive'),(473,'Yummy Kitchen','gG4807',10,1,'yummykitchen@restaurant.com','455-519-8732',473,'Zinnia Avenue'),(474,'Tasty Grill','gv3240',5,1,'tastygrill@restaurant.com','747-286-6758',474,'Amber Street'),(475,'Scrumptious Bistro','ca6754',3,1,'scrumptiousbistro@restaurant.com','568-731-8904',475,'Bamboo Lane'),(476,'Scrumptious Cafe','PH5674',2,1,'scrumptiouscafe@restaurant.com','666-495-1680',476,'Clover Road'),(477,'Delicious Restaurant','bJ7757',3,1,'deliciousrestaurant@restaurant.com','415-560-9440',477,'Daisy Drive'),(478,'Delicious Tavern','KP1367',10,0,'delicioustavern@restaurant.com','740-651-5219',478,'Eagle Street'),(479,'Yummy Grill','Fg6424',5,1,'yummygrill@restaurant.com','271-599-4616',479,'Fern Avenue'),(480,'Scrumptious Grill','lk0757',8,1,'scrumptiousgrill@restaurant.com','765-456-6147',480,'Gladiolus Lane'),(481,'Mouthwatering Eatery','ld5354',4,0,'mouthwateringeatery@restaurant.com','526-649-8899',481,'Heather Drive'),(482,'Scrumptious Restaurant','gp7110',3,1,'scrumptiousrestaurant@restaurant.com','436-426-2433',482,'Iris Street'),(483,'Tasty Tavern','cI5150',9,1,'tastytavern@restaurant.com','359-629-3177',483,'Jade Avenue'),(484,'Flavorful Kitchen','aq9750',6,0,'flavorfulkitchen@restaurant.com','618-275-7643',484,'Kestrel Lane'),(485,'Tasty Grill','nz6022',3,1,'tastygrill@restaurant.com','613-659-3460',485,'Lavender Drive'),(486,'Delectable Kitchen','fM4957',5,0,'delectablekitchen@restaurant.com','993-943-3574',486,'Marigold Street'),(487,'Delicious Diner','at2312',10,0,'deliciousdiner@restaurant.com','827-669-9524',487,'Nettle Lane'),(488,'Tasty Grill','dt4302',1,0,'tastygrill@restaurant.com','448-213-5638',488,'Oriole Avenue'),(489,'Flavorful Restaurant','zy4986',8,1,'flavorfulrestaurant@restaurant.com','914-998-2948',489,'Pinecone Drive'),(490,'Yummy Kitchen','PO9388',8,1,'yummykitchen@restaurant.com','701-532-5115',490,'Quail Street'),(491,'Savory Grill','XM4143',6,1,'savorygrill@restaurant.com','660-526-9516',491,'Raven Avenue'),(492,'Savory Cafe','pc1827',10,1,'savorycafe@restaurant.com','630-415-3308',492,'Sage Lane'),(493,'Yummy Grill','Vv4154',2,0,'yummygrill@restaurant.com','900-996-6874',493,'Tulip Drive'),(494,'Scrumptious Eatery','DX9319',6,0,'scrumptiouseatery@restaurant.com','493-722-2659',494,'Umbra Street'),(495,'Savory Bistro','IZ6181',3,0,'savorybistro@restaurant.com','744-383-2678',495,'Violet Avenue'),(496,'Mouthwatering Tavern','DJ1001',7,1,'mouthwateringtavern@restaurant.com','453-928-9432',496,'Wren Lane'),(497,'Tasty Grill','ie5551',5,0,'tastygrill@restaurant.com','578-549-1640',497,'Xenia Drive'),(498,'Delectable Diner','bd9328',9,1,'delectablediner@restaurant.com','295-755-4303',498,'Yucca Street'),(499,'Flavorful Grill','VC6877',6,0,'flavorfulgrill@restaurant.com','409-583-6175',499,'Zephyr Avenue');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_has_event`
--

DROP TABLE IF EXISTS `vendor_has_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_has_event` (
  `VendorID` int unsigned NOT NULL,
  `EventID` int unsigned NOT NULL,
  PRIMARY KEY (`VendorID`,`EventID`),
  KEY `fk_Vendor_has_Event_Event1_idx` (`EventID`),
  KEY `fk_Vendor_has_Event_Vendor1_idx` (`VendorID`),
  CONSTRAINT `fk_Vendor_has_Event_Event1` FOREIGN KEY (`EventID`) REFERENCES `events` (`EventID`),
  CONSTRAINT `fk_Vendor_has_Event_Vendor1` FOREIGN KEY (`VendorID`) REFERENCES `vendor` (`VendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_has_event`
--

LOCK TABLES `vendor_has_event` WRITE;
/*!40000 ALTER TABLE `vendor_has_event` DISABLE KEYS */;
INSERT INTO `vendor_has_event` VALUES (415,1),(437,1),(423,2),(453,4),(434,5),(426,6),(431,8),(443,9),(445,9),(447,9),(475,10),(427,11),(443,12),(462,12),(492,12),(406,15),(453,15),(413,17),(488,17),(436,18),(458,18),(402,19),(484,19),(474,21),(419,23),(428,23),(472,23),(425,25),(406,26),(420,28),(431,28),(494,28),(415,29),(423,29),(413,30),(442,30),(441,31),(466,31),(415,32),(416,33),(409,35),(449,35),(448,36),(458,37),(417,40),(403,42),(430,42),(475,42),(428,44),(492,45),(440,47),(439,50),(447,50),(414,51),(400,52),(422,52),(439,54),(444,54),(410,57),(412,61),(441,61),(413,62),(453,62),(461,62),(450,63),(480,63),(441,64),(471,64),(400,66),(491,66),(457,67),(484,67),(475,71),(407,72),(430,73),(416,74),(494,75),(407,78),(421,78),(449,79),(457,80),(414,81),(400,82),(416,82),(406,84),(412,84),(489,85),(468,88),(426,91),(431,91),(407,92),(439,92),(457,92),(417,94),(408,95),(430,95),(429,96),(495,97),(402,98),(477,98);
/*!40000 ALTER TABLE `vendor_has_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendorfeedback`
--

DROP TABLE IF EXISTS `vendorfeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendorfeedback` (
  `VendorFeedbackID` int unsigned NOT NULL AUTO_INCREMENT,
  `Comment` varchar(500) NOT NULL,
  `VendorID` int unsigned NOT NULL,
  `EventID` int unsigned NOT NULL,
  PRIMARY KEY (`VendorFeedbackID`),
  UNIQUE KEY `VendorFeedbackID_UNIQUE` (`VendorFeedbackID`),
  KEY `fk_VendorFeedback_Vendor1_idx` (`VendorID`),
  KEY `fk_VendorFeedback_Event1_idx` (`EventID`),
  CONSTRAINT `fk_VendorFeedback_Event1` FOREIGN KEY (`EventID`) REFERENCES `events` (`EventID`),
  CONSTRAINT `fk_VendorFeedback_Vendor1` FOREIGN KEY (`VendorID`) REFERENCES `vendor` (`VendorID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendorfeedback`
--

LOCK TABLES `vendorfeedback` WRITE;
/*!40000 ALTER TABLE `vendorfeedback` DISABLE KEYS */;
INSERT INTO `vendorfeedback` VALUES (1,'Tutoring sessions provided valuable support to students.',475,71),(2,'Environmental cleanup was well-executed and made a positive impact.',422,52),(3,'Community outreach event was impactful and reached many people.',495,97),(4,'Fundraising event was well-attended and achieved its goals.',449,35),(5,'Community outreach event was meaningful and connected with the community.',412,61),(6,'Tutoring sessions provided valuable support to students.',448,36),(7,'The event was well-organized and the food distribution was efficient.',461,62),(8,'Environmental cleanup was a great initiative and improved the local environment.',415,29),(9,'Community outreach event was impactful and reached many people.',428,44),(10,'The event was well-organized and the food distribution was efficient.',408,95),(11,'Food distribution was timely and helped many families in need.',472,23),(12,'Environmental cleanup was well-executed and made a positive impact.',415,32),(13,'Community outreach event brought people together and created a positive impact.',468,88),(14,'Food distribution was timely and helped many families in need.',443,12),(15,'Fundraising event was a success and generated significant funds.',400,82),(16,'Community outreach event brought people together and created a positive impact.',430,95),(17,'Tutoring sessions were very helpful and the volunteers were knowledgeable.',429,96),(18,'Community outreach event was impactful and reached many people.',431,28),(19,'Tutoring sessions were very helpful and the volunteers were knowledgeable.',458,18),(20,'The event was well-organized and the food distribution was efficient.',423,2),(21,'Community outreach event was impactful and reached many people.',426,6),(22,'The event was well-organized and the food distribution was efficient.',466,31),(23,'Fundraising event was a great success and raised a significant amount of money.',417,94),(24,'Tutoring sessions were engaging and beneficial for students.',417,40),(25,'Tutoring sessions were very helpful and the volunteers were knowledgeable.',409,35),(26,'Fundraising event was a success and generated significant funds.',410,57),(27,'Tutoring sessions were engaging and beneficial for students.',477,98),(28,'Food distribution was timely and helped many families in need.',475,42),(29,'Tutoring sessions were engaging and beneficial for students.',437,1),(30,'Community outreach event was impactful and reached many people.',492,45),(31,'Tutoring sessions provided valuable support to students.',484,19),(32,'Environmental cleanup was well-executed and made a positive impact.',406,15),(33,'Community outreach event was impactful and reached many people.',400,66),(34,'Community outreach event was impactful and reached many people.',412,84),(35,'Environmental cleanup was a great initiative and improved the local environment.',406,26),(36,'Environmental cleanup was a great initiative and improved the local environment.',416,33),(37,'Tutoring sessions were very helpful and the volunteers were knowledgeable.',436,18),(38,'Food distribution was timely and helped many families in need.',430,42),(39,'Food distribution was timely and helped many families in need.',416,74),(40,'Food distribution was timely and helped many families in need.',447,9),(41,'Community outreach event was a success and helped many individuals.',453,4),(42,'Fundraising event was a great success and raised a significant amount of money.',443,9),(43,'Fundraising event was a great success and raised a significant amount of money.',475,10),(44,'Tutoring sessions provided valuable support to students.',413,17),(45,'Fundraising event was a great success and raised a significant amount of money.',407,78),(46,'Environmental cleanup was successful, and the area looks much better now.',431,91),(47,'Tutoring sessions were engaging and beneficial for students.',419,23),(48,'Tutoring sessions were very helpful and the volunteers were knowledgeable.',494,28),(49,'Fundraising event was a great success and raised a significant amount of money.',453,15),(50,'Fundraising event was well-attended and achieved its goals.',453,62),(51,'Environmental cleanup was a great initiative and improved the local environment.',416,82),(52,'Community outreach event brought people together and created a positive impact.',414,81),(53,'Community outreach event brought people together and created a positive impact.',439,50),(54,'The event was well-organized and the food distribution was efficient.',462,12),(55,'Environmental cleanup was well-executed and made a positive impact.',442,30),(56,'The event was well-organized and the food distribution was efficient.',441,31),(57,'Environmental cleanup was successful, and the area looks much better now.',415,1),(58,'Environmental cleanup was well-executed and made a positive impact.',457,67),(59,'Tutoring sessions provided valuable support to students.',445,9),(60,'Tutoring sessions were informative and supportive.',403,42),(61,'Community outreach event was a success and helped many individuals.',444,54),(62,'Environmental cleanup was a great initiative and improved the local environment.',458,37),(63,'Environmental cleanup made a noticeable difference in the community.',402,19),(64,'Tutoring sessions provided valuable support to students.',471,64),(65,'Fundraising event was a success and generated significant funds.',491,66),(66,'Food distribution was timely and helped many families in need.',400,52),(67,'Tutoring sessions were very helpful and the volunteers were knowledgeable.',449,79),(68,'Tutoring sessions provided valuable support to students.',484,67),(69,'Community outreach event was a success and helped many individuals.',489,85),(70,'Food distribution was timely and helped many families in need.',420,28),(71,'Environmental cleanup was a great initiative and improved the local environment.',474,21),(72,'Fundraising event was well-attended and achieved its goals.',427,11),(73,'Community outreach event was meaningful and connected with the community.',441,64),(74,'Environmental cleanup was well-executed and made a positive impact.',414,51),(75,'Food distribution was timely and helped many families in need.',450,63),(76,'Food distribution was well-coordinated and provided essential supplies.',407,72),(77,'Tutoring sessions were informative and supportive.',426,91),(78,'Community outreach event was meaningful and connected with the community.',441,61),(79,'Community outreach event brought people together and created a positive impact.',439,92),(80,'Environmental cleanup made a noticeable difference in the community.',488,17),(81,'Community outreach event brought people together and created a positive impact.',431,8),(82,'Community outreach event brought people together and created a positive impact.',494,75),(83,'Community outreach event brought people together and created a positive impact.',440,47),(84,'Environmental cleanup was well-executed and made a positive impact.',480,63),(85,'Community outreach event was impactful and reached many people.',402,98),(86,'Tutoring sessions were very helpful and the volunteers were knowledgeable.',457,92),(87,'Environmental cleanup was a great initiative and improved the local environment.',428,23),(88,'Fundraising event was well-attended and achieved its goals.',492,12),(89,'Food distribution was timely and helped many families in need.',421,78),(90,'Fundraising event was well-attended and achieved its goals.',425,25),(91,'Community outreach event was impactful and reached many people.',406,84),(92,'Community outreach event brought people together and created a positive impact.',434,5),(93,'Environmental cleanup made a noticeable difference in the community.',457,80),(94,'Tutoring sessions were engaging and beneficial for students.',413,62),(95,'Fundraising event was a success and generated significant funds.',413,30),(96,'Tutoring sessions were informative and supportive.',447,50),(97,'Food distribution was effective and reached many families.',430,73),(98,'Environmental cleanup was successful, and the area looks much better now.',407,92),(99,'Food distribution was timely and helped many families in need.',423,29),(100,'Community outreach event was a success and helped many individuals.',439,54);
/*!40000 ALTER TABLE `vendorfeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendortype`
--

DROP TABLE IF EXISTS `vendortype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendortype` (
  `TypeID` int unsigned NOT NULL AUTO_INCREMENT,
  `Type` varchar(20) NOT NULL,
  PRIMARY KEY (`TypeID`),
  UNIQUE KEY `TypeID_UNIQUE` (`TypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendortype`
--

LOCK TABLES `vendortype` WRITE;
/*!40000 ALTER TABLE `vendortype` DISABLE KEYS */;
INSERT INTO `vendortype` VALUES (1,'Restaurant'),(2,'Cafe'),(3,'Bakery'),(4,'Food Truck'),(5,'Catering'),(6,'Bar'),(7,'Diner'),(8,'Pizzeria'),(9,'Buffet'),(10,'Bistro');
/*!40000 ALTER TABLE `vendortype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteer`
--

DROP TABLE IF EXISTS `volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer` (
  `VolunteerID` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `PhoneNumber` varchar(30) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Age` tinyint unsigned NOT NULL,
  `EmeergencyContact` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`VolunteerID`),
  UNIQUE KEY `idtable1_UNIQUE` (`VolunteerID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer`
--

LOCK TABLES `volunteer` WRITE;
/*!40000 ALTER TABLE `volunteer` DISABLE KEYS */;
INSERT INTO `volunteer` VALUES (1,'Travis Williams','555-814-6754','bbernard@yahoo.com',53,'555-623-5239'),(2,'Jennifer Vazquez','555-592-8509','valeriewilson@adams.org',73,'555-948-3002'),(3,'Michele Odonnell','555-585-8166','susancurry@gaines-kidd.com',80,'555-542-9160'),(4,'John Rodriguez','555-355-5032','rfranklin@turner.com',25,'555-883-5015'),(5,'Nancy Dixon','555-210-6343','robert28@yahoo.com',35,'555-502-8621'),(6,'Sarah Johnson','555-165-2835','kelseylynch@campbell.com',28,'555-288-5013'),(7,'Elizabeth Gates','555-433-1515','jasonblair@burke.biz',74,'555-982-2226'),(8,'Andrew Mercado','555-202-9674','kathleen59@gmail.com',72,'555-442-7617'),(9,'Tiffany Wood','555-371-3190','kyletorres@johnson-wheeler.com',40,'555-447-7587'),(10,'Jacob Banks','555-119-7701','penningtonconnie@henderson.com',61,'555-348-9584'),(11,'Mariah Hernandez','555-883-7492','murphyjeremy@allen.info',56,'555-339-2970'),(12,'Tricia Thomas','555-978-8523','mcmahonjack@hotmail.com',97,'555-104-3934'),(13,'Mark Roach','555-239-2901','jennifersmith@morton-maynard.com',29,'555-667-4048'),(14,'Robin Whitaker','555-411-4432','jefferyschmidt@hotmail.com',44,'555-206-3599'),(15,'Mathew Scott','555-688-9680','whitakerronald@yahoo.com',31,'555-751-2548'),(16,'Rhonda King','555-168-5493','sullivanmatthew@hotmail.com',18,'555-298-9370'),(17,'Donna Burgess','555-864-8779','rogersellen@curry.com',95,'555-993-3449'),(18,'Mr. Randy Silva','555-733-4208','kristen33@watson.com',57,'555-737-5345'),(19,'Jared Thomas','555-428-8137','gilllindsay@yahoo.com',25,'555-941-9101'),(20,'Tanya White','555-861-2868','carterbrian@hotmail.com',48,'555-617-8631'),(21,'Kimberly Anderson','555-752-9855','ronnielevy@yahoo.com',92,'555-391-4255'),(22,'Shannon Ortiz','555-149-8283','maria77@smith.com',55,'555-508-4349'),(23,'Allison Randolph','555-163-9367','johnsondaniel@gmail.com',20,'555-712-8500'),(24,'Joshua Underwood','555-666-2482','lisadominguez@gross.com',87,'555-664-5270'),(25,'Michael Gonzalez','555-706-9088','reynoldssherry@gmail.com',54,'555-839-7186'),(26,'Robert Wilson','555-829-4395','clarkcarrie@gmail.com',58,'555-235-1418'),(27,'Jessica Jacobs','555-920-8561','robertgomez@mcguire.com',67,'555-659-9504'),(28,'Mike Thompson','555-356-6640','pross@tucker-parker.org',70,'555-599-9230'),(29,'Brad Vazquez','555-610-4596','lpage@lyons.com',64,'555-208-6758'),(30,'William Carr','555-591-2989','xking@yahoo.com',34,'555-888-2640'),(31,'Erica Hogan','555-568-2925','ggutierrez@williams-reed.com',90,'555-592-5383'),(32,'Samantha Mills','555-380-8155','jkirby@cook.com',33,'555-599-4269'),(33,'Nathaniel White','555-341-2171','danielmorris@hotmail.com',82,'555-582-9183'),(34,'Jason Hancock','555-251-6963','igonzalez@gmail.com',42,'555-561-4642'),(35,'Amanda Williams','555-886-8041','gardnerkara@lewis.com',59,'555-373-5228'),(36,'Jorge Mata','555-575-8675','jamesharrison@harrell.com',53,'555-482-7053'),(37,'Mallory Ayala','555-437-8481','qstuart@kane.com',26,'555-135-7341'),(38,'Jeffrey Brown','555-656-6857','diana29@blevins.com',51,'555-859-5518'),(39,'Sarah Brown','555-625-1973','rachel56@hotmail.com',88,'555-727-6475'),(40,'Juan Williams','555-415-8312','mitchelltiffany@guerrero.com',23,'555-771-4525'),(41,'James Stokes','555-979-4858','bethanygeorge@hotmail.com',65,'555-604-5870'),(42,'Robert Kane','555-159-2088','barrywilliam@yahoo.com',30,'555-626-6686'),(43,'Micheal Burgess','555-707-7782','scottkeith@malone.com',19,'555-905-2537'),(44,'Clinton Young','555-945-2432','newtonangela@martinez.org',43,'555-270-8973'),(45,'Heather Lopez','555-716-2662','pbaker@yahoo.com',41,'555-283-3541'),(46,'Dakota Tucker','555-627-8870','ytownsend@brooks.com',31,'555-740-3813'),(47,'Angela Burch','555-569-6740','qburns@hurley.net',50,'555-855-2206'),(48,'Gregory Davenport','555-320-1748','markmorgan@yahoo.com',96,'555-558-2879'),(49,'Antonio Tran','555-855-9525','howelltammy@gmail.com',99,'555-700-3213'),(50,'Mitchell Parker','555-817-1600','bowerswilliam@lane.net',63,'555-704-1790'),(51,'Brandi Mueller','555-159-7235','williamsjennifer@schmidt.com',75,'555-382-6936'),(52,'John Martinez','555-463-8337','jenningsevan@mcmahon-walker.net',39,'555-630-3748'),(53,'Aaron Perez','555-376-5676','jjohnson@yahoo.com',51,'555-883-8743'),(54,'Susan Cooke','555-346-9447','qdawson@evans.com',45,'555-880-5165'),(55,'Kathryn Evans','555-730-8874','ncox@yahoo.com',54,'555-105-9839'),(56,'Christopher Kerr','555-822-9377','susan72@fisher.com',22,'555-129-5536'),(57,'Eric Robinson','555-620-4304','pbuchanan@sellers.com',93,'555-333-1230'),(58,'Holly Shea','555-875-4543','leematthew@yahoo.com',26,'555-219-5464'),(59,'Courtney Pruitt','555-745-1393','gshort@yahoo.com',27,'555-952-9976'),(60,'Victoria Miller','555-647-1718','christianjenkins@hernandez.net',60,'555-182-8336'),(61,'Karen Cunningham','555-876-1831','barnespamela@brown.org',77,'555-656-6675'),(62,'Allison Schmidt','555-385-3530','ramirezchristopher@yahoo.com',49,'555-632-6516'),(63,'Kristopher Miller','555-460-7662','michaelclark@garcia-hess.info',72,'555-800-8769'),(64,'Ashley Torres','555-949-6739','boltonamanda@hotmail.com',52,'555-883-5399'),(65,'Justin Martinez','555-914-5285','cassandra22@smith.com',43,'555-315-7684'),(66,'John Johnson','555-648-6403','moorebrenda@yahoo.com',74,'555-298-3842'),(67,'Jessica Wise','555-384-7923','eguerrero@schmidt-rojas.info',24,'555-114-4193'),(68,'Richard Johnson','555-866-9906','angelgallegos@blankenship.net',68,'555-983-7686'),(69,'Natalie Davis','555-485-8889','williamsmichelle@gmail.com',67,'555-773-9651'),(70,'Megan Webb','555-451-2261','asmith@gmail.com',44,'555-632-7922'),(71,'Tim Daugherty','555-794-5903','james69@roberts.info',62,'555-254-9678'),(72,'Bianca Rice','555-501-7570','martingutierrez@holmes.com',76,'555-696-9211'),(73,'Michael Chavez','555-315-9312','bmichael@hutchinson.biz',71,'555-441-4238'),(74,'Richard Robinson','555-263-5935','brandismith@gmail.com',37,'555-178-4188'),(75,'Paul Jordan','555-341-2695','dylan50@yahoo.com',81,'555-286-6018'),(76,'Wanda Brown','555-251-2835','robertsjames@yahoo.com',65,'555-428-6823'),(77,'Matthew Collins','555-721-9516','pbrown@gmail.com',36,'555-271-4884'),(78,'Brian Anderson','555-303-5316','wrodriguez@carson-reeves.net',78,'555-538-4139'),(79,'Abigail Gonzalez DDS','555-973-2337','mwright@hotmail.com',58,'555-336-1374'),(80,'Steven Hendrix','555-519-8285','frostjames@marquez.com',42,'555-721-7737'),(81,'Karen Harris','555-210-1213','garciatina@gmail.com',66,'555-574-1048'),(82,'Travis Andrews','555-640-7634','gordonmurray@sims-evans.biz',46,'555-981-7398'),(83,'Lisa West','555-189-5893','burnsmaria@hotmail.com',20,'555-519-2644'),(84,'Catherine Bennett','555-734-1863','watkinscharles@peterson.org',98,'555-451-9020'),(85,'Jasmine Romero','555-156-8358','petersennicholas@hotmail.com',63,'555-109-4910'),(86,'Maria Robertson','555-973-4512','qfreeman@franco.com',89,'555-918-3165'),(87,'David Hunt','555-963-8348','angel88@hotmail.com',54,'555-920-5088'),(88,'Eileen Morris','555-412-7718','uhodge@hotmail.com',75,'555-846-9317'),(89,'Mark Fleming','555-783-4285','thomasrobinson@yahoo.com',32,'555-800-6029'),(90,'David Morris','555-292-9177','millerraymond@hotmail.com',55,'555-394-5642'),(91,'Diana Lin','555-850-7888','yoderalexa@perez.net',91,'555-321-3647'),(92,'Michael Collins','555-599-1460','mosesrobert@yahoo.com',79,'555-954-8457'),(93,'Sally Hernandez','555-996-8752','jamesjoyce@gmail.com',68,'555-421-8549'),(94,'Jonathan Hampton','555-558-2485','walkergabriella@hotmail.com',38,'555-717-4412'),(95,'Christina Collins','555-213-3975','yclark@hopkins.com',47,'555-658-2069'),(96,'William Hall','555-472-6702','michael79@ellis-andrews.com',69,'555-458-5917'),(97,'Angela Wilson','555-274-8882','ghull@torres-lopez.net',86,'555-408-3871'),(98,'Miranda Huffman','555-894-8989','jonesrobert@yahoo.com',59,'555-141-4937'),(99,'Russell Wood','555-242-6923','kjohnson@friedman.biz',84,'555-631-9859'),(100,'Terry Carrillo','555-644-4890','michaellawson@white.com',21,'555-576-5683');
/*!40000 ALTER TABLE `volunteer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteerorganization`
--

DROP TABLE IF EXISTS `volunteerorganization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteerorganization` (
  `VolOrgID` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`VolOrgID`),
  UNIQUE KEY `VolOrgID_UNIQUE` (`VolOrgID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteerorganization`
--

LOCK TABLES `volunteerorganization` WRITE;
/*!40000 ALTER TABLE `volunteerorganization` DISABLE KEYS */;
INSERT INTO `volunteerorganization` VALUES (1,'Helping Hands'),(2,'Community Care'),(3,'Volunteer Squad'),(4,'Neighborhood Helpers'),(5,'Goodwill Group'),(6,'Charity Champions'),(7,'Hope Givers'),(8,'Kindness Crew'),(9,'Supportive Souls'),(10,'Generous Hearts'),(11,'Unity Volunteers'),(12,'Compassionate Friends'),(13,'Service Stars'),(14,'Aid Alliance'),(15,'Benevolent Bunch'),(16,'Caring Collective'),(17,'Philanthropy Partners'),(18,'Humanitarian Heroes'),(19,'Selfless Society'),(20,'Giving Group'),(21,'Altruistic Association'),(22,'Volunteer Visionaries'),(23,'Empathy Ensemble'),(24,'Relief Rangers'),(25,'Charitable Circle'),(26,'Mercy Mission'),(27,'Outreach Organization'),(28,'Rescue Rangers'),(29,'Support Squad'),(30,'Kindness Krew'),(31,'Generosity Guild'),(32,'Hope Helpers'),(33,'Service Society'),(34,'Aid Advocates'),(35,'Benevolence Brigade'),(36,'Caring Community'),(37,'Philanthropy Force'),(38,'Humanity Helpers'),(39,'Selfless Supporters'),(40,'Giving Guild'),(41,'Altruism Advocates'),(42,'Volunteer Vanguard'),(43,'Empathy Experts'),(44,'Relief Responders'),(45,'Charity Circle'),(46,'Mercy Makers'),(47,'Outreach Officers'),(48,'Rescue Responders'),(49,'Supportive Society'),(50,'Kindness Keepers'),(51,'Generosity Group'),(52,'Hopeful Hearts'),(53,'Service Supporters'),(54,'Aid Angels'),(55,'Benevolent Brigade'),(56,'Caring Crew'),(57,'Philanthropy Pioneers'),(58,'Humanitarian Helpers'),(59,'Selfless Souls'),(60,'Giving Guardians'),(61,'Altruistic Advocates'),(62,'Volunteer Voices'),(63,'Empathy Enthusiasts'),(64,'Relief Responders'),(65,'Charity Champions'),(66,'Mercy Missionaries'),(67,'Outreach Officers'),(68,'Rescue Responders'),(69,'Supportive Squad'),(70,'Kindness Keepers'),(71,'Generosity Group'),(72,'Hopeful Helpers'),(73,'Service Stars'),(74,'Aid Advocates'),(75,'Benevolent Bunch'),(76,'Caring Collective'),(77,'Philanthropy Partners'),(78,'Humanitarian Heroes'),(79,'Selfless Society'),(80,'Giving Group'),(81,'Altruistic Association'),(82,'Volunteer Visionaries'),(83,'Empathy Ensemble'),(84,'Relief Rangers'),(85,'Charitable Circle'),(86,'Mercy Mission'),(87,'Outreach Organization'),(88,'Rescue Rangers'),(89,'Support Squad'),(90,'Kindness Krew'),(91,'Generosity Guild'),(92,'Hope Helpers'),(93,'Service Society'),(94,'Aid Advocates'),(95,'Benevolence Brigade'),(96,'Caring Community'),(97,'Philanthropy Force'),(98,'Humanity Helpers'),(99,'Selfless Supporters'),(100,'Giving Guild');
/*!40000 ALTER TABLE `volunteerorganization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteerorganization_has_volunteer`
--

DROP TABLE IF EXISTS `volunteerorganization_has_volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteerorganization_has_volunteer` (
  `VolOrgID` int unsigned NOT NULL,
  `VolunteerID` int unsigned NOT NULL,
  PRIMARY KEY (`VolOrgID`,`VolunteerID`),
  KEY `fk_VolunteerOrganization_has_Volunteer_Volunteer1_idx` (`VolunteerID`),
  KEY `fk_VolunteerOrganization_has_Volunteer_VolunteerOrganizatio_idx` (`VolOrgID`),
  CONSTRAINT `fk_VolunteerOrganization_has_Volunteer_Volunteer1` FOREIGN KEY (`VolunteerID`) REFERENCES `volunteer` (`VolunteerID`),
  CONSTRAINT `fk_VolunteerOrganization_has_Volunteer_VolunteerOrganization1` FOREIGN KEY (`VolOrgID`) REFERENCES `volunteerorganization` (`VolOrgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteerorganization_has_volunteer`
--

LOCK TABLES `volunteerorganization_has_volunteer` WRITE;
/*!40000 ALTER TABLE `volunteerorganization_has_volunteer` DISABLE KEYS */;
INSERT INTO `volunteerorganization_has_volunteer` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50),(51,51),(52,52),(53,53),(54,54),(55,55),(56,56),(57,57),(58,58),(59,59),(60,60),(61,61),(62,62),(63,63),(64,64),(65,65),(66,66),(67,67),(68,68),(69,69),(70,70),(71,71),(72,72),(73,73),(74,74),(75,75),(76,76),(77,77),(78,78),(79,79),(80,80),(81,81),(82,82),(83,83),(84,84),(85,85),(86,86),(87,87),(88,88),(89,89),(90,90),(91,91),(92,92),(93,93),(94,94),(95,95),(96,96),(97,97),(98,98),(99,99),(100,100);
/*!40000 ALTER TABLE `volunteerorganization_has_volunteer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'volunteerdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddNewVolunteerThroughVolunterOrg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `AddNewVolunteerThroughVolunterOrg`( 

    IN NewName VARCHAR(100), 
	
    IN NewPhoneNumber VARCHAR(30),
    
    IN NewAge TINYINT,
    
    IN volunteerOrgID INT, 

    OUT volunteerID INT 

)
BEGIN 

    INSERT INTO volunteer (Name, PhoneNumber, Age) 

    VALUES (NewName, NewPhoneNumber, NewAge); 

	SET volunteerID = LAST_INSERT_ID();
    
    INSERT INTO volunteerorganization_has_volunteer(VolOrgID, VolunteerID) 
    VALUES (volunteerOrgID, volunteerID); 
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

# SHOWING THE LIST OF ALL VOLUNTEERS IN THE EVENT GIVEN THE EVENTID
DROP PROCEDURE IF EXISTS ShowVolunteersAtEvent;
DELIMITER ;;
CREATE PROCEDURE `ShowVolunteersAtEvent`(IN event_id INT)
  BEGIN
  SELECT 'Showing All Volunteers for Event' AS message;
  SELECT * FROM volunteer JOIN ticket ON ticket.Event_EventID = event_id;
  END ;;
DELIMITER ;

# ADDING A NEW ORGANIZATION
DROP PROCEDURE IF EXISTS AddNewOrganization;
DELIMITER ;;
CREATE PROCEDURE `AddNewOrganization`(
    IN new_name VARCHAR(80),
    IN new_npoID INT UNSIGNED,
    IN new_email VARCHAR(100),
    IN new_phonenumber VARCHAR(30),
    IN new_areaID INT UNSIGNED,
    IN new_street VARCHAR(100),
    OUT new_orgID INT UNSIGNED)
	
BEGIN 
	IF EXISTS (
		SELECT 1 FROM npotype WHERE npotype.NPOTypeID = new_npoID
	) THEN
		-- NPOTypeID exists in npotype
        IF EXISTS (
			SELECT 1 FROM area WHERE area.AreaID = new_areaID
            )
        THEN
          INSERT INTO `organization` (Name, NPOTypeID, Email, PhoneNumber, AreaID, Street)
          VALUES (new_name, new_npoID, new_email, new_phonenumber, new_areaID, new_street);
          SELECT LAST_INSERT_ID() INTO new_orgID;
        ELSE
          SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'AreaID doesn\'t currently exist in database';
		END IF;
	ELSE
		-- NPOTypeID doesn't exist in npotype
        SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'NPOTypeID doesn\'t currently exist in database';
	END IF;
END ;;
DELIMITER ;

-- Dump completed on 2025-05-16 19:55:51
