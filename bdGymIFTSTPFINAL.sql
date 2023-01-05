-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bdgimnasio
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.20-MariaDB

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
-- Table structure for table `tclase`
--

DROP TABLE IF EXISTS `tclase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tclase` (
  `idclase` int(11) NOT NULL,
  `idprofedis` int(11) NOT NULL,
  `idSala` int(11) NOT NULL,
  `idEclase` int(11) NOT NULL,
  `horaInicio` datetime NOT NULL,
  `horaFin` datetime NOT NULL,
  PRIMARY KEY (`idclase`),
  KEY `fkProf_idx` (`idprofedis`),
  KEY `fkSalaClase_idx` (`idSala`),
  KEY `fkestclase_idx` (`idEclase`),
  CONSTRAINT `fkSalaClase` FOREIGN KEY (`idSala`) REFERENCES `tsala` (`idsala`),
  CONSTRAINT `fkestclase` FOREIGN KEY (`idEclase`) REFERENCES `testadoclase` (`idestadoClase`),
  CONSTRAINT `fkpd` FOREIGN KEY (`idprofedis`) REFERENCES `tprofedisciplina` (`idpd`)
) ENGINE=InnoDB DEFAULT CHARSET=eucjpms COLLATE=eucjpms_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tclase`
--

LOCK TABLES `tclase` WRITE;
/*!40000 ALTER TABLE `tclase` DISABLE KEYS */;
INSERT INTO `tclase` VALUES (1,1,2,1,'2022-11-02 10:00:00','2022-11-02 11:00:00'),(2,2,2,1,'2022-11-02 11:00:00','2022-11-02 12:00:00'),(3,3,3,1,'2022-11-03 10:00:00','2022-11-03 11:30:00'),(4,2,1,1,'2022-11-03 10:00:00','2022-11-03 11:00:00'),(5,20,6,2,'2022-11-03 10:00:00','2022-11-03 10:00:00'),(6,10,10,1,'2022-11-03 14:00:00','2022-11-03 14:40:00'),(7,14,9,1,'2022-12-09 17:00:00','2022-12-09 18:00:00'),(8,12,2,2,'2022-10-25 11:00:00','2022-10-25 11:45:00'),(9,2,4,1,'2022-11-02 14:00:00','2022-11-02 15:30:00');
/*!40000 ALTER TABLE `tclase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tdisciplina`
--

DROP TABLE IF EXISTS `tdisciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tdisciplina` (
  `iddisciplina` int(11) NOT NULL,
  `nombreDisciplina` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `valorDisciplinaxMes` decimal(7,2) NOT NULL,
  `valorDiscxClase` decimal(7,2) NOT NULL,
  `valorAnual` decimal(7,2) NOT NULL,
  PRIMARY KEY (`iddisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tdisciplina`
--

LOCK TABLES `tdisciplina` WRITE;
/*!40000 ALTER TABLE `tdisciplina` DISABLE KEYS */;
INSERT INTO `tdisciplina` VALUES (1,'Boxeo','El entrenamiento de boxeo es, además, muy exi',2000.00,880.00,0.00),(2,'Pilates','El Método Pilates es un conjunto de movimient',1800.00,500.00,0.00),(3,'Spinning','El spinning consiste en la realización de eje',1500.00,250.00,0.00),(4,'Natación','La natación es la habilidad que permite al se',5000.00,1500.00,0.00),(5,'Aero Box','El aerobox es una opción diferente para ejerc',3000.00,1000.00,0.00),(6,'Karate-Do','Artes marciales - Shito Ryu',3500.00,1000.00,0.00),(7,'Zumba','Baile - Alegria - Ejercitación',4500.00,600.00,0.00),(8,'Crossfit','Musculación - coordinación - fuerza',5000.00,700.00,0.00),(9,'Yoga','Meditación - Armonía - Respiración - Corporal',3500.00,400.00,0.00),(10,'K-Pop','Coreografías - Baile - Coordinación',3200.00,550.00,0.00),(11,'Krav Maga','Defensa Personal - Fuerza - Coordinación',6500.00,1200.00,0.00),(12,'Funcional','Musculacion - coordinación - fuerza',3750.00,1000.00,0.00),(13,'Gimnasia Postural','Meditación - Armonía - Respiración - Corporal',4100.00,980.00,0.00),(14,'Musculación','Maquinas - Cintas - Cardio ',5700.00,650.00,0.00),(15,'Nutrición','Consultas - Seguimiento ',5000.00,2500.00,15000.00),(16,'Reserva-interna','Eventos - mantenimiento - otros',0.00,0.00,0.00);
/*!40000 ALTER TABLE `tdisciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testadoclase`
--

DROP TABLE IF EXISTS `testadoclase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testadoclase` (
  `idestadoClase` int(11) NOT NULL,
  `descEstado` varchar(45) DEFAULT 'ACT/SUS',
  PRIMARY KEY (`idestadoClase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testadoclase`
--

LOCK TABLES `testadoclase` WRITE;
/*!40000 ALTER TABLE `testadoclase` DISABLE KEYS */;
INSERT INTO `testadoclase` VALUES (1,'Activa'),(2,'Suspendida');
/*!40000 ALTER TABLE `testadoclase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testadoprofe`
--

DROP TABLE IF EXISTS `testadoprofe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testadoprofe` (
  `idEstadoProfe` int(11) NOT NULL,
  `Descripcion` varchar(45) DEFAULT 'ACT/INA',
  PRIMARY KEY (`idEstadoProfe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='				';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testadoprofe`
--

LOCK TABLES `testadoprofe` WRITE;
/*!40000 ALTER TABLE `testadoprofe` DISABLE KEYS */;
INSERT INTO `testadoprofe` VALUES (1,'Activo'),(2,'Inactivo');
/*!40000 ALTER TABLE `testadoprofe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tprofedisciplina`
--

DROP TABLE IF EXISTS `tprofedisciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tprofedisciplina` (
  `idpd` int(11) NOT NULL,
  `iddisciplina` int(11) NOT NULL,
  `idpf` int(11) NOT NULL,
  PRIMARY KEY (`idpd`),
  KEY `fkDis_idx` (`iddisciplina`),
  KEY `fkPr_idx` (`idpf`),
  CONSTRAINT `fkDis` FOREIGN KEY (`iddisciplina`) REFERENCES `tdisciplina` (`iddisciplina`),
  CONSTRAINT `fkPr` FOREIGN KEY (`idpf`) REFERENCES `tprofesor` (`idprofesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tprofedisciplina`
--

LOCK TABLES `tprofedisciplina` WRITE;
/*!40000 ALTER TABLE `tprofedisciplina` DISABLE KEYS */;
INSERT INTO `tprofedisciplina` VALUES (1,1,1),(2,2,1),(3,1,4),(4,3,2),(5,11,9),(6,6,5),(7,4,3),(8,16,11),(9,5,12),(10,15,14),(11,7,2),(12,8,6),(13,9,7),(14,10,13),(15,14,10),(16,14,9),(17,5,8),(18,1,1),(19,3,5),(20,3,11),(21,2,4);
/*!40000 ALTER TABLE `tprofedisciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tprofesor`
--

DROP TABLE IF EXISTS `tprofesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tprofesor` (
  `idprofesor` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) NOT NULL,
  `DNI` int(11) NOT NULL,
  `fechaNac` date DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `idRol` int(11) NOT NULL,
  `idEstadoProfe` int(11) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `celular` int(20) NOT NULL,
  PRIMARY KEY (`idprofesor`),
  KEY `fkRol_idx` (`idRol`),
  KEY `fkEstadoProfe_idx` (`idEstadoProfe`),
  CONSTRAINT `fkEstadoProfe` FOREIGN KEY (`idEstadoProfe`) REFERENCES `testadoprofe` (`idEstadoProfe`),
  CONSTRAINT `fkRol` FOREIGN KEY (`idRol`) REFERENCES `trolprofe` (`idrolprofe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tprofesor`
--

LOCK TABLES `tprofesor` WRITE;
/*!40000 ALTER TABLE `tprofesor` DISABLE KEYS */;
INSERT INTO `tprofesor` VALUES (1,'Nicolas','Cano',38165615,'1994-03-08','M',1,1,'NICOLASCANO2@GMAIL.COM',1532716834),(2,'Micaela','Gonzalez',38363615,'1994-04-09','F',2,1,'MICAELAGECERK2@GMAIL.COM',1532322134),(3,'Pablo','Perez',38333335,'2001-03-11','M',2,1,'PABLITOP@GMAIL.COM',1522322224),(4,'Micaela','Diaz',38155220,'1999-04-29','F',1,2,'MICADIAZ@GMAIL.COM',1532322134),(5,'Dario','Rivero',31500600,'1981-04-02','M',1,1,'dariokarate@gmail.com',1143349443),(6,'Michael','Kiton',99288233,'1970-06-23','M',2,2,'imbatman@warner.com.tv',23340003),(7,'Bruce','Lee',10200300,'1959-09-17','M',2,1,'blee@hotmail.com',55554000),(8,'Valeria','Linch',19301459,'1968-10-27','F',2,2,'vbodytime@vbodytime.com',60099321),(9,'Vladimir','Kirko',99012334,'1975-04-04','M',1,1,'krav-maga-vk@km.rus',1189895050),(10,'Federico','Araoz',27323221,'1998-02-13','M',1,1,'fede.araoz@aol.com.uy',223229932),(11,'Gym_user','Gym_interno',12345,'2000-01-01','M',1,1,'gym.ba@gym.ba.com.ar',40044004),(12,'Noelia','Silchenz',80101323,'2020-01-13','F',1,2,'ns@yahoo.com.ar',1543432344),(13,'Martina','Tesla',37002854,'1999-08-05','F',2,1,'martu.0003@edu.com.ar',232349834),(14,'Andrea','O´neill',65774443,'1994-05-16','F',2,2,'oneillandrea.star@area51.com.br',1123904765),(15,'Emanuel','Ginobilli',33456789,'1999-11-10','M',2,1,'nicolascano2@gmail.com',1545445456),(16,'Emanuel','Oberto',73345679,'1999-11-12','M',1,1,'nr2@gmail.com',1533445456),(17,'Emanuel','Delfinoo',73345679,'1994-11-12','M',1,1,'nr2@gmail.com',1533445456),(18,'Emanuel','Dele',73345679,'1994-11-12','M',1,1,'nr2@gmail.com',1533445456);
/*!40000 ALTER TABLE `tprofesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trolprofe`
--

DROP TABLE IF EXISTS `trolprofe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trolprofe` (
  `idrolprofe` int(11) NOT NULL,
  `descripcionRol` varchar(45) DEFAULT 'ADM/PROF',
  PRIMARY KEY (`idrolprofe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trolprofe`
--

LOCK TABLES `trolprofe` WRITE;
/*!40000 ALTER TABLE `trolprofe` DISABLE KEYS */;
INSERT INTO `trolprofe` VALUES (1,'ADM'),(2,'PROFE');
/*!40000 ALTER TABLE `trolprofe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tsala`
--

DROP TABLE IF EXISTS `tsala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsala` (
  `idsala` int(11) NOT NULL,
  `numSala` int(11) DEFAULT NULL,
  `piso` int(11) DEFAULT NULL,
  PRIMARY KEY (`idsala`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsala`
