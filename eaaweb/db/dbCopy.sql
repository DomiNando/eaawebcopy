-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: emergencyAssistantApp
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.12.04.1

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
-- Table structure for table `agency`
--

DROP TABLE IF EXISTS `agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agency` (
  `agencyPhoneNumber` varchar(15) DEFAULT NULL,
  `agencyName` varchar(50) DEFAULT NULL,
  `category` varchar(15) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency`
--

LOCK TABLES `agency` WRITE;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` VALUES ('7874510000','policia','police','Ponce','PR','PR'),('7871240000','grua','tow','Loiza','PR','PR'),('7879000000','bombero rincon','firefighter','Rincon','PR','PR'),('7873000000','salud','ambulance','Loiza','PR','PR'),('7873110000','bombero','firefighter','San Juan','PR','PR'),('7876660000','auxilio','ambulance','Guanica','PR','PR'),('7878887000','vida','ambulance','Corozal','PR','PR'),('7875300000','policia yauco','police','Ponce','PR','PR'),('7877858415','policia ponce','police','Ponce','PR','PR'),('7874110000','policia cabo rojo','police','Cabo Rojo','PR','PR'),('7877850000','medical','hospital','Ponce','PR','PR'),('9392188237','firefigther','firefighter','Mayaguez','PR','PR'),('7875500280','bombero','police','Mayaguez','PR','PR'),('7875001000','ambulancia','ambulance','Mayaguez','PR','PR'),('7873627434','vida hospital','hospital','Mayaguez','PR','PR'),('7877858414','health ambulance pr','ambulance','Cabo Rojo','PR','PR'),('7879006000','policia municipal','police','Las Marias','PR','PR'),('7879006001','policia estatal','police','Las Marias','PR','PR'),('7879006002','bombero municipal','firefighter','Las Marias','PR','PR'),('7879006003','bombero estatal','firefighter','Las Marias','PR','PR'),('7879006004','el gruero','tow','Las Marias','PR','PR'),('7879006005','mr. grua','tow','Las Marias','PR','PR'),('7879006006','jose grua','tow','Las Marias','PR','PR'),('7879006007','Remolque','tow','Las Marias','PR','PR'),('7879006008','auxilio','ambulance','Las Marias','PR','PR'),('7879006009','zocorro','ambulance','Las Marias','PR','PR'),('7879006010','Vida','hospital','Las Marias','PR','PR'),('7878006000','bombero estatal','firefighter','Mayaguez','PR','PR'),('7878006001','policia estatal','police','Mayaguez','PR','PR'),('7878006002','auxilio','ambulance','Mayaguez','PR','PR'),('7878006003','salud','hospital','Mayaguez','PR','PR'),('7877006000','policia estatal','police','Cabo Rojo','PR','PR'),('7877006001','bombero estatal','firefighter','Cabo Rojo','PR','PR'),('7877006002','bombero municipal','firefighter','Cabo Rojo','PR','PR'),('7877006003','auxilio','ambulance','Cabo Rojo','PR','PR'),('7877006004','grua','tow','Cabo Rojo','PR','PR'),('7876006000','policia estatal','police','Hormigueros','PR','PR');
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alternativeArea`
--

DROP TABLE IF EXISTS `alternativeArea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alternativeArea` (
  `agencyPhoneNumber` varchar(15) DEFAULT NULL,
  `altArea` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alternativeArea`
--

LOCK TABLES `alternativeArea` WRITE;
/*!40000 ALTER TABLE `alternativeArea` DISABLE KEYS */;
INSERT INTO `alternativeArea` VALUES ('7874510000','Ponce'),('7871240000','Loiza'),('7879000000','Rincon'),('7873000000','Loiza'),('7873110000','San Juan'),('7876660000','Guanica'),('7876660000','Culebra'),('7878887000','Corozal'),('7875300000','Ponce'),('7875300000','Yauco'),('7877858415','Ponce'),('7874110000','Cabo Rojo'),('7877850000','Ponce'),('9392188237','Mayaguez'),('7875500280','Mayaguez'),('7875001000','Mayaguez'),('7873627434','Mayaguez'),('7877858414','Cabo Rojo'),('7879006000','Las Marias'),('7879006001','Las Marias'),('7879006002','Las Marias'),('7879006003','Las Marias'),('7879006004','Las Marias'),('7879006005','Las Marias'),('7879006006','Las Marias'),('7879006007','Las Marias'),('7879006008','Las Marias'),('7879006009','Las Marias'),('7879006010','Las Marias'),('7878006000','Mayaguez'),('7878006001','Mayaguez'),('7878006002','Mayaguez'),('7878006003','Mayaguez'),('7877006000','Cabo Rojo'),('7877006001','Cabo Rojo'),('7877006002','Cabo Rojo'),('7877006003','Cabo Rojo'),('7877006004','Cabo Rojo'),('7876006000','Hormigueros');
/*!40000 ALTER TABLE `alternativeArea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alternativePhoneNumber`
--

DROP TABLE IF EXISTS `alternativePhoneNumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alternativePhoneNumber` (
  `agencyPhoneNumber` varchar(15) DEFAULT NULL,
  `altPhoneNumber` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alternativePhoneNumber`
--

LOCK TABLES `alternativePhoneNumber` WRITE;
/*!40000 ALTER TABLE `alternativePhoneNumber` DISABLE KEYS */;
INSERT INTO `alternativePhoneNumber` VALUES ('7874510000','7874510000'),('7871240000','7871240000'),('7879000000','7879000000'),('7873000000','7873000000'),('7873110000','7873110000'),('7876660000','7876660000'),('7876660000','7871140000'),('7878887000','7878887000'),('7875300000','7875300000'),('7875300000','7871160000'),('7877858415','7877858415'),('7874110000','7874110000'),('7877850000','7877850000'),('9392188237','9392188237'),('7875500280','7875500280'),('7875001000','7875001000'),('7873627434','7873627434'),('7877858414','7877858414'),('7879006000','7879006000'),('7879006001','7879006001'),('7879006002','7879006002'),('7879006003','7879006003'),('7879006004','7879006004'),('7879006005','7879006005'),('7879006006','7879006006'),('7879006007','7879006007'),('7879006008','7879006008'),('7879006009','7879006009'),('7879006010','7879006010'),('7878006000','7878006000'),('7878006001','7878006001'),('7878006002','7878006002'),('7878006003','7878006003'),('7877006000','7877006000'),('7877006001','7877006001'),('7877006002','7877006002'),('7877006003','7877006003'),('7877006004','7877006004'),('7876006000','7876006000');
/*!40000 ALTER TABLE `alternativePhoneNumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordinate`
--

DROP TABLE IF EXISTS `coordinate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordinate` (
  `agencyPhoneNumber` varchar(15) DEFAULT NULL,
  `latitude` varchar(15) DEFAULT NULL,
  `longitude` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinate`
--

LOCK TABLES `coordinate` WRITE;
/*!40000 ALTER TABLE `coordinate` DISABLE KEYS */;
INSERT INTO `coordinate` VALUES ('7877850000','18.1986809','-67.1492462'),('7873627434','18.1986809','-67.1492462'),('7879006010','18.2584042','-66.9857079'),('7878006003','18.2030837','-67.1412245');
/*!40000 ALTER TABLE `coordinate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deviceAccount`
--

DROP TABLE IF EXISTS `deviceAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deviceAccount` (
  `clientPhoneNumber` varchar(15) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `latitude` varchar(15) DEFAULT NULL,
  `longitude` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deviceAccount`
--

LOCK TABLES `deviceAccount` WRITE;
/*!40000 ALTER TABLE `deviceAccount` DISABLE KEYS */;
INSERT INTO `deviceAccount` VALUES ('100','pedro','18.4500','-66.0667'),('150','JORGE','18.4500','-66.0667'),('7879008000','LUIS','18.2011','-67.1397'),('333','pil','18.4500','-66.0667'),('854','pali','18.4500','-66.0667'),('7879006000','kola','18.4500','-66.0667'),('7879009000','kilo','18.4500','-66.0667'),('7879007000','pilo','18.2011','-67.1397'),('7874729078','carlos','3','4'),('7875008000','marco','18.0867','-67.1458');
/*!40000 ALTER TABLE `deviceAccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergencyData`
--

DROP TABLE IF EXISTS `emergencyData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emergencyData` (
  `clientPhoneNumber` varchar(15) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `resolved` varchar(5) DEFAULT NULL,
  `emergencyType` varchar(50) DEFAULT NULL,
  `emergencyDetails` text,
  `clientName` varchar(50) DEFAULT NULL,
  `clientAddress` varchar(1000) DEFAULT NULL,
  `latitude` varchar(15) DEFAULT NULL,
  `longitude` varchar(15) DEFAULT NULL,
  `outsideHome` varchar(15) DEFAULT NULL,
  `agencyPhoneNumber` varchar(15) DEFAULT NULL,
  `attendedBy` varchar(30) DEFAULT NULL,
  `timeCompleted` datetime DEFAULT NULL,
  `timeElapsed` varchar(50) DEFAULT NULL,
  `hasApplication` varchar(5) DEFAULT NULL,
  `onRelay` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergencyData`
--

LOCK TABLES `emergencyData` WRITE;
/*!40000 ALTER TABLE `emergencyData` DISABLE KEYS */;
INSERT INTO `emergencyData` VALUES ('967','2013-10-18 00:00:00','no','kill','no podemos','manuel','capetillo','18.2400','-67.1387','yes','7877858415','milky','0000-00-00 00:00:00','34','yes','no'),('301','2013-10-17 12:15:10','yes','crash','no podemos','manuel','capetillo','18.2400','-67.1387','yes','7877858415','jack','0000-00-00 00:00:00','15','yes','no'),('933','2013-10-17 12:15:10','yes','kill','no podemos','manuel','capetillo','18.2400','-67.1387','no','9392188237','milky','0000-00-00 00:00:00','30','no','no'),('7873003000','2013-10-20 12:15:00','yes','crash','no podemos','manuel','capetillo','18.2400','-67.1387','yes','9392188237','pedro','0000-00-00 00:00:00','45','yes','yes'),('7874729078','2013-10-20 12:15:00','yes','crash','accidente','jose','alturas','18.2400','-67.1387','yes','9392188237','pedro','2013-10-20 12:30:00','15','yes','no'),('5006003000','2013-11-22 12:18:34','yes',NULL,'a','a','a','','','yes','9392188237','a','2013-11-22 12:18:41','0','no','no');
/*!40000 ALTER TABLE `emergencyData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferDetail`
--

DROP TABLE IF EXISTS `transferDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transferDetail` (
  `clientPhoneNumber` varchar(15) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `reason` varchar(1000) DEFAULT NULL,
  `oldAgencyPhoneNumber` varchar(15) DEFAULT NULL,
  `newAgencyPhoneNumber` varchar(15) DEFAULT NULL,
  `onRelay` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferDetail`
--

LOCK TABLES `transferDetail` WRITE;
/*!40000 ALTER TABLE `transferDetail` DISABLE KEYS */;
INSERT INTO `transferDetail` VALUES ('967','2013-10-18 00:00:00','no podemos','805','954','no'),('301','2013-10-17 12:15:10','no podemos','872','982','no'),('933','2013-10-17 12:15:10','no podemos','220','551','no'),('7873003000','2013-10-20 12:15:00','no podemos','111','666','yes'),('7871001000','2013-11-21 12:27:13','d','9392188237','8','yes');
/*!40000 ALTER TABLE `transferDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userAccount`
--

DROP TABLE IF EXISTS `userAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userAccount` (
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `agencyPhoneNumber` varchar(30) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userAccount`
--

LOCK TABLES `userAccount` WRITE;
/*!40000 ALTER TABLE `userAccount` DISABLE KEYS */;
INSERT INTO `userAccount` VALUES ('label','l','label@gmail.com','employee','7877858414','black'),('milky','m','milky@mail.com','employee','7877858415','chocolate'),('jack','c','jack@mail.com','employee','7877858415','jack'),('dollar','b','mon@mail.com','employee','9392188237','money'),('pedro','p','pedro@mail.com','employee','9392188237','pedro'),('admin','admin','admin@mail.com','admin','0','admin'),('lechoso','l','lechoso@mail.com','employee','7877858414','azucar');
/*!40000 ALTER TABLE `userAccount` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-25 18:36:01
