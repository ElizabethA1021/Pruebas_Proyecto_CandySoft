CREATE DATABASE  IF NOT EXISTS `candysoftapi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `candysoftapi`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: candysoftapi
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `abastecimiento_abastecimiento`
--

DROP TABLE IF EXISTS `abastecimiento_abastecimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abastecimiento_abastecimiento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `manicurista_id_id` bigint(20) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_reporte` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abastecimiento_abast_manicurista_id_id_d56c54fe_fk_usuario_m` (`manicurista_id_id`),
  CONSTRAINT `abastecimiento_abast_manicurista_id_id_d56c54fe_fk_usuario_m` FOREIGN KEY (`manicurista_id_id`) REFERENCES `usuario_manicurista` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abastecimiento_abastecimiento`
--

LOCK TABLES `abastecimiento_abastecimiento` WRITE;
/*!40000 ALTER TABLE `abastecimiento_abastecimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `abastecimiento_abastecimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abastecimiento_insumoabastecimiento`
--

DROP TABLE IF EXISTS `abastecimiento_insumoabastecimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abastecimiento_insumoabastecimiento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `estado` varchar(30) NOT NULL,
  `abastecimiento_id_id` bigint(20) NOT NULL,
  `insumo_id_id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `comentario` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abastecimiento_insum_abastecimiento_id_id_0d9e2319_fk_abastecim` (`abastecimiento_id_id`),
  KEY `abastecimiento_insum_insumo_id_id_9bf3792b_fk_insumo_in` (`insumo_id_id`),
  CONSTRAINT `abastecimiento_insum_abastecimiento_id_id_0d9e2319_fk_abastecim` FOREIGN KEY (`abastecimiento_id_id`) REFERENCES `abastecimiento_abastecimiento` (`id`),
  CONSTRAINT `abastecimiento_insum_insumo_id_id_9bf3792b_fk_insumo_in` FOREIGN KEY (`insumo_id_id`) REFERENCES `insumo_insumo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abastecimiento_insumoabastecimiento`
--

LOCK TABLES `abastecimiento_insumoabastecimiento` WRITE;
/*!40000 ALTER TABLE `abastecimiento_insumoabastecimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `abastecimiento_insumoabastecimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add blacklisted token',6,'add_blacklistedtoken'),(22,'Can change blacklisted token',6,'change_blacklistedtoken'),(23,'Can delete blacklisted token',6,'delete_blacklistedtoken'),(24,'Can view blacklisted token',6,'view_blacklistedtoken'),(25,'Can add outstanding token',7,'add_outstandingtoken'),(26,'Can change outstanding token',7,'change_outstandingtoken'),(27,'Can delete outstanding token',7,'delete_outstandingtoken'),(28,'Can view outstanding token',7,'view_outstandingtoken'),(29,'Can add abastecimiento',8,'add_abastecimiento'),(30,'Can change abastecimiento',8,'change_abastecimiento'),(31,'Can delete abastecimiento',8,'delete_abastecimiento'),(32,'Can view abastecimiento',8,'view_abastecimiento'),(33,'Can add insumo abastecimiento',9,'add_insumoabastecimiento'),(34,'Can change insumo abastecimiento',9,'change_insumoabastecimiento'),(35,'Can delete insumo abastecimiento',9,'delete_insumoabastecimiento'),(36,'Can view insumo abastecimiento',9,'view_insumoabastecimiento'),(37,'Can add codigo recuperacion',10,'add_codigorecuperacion'),(38,'Can change codigo recuperacion',10,'change_codigorecuperacion'),(39,'Can delete codigo recuperacion',10,'delete_codigorecuperacion'),(40,'Can view codigo recuperacion',10,'view_codigorecuperacion'),(41,'Can add estado cita',11,'add_estadocita'),(42,'Can change estado cita',11,'change_estadocita'),(43,'Can delete estado cita',11,'delete_estadocita'),(44,'Can view estado cita',11,'view_estadocita'),(45,'Can add cita venta',12,'add_citaventa'),(46,'Can change cita venta',12,'change_citaventa'),(47,'Can delete cita venta',12,'delete_citaventa'),(48,'Can view cita venta',12,'view_citaventa'),(49,'Can add servicio cita',13,'add_serviciocita'),(50,'Can change servicio cita',13,'change_serviciocita'),(51,'Can delete servicio cita',13,'delete_serviciocita'),(52,'Can view servicio cita',13,'view_serviciocita'),(53,'Can add estado compra',14,'add_estadocompra'),(54,'Can change estado compra',14,'change_estadocompra'),(55,'Can delete estado compra',14,'delete_estadocompra'),(56,'Can view estado compra',14,'view_estadocompra'),(57,'Can add compra',15,'add_compra'),(58,'Can change compra',15,'change_compra'),(59,'Can delete compra',15,'delete_compra'),(60,'Can view compra',15,'view_compra'),(61,'Can add compra insumo',16,'add_comprainsumo'),(62,'Can change compra insumo',16,'change_comprainsumo'),(63,'Can delete compra insumo',16,'delete_comprainsumo'),(64,'Can view compra insumo',16,'view_comprainsumo'),(65,'Can add marca',17,'add_marca'),(66,'Can change marca',17,'change_marca'),(67,'Can delete marca',17,'delete_marca'),(68,'Can view marca',17,'view_marca'),(69,'Can add insumo',18,'add_insumo'),(70,'Can change insumo',18,'change_insumo'),(71,'Can delete insumo',18,'delete_insumo'),(72,'Can view insumo',18,'view_insumo'),(73,'Can add liquidacion',19,'add_liquidacion'),(74,'Can change liquidacion',19,'change_liquidacion'),(75,'Can delete liquidacion',19,'delete_liquidacion'),(76,'Can view liquidacion',19,'view_liquidacion'),(77,'Can add novedades',20,'add_novedades'),(78,'Can change novedades',20,'change_novedades'),(79,'Can delete novedades',20,'delete_novedades'),(80,'Can view novedades',20,'view_novedades'),(81,'Can add proveedor',21,'add_proveedor'),(82,'Can change proveedor',21,'change_proveedor'),(83,'Can delete proveedor',21,'delete_proveedor'),(84,'Can view proveedor',21,'view_proveedor'),(85,'Can add permiso',22,'add_permiso'),(86,'Can change permiso',22,'change_permiso'),(87,'Can delete permiso',22,'delete_permiso'),(88,'Can view permiso',22,'view_permiso'),(89,'Can add rol',23,'add_rol'),(90,'Can change rol',23,'change_rol'),(91,'Can delete rol',23,'delete_rol'),(92,'Can view rol',23,'view_rol'),(93,'Can add permiso_ rol',24,'add_permiso_rol'),(94,'Can change permiso_ rol',24,'change_permiso_rol'),(95,'Can delete permiso_ rol',24,'delete_permiso_rol'),(96,'Can view permiso_ rol',24,'view_permiso_rol'),(97,'Can add servicio',25,'add_servicio'),(98,'Can change servicio',25,'change_servicio'),(99,'Can delete servicio',25,'delete_servicio'),(100,'Can view servicio',25,'view_servicio'),(101,'Can add user',26,'add_usuario'),(102,'Can change user',26,'change_usuario'),(103,'Can delete user',26,'delete_usuario'),(104,'Can view user',26,'view_usuario'),(105,'Can add cliente',27,'add_cliente'),(106,'Can change cliente',27,'change_cliente'),(107,'Can delete cliente',27,'delete_cliente'),(108,'Can view cliente',27,'view_cliente'),(109,'Can add manicurista',28,'add_manicurista'),(110,'Can change manicurista',28,'change_manicurista'),(111,'Can delete manicurista',28,'delete_manicurista'),(112,'Can view manicurista',28,'view_manicurista'),(113,'Can add calificacion',29,'add_calificacion'),(114,'Can change calificacion',29,'change_calificacion'),(115,'Can delete calificacion',29,'delete_calificacion'),(116,'Can view calificacion',29,'view_calificacion');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authrecuperacion_codigorecuperacion`
--

