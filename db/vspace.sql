-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: vspace
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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer` (
  `oid` int NOT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `qid` int DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FKk7nkgv6e57qybj4mi1i49cuw8` (`qid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (42,'Car',41),(43,'Bus',41),(44,'Train',41),(45,'Ship',41),(47,'Car',46),(48,'Bus',46),(49,'Train',46),(50,'Plane',46),(53,'Car',52),(54,'Bus',52),(55,'Train',52),(56,'Ship',52),(60,'Car',59),(61,'Bus',59),(62,'Train',59),(63,'Ship',59),(66,'Car',65),(67,'Bus',65),(68,'Train',65),(69,'Ship',65),(71,'Car',70),(72,'Bus',70),(73,'Train',70),(74,'Ship',70),(76,'Car',75),(77,'Bus',75),(78,'Train',75),(79,'Ship',75),(85,'Car',84),(86,'Bus',84),(87,'Train',84),(88,'Ship',84),(90,'Car',89),(91,'Bus',89),(92,'Train',89),(93,'Ship',89),(96,'Car',95),(97,'Bus',95),(98,'Train',95),(99,'Ship',95),(101,'Car',100),(102,'Bus',100),(103,'Train',100),(104,'Ship',100),(107,'Car',106),(108,'Bus',106),(109,'Train',106),(110,'Ship',106),(112,'Car',111),(113,'Bus',111),(114,'Train',111),(115,'Ship',111),(118,'Car',117),(119,'Bus',117),(120,'Train',117),(121,'Ship',117),(123,'Car',122),(124,'Bus',122),(125,'Train',122),(126,'Ship',122),(128,'Car',127),(129,'Bus',127),(130,'Train',127),(131,'Ship',127);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (132);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participation`
--

DROP TABLE IF EXISTS `participation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participation` (
  `tid` int NOT NULL,
  `uid` int NOT NULL,
  `last_attempted` int NOT NULL,
  `score` int NOT NULL,
  `totalQn` int NOT NULL,
  `paymentDone` bit(1) NOT NULL,
  PRIMARY KEY (`tid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participation`
--

LOCK TABLES `participation` WRITE;
/*!40000 ALTER TABLE `participation` DISABLE KEYS */;
INSERT INTO `participation` VALUES (40,1,2,4,2,_binary '\0'),(51,1,1,5,1,_binary '\0'),(58,1,1,10,1,_binary ''),(57,80,3,3,3,_binary '\0'),(57,1,3,2,3,_binary '\0'),(57,81,3,0,3,_binary '\0'),(58,80,1,10,1,_binary ''),(83,1,2,2,2,_binary ''),(94,1,2,2,2,_binary ''),(116,1,0,0,3,_binary '\0'),(94,80,2,2,2,_binary '');
/*!40000 ALTER TABLE `participation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `qid` int NOT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `mark` int NOT NULL,
  `qtext` varchar(255) DEFAULT NULL,
  `tid` int DEFAULT NULL,
  `idx` int NOT NULL,
  PRIMARY KEY (`qid`),
  KEY `FKoxiu71lxgvyty9kc11pnli36g` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (41,'Ship',2,'Odd one out',40,1),(46,'Plane',2,'Odd One out',40,2),(52,'Ship',5,'Odd one out',51,1),(59,'Ship',10,'Odd one out',58,1),(65,'Ship',1,'q1',57,1),(70,'Ship',1,'q2',57,2),(75,'Ship',1,'Q3',57,3),(84,'Ship',1,'Odd one out',83,1),(89,'Ship',1,'Odd one out',83,2),(95,'Ship',1,'Odd one out',94,1),(100,'Ship',1,'Odd one out',94,2),(106,'Car',1,'Odd one out ',105,0),(111,'Ship',1,'Odd one out',105,0),(117,'Ship',1,'Odd one out',116,1),(122,'Ship',1,'Odd one out',116,2),(127,'Ship',1,'Odd one out',116,3);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result` (
  `tid` int NOT NULL,
  `uid` int NOT NULL,
  `total` int NOT NULL,
  PRIMARY KEY (`tid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission`
--

DROP TABLE IF EXISTS `submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission` (
  `qid` int NOT NULL,
  `tid` int NOT NULL,
  `uid` int NOT NULL,
  `choice` varchar(255) DEFAULT NULL,
  `mark` int NOT NULL,
  `rightanswer` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`qid`,`tid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission`
--

LOCK TABLES `submission` WRITE;
/*!40000 ALTER TABLE `submission` DISABLE KEYS */;
INSERT INTO `submission` VALUES (41,40,1,'Ship',2,'Ship','correct'),(46,40,1,'Plane',2,'Plane','correct'),(59,58,1,'Ship',10,'Ship','correct'),(65,57,80,'Ship',1,'Ship','correct'),(70,57,80,'Ship',1,'Ship','correct'),(75,57,80,'Ship',1,'Ship','correct'),(65,57,1,'Car',0,'Ship','wrong'),(70,57,1,'Ship',1,'Ship','correct'),(75,57,1,'Ship',1,'Ship','correct'),(65,57,81,'Car',0,'Ship','wrong'),(70,57,81,'Car',0,'Ship','wrong'),(75,57,81,'Car',0,'Ship','wrong'),(59,58,80,'Ship',10,'Ship','correct'),(52,51,1,'Ship',5,'Ship','correct'),(84,83,1,'Ship',1,'Ship','correct'),(89,83,1,'Ship',1,'Ship','correct'),(95,94,1,'Ship',1,'Ship','correct'),(100,94,1,'Ship',1,'Ship','correct'),(95,94,80,'Ship',1,'Ship','correct'),(100,94,80,'Ship',1,'Ship','correct');
/*!40000 ALTER TABLE `submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submissions` (
  `qid` int NOT NULL,
  `tid` int NOT NULL,
  `uid` int NOT NULL,
  `choice` varchar(255) DEFAULT NULL,
  `mark` int NOT NULL,
  `rightanswer` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`qid`,`tid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `tid` int NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `duration` float NOT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL,
  `totalMarks` int NOT NULL,
  `amount` int NOT NULL,
  `needPayment` bit(1) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (40,'2021-12-07',1,'16:54','end','Kec Test',4,0,_binary '\0'),(51,'2021-12-07',3,'06:58','end','RMK',5,0,_binary '\0'),(57,'2021-12-08',2,'11:17','end','Velamal',3,0,_binary '\0'),(58,'2021-12-08',1,'03:18','end','Sri Krish',10,100,_binary ''),(116,'2021-12-14',1,'18:00','start','GCT - 2022',3,0,_binary '\0'),(83,'2021-12-10',1,'13:04','start','PSG',2,500,_binary ''),(94,'2021-12-10',1,'16:44','start','CIT-2020',2,500,_binary ''),(105,'2021-12-14',1,'18:00','edit','Bannari - 2022',0,100,_binary '');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `uid` int NOT NULL,
  `claim` varchar(255) DEFAULT NULL,
  `emailVerified` bit(1) NOT NULL,
  `emailid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `last_attempted` int NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user',_binary '\0','yashwanthkkn@gmail.com','Yashwanth','$2a$10$dgYgzsK2rNAXfTjqIww2GettHwiTCDjQ519SEZNS592TadzdaIwv6',0),(64,'admin',_binary '\0','admin@gmail.com','admin','$2a$10$4ecF58Oebt63Z.R817104u41kxZRu1gH0i8dLGOgyXbVbWpTghx7O',0),(80,'user',_binary '\0','raagav@gmail.com','Raag','$2a$10$fn37JLTfQUWY6L6A8kz2SeIUAOCwiRvJIbxGZAqemMirjU4meizr2',0),(81,'user',_binary '\0','vasanth@gmail.com','Vsanth','$2a$10$XpA2cjZcbsvJNR1n6hJITusTEcdTxXfcLgAxoat8WTDrPtGOJutQq',0),(82,'user',_binary '\0','kumar@gmail.com','Kumar','$2a$10$zHHqaIjwpujetda9/Dn7Keyi5FiOfkH4lNHyVqrczh2JJTw9wvQ/.',0);
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

-- Dump completed on 2021-12-14 20:38:09
