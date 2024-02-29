-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_libro_express
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id_cliente` varchar(50) NOT NULL,
  `nombre_cliente` varchar(50) DEFAULT NULL,
  `email_cliente` varchar(100) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `uq_email_cliente` (`email_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('028ac0ff-d6a7-11ee-97a8-d5dfdfbd1943','Juan Pérez','juanperez@gmail.com','1234567890'),('028b0c5d-d6a7-11ee-97a8-d5dfdfbd1943','María Rodríguez','maria.rodriguez@gmail.com','9876543210'),('028b69bb-d6a7-11ee-97a8-d5dfdfbd1943','Carlos Gómez','cgomez@gmail.com','5551234567'),('028bb5ba-d6a7-11ee-97a8-d5dfdfbd1943','Laura Martínez','laura.martinez@gmail.com','7894561230'),('028c1034-d6a7-11ee-97a8-d5dfdfbd1943','Alejandro López','alejandro.lopez@gmail.com','3339998888'),('028c5a17-d6a7-11ee-97a8-d5dfdfbd1943','Ana García','ana.garcia@gmail.com','1112223333'),('028ca45b-d6a7-11ee-97a8-d5dfdfbd1943','Luis Hernández','luis.hernandez@gmail.com','4445556666'),('028ce342-d6a7-11ee-97a8-d5dfdfbd1943','Elena Díaz','elena.diaz@gmail.com','7778889999'),('028d2423-d6a7-11ee-97a8-d5dfdfbd1943','Pedro Sánchez','pedro.sanchez@gmail.com','6667778888'),('028d73c1-d6a7-11ee-97a8-d5dfdfbd1943','Sofía Ruiz','sofia.ruiz@gmail.com','2223334444'),('028dcf68-d6a7-11ee-97a8-d5dfdfbd1943','Lucas Castro','lucas.castro@gmail.com','8887776666'),('028e16d0-d6a7-11ee-97a8-d5dfdfbd1943','Marina Jiménez','marina.jimenez@gmail.com','5554443333'),('028e64d3-d6a7-11ee-97a8-d5dfdfbd1943','Daniel Martín','daniel.martin@gmail.com','3332221111'),('028eb5c5-d6a7-11ee-97a8-d5dfdfbd1943','Carmen López','carmen.lopez@gmail.com','9998887777'),('028f0449-d6a7-11ee-97a8-d5dfdfbd1943','Javier Morales','javier.morales@gmail.com','1114447777');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_prestamos`
--

DROP TABLE IF EXISTS `detalles_prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalles_prestamos` (
  `id_detalle_prestamo` varchar(50) NOT NULL,
  `id_prestamo` varchar(50) DEFAULT NULL,
  `id_libro` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_prestamo`),
  KEY `fk_prestamo_detalle` (`id_prestamo`),
  KEY `fk_libro_detalle` (`id_libro`),
  CONSTRAINT `fk_libro_detalle` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`),
  CONSTRAINT `fk_prestamo_detalle` FOREIGN KEY (`id_prestamo`) REFERENCES `prestamos` (`id_prestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_prestamos`
--

LOCK TABLES `detalles_prestamos` WRITE;
/*!40000 ALTER TABLE `detalles_prestamos` DISABLE KEYS */;
INSERT INTO `detalles_prestamos` VALUES ('02a6a375-d6a7-11ee-97a8-d5dfdfbd1943','0292e805-d6a7-11ee-97a8-d5dfdfbd1943','029f8c34-d6a7-11ee-97a8-d5dfdfbd1943'),('02a73614-d6a7-11ee-97a8-d5dfdfbd1943','0292e805-d6a7-11ee-97a8-d5dfdfbd1943','02a013e5-d6a7-11ee-97a8-d5dfdfbd1943'),('02a7d7ab-d6a7-11ee-97a8-d5dfdfbd1943','0292e805-d6a7-11ee-97a8-d5dfdfbd1943','02a06961-d6a7-11ee-97a8-d5dfdfbd1943'),('02a82705-d6a7-11ee-97a8-d5dfdfbd1943','0292e805-d6a7-11ee-97a8-d5dfdfbd1943','02a0bae7-d6a7-11ee-97a8-d5dfdfbd1943'),('02a87f09-d6a7-11ee-97a8-d5dfdfbd1943','0292e805-d6a7-11ee-97a8-d5dfdfbd1943','02a1132e-d6a7-11ee-97a8-d5dfdfbd1943'),('02a8d15e-d6a7-11ee-97a8-d5dfdfbd1943','0292e805-d6a7-11ee-97a8-d5dfdfbd1943','02a161bd-d6a7-11ee-97a8-d5dfdfbd1943'),('02a934bd-d6a7-11ee-97a8-d5dfdfbd1943','0292e805-d6a7-11ee-97a8-d5dfdfbd1943','02a1b9d8-d6a7-11ee-97a8-d5dfdfbd1943'),('02a98f76-d6a7-11ee-97a8-d5dfdfbd1943','0292e805-d6a7-11ee-97a8-d5dfdfbd1943','02a2117f-d6a7-11ee-97a8-d5dfdfbd1943'),('02a9e5a1-d6a7-11ee-97a8-d5dfdfbd1943','0292e805-d6a7-11ee-97a8-d5dfdfbd1943','02a26576-d6a7-11ee-97a8-d5dfdfbd1943'),('02aa3792-d6a7-11ee-97a8-d5dfdfbd1943','0292e805-d6a7-11ee-97a8-d5dfdfbd1943','02a2aefc-d6a7-11ee-97a8-d5dfdfbd1943'),('02aa93bc-d6a7-11ee-97a8-d5dfdfbd1943','0292e805-d6a7-11ee-97a8-d5dfdfbd1943','02a2fd8b-d6a7-11ee-97a8-d5dfdfbd1943'),('02aaedc7-d6a7-11ee-97a8-d5dfdfbd1943','0292e805-d6a7-11ee-97a8-d5dfdfbd1943','02a3555d-d6a7-11ee-97a8-d5dfdfbd1943'),('02ab39e0-d6a7-11ee-97a8-d5dfdfbd1943','0292e805-d6a7-11ee-97a8-d5dfdfbd1943','02a39ee4-d6a7-11ee-97a8-d5dfdfbd1943'),('02ab86e0-d6a7-11ee-97a8-d5dfdfbd1943','0292e805-d6a7-11ee-97a8-d5dfdfbd1943','02a3eb61-d6a7-11ee-97a8-d5dfdfbd1943'),('02abe1c9-d6a7-11ee-97a8-d5dfdfbd1943','0292e805-d6a7-11ee-97a8-d5dfdfbd1943','02a43006-d6a7-11ee-97a8-d5dfdfbd1943');
/*!40000 ALTER TABLE `detalles_prestamos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_estado_libro
AFTER INSERT ON detalles_prestamos
FOR EACH ROW
BEGIN

    UPDATE libros
    SET estado = 'Prestado'
    WHERE id_libro = NEW.id_libro;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `generos_libros`