DROP TABLE IF EXISTS `authrecuperacion_codigorecuperacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authrecuperacion_codigorecuperacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(6) NOT NULL,
  `creado_en` datetime(6) NOT NULL,
  `expiracion` datetime(6) NOT NULL,
  `usuario_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `authrecuperacion_cod_usuario_id_a9dd60aa_fk_usuario_u` (`usuario_id`),
  CONSTRAINT `authrecuperacion_cod_usuario_id_a9dd60aa_fk_usuario_u` FOREIGN KEY (`usuario_id`) REFERENCES `usuario_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authrecuperacion_codigorecuperacion`
--

LOCK TABLES `authrecuperacion_codigorecuperacion` WRITE;
/*!40000 ALTER TABLE `authrecuperacion_codigorecuperacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `authrecuperacion_codigorecuperacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificacion_calificacion`
--

DROP TABLE IF EXISTS `calificacion_calificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificacion_calificacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `puntuacion` int(11) NOT NULL,
  `comentario` longtext NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion_calificacion`
--

LOCK TABLES `calificacion_calificacion` WRITE;
/*!40000 ALTER TABLE `calificacion_calificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `calificacion_calificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cita_citaventa`
--

DROP TABLE IF EXISTS `cita_citaventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cita_citaventa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` time(6) NOT NULL,
  `Descripcion` longtext NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  `cliente_id_id` bigint(20) DEFAULT NULL,
  `manicurista_id_id` bigint(20) DEFAULT NULL,
  `estado_id_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cita_citaventa_estado_id_id_db02b589_fk_cita_estadocita_id` (`estado_id_id`),
  KEY `cita_citaventa_manicurista_id_id_14a3fff2_fk_usuario_m` (`manicurista_id_id`),
  KEY `cita_citaventa_cliente_id_id_7a66ac97_fk_usuario_c` (`cliente_id_id`),
  CONSTRAINT `cita_citaventa_cliente_id_id_7a66ac97_fk_usuario_c` FOREIGN KEY (`cliente_id_id`) REFERENCES `usuario_cliente` (`usuario_id`),
  CONSTRAINT `cita_citaventa_estado_id_id_db02b589_fk_cita_estadocita_id` FOREIGN KEY (`estado_id_id`) REFERENCES `cita_estadocita` (`id`),
  CONSTRAINT `cita_citaventa_manicurista_id_id_14a3fff2_fk_usuario_m` FOREIGN KEY (`manicurista_id_id`) REFERENCES `usuario_manicurista` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita_citaventa`
--

LOCK TABLES `cita_citaventa` WRITE;
/*!40000 ALTER TABLE `cita_citaventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `cita_citaventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cita_estadocita`
--

DROP TABLE IF EXISTS `cita_estadocita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cita_estadocita` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita_estadocita`
--

LOCK TABLES `cita_estadocita` WRITE;
/*!40000 ALTER TABLE `cita_estadocita` DISABLE KEYS */;
/*!40000 ALTER TABLE `cita_estadocita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cita_serviciocita`
--

DROP TABLE IF EXISTS `cita_serviciocita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cita_serviciocita` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subtotal` decimal(10,2) NOT NULL,
  `cita_id_id` bigint(20) NOT NULL,
  `servicio_id_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cita_serviciocita_cita_id_id_8992de2f_fk_cita_citaventa_id` (`cita_id_id`),
  KEY `cita_serviciocita_servicio_id_id_d90d6aec_fk_servicio_` (`servicio_id_id`),
  CONSTRAINT `cita_serviciocita_cita_id_id_8992de2f_fk_cita_citaventa_id` FOREIGN KEY (`cita_id_id`) REFERENCES `cita_citaventa` (`id`),
  CONSTRAINT `cita_serviciocita_servicio_id_id_d90d6aec_fk_servicio_` FOREIGN KEY (`servicio_id_id`) REFERENCES `servicio_servicio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita_serviciocita`
--

LOCK TABLES `cita_serviciocita` WRITE;
/*!40000 ALTER TABLE `cita_serviciocita` DISABLE KEYS */;
/*!40000 ALTER TABLE `cita_serviciocita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_compra`
--

DROP TABLE IF EXISTS `compra_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_compra` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fechaIngreso` date NOT NULL,
  `fechaCompra` date NOT NULL,
  `IVA` decimal(10,2) NOT NULL,
  `proveedor_id_id` bigint(20) NOT NULL,
  `estadoCompra_id_id` bigint(20) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `observacion` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `compra_compra_proveedor_id_id_28b9d88e_fk_proveedor_proveedor_id` (`proveedor_id_id`),
  KEY `compra_compra_estadoCompra_id_id_7a231026_fk_compra_es` (`estadoCompra_id_id`),
  CONSTRAINT `compra_compra_estadoCompra_id_id_7a231026_fk_compra_es` FOREIGN KEY (`estadoCompra_id_id`) REFERENCES `compra_estadocompra` (`id`),
  CONSTRAINT `compra_compra_proveedor_id_id_28b9d88e_fk_proveedor_proveedor_id` FOREIGN KEY (`proveedor_id_id`) REFERENCES `proveedor_proveedor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_compra`
--

LOCK TABLES `compra_compra` WRITE;
/*!40000 ALTER TABLE `compra_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_comprainsumo`
--

DROP TABLE IF EXISTS `compra_comprainsumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_comprainsumo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `precioUnitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `compra_id_id` bigint(20) NOT NULL,
  `insumo_id_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `compra_comprainsumo_compra_id_id_3b5e0d5c_fk_compra_compra_id` (`compra_id_id`),
  KEY `compra_comprainsumo_insumo_id_id_c9a77d99_fk_insumo_insumo_id` (`insumo_id_id`),
  CONSTRAINT `compra_comprainsumo_compra_id_id_3b5e0d5c_fk_compra_compra_id` FOREIGN KEY (`compra_id_id`) REFERENCES `compra_compra` (`id`),
  CONSTRAINT `compra_comprainsumo_insumo_id_id_c9a77d99_fk_insumo_insumo_id` FOREIGN KEY (`insumo_id_id`) REFERENCES `insumo_insumo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_comprainsumo`
--

LOCK TABLES `compra_comprainsumo` WRITE;
/*!40000 ALTER TABLE `compra_comprainsumo` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_comprainsumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_estadocompra`
--

DROP TABLE IF EXISTS `compra_estadocompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_estadocompra` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_estadocompra`
--

LOCK TABLES `compra_estadocompra` WRITE;
/*!40000 ALTER TABLE `compra_estadocompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_estadocompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_usuario_usuario_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_usuario_usuario_id` FOREIGN KEY (`user_id`) REFERENCES `usuario_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'abastecimiento','abastecimiento'),(9,'abastecimiento','insumoabastecimiento'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(10,'authrecuperacion','codigorecuperacion'),(29,'calificacion','calificacion'),(12,'cita','citaventa'),(11,'cita','estadocita'),(13,'cita','serviciocita'),(15,'compra','compra'),(16,'compra','comprainsumo'),(14,'compra','estadocompra'),(4,'contenttypes','contenttype'),(18,'insumo','insumo'),(17,'insumo','marca'),(19,'manicurista','liquidacion'),(20,'manicurista','novedades'),(21,'proveedor','proveedor'),(22,'rol','permiso'),(24,'rol','permiso_rol'),(23,'rol','rol'),(25,'servicio','servicio'),(5,'sessions','session'),(6,'token_blacklist','blacklistedtoken'),(7,'token_blacklist','outstandingtoken'),(27,'usuario','cliente'),(28,'usuario','manicurista'),(26,'usuario','usuario');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'rol','0001_initial','2025-08-24 04:57:33.045035'),(2,'contenttypes','0001_initial','2025-08-24 04:57:33.073698'),(3,'contenttypes','0002_remove_content_type_name','2025-08-24 04:57:33.131396'),(4,'auth','0001_initial','2025-08-24 04:57:33.294155'),(5,'auth','0002_alter_permission_name_max_length','2025-08-24 04:57:33.333509'),(6,'auth','0003_alter_user_email_max_length','2025-08-24 04:57:33.339504'),(7,'auth','0004_alter_user_username_opts','2025-08-24 04:57:33.347501'),(8,'auth','0005_alter_user_last_login_null','2025-08-24 04:57:33.355495'),(9,'auth','0006_require_contenttypes_0002','2025-08-24 04:57:33.358494'),(10,'auth','0007_alter_validators_add_error_messages','2025-08-24 04:57:33.367505'),(11,'auth','0008_alter_user_username_max_length','2025-08-24 04:57:33.375620'),(12,'auth','0009_alter_user_last_name_max_length','2025-08-24 04:57:33.384597'),(13,'auth','0010_alter_group_name_max_length','2025-08-24 04:57:33.393592'),(14,'auth','0011_update_proxy_permissions','2025-08-24 04:57:33.402586'),(15,'auth','0012_alter_user_first_name_max_length','2025-08-24 04:57:33.408583'),(16,'usuario','0001_initial','2025-08-24 04:57:33.738613'),(17,'insumo','0001_initial','2025-08-24 04:57:33.791487'),(18,'abastecimiento','0001_initial','2025-08-24 04:57:33.936310'),(19,'abastecimiento','0002_remove_abastecimiento_fecha_abastecimiento_estado_and_more','2025-08-24 04:57:34.002181'),(20,'admin','0001_initial','2025-08-24 04:57:34.099273'),(21,'admin','0002_logentry_remove_auto_add','2025-08-24 04:57:34.110267'),(22,'admin','0003_logentry_add_action_flag_choices','2025-08-24 04:57:34.122370'),(23,'authrecuperacion','0001_initial','2025-08-24 04:57:34.172258'),(24,'calificacion','0001_initial','2025-08-24 04:57:34.185372'),(25,'usuario','0002_alter_cliente_celular','2025-08-24 04:57:34.212358'),(26,'usuario','0003_alter_usuario_estado','2025-08-24 04:57:34.226349'),(27,'usuario','0004_alter_cliente_estado_alter_manicurista_estado','2025-08-24 04:57:34.251507'),(28,'usuario','0005_usuario_numero_documento_usuario_tipo_documento','2025-08-24 04:57:34.286487'),(29,'rol','0002_alter_rol_descripcion','2025-08-24 04:57:34.295696'),(30,'rol','0003_alter_permiso_rol_unique_together','2025-08-24 04:57:34.310755'),(31,'rol','0004_alter_rol_estado','2025-08-24 04:57:34.320748'),(32,'usuario','0006_alter_usuario_options_alter_usuario_correo_and_more','2025-08-24 04:57:34.587676'),(33,'usuario','0007_alter_usuario_options_remove_usuario_unique_correo_and_more','2025-08-24 04:57:34.728371'),(34,'usuario','0008_alter_usuario_numero_documento','2025-08-24 04:57:34.748361'),(35,'usuario','0009_alter_cliente_correo_alter_cliente_numero_documento','2025-08-24 04:57:34.784339'),(36,'usuario','0010_alter_manicurista_celular_alter_manicurista_correo_and_more','2025-08-24 04:57:34.836506'),(37,'servicio','0001_initial','2025-08-24 04:57:34.848863'),(38,'cita','0001_initial','2025-08-24 04:57:35.051950'),(39,'cita','0002_alter_citaventa_manicurista_id','2025-08-24 04:57:35.296238'),(40,'cita','0003_alter_citaventa_cliente_id','2025-08-24 04:57:35.646087'),(41,'proveedor','0001_initial','2025-08-24 04:57:35.660077'),(42,'compra','0001_initial','2025-08-24 04:57:35.972143'),(43,'compra','0002_compra_total','2025-08-24 04:57:35.997220'),(44,'compra','0003_compra_observacion','2025-08-24 04:57:36.008152'),(45,'insumo','0002_rename_cantidad_insumo_stock_insumo_estado','2025-08-24 04:57:36.031188'),(46,'insumo','0003_alter_insumo_estado','2025-08-24 04:57:36.040180'),(47,'insumo','0004_alter_insumo_marca_id','2025-08-24 04:57:36.072163'),(48,'manicurista','0001_initial','2025-08-24 04:57:36.224551'),(49,'proveedor','0002_remove_proveedor_representante_and_more','2025-08-24 04:57:36.252991'),(50,'proveedor','0003_remove_proveedor_nombre_proveedor_nombre_empresa','2025-08-24 04:57:36.270756'),(51,'proveedor','0004_proveedor_email_representante_and_more','2025-08-24 04:57:36.336383'),(52,'proveedor','0005_proveedor_estado','2025-08-24 04:57:36.375760'),(53,'proveedor','0006_alter_proveedor_estado','2025-08-24 04:57:36.391750'),(54,'proveedor','0007_alter_proveedor_email_and_more','2025-08-24 04:57:36.420856'),(55,'proveedor','0008_alter_proveedor_email_representante','2025-08-24 04:57:36.618040'),(56,'servicio','0002_servicio_created_at','2025-08-24 04:57:36.628224'),(57,'servicio','0003_servicio_tipo_alter_servicio_estado','2025-08-24 04:57:36.658835'),(58,'servicio','0004_alter_servicio_url_imagen','2025-08-24 04:57:36.672828'),(59,'servicio','0005_servicio_hora','2025-08-24 04:57:36.686820'),(60,'servicio','0006_alter_servicio_hora','2025-08-24 04:57:36.715746'),(61,'servicio','0007_remove_servicio_hora_servicio_duracion','2025-08-24 04:57:36.737148'),(62,'sessions','0001_initial','2025-08-24 04:57:36.769129'),(63,'token_blacklist','0001_initial','2025-08-24 04:57:36.953441'),(64,'token_blacklist','0002_outstandingtoken_jti_hex','2025-08-24 04:57:36.968434'),(65,'token_blacklist','0003_auto_20171017_2007','2025-08-24 04:57:36.996433'),(66,'token_blacklist','0004_auto_20171017_2013','2025-08-24 04:57:37.059260'),(67,'token_blacklist','0005_remove_outstandingtoken_jti','2025-08-24 04:57:37.077250'),(68,'token_blacklist','0006_auto_20171017_2113','2025-08-24 04:57:37.093240'),(69,'token_blacklist','0007_auto_20171017_2214','2025-08-24 04:57:37.430360'),(70,'token_blacklist','0008_migrate_to_bigautofield','2025-08-24 04:57:37.718760'),(71,'token_blacklist','0010_fix_migrate_to_bigautofield','2025-08-24 04:57:37.747603'),(72,'token_blacklist','0011_linearizes_history','2025-08-24 04:57:37.751394'),(73,'token_blacklist','0012_alter_outstandingtoken_user','2025-08-24 04:57:37.774744');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo_insumo`
--

DROP TABLE IF EXISTS `insumo_insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumo_insumo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `stock` int(11) NOT NULL,
  `marca_id_id` bigint(20) NOT NULL,
  `estado` varchar(9) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `insumo_insumo_marca_id_id_76a93ccf_fk_insumo_marca_id` (`marca_id_id`),
  CONSTRAINT `insumo_insumo_marca_id_id_76a93ccf_fk_insumo_marca_id` FOREIGN KEY (`marca_id_id`) REFERENCES `insumo_marca` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo_insumo`
--

LOCK TABLES `insumo_insumo` WRITE;
/*!40000 ALTER TABLE `insumo_insumo` DISABLE KEYS */;
/*!40000 ALTER TABLE `insumo_insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo_marca`
--

DROP TABLE IF EXISTS `insumo_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumo_marca` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo_marca`
--

LOCK TABLES `insumo_marca` WRITE;
/*!40000 ALTER TABLE `insumo_marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `insumo_marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manicurista_liquidacion`
--

DROP TABLE IF EXISTS `manicurista_liquidacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manicurista_liquidacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `FechaInicial` date NOT NULL,
  `TotalGenerado` decimal(10,2) NOT NULL,
  `Comision` decimal(10,2) NOT NULL,
  `Local` decimal(10,2) NOT NULL,
  `FechaFinal` date NOT NULL,
  `manicurista_id_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manicurista_liquidac_manicurista_id_id_9214704a_fk_usuario_m` (`manicurista_id_id`),
  CONSTRAINT `manicurista_liquidac_manicurista_id_id_9214704a_fk_usuario_m` FOREIGN KEY (`manicurista_id_id`) REFERENCES `usuario_manicurista` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manicurista_liquidacion`
--

LOCK TABLES `manicurista_liquidacion` WRITE;
/*!40000 ALTER TABLE `manicurista_liquidacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `manicurista_liquidacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manicurista_novedades`
--

DROP TABLE IF EXISTS `manicurista_novedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manicurista_novedades` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `HoraEntrada` time(6) NOT NULL,
  `HoraSalida` time(6) NOT NULL,
  `Motivo` longtext NOT NULL,
  `manicurista_id_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manicurista_novedade_manicurista_id_id_9f2561c5_fk_usuario_m` (`manicurista_id_id`),
  CONSTRAINT `manicurista_novedade_manicurista_id_id_9f2561c5_fk_usuario_m` FOREIGN KEY (`manicurista_id_id`) REFERENCES `usuario_manicurista` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manicurista_novedades`
--

LOCK TABLES `manicurista_novedades` WRITE;
/*!40000 ALTER TABLE `manicurista_novedades` DISABLE KEYS */;
/*!40000 ALTER TABLE `manicurista_novedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor_proveedor`
--

DROP TABLE IF EXISTS `proveedor_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor_proveedor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo_persona` varchar(10) NOT NULL,
  `tipo_documento` varchar(3) NOT NULL,
  `numero_documento` varchar(15) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(60) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `ciudad` varchar(60) NOT NULL,
  `apellido_representante` varchar(60) DEFAULT NULL,
  `nombre_representante` varchar(60) DEFAULT NULL,
  `nombre_empresa` varchar(60) DEFAULT NULL,
  `email_representante` varchar(60) DEFAULT NULL,
  `telefono_representante` varchar(15) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proveedor_proveedor_email_30f38c53_uniq` (`email`),
  UNIQUE KEY `proveedor_proveedor_numero_documento_3a2db986_uniq` (`numero_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor_proveedor`
--

LOCK TABLES `proveedor_proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor_proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_permiso`
--

DROP TABLE IF EXISTS `rol_permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_permiso` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `modulo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_permiso`
--

LOCK TABLES `rol_permiso` WRITE;
/*!40000 ALTER TABLE `rol_permiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol_permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_permiso_rol`
--

DROP TABLE IF EXISTS `rol_permiso_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_permiso_rol` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permiso_id_id` bigint(20) DEFAULT NULL,
  `rol_id_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rol_permiso_rol_rol_id_id_permiso_id_id_8834d424_uniq` (`rol_id_id`,`permiso_id_id`),
  KEY `rol_permiso_rol_permiso_id_id_f3efbd7e_fk_rol_permiso_id` (`permiso_id_id`),
  CONSTRAINT `rol_permiso_rol_permiso_id_id_f3efbd7e_fk_rol_permiso_id` FOREIGN KEY (`permiso_id_id`) REFERENCES `rol_permiso` (`id`),
  CONSTRAINT `rol_permiso_rol_rol_id_id_56fc27e1_fk_rol_rol_id` FOREIGN KEY (`rol_id_id`) REFERENCES `rol_rol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_permiso_rol`
--

LOCK TABLES `rol_permiso_rol` WRITE;
/*!40000 ALTER TABLE `rol_permiso_rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol_permiso_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_rol`
--

DROP TABLE IF EXISTS `rol_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_rol` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(80) DEFAULT NULL,
  `estado` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_rol`
--

LOCK TABLES `rol_rol` WRITE;
/*!40000 ALTER TABLE `rol_rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio_servicio`
--

DROP TABLE IF EXISTS `servicio_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_servicio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `estado` varchar(40) NOT NULL,
  `url_imagen` varchar(500) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `tipo` varchar(40) NOT NULL,
  `duracion` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_servicio`
--

LOCK TABLES `servicio_servicio` WRITE;
/*!40000 ALTER TABLE `servicio_servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_blacklistedtoken`
--

DROP TABLE IF EXISTS `token_blacklist_blacklistedtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_blacklistedtoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `blacklisted_at` datetime(6) NOT NULL,
  `token_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_id` (`token_id`),
  CONSTRAINT `token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk` FOREIGN KEY (`token_id`) REFERENCES `token_blacklist_outstandingtoken` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_blacklistedtoken`
--

LOCK TABLES `token_blacklist_blacklistedtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_outstandingtoken`
--

DROP TABLE IF EXISTS `token_blacklist_outstandingtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_outstandingtoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `jti` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti`),
  KEY `token_blacklist_outs_user_id_83bc629a_fk_usuario_u` (`user_id`),
  CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_usuario_u` FOREIGN KEY (`user_id`) REFERENCES `usuario_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

LOCK TABLES `token_blacklist_outstandingtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_cliente`
--

DROP TABLE IF EXISTS `usuario_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_cliente` (
  `usuario_id` bigint(20) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `tipo_documento` varchar(2) NOT NULL,
  `numero_documento` varchar(15) NOT NULL,
  `correo` varchar(40) NOT NULL,
  `celular` varchar(13) DEFAULT NULL,
  `estado` varchar(8) NOT NULL,
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `usuario_cliente_correo_37f1f82c_uniq` (`correo`),
  UNIQUE KEY `usuario_cliente_numero_documento_8f1cded8_uniq` (`numero_documento`),
  CONSTRAINT `usuario_cliente_usuario_id_4d1b2caa_fk_usuario_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_cliente`
--

LOCK TABLES `usuario_cliente` WRITE;
/*!40000 ALTER TABLE `usuario_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_manicurista`
--

DROP TABLE IF EXISTS `usuario_manicurista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_manicurista` (
  `usuario_id` bigint(20) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `tipo_documento` varchar(2) NOT NULL,
  `numero_documento` varchar(15) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `celular` varchar(13) NOT NULL,
  `estado` varchar(8) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_contratacion` date NOT NULL,
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `usuario_manicurista_celular_4232efed_uniq` (`celular`),
  UNIQUE KEY `usuario_manicurista_correo_6abfe4aa_uniq` (`correo`),
  UNIQUE KEY `usuario_manicurista_numero_documento_83165f64_uniq` (`numero_documento`),
  CONSTRAINT `usuario_manicurista_usuario_id_ccb8e633_fk_usuario_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_manicurista`
--

LOCK TABLES `usuario_manicurista` WRITE;
/*!40000 ALTER TABLE `usuario_manicurista` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_manicurista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_usuario`
--

DROP TABLE IF EXISTS `usuario_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `estado` varchar(8) NOT NULL,
  `rol_id_id` bigint(20) NOT NULL,
  `numero_documento` varchar(15) DEFAULT NULL,
  `tipo_documento` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `usuario_usuario_correo_d80bc94d_uniq` (`correo`),
  UNIQUE KEY `usuario_usuario_numero_documento_caf06a5d_uniq` (`numero_documento`),
  KEY `usuario_usuario_rol_id_id_00a060c6_fk_rol_rol_id` (`rol_id_id`),
  CONSTRAINT `usuario_usuario_rol_id_id_00a060c6_fk_rol_rol_id` FOREIGN KEY (`rol_id_id`) REFERENCES `rol_rol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_usuario`
--

LOCK TABLES `usuario_usuario` WRITE;
/*!40000 ALTER TABLE `usuario_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_usuario_groups`
--

DROP TABLE IF EXISTS `usuario_usuario_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_usuario_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_usuario_groups_usuario_id_group_id_a4cfb0b8_uniq` (`usuario_id`,`group_id`),
  KEY `usuario_usuario_groups_group_id_b9c090f8_fk_auth_group_id` (`group_id`),
  CONSTRAINT `usuario_usuario_groups_group_id_b9c090f8_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `usuario_usuario_groups_usuario_id_62de76a1_fk_usuario_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_usuario_groups`
--

LOCK TABLES `usuario_usuario_groups` WRITE;
/*!40000 ALTER TABLE `usuario_usuario_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_usuario_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_usuario_user_permissions`
--

DROP TABLE IF EXISTS `usuario_usuario_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_usuario_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_usuario_user_per_usuario_id_permission_id_c0a85055_uniq` (`usuario_id`,`permission_id`),
  KEY `usuario_usuario_user_permission_id_5cad0a4b_fk_auth_perm` (`permission_id`),
  CONSTRAINT `usuario_usuario_user_permission_id_5cad0a4b_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `usuario_usuario_user_usuario_id_5969a193_fk_usuario_u` FOREIGN KEY (`usuario_id`) REFERENCES `usuario_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_usuario_user_permissions`
--

LOCK TABLES `usuario_usuario_user_permissions` WRITE;
/*!40000 ALTER TABLE `usuario_usuario_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_usuario_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-24  0:01:51
