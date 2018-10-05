-- MySQL dump 10.13  Distrib 5.5.57, for Win64 (AMD64)
--
-- Host: localhost    Database: universidad
-- ------------------------------------------------------
-- Server version	5.5.57

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
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `fechaNacimiento` datetime DEFAULT NULL,
  `legajo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (1,'Ronaldo','Cristiano',NULL,'1975-06-10 21:00:00','345354444322/2'),(2,'Castro','Juan Pablo',NULL,'1987-10-20 21:00:00','434324444/2'),(3,'Gonzales','Ramiro',NULL,'1998-10-20 21:00:00','4444433333/2'),(4,'Perez','Cristina',34,'1984-10-20 21:00:00','4444555555/2'),(5,'Carbonelli','Rodolfo',NULL,'1987-10-20 21:00:00','4444555442/2'),(6,'Gomez','Ramiro',NULL,'1998-10-22 21:00:00','4324324324'),(7,'Pirez','Roberto',NULL,'1998-10-30 21:00:00','432432432'),(8,'Soteres','Manuel',NULL,'1988-10-23 21:00:00','432432432');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignaturas`
--

DROP TABLE IF EXISTS `asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignaturas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaturas`
--

LOCK TABLES `asignaturas` WRITE;
/*!40000 ALTER TABLE `asignaturas` DISABLE KEYS */;
INSERT INTO `asignaturas` VALUES (1,'Matemáticas'),(2,'Programación'),(3,'Laboratorio'),(4,'Laboratorio I'),(5,'Laboratorio II'),(6,'Programacion II'),(7,'Metodología Investigación'),(8,'Estadísticas'),(9,'Contabilidad'),(10,'Legislación'),(11,'Sistema Procesamiento Datos'),(12,'Analisis');
/*!40000 ALTER TABLE `asignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cursos` (
  `cupoMaximo` int(11) DEFAULT NULL,
  `id_docente` bigint(20) NOT NULL,
  `id_asignatura` bigint(20) NOT NULL,
  PRIMARY KEY (`id_docente`,`id_asignatura`),
  KEY `FKkf5e81lij3sdw9ven1ewdr4xe` (`id_asignatura`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (30,6,12),(30,1,1),(30,3,2),(30,2,3),(30,2,4),(30,2,5),(30,3,6),(30,7,7),(1,1,8),(30,5,9);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docentes`
--

DROP TABLE IF EXISTS `docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docentes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docentes`
--

LOCK TABLES `docentes` WRITE;
/*!40000 ALTER TABLE `docentes` DISABLE KEYS */;
INSERT INTO `docentes` VALUES (1,'Andrenasi','Mariel'),(2,'Giomi','Ariel'),(3,'Matheu','Eduardo'),(4,'Bassi','Martin'),(5,'Frontera','Omar'),(6,'Serra','Mariana'),(7,'Membriani','Javier');
/*!40000 ALTER TABLE `docentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscripciones` (
  `fechaInscripcion` datetime NOT NULL,
  `estado` int(11) DEFAULT NULL,
  `id_docente` bigint(20) NOT NULL,
  `id_asignatura` bigint(20) NOT NULL,
  `id_alumno` bigint(20) NOT NULL,
  PRIMARY KEY (`fechaInscripcion`,`id_docente`,`id_asignatura`,`id_alumno`),
  KEY `FKd4q1jyaogllcwwd2ed2b62qqj` (`id_docente`,`id_asignatura`),
  KEY `FK7va1h601nvg59dt6g6jj5qcco` (`id_alumno`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones`
--

LOCK TABLES `inscripciones` WRITE;
/*!40000 ALTER TABLE `inscripciones` DISABLE KEYS */;
INSERT INTO `inscripciones` VALUES ('2018-10-02 21:00:00',1,1,1,1),('2018-10-02 21:00:00',1,1,1,2),('2018-10-02 21:00:00',1,1,1,3),('2018-10-02 21:00:00',1,1,1,4),('2018-10-02 21:00:00',1,6,12,2),('2018-10-02 21:00:00',1,6,12,3),('2018-10-02 21:00:00',1,6,12,4),('2018-10-02 21:00:00',1,6,12,1),('2018-10-02 21:00:00',1,1,8,5),('2018-10-02 21:00:00',1,1,8,2),('2016-10-08 21:00:00',3,1,8,2),('2016-10-08 21:00:00',3,1,8,1),('2016-10-08 21:00:00',3,2,5,1),('2016-10-08 21:00:00',3,6,12,1),('2016-10-08 21:00:00',3,6,12,2);
/*!40000 ALTER TABLE `inscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(45) NOT NULL DEFAULT '',
  `password` varchar(45) NOT NULL DEFAULT '',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('jpcastro087','1234',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-05  4:17:06