--

DROP TABLE IF EXISTS `generos_libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generos_libros` (
  `id_genero_libro` varchar(50) NOT NULL,
  `nombre_genero_libro` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_genero_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos_libros`
--

LOCK TABLES `generos_libros` WRITE;
/*!40000 ALTER TABLE `generos_libros` DISABLE KEYS */;
INSERT INTO `generos_libros` VALUES ('0298a941-d6a7-11ee-97a8-d5dfdfbd1943','Ciencia Ficción'),('02991310-d6a7-11ee-97a8-d5dfdfbd1943','Fantasía'),('02997c6c-d6a7-11ee-97a8-d5dfdfbd1943','Romance'),('0299cd3d-d6a7-11ee-97a8-d5dfdfbd1943','Misterio'),('029a1341-d6a7-11ee-97a8-d5dfdfbd1943','Thriller'),('029a5b12-d6a7-11ee-97a8-d5dfdfbd1943','Historia'),('029aa5a4-d6a7-11ee-97a8-d5dfdfbd1943','Biografía'),('029aea78-d6a7-11ee-97a8-d5dfdfbd1943','Autoayuda'),('029b30a3-d6a7-11ee-97a8-d5dfdfbd1943','Poesía'),('029b7d54-d6a7-11ee-97a8-d5dfdfbd1943','Aventura'),('029bbb4a-d6a7-11ee-97a8-d5dfdfbd1943','Terror'),('029c0825-d6a7-11ee-97a8-d5dfdfbd1943','Humor'),('029c4999-d6a7-11ee-97a8-d5dfdfbd1943','Drama'),('029c9540-d6a7-11ee-97a8-d5dfdfbd1943','Suspenso'),('029cda08-d6a7-11ee-97a8-d5dfdfbd1943','Infantil');
/*!40000 ALTER TABLE `generos_libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros` (
  `id_libro` varchar(50) NOT NULL,
  `titulo_libro` varchar(50) DEFAULT NULL,
  `anio_publicacion` int(11) DEFAULT NULL,
  `id_genero_libro` varchar(50) DEFAULT NULL,
  `estado` enum('Disponible','Prestado') DEFAULT NULL,
  PRIMARY KEY (`id_libro`),
  KEY `fk_genero_libro` (`id_genero_libro`),
  CONSTRAINT `fk_genero_libro` FOREIGN KEY (`id_genero_libro`) REFERENCES `generos_libros` (`id_genero_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES ('029f8c34-d6a7-11ee-97a8-d5dfdfbd1943','El fin de la eternidad',1955,'0298a941-d6a7-11ee-97a8-d5dfdfbd1943','Prestado'),('02a013e5-d6a7-11ee-97a8-d5dfdfbd1943','El señor de los anillos',1954,'02991310-d6a7-11ee-97a8-d5dfdfbd1943','Prestado'),('02a06961-d6a7-11ee-97a8-d5dfdfbd1943','Orgullo y prejuicio',1813,'02997c6c-d6a7-11ee-97a8-d5dfdfbd1943','Prestado'),('02a0bae7-d6a7-11ee-97a8-d5dfdfbd1943','El código Da Vinci',2003,'0299cd3d-d6a7-11ee-97a8-d5dfdfbd1943','Prestado'),('02a1132e-d6a7-11ee-97a8-d5dfdfbd1943','El psicoanalista',2002,'029a1341-d6a7-11ee-97a8-d5dfdfbd1943','Prestado'),('02a161bd-d6a7-11ee-97a8-d5dfdfbd1943','La historia interminable',1979,'02991310-d6a7-11ee-97a8-d5dfdfbd1943','Prestado'),('02a1b9d8-d6a7-11ee-97a8-d5dfdfbd1943','Steve Jobs',2011,'029aa5a4-d6a7-11ee-97a8-d5dfdfbd1943','Prestado'),('02a2117f-d6a7-11ee-97a8-d5dfdfbd1943','Cien años de soledad',1967,'029a5b12-d6a7-11ee-97a8-d5dfdfbd1943','Prestado'),('02a26576-d6a7-11ee-97a8-d5dfdfbd1943','La ladrona de libros',2005,'029c4999-d6a7-11ee-97a8-d5dfdfbd1943','Prestado'),('02a2aefc-d6a7-11ee-97a8-d5dfdfbd1943','La sombra del viento',2001,'0299cd3d-d6a7-11ee-97a8-d5dfdfbd1943','Prestado'),('02a2fd8b-d6a7-11ee-97a8-d5dfdfbd1943','It',1986,'029bbb4a-d6a7-11ee-97a8-d5dfdfbd1943','Prestado'),('02a3555d-d6a7-11ee-97a8-d5dfdfbd1943','El principito',1943,'029cda08-d6a7-11ee-97a8-d5dfdfbd1943','Prestado'),('02a39ee4-d6a7-11ee-97a8-d5dfdfbd1943','Misery',1987,'029a1341-d6a7-11ee-97a8-d5dfdfbd1943','Prestado'),('02a3eb61-d6a7-11ee-97a8-d5dfdfbd1943','1984',1949,'0298a941-d6a7-11ee-97a8-d5dfdfbd1943','Prestado'),('02a43006-d6a7-11ee-97a8-d5dfdfbd1943','Harry Potter y la piedra filosofal',1997,'02991310-d6a7-11ee-97a8-d5dfdfbd1943','Prestado');
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamos` (
  `id_prestamo` varchar(50) NOT NULL,
  `id_cliente` varchar(50) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `estado` enum('Activo','Inactivo') DEFAULT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `fk_cliente_prestamo` (`id_cliente`),
  CONSTRAINT `fk_cliente_prestamo` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` VALUES ('02916d8a-d6a7-11ee-97a8-d5dfdfbd1943','028ac0ff-d6a7-11ee-97a8-d5dfdfbd1943','2024-03-01','2024-03-15','Activo'),('0291eba7-d6a7-11ee-97a8-d5dfdfbd1943','028b0c5d-d6a7-11ee-97a8-d5dfdfbd1943','2024-02-28','2024-03-10','Activo'),('02924d80-d6a7-11ee-97a8-d5dfdfbd1943','028b69bb-d6a7-11ee-97a8-d5dfdfbd1943','2024-03-02','2024-03-16','Inactivo'),('02929cd4-d6a7-11ee-97a8-d5dfdfbd1943','028bb5ba-d6a7-11ee-97a8-d5dfdfbd1943','2024-03-05','2024-03-20','Activo'),('0292e805-d6a7-11ee-97a8-d5dfdfbd1943','028c1034-d6a7-11ee-97a8-d5dfdfbd1943','2024-03-03','2024-03-18','Inactivo'),('0293367a-d6a7-11ee-97a8-d5dfdfbd1943','028c5a17-d6a7-11ee-97a8-d5dfdfbd1943','2024-03-04','2024-03-19','Activo'),('02938ffe-d6a7-11ee-97a8-d5dfdfbd1943','028ca45b-d6a7-11ee-97a8-d5dfdfbd1943','2024-03-07','2024-03-22','Activo'),('0293f569-d6a7-11ee-97a8-d5dfdfbd1943','028ce342-d6a7-11ee-97a8-d5dfdfbd1943','2024-03-09','2024-03-24','Inactivo'),('02945289-d6a7-11ee-97a8-d5dfdfbd1943','028d2423-d6a7-11ee-97a8-d5dfdfbd1943','2024-03-10','2024-03-25','Activo'),('0294a257-d6a7-11ee-97a8-d5dfdfbd1943','028d73c1-d6a7-11ee-97a8-d5dfdfbd1943','2024-03-12','2024-03-27','Activo'),('0294f038-d6a7-11ee-97a8-d5dfdfbd1943','028dcf68-d6a7-11ee-97a8-d5dfdfbd1943','2024-03-14','2024-03-29','Inactivo'),('02953da4-d6a7-11ee-97a8-d5dfdfbd1943','028e16d0-d6a7-11ee-97a8-d5dfdfbd1943','2024-03-16','2024-03-31','Activo'),('0295891f-d6a7-11ee-97a8-d5dfdfbd1943','028e64d3-d6a7-11ee-97a8-d5dfdfbd1943','2024-03-18','2024-04-02','Activo'),('0295dbfe-d6a7-11ee-97a8-d5dfdfbd1943','028eb5c5-d6a7-11ee-97a8-d5dfdfbd1943','2024-03-20','2024-04-04','Inactivo'),('02962629-d6a7-11ee-97a8-d5dfdfbd1943','028f0449-d6a7-11ee-97a8-d5dfdfbd1943','2024-03-22','2024-04-06','Activo');
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-28 20:44:31
