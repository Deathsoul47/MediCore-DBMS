CREATE DATABASE  IF NOT EXISTS `hospital_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital_management`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_management
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
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `patient_id` varchar(10) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  `insurance_provider` varchar(100) DEFAULT NULL,
  `insurance_number` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES ('P001','David','Williams','F','1955-06-04','6939585183','789 Pine Rd','2022-06-23','WellnessCorp','INS840674','david.williams@mail.com'),('P002','Emily','Smith','F','1984-10-12','8228188767','321 Maple Dr','2022-01-15','PulseSecure','INS354079','emily.smith@mail.com'),('P003','Laura','Jones','M','1977-08-21','8397029847','321 Maple Dr','2022-02-07','PulseSecure','INS650929','laura.jones@mail.com'),('P004','Michael','Johnson','F','1981-02-20','9019443432','123 Elm St','2021-03-02','HealthIndia','INS789944','michael.johnson@mail.com'),('P005','David','Wilson','M','1960-06-23','7734463155','123 Elm St','2021-09-29','MedCare Plus','INS788105','david.wilson@mail.com'),('P006','Linda','Jones','M','1963-06-16','7561777264','321 Maple Dr','2022-10-02','HealthIndia','INS613758','linda.jones@mail.com'),('P007','Alex','Johnson','F','1989-06-08','6278710077','789 Pine Rd','2021-12-25','MedCare Plus','INS465890','alex.johnson@mail.com'),('P008','David','Davis','F','1976-07-05','7090558393','456 Oak Ave','2021-05-25','WellnessCorp','INS545101','david.davis@mail.com'),('P009','Laura','Davis','M','1971-12-11','7060324619','321 Maple Dr','2022-09-18','PulseSecure','INS136631','laura.davis@mail.com'),('P010','Michael','Taylor','M','2001-10-13','7081396733','123 Elm St','2022-08-24','WellnessCorp','INS866577','michael.taylor@mail.com'),('P011','Emily','Jones','F','1966-12-04','8990604070','789 Pine Rd','2022-09-27','MedCare Plus','INS172991','emily.jones@mail.com'),('P012','Laura','Davis','F','1991-12-08','8135666049','321 Maple Dr','2023-04-27','MedCare Plus','INS104014','laura.davis@mail.com'),('P013','Laura','Johnson','F','1990-03-28','9059178882','321 Maple Dr','2021-12-23','WellnessCorp','INS373237','laura.johnson@mail.com'),('P014','Alex','Taylor','M','1968-02-27','7292262512','789 Pine Rd','2023-12-12','MedCare Plus','INS118070','alex.taylor@mail.com'),('P015','Sarah','Johnson','M','1964-05-11','6636028516','321 Maple Dr','2021-09-25','WellnessCorp','INS922209','sarah.johnson@mail.com'),('P016','Michael','Taylor','M','2000-07-22','7223380592','789 Pine Rd','2021-07-23','PulseSecure','INS156958','michael.taylor@mail.com'),('P017','Jane','Jones','M','1991-05-01','6158428240','456 Oak Ave','2022-09-26','WellnessCorp','INS182074','jane.jones@mail.com'),('P018','Laura','Wilson','M','1979-09-24','7145815738','789 Pine Rd','2022-09-23','PulseSecure','INS635017','laura.wilson@mail.com'),('P019','Sarah','Miller','M','1975-05-24','8618058864','789 Pine Rd','2023-06-24','WellnessCorp','INS855073','sarah.miller@mail.com'),('P020','Jane','Moore','F','2003-06-06','8158989953','789 Pine Rd','2022-04-03','MedCare Plus','INS276089','jane.moore@mail.com'),('P021','Michael','Wilson','M','2002-03-01','7765390555','321 Maple Dr','2022-01-19','WellnessCorp','INS297392','michael.wilson@mail.com'),('P022','John','Brown','M','1955-05-10','6221099573','321 Maple Dr','2021-05-11','MedCare Plus','INS258823','john.brown@mail.com'),('P023','Linda','Johnson','M','1994-02-22','6141951830','789 Pine Rd','2021-12-27','WellnessCorp','INS730152','linda.johnson@mail.com'),('P024','Sarah','Brown','F','1991-11-04','7196777444','321 Maple Dr','2021-09-02','WellnessCorp','INS493002','sarah.brown@mail.com'),('P025','Robert','Wilson','M','1966-08-14','7482069727','123 Elm St','2021-09-09','HealthIndia','INS833429','robert.wilson@mail.com'),('P026','John','Taylor','M','2003-11-28','9900972256','123 Elm St','2021-05-13','MedCare Plus','INS598863','john.taylor@mail.com'),('P027','Linda','Moore','F','1998-06-29','8724518272','321 Maple Dr','2021-08-15','HealthIndia','INS467654','linda.moore@mail.com'),('P028','Alex','Moore','M','1993-04-13','7028910482','321 Maple Dr','2023-05-20','MedCare Plus','INS679036','alex.moore@mail.com'),('P029','David','Smith','M','2005-05-15','8923607677','789 Pine Rd','2023-04-19','HealthIndia','INS630089','david.smith@mail.com'),('P030','Emily','Moore','M','1964-12-23','6622318721','456 Oak Ave','2021-08-07','PulseSecure','INS250262','emily.moore@mail.com'),('P031','Robert','Miller','M','1987-01-14','8280346676','321 Maple Dr','2022-06-28','WellnessCorp','INS542905','robert.miller@mail.com'),('P032','Alex','Moore','M','1981-01-08','8102183595','123 Elm St','2021-10-02','MedCare Plus','INS335362','alex.moore@mail.com'),('P033','Michael','Wilson','F','1970-02-06','7923214041','789 Pine Rd','2023-09-06','MedCare Plus','INS544209','michael.wilson@mail.com'),('P034','Alex','Smith','F','1950-01-26','8374657733','321 Maple Dr','2023-06-18','WellnessCorp','INS653880','alex.smith@mail.com'),('P035','David','Wilson','F','1993-04-13','7039619487','123 Elm St','2023-07-09','MedCare Plus','INS897079','david.wilson@mail.com'),('P036','Michael','Wilson','M','1997-12-26','8545613046','123 Elm St','2022-10-04','MedCare Plus','INS764076','michael.wilson@mail.com'),('P037','Robert','Williams','M','1999-02-05','8886800195','456 Oak Ave','2021-09-30','HealthIndia','INS319963','robert.williams@mail.com'),('P038','David','Smith','M','1991-06-25','6347262390','789 Pine Rd','2021-04-19','MedCare Plus','INS580761','david.smith@mail.com'),('P039','Jane','Wilson','F','1950-12-12','9271131338','789 Pine Rd','2021-03-09','PulseSecure','INS348710','jane.wilson@mail.com'),('P040','Emily','Williams','M','1972-05-30','7587653815','456 Oak Ave','2021-10-16','PulseSecure','INS320984','emily.williams@mail.com'),('P041','Robert','Williams','M','1951-06-19','7020645498','456 Oak Ave','2022-07-16','WellnessCorp','INS997059','robert.williams@mail.com'),('P042','Jane','Smith','F','1954-08-22','7040069008','789 Pine Rd','2022-03-15','MedCare Plus','INS956748','jane.smith@mail.com'),('P043','Linda','Brown','M','1980-03-25','9127665406','789 Pine Rd','2022-07-18','WellnessCorp','INS882355','linda.brown@mail.com'),('P044','Robert','Taylor','F','1976-03-11','9449458981','321 Maple Dr','2023-01-26','PulseSecure','INS364512','robert.taylor@mail.com'),('P045','Linda','Miller','F','1966-04-25','7579616535','321 Maple Dr','2021-01-23','MedCare Plus','INS701863','linda.miller@mail.com'),('P046','Michael','Taylor','F','1986-09-01','8019925828','456 Oak Ave','2021-07-31','MedCare Plus','INS368799','michael.taylor@mail.com'),('P047','Jane','Moore','M','1995-12-13','8715732851','321 Maple Dr','2022-05-20','WellnessCorp','INS337549','jane.moore@mail.com'),('P048','Emily','Miller','M','1983-03-24','8720989381','123 Elm St','2023-06-19','PulseSecure','INS694319','emily.miller@mail.com'),('P049','David','Moore','M','1972-11-26','7712937941','321 Maple Dr','2023-06-14','MedCare Plus','INS584299','david.moore@mail.com'),('P050','Laura','Wilson','M','1993-12-27','8301134730','321 Maple Dr','2023-04-28','WellnessCorp','INS712210','laura.wilson@mail.com');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-01 23:06:36
