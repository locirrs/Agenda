CREATE DATABASE  IF NOT EXISTS `db_consultas` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_consultas`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: db_consultas
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `tb_medicos`
--

DROP TABLE IF EXISTS `tb_medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_medicos` (
  `med_cd` int(11) NOT NULL AUTO_INCREMENT,
  `med_crm` varchar(45) NOT NULL,
  `med_especialidades` varchar(45) NOT NULL,
  PRIMARY KEY (`med_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

ALTER TABLE `db_consultas`.`tb_medicos` 
ADD COLUMN `med_nome` VARCHAR(45) NULL AFTER `med_especialidades`;

--
-- Dumping data for table `tb_medicos`
--

LOCK TABLES `tb_medicos` WRITE;
/*!40000 ALTER TABLE `tb_medicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pacientes`
--

DROP TABLE IF EXISTS `tb_pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pacientes` (
  `pac_nome` int(11) NOT NULL AUTO_INCREMENT,
  `pac_data_nascimento` date NOT NULL,
  `pac_contato` varchar(45) NOT NULL,
  `pac_cpf` varchar(45) NOT NULL,
  `pac_plano_saude` varchar(45) NOT NULL,
  PRIMARY KEY (`pac_nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

ALTER TABLE `db_consultas`.`tb_pacientes` 
ADD COLUMN `pac_nome` VARCHAR(45) NULL AFTER `pac_plano_saude`;
ALTER TABLE `db_consultas`.`tb_pacientes` 
CHANGE COLUMN `pac_plano_saude` `pac_nome` VARCHAR(45) NOT NULL ;

CREATE TABLE `db_consultas`.`tb_consultas` (
  `con_cd` INT NOT NULL,
  `con_data` DATETIME NOT NULL,
  `con_pac_cd` INT NOT NULL,
  `con_med_cd` INT NOT NULL,
  `con_hora` DATETIME NOT NULL,
  PRIMARY KEY (`con_cd`),
  INDEX `fk_tb_consultas_tb_pacientes_idx` (`con_pac_cd` ASC),
  INDEX `fk_tb_consultas_tb_medicos_idx` (`con_med_cd` ASC),
  CONSTRAINT `fk_tb_consultas_tb_pacientes`
    FOREIGN KEY (`con_pac_cd`)
    REFERENCES `db_consultas`.`tb_pacientes` (`pac_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_consultas_tb_medicos`
    FOREIGN KEY (`con_med_cd`)
    REFERENCES `db_consultas`.`tb_medicos` (`med_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = '		';
ALTER TABLE `db_consultas`.`tb_consultas` 
CHANGE COLUMN `con_cd` `con_cd` INT(11) NOT NULL AUTO_INCREMENT ;

--
-- Dumping data for table `tb_pacientes`
--

LOCK TABLES `tb_pacientes` WRITE;
/*!40000 ALTER TABLE `tb_pacientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pacientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

DROP TABLE IF EXISTS `tb_funcionario`;

CREATE TABLE `tb_funcionario` (
  `fun_cd` INT NOT NULL,
  `fun_nome` VARCHAR(45) NULL,
  `fun_cpf` VARCHAR(45) NULL,
  `fun_cargo` VARCHAR(45) NULL,
  `fun_telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`fun_cd`));

  
  ALTER TABLE `db_consultas`.`tb_funcionario` 
CHANGE COLUMN `fun_cd` `fun_cd` INT(11) NOT NULL AUTO_INCREMENT ;

-- Dump completed on 2014-11-12 13:30:39
