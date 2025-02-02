-- MySQL dump 10.13  Distrib 9.0.1, for Win64 (x86_64)
--
-- Host: localhost    Database: pdo_app_db
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `car_brands`
--

DROP TABLE IF EXISTS `car_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_brands` (
  `id_brand` int NOT NULL COMMENT 'id ╨╖╨░╨┐╨╕╤Б╨╕',
  `brand` varchar(20) NOT NULL DEFAULT 'new_brand' COMMENT '╨Э╨░╨╕╨╝╨╡╨╜╨╛╨▓╨░╨╜╨╕╨╡ ╨╝╨░╤А╨║╨╕ ╨╝╨░╤И╨╕╨╜╤Л',
  PRIMARY KEY (`id_brand`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='╨Ь╨░╤А╨║╨╕ ╨╝╨░╤И╨╕╨╜';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_brands`
--

LOCK TABLES `car_brands` WRITE;
/*!40000 ALTER TABLE `car_brands` DISABLE KEYS */;
INSERT INTO `car_brands` VALUES (0,'none'),(1,'Audi'),(2,'BMW'),(3,'Volvo'),(4,'╨Т╨Р╨Ч'),(5,'Mazda');
/*!40000 ALTER TABLE `car_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_models`
--

DROP TABLE IF EXISTS `car_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_models` (
  `id_model` bigint NOT NULL COMMENT 'id ╨╖╨░╨┐╨╕╤Б╨╕',
  `id_brand` int NOT NULL DEFAULT '0' COMMENT '╨Ь╨░╤А╨║╨░ ╨╝╨░╤И╨╕╨╜╤Л (╨╕╨╖ car_brands)',
  `model` varchar(50) NOT NULL DEFAULT 'new model' COMMENT '╨Э╨░╨╕╨╝╨╡╨╜╨╛╨▓╨░╨╜╨╕╨╡ ╨╝╨╛╨┤╨╡╨╗╨╕',
  `start_production` date DEFAULT NULL COMMENT '╨Ф╨░╤В╨░ ╨╜╨░╤З╨░╨╗╨░ ╨┐╤А╨╛╨╕╨╖╨▓╨╛╨┤╤Б╤В╨▓╨░',
  `end_production` date DEFAULT NULL COMMENT '╨Ф╨░╤В╨░ ╨╛╨║╨╛╨╜╤З╨░╨╜╨╕╤П ╨┐╤А╨╛╨╕╨╖╨▓╨╛╨┤╤Б╤В╨▓╨░',
  `car_body_type` varchar(20) DEFAULT NULL COMMENT '╨в╨╕╨┐ ╨║╤Г╨╖╨╛╨▓╨░',
  `filename` varchar(100) DEFAULT NULL COMMENT '╨д╨░╨╣╨╗ ╨╕╨╖╨╛╨▒╤А╨░╨╢╨╡╨╜╨╕╤П ╨╝╨╛╨┤╨╡╨╗╨╕',
  PRIMARY KEY (`id_model`),
  KEY `car_models_id_brand_fk` (`id_brand`),
  CONSTRAINT `car_models_id_brand_fk` FOREIGN KEY (`id_brand`) REFERENCES `car_brands` (`id_brand`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='╨Ь╨╛╨┤╨╡╨╗╨╕ ╨╝╨░╤И╨╕╨╜';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_models`
--

LOCK TABLES `car_models` WRITE;
/*!40000 ALTER TABLE `car_models` DISABLE KEYS */;
INSERT INTO `car_models` VALUES (1,1,'A5','2007-01-01',NULL,'╨║╤Г╨┐╨╡',NULL),(2,2,'X3','2003-01-01',NULL,'╨║╤А╨╛╤Б╤Б╨╛╨▓╨╡╤А',NULL),(3,4,'2101','1970-04-19','1988-12-31','╤Б╨╡╨┤╨░╨╜',NULL),(4,3,'480','1986-01-01','1996-12-31','╤Е╤Н╤В╤З╨▒╨╡╨║',NULL);
/*!40000 ALTER TABLE `car_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_works`
--

DROP TABLE IF EXISTS `service_works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_works` (
  `id_work` bigint NOT NULL COMMENT 'id ╨╖╨░╨┐╨╕╤Б╨╕',
  `work_name` varchar(150) NOT NULL COMMENT '╨Э╨░╨╕╨╝╨╡╨╜╨╛╨▓╨░╨╜╨╕╨╡ ╤А╨░╨▒╨╛╤В╤Л',
  `work_cost` int NOT NULL COMMENT '╨б╤В╨╛╨╕╨╝╨╛╤Б╤В╤М ╤А╨░╨▒╨╛╤В╤Л (╤А╤Г╨▒.)',
  `work_duration` float NOT NULL COMMENT '╨Т╤А╨╡╨╝╤П ╨▓╤Л╨┐╨╛╨╗╨╜╨╡╨╜╨╕╤П ╤А╨░╨▒╨╛╤В╤Л (╤З.)',
  `id_model` bigint NOT NULL COMMENT '╨Ь╨╛╨┤╨╡╨╗╤М ╨╝╨░╤И╨╕╨╜╤Л (╨╕╨╖ car_models)',
  PRIMARY KEY (`id_work`),
  KEY `service_works_id_model_fk` (`id_model`),
  CONSTRAINT `service_works_id_model_fk` FOREIGN KEY (`id_model`) REFERENCES `car_models` (`id_model`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='╨Я╨╡╤А╨╡╤З╨╡╨╜╤М ╤А╨░╨▒╨╛╤В';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_works`
--

LOCK TABLES `service_works` WRITE;
/*!40000 ALTER TABLE `service_works` DISABLE KEYS */;
INSERT INTO `service_works` VALUES (1,'╨Ч╨░╨╝╨╡╨╜╨░ ╤В╨╛╤А╨╝╨╛╨╖╨╜╤Л╤Е ╨║╨╛╨╗╨╛╨┤╨╛╨║ ╨┐╨╡╤А╨╡╨┤╨╜╨╕╤Е',1500,0.5,1),(2,'╨Ч╨░╨╝╨╡╨╜╨░ ╤В╨╛╤А╨╝╨╛╨╖╨╜╤Л╤Е ╨║╨╛╨╗╨╛╨┤╨╛╨║ ╨╖╨░╨┤╨╜╨╕╤Е',1500,0.5,1),(3,'╨Ч╨░╨╝╨╡╨╜╨░ ╤В╨╛╤А╨╝╨╛╨╖╨╜╤Л╤Е ╨║╨╛╨╗╨╛╨┤╨╛╨║ ╨┐╨╡╤А╨╡╨┤╨╜╨╕╤Е',500,0.5,3),(4,'╨Ч╨░╨╝╨╡╨╜╨░ ╤В╨╛╤А╨╝╨╛╨╖╨╜╤Л╤Е ╨║╨╛╨╗╨╛╨┤╨╛╨║ ╨╖╨░╨┤╨╜╨╕╤Е',500,0.5,3),(5,'╨Ч╨░╨╝╨╡╨╜╨░ ╤В╨╛╤А╨╝╨╛╨╖╨╜╤Л╤Е ╨║╨╛╨╗╨╛╨┤╨╛╨║ ╨┐╨╡╤А╨╡╨┤╨╜╨╕╤Е',1900,1,2),(6,'╨Ч╨░╨╝╨╡╨╜╨░ ╤В╨╛╤А╨╝╨╛╨╖╨╜╤Л╤Е ╨║╨╛╨╗╨╛╨┤╨╛╨║ ╨╖╨░╨┤╨╜╨╕╤Е',1900,1,2);
/*!40000 ALTER TABLE `service_works` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-05 23:53:34
