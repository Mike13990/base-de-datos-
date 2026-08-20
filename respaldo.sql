-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ventas_perfumes
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Ana Lucia Fernandez','+502 5555-0101','ana.fernandez@email.com'),(2,'Carlos Roberto Mendez','+502 5555-0102','carlos.mendez@email.com'),(3,'Sofia Castillo','+502 5555-0103','sofia.castillo@email.com'),(4,'Diego Alejandro Ruiz','+502 5555-0104','diego.ruiz@email.com'),(5,'Maria Rene Salazar','+502 5555-0105','maria.salazar@email.com'),(6,'Jorge Escobar','+502 5555-0106','jorge.escobar@email.com'),(7,'Lucia Monterroso','+502 5555-0107','lucia.monterroso@email.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_ventas`
--

DROP TABLE IF EXISTS `detalle_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_ventas` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_historico` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) GENERATED ALWAYS AS ((`cantidad` * `precio_historico`)) STORED,
  PRIMARY KEY (`id_detalle`),
  KEY `fk_detalle_venta` (`id_venta`),
  KEY `fk_detalle_producto` (`id_producto`),
  CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON UPDATE CASCADE,
  CONSTRAINT `fk_detalle_venta` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE CASCADE,
  CONSTRAINT `detalle_ventas_chk_1` CHECK ((`cantidad` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ventas`
--

LOCK TABLES `detalle_ventas` WRITE;
/*!40000 ALTER TABLE `detalle_ventas` DISABLE KEYS */;
INSERT INTO `detalle_ventas` (`id_detalle`, `id_venta`, `id_producto`, `cantidad`, `precio_historico`) VALUES (1,1,1,1,125.00),(2,2,2,2,110.00),(3,3,3,1,145.00),(4,4,4,2,25.00),(5,5,6,1,160.00),(6,5,5,1,18.50),(7,6,6,2,160.00),(8,7,7,1,35.00);
/*!40000 ALTER TABLE `detalle_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `codigo_sku` varchar(20) NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `tipo` enum('Perfume','Locion') NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `stock_disponible` int NOT NULL,
  `url_imagen` varchar(255) NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `codigo_sku` (`codigo_sku`),
  CONSTRAINT `productos_chk_1` CHECK ((`stock_disponible` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'PRF-CH-001','Carolina Herrera Good Girl 80ml','Perfume',125.00,15,'https://img.olores.com/ch-goodgirl.jpg'),(2,'PRF-PR-002','Paco Rabanne 1 Million 100ml','Perfume',110.00,20,'https://img.olores.com/pr-1million.jpg'),(3,'PRF-CD-003','Dior Sauvage Eau de Parfum 100ml','Perfume',145.00,10,'https://img.olores.com/cd-sauvage.jpg'),(4,'LOC-VS-001','Victoria\'s Secret Love Spell Body Mist','Locion',25.00,50,'https://img.olores.com/vs-lovespell.jpg'),(5,'LOC-BB-002','Bath & Body Works A Thousand Wishes','Locion',18.50,45,'https://img.olores.com/bbw-wishes.jpg'),(6,'PRF-CH-004','Chanel No. 5 Eau de Parfum 50ml','Perfume',160.00,5,'https://img.olores.com/ch-no5.jpg'),(7,'LOC-CC-003','Clinique Happy Body Cream','Locion',35.00,30,'https://img.olores.com/cc-happy.jpg');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `id_vendedor` int NOT NULL AUTO_INCREMENT,
  `documento_identidad` varchar(20) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `zona_asignada` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `fecha_contratacion` date NOT NULL,
  PRIMARY KEY (`id_vendedor`),
  UNIQUE KEY `documento_identidad` (`documento_identidad`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,'1234567890101','Mario','Gomez','Zona 10 y Carretera','+502 4444-1001','2022-03-15'),(2,'2345678900101','Elena','Morales','Zona 1','+502 4444-1002','2021-11-01'),(3,'3456789010101','Luis','Perez','Zona 14 y 15','+502 4444-1003','2023-01-20'),(4,'4567890120101','Carmen','Velasquez','Antigua Guatemala','+502 4444-1004','2020-08-10'),(5,'5678901230101','Roberto','Diaz','Zona 4 y 9','+502 4444-1005','2022-06-05'),(6,'6789012340101','Patricia','Luna','Xela Centro','+502 4444-1006','2023-09-12'),(7,'7890123450101','Miguel','Rojas','San Cristobal','+502 4444-1007','2019-02-25');
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_vendedor` int NOT NULL,
  `fecha_venta` datetime DEFAULT CURRENT_TIMESTAMP,
  `total_venta` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_venta_cliente` (`id_cliente`),
  KEY `fk_venta_vendedor` (`id_vendedor`),
  CONSTRAINT `fk_venta_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON UPDATE CASCADE,
  CONSTRAINT `fk_venta_vendedor` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id_vendedor`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,2,'2023-10-25 10:30:00',125.00),(2,2,1,'2023-10-26 14:15:00',220.00),(3,3,3,'2023-10-26 16:45:00',145.00),(4,4,5,'2023-10-27 09:20:00',50.00),(5,5,4,'2023-10-28 11:10:00',178.50),(6,6,7,'2023-10-28 15:30:00',320.00),(7,7,6,'2023-10-29 18:05:00',35.00);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-20  4:16:53
