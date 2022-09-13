-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: security
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `Client_ID` int NOT NULL,
  `Full_name` varchar(50) NOT NULL,
  `Date_of_birth` date NOT NULL,
  `Contact_phone` varchar(50) NOT NULL,
  `Passport_data` varchar(50) DEFAULT NULL,
  `Registration_address` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`Client_ID`),
  UNIQUE KEY `Contact_phone` (`Contact_phone`),
  UNIQUE KEY `Passport_data` (`Passport_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Иванов Иван Иванович','1999-11-23','+79651703550','6113875088','Улица Щорса, 7, 130'),(2,'Петров Игорь Васильевич','1995-08-25','+79651703551','6113875089','Улица Забайкальская, 8, 133'),(3,'Бузлов Станислав Игоревич','1996-12-02','+79651703552','6113875090','Улица Повторная, 9, 132'),(4,'Котов Сергей Анатольевич','1997-01-03','+79651703553','6113875091','Улица Ленина, 71, 131'),(5,'Серёгин Илья Андреевич','1998-10-26','+79651703554','6113875092','Улица Могэс, 72, 13');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts` (
  `Contract_ID` int NOT NULL,
  `License_number_ID` int DEFAULT NULL,
  `Client_ID` int DEFAULT NULL,
  `Date_of_conclusion` date NOT NULL,
  `Date_of_termination` date NOT NULL,
  `Service_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Contract_ID`),
  KEY `R_1` (`License_number_ID`),
  KEY `R_2` (`Client_ID`),
  CONSTRAINT `R_1` FOREIGN KEY (`License_number_ID`) REFERENCES `employees` (`License_number_ID`),
  CONSTRAINT `R_2` FOREIGN KEY (`Client_ID`) REFERENCES `clients` (`Client_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
INSERT INTO `contracts` VALUES (1,12578,1,'2005-01-20','2005-02-20','Затинная 5'),(2,12579,2,'2006-01-20','2007-01-20','Пожалостина 8'),(3,12576,3,'2008-01-20','2008-05-20','Ленина 15'),(4,12575,4,'2009-03-10','2010-03-10','Новая 8'),(5,12577,5,'2016-08-15','2017-09-15','Солнечная 29');
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `License_number_ID` int NOT NULL,
  `Full_name` varchar(50) NOT NULL,
  `Contact_phone` varchar(50) NOT NULL,
  `Work_experience` varchar(50) NOT NULL,
  `brigade_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`License_number_ID`),
  UNIQUE KEY `Contact_phone` (`Contact_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (12575,'Старков Станислав Иванович','+79661713559','15 лет','Вторая'),(12576,'Чудновец Святослав Иванович','+79661713558','7 лет','Вторая'),(12577,'Петров Евдоким Иванович','+79661713557','6 лет','Первая'),(12578,'Осин Вячеслав Иванович','+79661713555','10 лет','Первая'),(12579,'Нижегородцев Илья Иванович','+79661713556','5 лет','Первая');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incedents_and_violations`
--

DROP TABLE IF EXISTS `incedents_and_violations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incedents_and_violations` (
  `IaV_ID` int NOT NULL,
  `Contract_ID` int DEFAULT NULL,
  `Call_date` date NOT NULL,
  `Reason` varchar(50) NOT NULL,
  PRIMARY KEY (`IaV_ID`),
  KEY `R_3` (`Contract_ID`),
  CONSTRAINT `R_3` FOREIGN KEY (`Contract_ID`) REFERENCES `contracts` (`Contract_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incedents_and_violations`
--

LOCK TABLES `incedents_and_violations` WRITE;
/*!40000 ALTER TABLE `incedents_and_violations` DISABLE KEYS */;
INSERT INTO `incedents_and_violations` VALUES (1,1,'2005-01-21','Проникновение'),(2,2,'2006-01-21','Взлом'),(3,3,'2008-01-21','Кража'),(4,4,'2009-03-11','Проникновение'),(5,5,'2016-08-16','Проникновение');
/*!40000 ALTER TABLE `incedents_and_violations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_in_contracts`
--

DROP TABLE IF EXISTS `services_in_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_in_contracts` (
  `Contract_ID` int NOT NULL,
  `Service_ID` int NOT NULL,
  PRIMARY KEY (`Service_ID`,`Contract_ID`),
  KEY `R_4` (`Contract_ID`),
  CONSTRAINT `R_4` FOREIGN KEY (`Contract_ID`) REFERENCES `contracts` (`Contract_ID`),
  CONSTRAINT `R_5` FOREIGN KEY (`Service_ID`) REFERENCES `services_s` (`Service_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_in_contracts`
--

LOCK TABLES `services_in_contracts` WRITE;
/*!40000 ALTER TABLE `services_in_contracts` DISABLE KEYS */;
INSERT INTO `services_in_contracts` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `services_in_contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_s`
--

DROP TABLE IF EXISTS `services_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_s` (
  `Service_ID` int NOT NULL,
  `Service_s_name` varchar(50) NOT NULL,
  `Price_per_month` float DEFAULT NULL,
  PRIMARY KEY (`Service_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_s`
--

LOCK TABLES `services_s` WRITE;
/*!40000 ALTER TABLE `services_s` DISABLE KEYS */;
INSERT INTO `services_s` VALUES (1,'Охрана квартиры',5000),(2,'Охрана дома',6000),(3,'Охрана склада',7000),(4,'Охрана магазина',8000),(5,'Охрана торгового центра',9000);
/*!40000 ALTER TABLE `services_s` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-13 12:49:05
