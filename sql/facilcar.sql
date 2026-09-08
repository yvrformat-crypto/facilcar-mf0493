CREATE DATABASE  IF NOT EXISTS `facilcar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `facilcar`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: alquicar
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `alquiler_vehiculos`
--

DROP TABLE IF EXISTS `alquiler_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alquiler_vehiculos` (
  `id_alquiler` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_vehiculo` int NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_reserva` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_alquiler`),
  KEY `fk_cliente_alquiler_idx` (`id_cliente`),
  KEY `fk_vehiculos_alquiler_idx` (`id_vehiculo`),
  CONSTRAINT `fk_cliente_alquiler` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON UPDATE CASCADE,
  CONSTRAINT `fk_vehiculos_alquiler` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquiler_vehiculos`
--

LOCK TABLES `alquiler_vehiculos` WRITE;
/*!40000 ALTER TABLE `alquiler_vehiculos` DISABLE KEYS */;
INSERT INTO `alquiler_vehiculos` VALUES (1,1,1,'2024-08-29','2024-12-03','2024-10-28 18:01:38'),(2,2,3,'2024-10-29','2024-11-15','2024-10-28 18:03:51'),(3,1,3,'2024-10-16','2024-10-26','2024-10-28 18:03:51'),(4,1,3,'2024-10-18','2024-10-31','2024-10-29 18:35:49'),(5,2,1,'2024-11-01','2024-11-10','2024-10-29 18:39:55'),(6,2,3,'2024-11-30','2024-12-29','2024-10-30 19:11:35'),(7,2,3,'2024-11-28','2024-11-29','2024-10-31 22:57:41'),(8,2,3,'2024-11-28','2024-11-29','2024-10-31 22:57:47');
/*!40000 ALTER TABLE `alquiler_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `alquileres`
--

DROP TABLE IF EXISTS `alquileres`;
/*!50001 DROP VIEW IF EXISTS `alquileres`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `alquileres` AS SELECT 
 1 AS `nombre_cliente`,
 1 AS `apellido_cliente`,
 1 AS `edad`,
 1 AS `Cantidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(25) NOT NULL,
  `apellido_cliente` varchar(50) NOT NULL,
  `carnet_cond` varchar(20) DEFAULT NULL,
  `edad` int NOT NULL,
  `id_pais` int DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  CONSTRAINT `chk_edad` CHECK ((`edad` >= 18))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Bill','Jones','12345678',25,3),(2,'Mary','Smith','23456789',18,3),(3,'Mike','Tyson','9876',37,3),(4,'Elon','Bezos','123456',30,3),(5,'Pablo','Picasso','abcd',60,1),(6,'Roger','Federer','abcd',60,4);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `facturacion`
--

DROP TABLE IF EXISTS `facturacion`;
/*!50001 DROP VIEW IF EXISTS `facturacion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `facturacion` AS SELECT 
 1 AS `cliente`,
 1 AS `inicio`,
 1 AS `fin`,
 1 AS `importe`,
 1 AS `marca`,
 1 AS `modelo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `id_pais` int NOT NULL AUTO_INCREMENT,
  `pais` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'España'),(2,'Francia'),(3,'Italia'),(4,'Suiza');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculos` (
  `id_vehiculo` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(20) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `tipo` enum('Moto','Turismo','Furgoneta') NOT NULL,
  `numero_puertas` int DEFAULT NULL,
  `automatico` tinyint DEFAULT NULL,
  `plazas` int DEFAULT NULL,
  `precio_dia` decimal(10,0) DEFAULT NULL,
  `stock` int DEFAULT '1',
  PRIMARY KEY (`id_vehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
INSERT INTO `vehiculos` VALUES (1,'Seat','Toledo','Turismo',5,0,5,100,1),(2,'Seat','Ibiza','Turismo',4,0,5,60,1),(3,'Opel','Corsa','Turismo',5,1,5,80,2);
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `alquileres`
--

/*!50001 DROP VIEW IF EXISTS `alquileres`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alquileres` AS select `c`.`nombre_cliente` AS `nombre_cliente`,`c`.`apellido_cliente` AS `apellido_cliente`,`c`.`edad` AS `edad`,count(`av`.`id_cliente`) AS `Cantidad` from (`clientes` `c` join `alquiler_vehiculos` `av` on((`c`.`id_cliente` = `av`.`id_cliente`))) group by `av`.`id_cliente` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `facturacion`
--

/*!50001 DROP VIEW IF EXISTS `facturacion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `facturacion` AS select concat_ws(' ',`c`.`nombre_cliente`,`c`.`apellido_cliente`) AS `cliente`,`av`.`fecha_inicio` AS `inicio`,`av`.`fecha_fin` AS `fin`,(`v`.`precio_dia` * ((to_days(`av`.`fecha_fin`) - to_days(`av`.`fecha_inicio`)) + 1)) AS `importe`,`v`.`marca` AS `marca`,`v`.`modelo` AS `modelo` from ((`clientes` `c` join `alquiler_vehiculos` `av` on((`c`.`id_cliente` = `av`.`id_cliente`))) join `vehiculos` `v` on((`av`.`id_vehiculo` = `v`.`id_vehiculo`))) order by `av`.`fecha_inicio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-06 16:10:02