--

LOCK TABLES `tsala` WRITE;
/*!40000 ALTER TABLE `tsala` DISABLE KEYS */;
INSERT INTO `tsala` VALUES (1,1,1),(2,2,1),(3,3,2),(4,4,1),(5,5,1),(6,6,1),(7,7,2),(8,8,1),(9,9,2),(10,10,2);
/*!40000 ALTER TABLE `tsala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_canthoras`
--

DROP TABLE IF EXISTS `vw_canthoras`;
/*!50001 DROP VIEW IF EXISTS `vw_canthoras`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_canthoras` AS SELECT 
 1 AS `idclase`,
 1 AS `Apellido`,
 1 AS `Dias Trabajados`,
 1 AS `Cantidad de Horas Trabajadas`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'bdgimnasio'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_iInsertClase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_iInsertClase`(IN p1idclase INT(11),
IN p3numSala INT(11), IN p4pisoSala INT(11), IN p5idEclase VARCHAR(45),
IN horaInicio DATETIME, IN horaFin DATETIME, IN p6appProfe VARCHAR(45), IN p7disci VARCHAR(45))
BEGIN

INSERT INTO tclase (idclase,idprofedis,idSala,idEclase,horaInicio,horaFin)

SELECT p1idclase,

(SELECT idpd FROM tprofedisciplina pf INNER JOIN tdisciplina D ON PF.iddisciplina = D.iddisciplina
INNER JOIN tprofesor PROF ON pf.idpf= PROF.idprofesor
 WHERE D.nombreDisciplina IN (p7disci) and PROF.Apellido in (p6appProfe)),
 
(SELECT idsala FROM tsala WHERE numSala = p3numSala AND piso = p4pisoSala ),

IF (p5idEclase = 'Activa', (SELECT idestadoClase FROM testadoclase WHERE descEstado IN ('Activa')),
(SELECT idestadoClase FROM testadoclase WHERE descEstado IN ('Suspendida'))),
 horaInicio, horaFin;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_iInsertDisciplina` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_iInsertDisciplina`(IN prmId INT(11), IN prmNombreD VARCHAR(45),

IN prmDescr VARCHAR(45), IN prmValorClase DECIMAL(7,2), IN prmValorMensual DECIMAL(7,2),

 IN prmValorAnual DECIMAL(7,2) )
BEGIN

INSERT INTO  tdisciplina(iddisciplina, nombreDisciplina,descripcion, valorDisciplinaxMes,

valorDiscxClase, valorAnual )
VALUES(prmId, prmNombreD ,prmDescr,prmValorClase,prmValorMensual, prmValorAnual);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_iInsertProfe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_iInsertProfe`(IN paramId1 INT(11), 
IN paramNom2 VARCHAR(45), 
IN parmApe3 VARCHAR(45), IN parmDni4 INT(11), IN paraFech5 DATE,
IN parase6 VARCHAR(45), IN parRol VARCHAR(45),
IN parEstado VARCHAR(45),
IN prmema9 VARCHAR(45), IN parmcel INT(20))
BEGIN

INSERT INTO tprofesor(idprofesor,Nombre,Apellido,DNI,fechaNac,sexo, idRol,
idEstadoProfe,email,celular)

SELECT paramId1, 

paramNom2, 

parmApe3 ,

parmDni4 , 
 
paraFech5, 
 
parase6,
(IF (parRol = 'ADM', (SELECT idrolprofe FROM trolprofe WHERE descripcionRol = 'ADM'), 
(SELECT idrolprofe FROM trolprofe WHERE descripcionRol = 'PROFE'))),
IF(parEstado = 'Activo', (SELECT idEstadoProfe FROM testadoprofe WHERE Descripcion IN ('ACTIVO')),
(SELECT idEstadoProfe FROM testadoprofe WHERE Descripcion IN ('Inactivo')))
, 

prmema9, parmcel;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_iInsertsala` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_iInsertsala`(IN prmId INT(11), IN prmnumsala INT(11), IN prmpiso INT(11) )
BEGIN

INSERT INTO tsala(idsala, numSala, piso)
VALUES (prmId, prmnumsala , prmpiso);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_iProfDisc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_iProfDisc`(IN parId INT(11), parApellido VARCHAR(45), IN parDisc VARCHAR(45))
BEGIN
INSERT INTO tprofedisciplina(idpd,iddisciplina, idpf )
SELECT parId,
(SELECT iddisciplina FROM tdisciplina WHERE nombreDisciplina IN (parDisc)),
(SELECT idprofesor FROM tprofesor WHERE Apellido IN (parApellido));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_canthoras`
--

/*!50001 DROP VIEW IF EXISTS `vw_canthoras`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_canthoras` AS select `c`.`idclase` AS `idclase`,`p`.`Apellido` AS `Apellido`,count(distinct cast(`c`.`horaInicio` as date)) AS `Dias Trabajados`,time_format(sec_to_time(sum(time_to_sec(timediff(`c`.`horaFin`,`c`.`horaInicio`)))),'%H:%i') AS `Cantidad de Horas Trabajadas` from (((`tclase` `c` join `tprofedisciplina` `pf` on(`c`.`idprofedis` = `pf`.`idpd`)) join `tprofesor` `p` on(`pf`.`idpf` = `p`.`idprofesor`)) join `tdisciplina` `d` on(`pf`.`iddisciplina` = `d`.`iddisciplina`)) group by `p`.`idprofesor` */;
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

-- Dump completed on 2022-11-17 13:56:36
