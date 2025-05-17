CREATE DATABASE  IF NOT EXISTS `projetoestoque` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `projetoestoque`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: projetoestoque
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `atendimento`
--

DROP TABLE IF EXISTS `atendimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atendimento` (
  `IDATENDIMENTO` int NOT NULL,
  `DATAENTRADA` date DEFAULT NULL,
  `IDMEDICO` int DEFAULT NULL,
  `CID` varchar(45) DEFAULT NULL,
  `IDPACIENTE` int DEFAULT NULL,
  `DATASAIDA` date DEFAULT NULL,
  `RESULTADO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDATENDIMENTO`),
  KEY `IDPRONTUARIO_idx` (`IDPACIENTE`),
  KEY `IDMEDICO_idx` (`IDMEDICO`),
  CONSTRAINT `IDMEDICO` FOREIGN KEY (`IDMEDICO`) REFERENCES `medico` (`IDMEDICO`),
  CONSTRAINT `IDPRONTUARIO` FOREIGN KEY (`IDPACIENTE`) REFERENCES `paciente` (`IDPACIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atendimento`
--

LOCK TABLES `atendimento` WRITE;
/*!40000 ALTER TABLE `atendimento` DISABLE KEYS */;
INSERT INTO `atendimento` VALUES (1,'2024-01-01',1,'A01',1,NULL,'Internado'),(2,'2024-02-01',2,'B02',2,NULL,'Internado'),(3,'2024-03-01',3,'C03',3,NULL,'Internado'),(4,'2024-04-01',4,'D04',4,NULL,'Internado'),(5,'2024-05-01',5,'E05',5,NULL,'Internado'),(6,'2024-06-01',6,'F06',6,NULL,'Internado'),(7,'2024-07-01',7,'G07',7,NULL,'Internado'),(8,'2024-08-01',8,'H08',8,NULL,'Internado'),(9,'2024-09-01',9,'I09',9,'2024-09-10','Óbito'),(10,'2024-10-01',10,'J10',10,'2024-10-15','Óbito'),(11,'2024-11-01',1,'K11',11,'2024-11-10','Óbito'),(12,'2024-12-01',2,'L12',12,'2024-12-20','Óbito'),(13,'2024-01-01',3,'M13',13,NULL,'Internado'),(14,'2024-02-01',4,'N14',14,NULL,'Internado'),(15,'2024-03-01',5,'O15',15,NULL,'Internado'),(16,'2024-04-01',6,'P16',16,NULL,'Internado'),(17,'2024-05-01',7,'Q17',17,NULL,'Internado'),(18,'2024-06-01',8,'R18',18,NULL,'Internado'),(19,'2024-07-01',9,'S19',19,NULL,'Internado'),(20,'2024-08-01',10,'T20',20,NULL,'Internado'),(21,'2024-09-01',1,'U21',21,'2024-09-10','Óbito'),(22,'2024-10-01',2,'V22',22,'2024-10-15','Óbito'),(23,'2024-11-01',3,'W23',23,'2024-11-10','Alta'),(24,'2024-12-01',4,'X24',24,'2024-12-20','Alta'),(25,'2024-01-01',5,'Y25',25,NULL,'Internado'),(26,'2024-02-01',6,'Z26',26,NULL,'Internado'),(27,'2024-03-01',7,'A27',27,NULL,'Internado'),(28,'2024-04-01',8,'B28',28,NULL,'Internado'),(29,'2024-05-01',9,'C29',29,NULL,'Internado'),(30,'2024-06-01',10,'D30',30,NULL,'Internado'),(31,'2024-07-01',1,'E31',31,'2024-07-10','Alta'),(32,'2024-08-01',2,'F32',32,'2024-08-15','Óbito'),(33,'2024-09-01',3,'G33',33,'2024-09-10','Óbito'),(34,'2024-10-01',4,'H34',34,'2024-10-15','Alta'),(35,'2024-11-01',5,'I35',35,NULL,'Internado'),(36,'2024-12-01',6,'J36',36,NULL,'Internado'),(37,'2024-01-01',7,'K37',37,'2024-01-10','Alta'),(38,'2024-01-10',1,'C34',38,NULL,'Internado'),(39,'2024-02-01',2,'C43',39,NULL,'Internado'),(40,'2024-03-05',3,'C50',40,NULL,'Internado'),(41,'2024-04-02',4,'D73',41,NULL,'Internado'),(42,'2024-05-01',5,'C77',42,NULL,'Internado'),(43,'2024-06-01',6,'E11',43,NULL,'Internado'),(44,'2024-07-01',7,'C91',44,NULL,'Internado'),(45,'2024-08-01',8,'D39',45,NULL,'Internado'),(46,'2024-09-01',9,'E12',46,'2024-09-10','Alta'),(47,'2024-10-01',10,'C54',47,'2024-10-15','Alta'),(48,'2024-11-01',1,'D32',48,'2024-11-10','Alta'),(49,'2024-12-01',2,'E40',49,'2024-12-20','Óbito'),(50,'2024-01-15',3,'F20',50,NULL,'Internado'),(51,'2024-02-10',4,'G30',51,NULL,'Internado'),(52,'2024-03-15',5,'H10',52,NULL,'Internado'),(53,'2024-04-10',6,'I20',53,NULL,'Internado'),(54,'2024-05-15',7,'J40',54,NULL,'Internado'),(55,'2024-06-01',8,'K30',55,NULL,'Internado'),(56,'2024-07-01',9,'L10',56,NULL,'Internado'),(57,'2024-08-01',10,'M20',57,NULL,'Internado'),(58,'2024-09-01',1,'N30',58,'2024-09-10','Óbito'),(59,'2024-10-01',2,'O40',59,'2024-10-15','Óbito'),(60,'2024-11-01',3,'P50',60,'2024-11-10','Alta'),(61,'2024-12-01',4,'Q60',61,'2024-12-20','Óbito'),(62,'2024-01-01',5,'R70',62,NULL,'Internado'),(63,'2024-02-01',6,'S80',63,NULL,'Internado'),(64,'2024-03-01',7,'T90',64,NULL,'Internado'),(65,'2024-04-01',8,'U10',65,NULL,'Internado'),(66,'2024-05-01',9,'V20',66,NULL,'Internado'),(67,'2024-06-01',10,'W30',67,NULL,'Internado'),(68,'2024-07-01',1,'X40',68,'2024-07-10','Óbito'),(69,'2024-08-01',2,'Y50',69,'2024-08-15','Alta'),(70,'2024-09-01',3,'Z60',70,'2024-09-10','Óbito'),(71,'2024-10-01',4,'A70',71,'2024-10-15','Óbito'),(72,'2024-11-01',5,'B80',72,NULL,'Internado'),(73,'2024-12-01',6,'C90',73,NULL,'Internado'),(74,'2024-01-01',7,'D10',74,'2024-01-10','Alta'),(75,'2024-02-01',8,'E20',75,'2024-02-10','Alta'),(76,'2024-03-01',9,'F30',76,'2024-03-10','Alta'),(77,'2024-04-01',10,'G40',77,'2024-04-10','Alta'),(78,'2024-05-01',1,'H50',78,NULL,'Internado'),(79,'2024-06-01',2,'I60',79,NULL,'Internado'),(80,'2024-07-01',3,'J70',80,NULL,'Internado'),(81,'2024-08-01',4,'K80',81,NULL,'Internado'),(82,'2024-09-01',5,'L90',82,NULL,'Internado'),(83,'2024-10-01',6,'M10',83,NULL,'Internado'),(84,'2024-11-01',7,'N20',84,'2024-11-10','Alta'),(85,'2024-12-01',8,'O30',85,'2024-12-10','Alta'),(86,'2024-01-01',9,'P40',86,'2024-01-10','Alta'),(87,'2024-02-01',10,'Q50',87,'2024-02-10','Óbito'),(88,'2024-03-01',1,'R60',88,'2024-03-10','Alta'),(89,'2024-04-01',2,'S70',89,'2024-04-10','Alta'),(90,'2024-05-01',3,'T80',90,'2024-05-10','Óbito'),(91,'2024-06-01',4,'U90',91,'2024-06-10','Óbito'),(92,'2024-07-01',5,'V10',92,NULL,'Internado'),(93,'2024-08-01',6,'W20',93,NULL,'Internado'),(94,'2024-09-01',7,'X30',94,NULL,'Internado'),(95,'2024-10-01',8,'Y40',95,NULL,'Internado'),(96,'2024-11-01',9,'Z50',96,'2024-11-10','Alta'),(97,'2024-12-01',10,'A60',97,'2024-12-10','Alta'),(98,'2024-01-01',1,'B70',98,'2024-01-10','Alta'),(99,'2024-02-01',2,'C80',99,'2024-02-10','Alta'),(100,'2024-03-01',3,'D90',100,'2024-03-10','Alta'),(101,'2024-04-01',4,'E10',101,'2024-04-10','Óbito'),(102,'2024-05-01',5,'F20',102,'2024-05-10','Alta'),(103,'2024-06-01',6,'G30',103,'2024-06-10','Alta'),(104,'2024-07-01',7,'H40',104,NULL,'Internado'),(105,'2024-08-01',8,'I50',105,NULL,'Internado'),(106,'2024-09-01',9,'J60',106,'2024-09-10','Óbito'),(107,'2024-10-01',10,'K70',107,NULL,'Internado'),(108,'2024-11-01',1,'L80',108,NULL,'Internado'),(109,'2024-12-01',2,'M90',109,NULL,'Internado'),(110,'2024-01-01',3,'N10',110,'2024-01-10','Alta'),(111,'2024-02-01',4,'O20',111,'2024-02-10','Óbito'),(112,'2024-03-01',5,'P30',112,'2024-03-10','Óbito'),(113,'2024-04-01',6,'Q40',113,NULL,'Internado'),(114,'2024-05-01',7,'R50',114,NULL,'Internado'),(115,'2024-06-01',8,'S60',115,'2024-06-10','Óbito'),(116,'2024-07-01',9,'T70',116,'2024-07-10','Óbito'),(117,'2024-08-01',10,'U80',117,'2024-08-10','Alta'),(118,'2024-09-01',1,'V90',118,NULL,'Internado'),(119,'2024-10-01',2,'W10',119,'2024-10-10','Óbito'),(120,'2024-11-01',3,'X20',120,'2024-11-10','Alta'),(121,'2024-12-01',4,'Y30',121,'2024-12-10','Óbito'),(122,'2024-01-01',5,'Z40',122,NULL,'Internado'),(123,'2024-02-01',6,'A50',123,NULL,'Internado'),(124,'2024-03-01',7,'B60',124,'2024-03-10','Alta'),(125,'2024-04-01',8,'C70',125,'2024-04-10','Alta'),(126,'2024-05-01',9,'D80',126,NULL,'Internado'),(127,'2024-06-01',10,'E90',127,NULL,'Internado'),(128,'2024-07-01',1,'F10',128,NULL,'Internado'),(129,'2024-08-01',2,'G20',129,'2024-08-10','Óbito'),(130,'2024-09-01',3,'H30',130,'2024-09-10','Alta'),(131,'2024-10-01',4,'I40',131,NULL,'Internado'),(132,'2024-11-01',5,'J50',132,'2024-11-10','Óbito'),(133,'2024-12-01',6,'K60',133,NULL,'Internado'),(134,'2024-01-01',7,'L70',134,NULL,'Internado'),(135,'2024-02-01',8,'M80',135,NULL,'Internado'),(136,'2024-03-01',9,'N90',136,'2024-03-10','Óbito'),(137,'2024-04-01',10,'O10',137,'2024-04-10','Óbito'),(138,'2024-05-01',1,'P20',138,NULL,'Internado'),(139,'2024-06-01',2,'Q30',139,NULL,'Internado'),(140,'2024-07-01',3,'R40',140,NULL,'Internado'),(141,'2024-08-01',4,'S50',141,NULL,'Internado'),(142,'2024-09-01',5,'T60',142,NULL,'Internado'),(143,'2024-10-01',6,'U70',143,'2024-10-10','Alta'),(144,'2024-11-01',7,'V80',144,'2024-11-10','Óbito'),(145,'2024-12-01',8,'W90',145,NULL,'Internado'),(146,'2024-01-01',9,'X10',146,NULL,'Internado'),(147,'2024-02-01',10,'Y20',147,NULL,'Internado'),(148,'2024-03-01',1,'Z30',148,NULL,'Internado'),(149,'2024-04-01',2,'A40',149,'2024-04-10','Alta'),(150,'2024-05-01',3,'B50',150,'2024-05-10','Óbito');
/*!40000 ALTER TABLE `atendimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complementos_fornecedor`
--

DROP TABLE IF EXISTS `complementos_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complementos_fornecedor` (
  `IDFORNECEDOR` int DEFAULT NULL,
  `ENDERECO` varchar(80) DEFAULT NULL,
  `NUMERO` varchar(15) DEFAULT NULL,
  `TELEFONE` varchar(9) DEFAULT NULL,
  `DDD` varchar(2) DEFAULT NULL,
  KEY `IDFORNECEDOR_idx` (`IDFORNECEDOR`),
  CONSTRAINT `IDFORNECEDOR_2` FOREIGN KEY (`IDFORNECEDOR`) REFERENCES `fornecedor` (`IDFORNECEDOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complementos_fornecedor`
--

LOCK TABLES `complementos_fornecedor` WRITE;
/*!40000 ALTER TABLE `complementos_fornecedor` DISABLE KEYS */;
INSERT INTO `complementos_fornecedor` VALUES (1,'Rua dos 13','0','987654321','11'),(2,'Avenida das Estrelas','123','876543210','21'),(3,'Praça da Liberdade','456','765432109','19');
/*!40000 ALTER TABLE `complementos_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descricaomedicamento`
--

DROP TABLE IF EXISTS `descricaomedicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descricaomedicamento` (
  `idDESCRICAOMEDICAMENTO` int NOT NULL AUTO_INCREMENT,
  `DESCRICAOMEDICAMENTO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDESCRICAOMEDICAMENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descricaomedicamento`
--

LOCK TABLES `descricaomedicamento` WRITE;
/*!40000 ALTER TABLE `descricaomedicamento` DISABLE KEYS */;
INSERT INTO `descricaomedicamento` VALUES (1,'Ansiolíticos'),(2,'Analgésicos'),(3,'Anti-inflamatórios'),(4,'Antibióticos'),(5,'Antialérgicos'),(6,'Antidepressivos'),(7,'Antipiréticos'),(8,'Antidiabéticos'),(9,'Antihipertensivos'),(10,'Anticoagulantes'),(11,'Antieméticos'),(12,'Antifúngicos'),(13,'Antimaláricos'),(14,'Antivirais'),(15,'Antipsicóticos'),(16,'Antiespasmódicos'),(17,'Broncodilatadores'),(18,'Diuréticos'),(19,'Estimulantes'),(20,'Hormônios'),(21,'Antiparasitários');
/*!40000 ALTER TABLE `descricaomedicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermeiro`
--

DROP TABLE IF EXISTS `enfermeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfermeiro` (
  `idENFERMEIRO` int NOT NULL,
  `NOME` varchar(45) DEFAULT NULL,
  `COREN` int DEFAULT NULL,
  `CARGO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idENFERMEIRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermeiro`
--

LOCK TABLES `enfermeiro` WRITE;
/*!40000 ALTER TABLE `enfermeiro` DISABLE KEYS */;
INSERT INTO `enfermeiro` VALUES (1,'Ana Silva',12345,'Enfermeira Chefe'),(2,'Carlos Santos',12346,'Enfermeiro'),(3,'Maria Oliveira',12347,'Enfermeira'),(4,'Roberto Almeida',12348,'Enfermeiro Técnico');
/*!40000 ALTER TABLE `enfermeiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmaceutico`
--

DROP TABLE IF EXISTS `farmaceutico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farmaceutico` (
  `IDFARMACEUTICO` int NOT NULL,
  `NOME` varchar(45) DEFAULT NULL,
  `CRF` int DEFAULT NULL,
  `CARGO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDFARMACEUTICO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmaceutico`
--

LOCK TABLES `farmaceutico` WRITE;
/*!40000 ALTER TABLE `farmaceutico` DISABLE KEYS */;
INSERT INTO `farmaceutico` VALUES (1,'Maria Silva',12345,'Farmacêutica Responsável'),(2,'João Souza',67890,'Assistente Farmacêutico'),(3,'Ana Pereira',11223,'Farmacêutica Clínica');
/*!40000 ALTER TABLE `farmaceutico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `IDFORNECEDOR` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(45) NOT NULL,
  `CNPJ` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`IDFORNECEDOR`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Farmácia Hospitalar Ltda','12345678000190'),(2,'Distribuidora de Medicamentos SA','98765432000112'),(3,'Laboratório Saúde & Cia','23456789000134');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liberacao`
--

DROP TABLE IF EXISTS `liberacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liberacao` (
  `IDLIBERACAO` int DEFAULT NULL,
  `IDUSUARIO` int DEFAULT NULL,
  `LIBERADO` varchar(1) DEFAULT NULL,
  `IDFARMACEUTICO` int DEFAULT NULL,
  `DATASOLICITACAO` date DEFAULT NULL,
  KEY `IDUSUARIO_idx` (`IDUSUARIO`),
  KEY `IDFARMACEUTICO_idx` (`IDFARMACEUTICO`),
  KEY `IDLIBERA_idx` (`IDLIBERACAO`),
  CONSTRAINT `IDFARMACEUTICO` FOREIGN KEY (`IDFARMACEUTICO`) REFERENCES `farmaceutico` (`IDFARMACEUTICO`),
  CONSTRAINT `IDLIBERA` FOREIGN KEY (`IDLIBERACAO`) REFERENCES `movimentacoesestoque` (`IDLIBERACAO`),
  CONSTRAINT `IDUSUARIO` FOREIGN KEY (`IDUSUARIO`) REFERENCES `usuario` (`IDUSUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liberacao`
--

LOCK TABLES `liberacao` WRITE;
/*!40000 ALTER TABLE `liberacao` DISABLE KEYS */;
INSERT INTO `liberacao` VALUES (1,76,'S',3,'2024-08-24'),(40,167,'S',2,'2024-08-24'),(41,128,'S',3,'2024-08-24'),(118,150,'S',3,'2024-08-24'),(128,157,'S',2,'2024-08-24'),(129,121,'S',3,'2024-08-24'),(2,83,'S',2,'2024-08-24'),(42,89,'S',3,'2024-08-24'),(43,107,'S',1,'2024-08-24'),(119,28,'S',2,'2024-08-24'),(130,132,'S',2,'2024-08-24'),(131,166,'S',3,'2024-08-24'),(3,153,'S',1,'2024-08-24'),(44,34,'S',2,'2024-08-24'),(45,135,'S',2,'2024-08-24'),(120,79,'S',1,'2024-08-24'),(132,37,'S',1,'2024-08-24'),(133,56,'S',3,'2024-08-24'),(4,74,'S',3,'2024-08-24'),(46,74,'S',3,'2024-08-24'),(47,115,'S',2,'2024-08-24'),(121,23,'S',3,'2024-08-24'),(134,50,'S',1,'2024-08-24'),(135,29,'S',1,'2024-08-24'),(5,41,'S',2,'2024-08-24'),(48,89,'S',1,'2024-08-24'),(49,81,'S',1,'2024-08-24'),(122,155,'S',3,'2024-08-24'),(136,44,'S',2,'2024-08-24'),(137,34,'S',3,'2024-08-24'),(6,125,'S',3,'2024-08-24'),(50,63,'S',3,'2024-08-24'),(51,156,'S',3,'2024-08-24'),(123,133,'S',3,'2024-08-24'),(138,20,'S',1,'2024-08-24'),(139,47,'S',2,'2024-08-24'),(7,121,'S',3,'2024-08-24'),(52,112,'S',1,'2024-08-24'),(53,84,'S',2,'2024-08-24'),(124,133,'S',3,'2024-08-24'),(140,76,'S',2,'2024-08-24'),(141,116,'S',1,'2024-08-24'),(8,139,'S',1,'2024-08-24'),(54,168,'S',1,'2024-08-24'),(55,162,'S',1,'2024-08-24'),(125,142,'S',3,'2024-08-24'),(142,169,'S',1,'2024-08-24'),(143,40,'S',1,'2024-08-24'),(9,47,'S',3,'2024-08-24'),(56,70,'S',3,'2024-08-24'),(57,52,'S',3,'2024-08-24'),(126,60,'S',2,'2024-08-24'),(144,68,'S',1,'2024-08-24'),(145,40,'S',3,'2024-08-24'),(10,76,'S',2,'2024-08-24'),(58,56,'S',3,'2024-08-24'),(59,121,'S',2,'2024-08-24'),(127,109,'S',2,'2024-08-24'),(146,125,'S',1,'2024-08-24'),(147,28,'S',3,'2024-08-24'),(11,64,'S',3,'2024-08-24'),(60,152,'S',2,'2024-08-24'),(61,54,'S',3,'2024-08-24'),(148,97,'S',3,'2024-08-24'),(149,121,'S',3,'2024-08-24'),(12,169,'S',1,'2024-08-24'),(62,162,'S',3,'2024-08-24'),(63,111,'S',1,'2024-08-24'),(150,74,'S',3,'2024-08-24'),(151,118,'S',1,'2024-08-24'),(13,139,'S',2,'2024-08-24'),(64,34,'S',3,'2024-08-24'),(65,126,'S',2,'2024-08-24'),(152,88,'S',3,'2024-08-24'),(153,80,'S',1,'2024-08-24'),(14,62,'S',1,'2024-08-24'),(66,28,'S',3,'2024-08-24'),(67,92,'S',1,'2024-08-24'),(154,155,'S',2,'2024-08-24'),(155,93,'S',2,'2024-08-24'),(15,73,'S',3,'2024-08-24'),(68,32,'S',1,'2024-08-24'),(69,37,'S',3,'2024-08-24'),(156,23,'S',2,'2024-08-24'),(157,158,'S',1,'2024-08-24'),(16,30,'S',3,'2024-08-24'),(70,31,'S',3,'2024-08-24'),(71,158,'S',3,'2024-08-24'),(158,100,'S',1,'2024-08-24'),(159,55,'S',2,'2024-08-24'),(17,50,'S',1,'2024-08-24'),(72,39,'S',2,'2024-08-24'),(73,25,'S',3,'2024-08-24'),(160,164,'S',2,'2024-08-24'),(161,35,'S',2,'2024-08-24'),(18,37,'S',1,'2024-08-24'),(74,163,'S',2,'2024-08-24'),(75,111,'S',3,'2024-08-24'),(162,68,'S',3,'2024-08-24'),(163,49,'S',2,'2024-08-24'),(19,52,'S',3,'2024-08-24'),(76,129,'S',2,'2024-08-24'),(77,90,'S',1,'2024-08-24'),(164,100,'S',1,'2024-08-24'),(165,110,'S',3,'2024-08-24'),(20,124,'S',2,'2024-08-24'),(78,89,'S',1,'2024-08-24'),(79,38,'S',1,'2024-08-24'),(166,134,'S',3,'2024-08-24'),(167,104,'S',1,'2024-08-24'),(21,134,'S',2,'2024-08-24'),(80,56,'S',2,'2024-08-24'),(81,88,'S',2,'2024-08-24'),(168,163,'S',3,'2024-08-24'),(169,69,'S',2,'2024-08-24'),(22,66,'S',1,'2024-08-24'),(82,83,'S',1,'2024-08-24'),(83,84,'S',1,'2024-08-24'),(170,132,'S',3,'2024-08-24'),(171,142,'S',3,'2024-08-24'),(23,109,'S',3,'2024-08-24'),(84,161,'S',2,'2024-08-24'),(85,90,'S',2,'2024-08-24'),(172,105,'S',1,'2024-08-24'),(173,156,'S',2,'2024-08-24'),(24,73,'S',1,'2024-08-24'),(86,136,'S',2,'2024-08-24'),(87,151,'S',3,'2024-08-24'),(174,107,'S',1,'2024-08-24'),(175,126,'S',3,'2024-08-24'),(26,51,'S',1,'2024-08-24'),(90,149,'S',3,'2024-08-24'),(91,58,'S',1,'2024-08-24'),(177,83,'S',3,'2024-08-24'),(178,61,'S',1,'2024-08-24'),(27,121,'S',1,'2024-08-24'),(92,134,'S',2,'2024-08-24'),(93,104,'S',1,'2024-08-24'),(179,42,'S',2,'2024-08-24'),(180,97,'S',1,'2024-08-24'),(28,44,'S',1,'2024-08-24'),(94,164,'S',2,'2024-08-24'),(95,134,'S',3,'2024-08-24'),(181,20,'S',2,'2024-08-24'),(182,48,'S',1,'2024-08-24'),(29,152,'S',1,'2024-08-24'),(96,89,'S',1,'2024-08-24'),(97,78,'S',1,'2024-08-24'),(183,138,'S',3,'2024-08-24'),(184,39,'S',1,'2024-08-24'),(30,57,'S',2,'2024-08-24'),(98,158,'S',3,'2024-08-24'),(99,45,'S',3,'2024-08-24'),(185,163,'S',2,'2024-08-24'),(186,106,'S',2,'2024-08-24'),(31,160,'S',2,'2024-08-24'),(100,87,'S',3,'2024-08-24'),(101,166,'S',3,'2024-08-24'),(187,57,'S',2,'2024-08-24'),(188,68,'S',2,'2024-08-24'),(32,29,'S',1,'2024-08-24'),(102,95,'S',2,'2024-08-24'),(103,129,'S',1,'2024-08-24'),(189,159,'S',3,'2024-08-24'),(190,71,'S',2,'2024-08-24'),(34,150,'S',1,'2024-08-24'),(106,25,'S',1,'2024-08-24'),(107,153,'S',2,'2024-08-24'),(193,56,'S',2,'2024-08-24'),(194,131,'S',2,'2024-08-24'),(35,59,'S',2,'2024-08-24'),(108,24,'S',3,'2024-08-24'),(109,27,'S',2,'2024-08-24'),(195,138,'S',1,'2024-08-24'),(196,83,'S',3,'2024-08-24'),(36,107,'S',2,'2024-08-24'),(110,31,'S',3,'2024-08-24'),(111,61,'S',3,'2024-08-24'),(197,37,'S',2,'2024-08-24'),(198,47,'S',1,'2024-08-24'),(37,111,'S',2,'2024-08-24'),(112,79,'S',2,'2024-08-24'),(113,22,'S',2,'2024-08-24'),(199,82,'S',1,'2024-08-24'),(200,30,'S',2,'2024-08-24'),(38,143,'S',1,'2024-08-24'),(114,121,'S',2,'2024-08-24'),(115,85,'S',2,'2024-08-24'),(201,49,'S',1,'2024-08-24'),(202,53,'S',1,'2024-08-24'),(39,109,'S',2,'2024-08-24'),(116,80,'S',1,'2024-08-24'),(117,28,'S',2,'2024-08-24'),(203,149,'S',3,'2024-08-24'),(204,122,'S',3,'2024-08-24'),(1,68,'S',2,'2024-08-24'),(40,46,'S',3,'2024-08-24'),(41,89,'S',3,'2024-08-24'),(118,20,'S',2,'2024-08-24'),(128,103,'S',3,'2024-08-24'),(129,104,'S',1,'2024-08-24'),(2,120,'S',1,'2024-08-24'),(42,117,'S',3,'2024-08-24'),(43,61,'S',2,'2024-08-24'),(119,104,'S',3,'2024-08-24'),(130,120,'S',3,'2024-08-24'),(131,37,'S',2,'2024-08-24'),(3,89,'S',1,'2024-08-24'),(44,57,'S',1,'2024-08-24'),(45,146,'S',2,'2024-08-24'),(120,152,'S',2,'2024-08-24'),(132,128,'S',3,'2024-08-24'),(133,101,'S',1,'2024-08-24'),(4,44,'S',1,'2024-08-24'),(46,27,'S',2,'2024-08-24'),(47,111,'S',1,'2024-08-24'),(121,99,'S',1,'2024-08-24'),(134,44,'S',2,'2024-08-24'),(135,24,'S',3,'2024-08-24'),(5,150,'S',1,'2024-08-24'),(48,97,'S',2,'2024-08-24'),(49,89,'S',3,'2024-08-24'),(122,140,'S',3,'2024-08-24'),(136,36,'S',2,'2024-08-24'),(137,99,'S',2,'2024-08-24'),(6,26,'S',1,'2024-08-24'),(50,112,'S',2,'2024-08-24'),(51,63,'S',2,'2024-08-24'),(123,84,'S',1,'2024-08-24'),(138,62,'S',2,'2024-08-24'),(139,163,'S',3,'2024-08-24'),(7,148,'S',3,'2024-08-24'),(52,51,'S',3,'2024-08-24'),(53,102,'S',1,'2024-08-24'),(124,72,'S',2,'2024-08-24'),(140,78,'S',1,'2024-08-24'),(141,86,'S',2,'2024-08-24'),(8,31,'S',2,'2024-08-24'),(54,165,'S',3,'2024-08-24'),(55,163,'S',1,'2024-08-24'),(125,144,'S',1,'2024-08-24'),(142,75,'S',1,'2024-08-24'),(143,96,'S',2,'2024-08-24'),(9,82,'S',1,'2024-08-24'),(56,25,'S',3,'2024-08-24'),(57,52,'S',2,'2024-08-24'),(126,116,'S',2,'2024-08-24'),(144,77,'S',1,'2024-08-24'),(145,112,'S',3,'2024-08-24'),(10,113,'S',2,'2024-08-24'),(58,44,'S',2,'2024-08-24'),(59,59,'S',1,'2024-08-24'),(127,93,'S',1,'2024-08-24'),(146,69,'S',2,'2024-08-24'),(147,31,'S',3,'2024-08-24'),(11,99,'S',3,'2024-08-24'),(60,115,'S',3,'2024-08-24'),(61,102,'S',3,'2024-08-24'),(148,95,'S',3,'2024-08-24'),(149,101,'S',1,'2024-08-24'),(12,141,'S',2,'2024-08-24'),(62,167,'S',3,'2024-08-24'),(63,159,'S',3,'2024-08-24'),(150,106,'S',2,'2024-08-24'),(151,91,'S',3,'2024-08-24'),(13,23,'S',1,'2024-08-24'),(64,147,'S',3,'2024-08-24'),(65,21,'S',3,'2024-08-24'),(152,93,'S',1,'2024-08-24'),(153,79,'S',2,'2024-08-24'),(14,161,'S',3,'2024-08-24'),(66,79,'S',2,'2024-08-24'),(67,22,'S',1,'2024-08-24'),(154,56,'S',1,'2024-08-24'),(155,57,'S',3,'2024-08-24'),(15,61,'S',1,'2024-08-24'),(68,137,'S',1,'2024-08-24'),(69,46,'S',2,'2024-08-24'),(156,48,'S',2,'2024-08-24'),(157,133,'S',1,'2024-08-24'),(16,28,'S',1,'2024-08-24'),(70,123,'S',3,'2024-08-24'),(71,24,'S',3,'2024-08-24'),(158,164,'S',1,'2024-08-24'),(159,43,'S',2,'2024-08-24'),(17,80,'S',1,'2024-08-24'),(72,29,'S',3,'2024-08-24'),(73,79,'S',3,'2024-08-24'),(160,30,'S',1,'2024-08-24'),(161,63,'S',3,'2024-08-24'),(18,56,'S',2,'2024-08-24'),(74,147,'S',2,'2024-08-24'),(75,60,'S',2,'2024-08-24'),(162,121,'S',3,'2024-08-24'),(163,151,'S',1,'2024-08-24'),(19,48,'S',3,'2024-08-24'),(76,150,'S',1,'2024-08-24'),(77,115,'S',1,'2024-08-24'),(164,76,'S',3,'2024-08-24'),(165,48,'S',2,'2024-08-24'),(20,110,'S',3,'2024-08-24'),(78,64,'S',2,'2024-08-24'),(79,78,'S',2,'2024-08-24'),(166,68,'S',2,'2024-08-24'),(167,154,'S',2,'2024-08-24'),(21,124,'S',2,'2024-08-24'),(80,146,'S',2,'2024-08-24'),(81,82,'S',3,'2024-08-24'),(168,63,'S',1,'2024-08-24'),(169,48,'S',2,'2024-08-24'),(22,160,'S',3,'2024-08-24'),(82,55,'S',1,'2024-08-24'),(83,38,'S',3,'2024-08-24'),(170,32,'S',1,'2024-08-24'),(171,114,'S',3,'2024-08-24'),(23,128,'S',2,'2024-08-24'),(84,88,'S',1,'2024-08-24'),(85,58,'S',1,'2024-08-24'),(172,95,'S',3,'2024-08-24'),(173,71,'S',3,'2024-08-24');
/*!40000 ALTER TABLE `liberacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentos`
--

DROP TABLE IF EXISTS `medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamentos` (
  `IDPRODUTO` int NOT NULL,
  `NOMEGENERICO` varchar(45) DEFAULT NULL,
  `IDMEDICAMENTO` int NOT NULL AUTO_INCREMENT,
  `NOMECOMERCIAL` varchar(45) DEFAULT NULL,
  `FORMAFARMACEUTICA` varchar(20) DEFAULT NULL,
  `UNIDADEMEDIDA` varchar(45) DEFAULT NULL,
  `QUANTIDADE` int DEFAULT NULL,
  `DT_VALIDADE` date DEFAULT NULL,
  `UNIDADE` int NOT NULL,
  PRIMARY KEY (`IDMEDICAMENTO`),
  KEY `IDPRODUTO_idx` (`IDPRODUTO`),
  CONSTRAINT `IDPRODUTO_3` FOREIGN KEY (`IDPRODUTO`) REFERENCES `produto` (`IDPRODUTO`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos`
--

LOCK TABLES `medicamentos` WRITE;
/*!40000 ALTER TABLE `medicamentos` DISABLE KEYS */;
INSERT INTO `medicamentos` VALUES (1,'Diazepam',1,'Valium','Comprimido','g',818,'2025-03-13',50),(2,'Lorazepam',2,'Ativan','Injecao','g',478,'2025-05-30',50),(3,'Paracetamol',3,'Tylenol','Liquido','ml',813,'2025-01-31',20),(4,'Ibuprofeno',4,'Advil','Comprimido','mg',823,'2025-03-10',30),(5,'Diclofenaco',5,'Voltaren','Liquido','ml',427,'2026-06-26',100),(6,'Naproxeno',6,'Naprosyn','Liquido','ml',759,'2026-06-14',20),(7,'Amoxicilina',7,'Amoxil','Comprimido','g',573,'2027-09-10',50),(8,'Ciprofloxacino',8,'Cipro','Comprimido','mg',134,'2027-02-22',10),(9,'Cetirizina',9,'Zyrtec','Injecao','g',804,'2026-08-09',30),(10,'Loratadina',10,'Claritin','Capsula','g',783,'2025-03-02',30),(11,'Fluoxetina',11,'Prozac','Po para solucao','g',862,'2028-05-28',5),(12,'Sertralina',12,'Zoloft','Capsula','g',440,'2028-12-31',20),(13,'Aspirina',13,'Bayer','Comprimido','g',220,'2026-08-02',20),(14,'Metformina',14,'Glucophage','Capsula','mg',900,'2028-12-04',10),(15,'Glibenclamida',15,'Diabeta','Liquido','ml',646,'2027-08-16',50),(16,'Enalapril',16,'Vasotec','Comprimido','g',360,'2028-05-23',20),(17,'Losartana',17,'Cozaar','Comprimido','mg',382,'2026-07-31',30),(18,'Varfarina',18,'Coumadin','Comprimido','mg',538,'2027-03-29',10),(19,'Heparina',19,'Liquaemin','Liquido','ml',337,'2028-06-15',10),(20,'Ondansetrona',20,'Zofran','Liquido','ml',147,'2029-08-21',50),(21,'Metoclopramida',21,'Reglan','Comprimido','g',460,'2026-10-23',50),(22,'Fluconazol',22,'Diflucan','Comprimido','mg',717,'2024-12-22',50),(23,'Itraconazol',23,'Sporanox','Injecao','g',499,'2025-10-26',20),(24,'Cloroquina',24,'Aralen','Liquido','ml',554,'2025-11-11',5),(25,'ArtemÃ©ter/Lumefantrina',25,'Coartem','Comprimido','g',831,'2027-10-25',10),(26,'Aciclovir',26,'Zovirax','Po para solucao','g',412,'2027-01-05',5),(27,'Oseltamivir',27,'Tamiflu','Liquido','ml',387,'2025-03-08',20),(28,'Olanzapina',28,'Zyprexa','Liquido','ml',95,'2026-02-15',100),(29,'Risperidona',29,'Risperdal','Injecao','g',506,'2027-09-10',20),(30,'Butilbrometo de Escopolamina',30,'Buscopan','Comprimido','mg',417,'2026-02-11',30),(31,'Dicyclomina',31,'Bentyl','Po para solucao','g',57,'2025-08-31',100),(32,'Salbutamol',32,'Ventolin','Injecao','g',716,'2029-02-04',10),(33,'IpratrÃ³pio',33,'Atrovent','Injecao','mg',426,'2026-04-23',10),(34,'Furosemida',34,'Lasix','Injecao','mg',465,'2027-06-17',30),(35,'Hidroclorotiazida',35,'Microzide','Po para solucao','g',418,'2026-07-22',20),(36,'Metilfenidato',36,'Ritalina','Po para solucao','g',169,'2028-07-29',5),(37,'Modafinil',37,'Provigil','Injecao','mg',844,'2026-07-01',30),(38,'Levotiroxina',38,'Synthroid','Liquido','ml',792,'2028-03-09',5),(39,'Insulina',39,'Lantus','Po para solucao','g',893,'2024-11-25',20);
/*!40000 ALTER TABLE `medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentos_descricao`
--

DROP TABLE IF EXISTS `medicamentos_descricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamentos_descricao` (
  `IDDESCRICAOMEDICAMENTO` int NOT NULL,
  `IDMEDICAMENTO` int NOT NULL,
  PRIMARY KEY (`IDDESCRICAOMEDICAMENTO`,`IDMEDICAMENTO`),
  KEY `IDDESCRICAO_idx` (`IDDESCRICAOMEDICAMENTO`),
  KEY `IDMEDICAMENTO_idx` (`IDMEDICAMENTO`),
  CONSTRAINT `IDDESCRICAO` FOREIGN KEY (`IDDESCRICAOMEDICAMENTO`) REFERENCES `descricaomedicamento` (`idDESCRICAOMEDICAMENTO`),
  CONSTRAINT `IDMEDICAMENTO` FOREIGN KEY (`IDMEDICAMENTO`) REFERENCES `medicamentos` (`IDMEDICAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos_descricao`
--

LOCK TABLES `medicamentos_descricao` WRITE;
/*!40000 ALTER TABLE `medicamentos_descricao` DISABLE KEYS */;
INSERT INTO `medicamentos_descricao` VALUES (1,1),(2,2),(2,12),(3,3),(3,4),(3,5),(4,6),(4,7),(5,8),(5,9),(6,10),(6,11),(7,2),(7,12),(8,13),(9,14),(9,15),(10,12),(10,16),(10,17),(11,20),(11,21),(11,30),(11,31),(12,22),(12,23),(14,26),(14,27),(15,28),(15,29),(16,30),(16,31),(17,32),(17,33),(18,34),(18,35),(19,36),(19,37),(20,38),(20,39),(21,24),(21,25);
/*!40000 ALTER TABLE `medicamentos_descricao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `IDMEDICO` int NOT NULL,
  `NOME` varchar(45) DEFAULT NULL,
  `CRM` int DEFAULT NULL,
  `ESPECIALIDADE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDMEDICO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (1,'Dr. Ana Costa',100001,'Oncologia Clínica'),(2,'Dr. Bruno Almeida',100002,'Cirurgia Oncológica'),(3,'Dr. Carlos Pereira',100003,'Radioterapia'),(4,'Dra. Daniela Martins',100004,'Hematologia'),(5,'Dr. Eduardo Silva',100005,'Oncologia Pediátrica'),(6,'Dra. Fernanda Lima',100006,'Oncologia Ginecológica'),(7,'Dr. Gabriel Sousa',100007,'Oncologia Thorácica'),(8,'Dra. Helena Rocha',100008,'Oncologia Urológica'),(9,'Dr. Igor Carvalho',100009,'Imunoterapia'),(10,'Dra. Juliana Costa',100010,'Oncologia Neurocirúrgica');
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimentacao_paciente`
--

DROP TABLE IF EXISTS `movimentacao_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimentacao_paciente` (
  `idMOVIMENTACAO_PACIENTE` int NOT NULL AUTO_INCREMENT,
  `DATAENTRADA` date DEFAULT NULL,
  `DATASAIDA` date DEFAULT NULL,
  `SETOR` varchar(45) DEFAULT NULL,
  `IDATENDIMENTO` int DEFAULT NULL,
  PRIMARY KEY (`idMOVIMENTACAO_PACIENTE`),
  KEY `IDATENDIMENTO_idx` (`IDATENDIMENTO`),
  CONSTRAINT `IDATENDIMENTO` FOREIGN KEY (`IDATENDIMENTO`) REFERENCES `atendimento` (`IDATENDIMENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=473 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentacao_paciente`
--

LOCK TABLES `movimentacao_paciente` WRITE;
/*!40000 ALTER TABLE `movimentacao_paciente` DISABLE KEYS */;
INSERT INTO `movimentacao_paciente` VALUES (70,'2024-01-10','2024-01-15','UTI',38),(71,'2024-01-16',NULL,'Quarto',38),(72,'2024-02-01','2024-02-07','UTI',39),(73,'2024-02-08',NULL,'Quarto',39),(74,'2024-03-05','2024-03-10','Quarto',40),(75,'2024-03-11',NULL,'UTI',40),(76,'2024-04-02','2024-04-08','UTI',41),(77,'2024-04-09',NULL,'Quarto',41),(78,'2024-05-01','2024-05-06','UTI',42),(79,'2024-05-07','2024-05-12','Quarto',42),(80,'2024-05-13',NULL,'UTI',42),(81,'2024-06-01','2024-06-05','Quarto',43),(82,'2024-06-06','2024-06-10','UTI',43),(83,'2024-07-01',NULL,'UTI',44),(84,'2024-07-02',NULL,'Quarto',45),(85,'2024-08-01','2024-08-10','UTI',46),(86,'2024-08-11',NULL,'Alta',46),(87,'2024-08-15','2024-08-22','Quarto',47),(88,'2024-08-23',NULL,'Alta',47),(89,'2024-09-01','2024-09-05','UTI',48),(90,'2024-09-06','2024-09-07','Óbito',48),(91,'2024-09-10','2024-09-15','Quarto',49),(92,'2024-09-16','2024-09-17','Óbito',49),(93,'2024-10-01','2024-10-05','UTI',50),(94,'2024-10-06',NULL,'Quarto',50),(95,'2024-10-07','2024-10-12','Quarto',51),(96,'2024-10-13',NULL,'UTI',51),(97,'2024-11-01','2024-11-05','Quarto',52),(98,'2024-11-06',NULL,'UTI',52),(99,'2024-11-07','2024-11-12','UTI',53),(100,'2024-11-13',NULL,'Quarto',53),(101,'2024-12-01','2024-12-05','UTI',54),(102,'2024-12-06','2024-12-10','Quarto',54),(103,'2024-12-11',NULL,'UTI',54),(104,'2024-12-12','2024-12-15','Quarto',55),(105,'2024-12-16','2024-12-20','UTI',55),(106,'2024-12-21',NULL,'UTI',56),(107,'2024-12-22',NULL,'Quarto',57),(108,'2024-12-25','2024-12-30','UTI',58),(109,'2024-12-31',NULL,'Alta',58),(110,'2024-12-26','2024-12-31','Quarto',59),(111,'2024-12-31',NULL,'Alta',59),(112,'2024-12-20','2024-12-25','UTI',60),(113,'2024-12-26','2024-12-27','Óbito',60),(114,'2024-12-28','2024-12-30','Quarto',61),(115,'2024-12-31','2024-12-31','Óbito',61),(116,'2024-01-10','2024-01-15','UTI',38),(117,'2024-01-16',NULL,'Quarto',38),(118,'2024-02-01','2024-02-07','UTI',39),(119,'2024-02-08',NULL,'Quarto',39),(120,'2024-03-05','2024-03-10','Quarto',40),(121,'2024-03-11',NULL,'UTI',40),(122,'2024-04-02','2024-04-08','UTI',41),(123,'2024-04-09',NULL,'Quarto',41),(124,'2024-05-01','2024-05-06','UTI',42),(125,'2024-05-07','2024-05-12','Quarto',42),(126,'2024-05-13',NULL,'UTI',42),(127,'2024-06-01','2024-06-05','Quarto',43),(128,'2024-06-06','2024-06-10','UTI',43),(129,'2024-07-01',NULL,'UTI',44),(130,'2024-07-02',NULL,'Quarto',45),(131,'2024-08-01','2024-08-10','UTI',46),(132,'2024-08-11',NULL,'Alta',46),(133,'2024-08-15','2024-08-22','Quarto',47),(134,'2024-08-23',NULL,'Alta',47),(135,'2024-09-01','2024-09-05','UTI',48),(136,'2024-09-06','2024-09-07','Óbito',48),(137,'2024-09-10','2024-09-15','Quarto',49),(138,'2024-09-16','2024-09-17','Óbito',49),(139,'2024-10-01','2024-10-05','UTI',50),(140,'2024-10-06',NULL,'Quarto',50),(141,'2024-10-07','2024-10-12','Quarto',51),(142,'2024-10-13',NULL,'UTI',51),(143,'2024-11-01','2024-11-05','Quarto',52),(144,'2024-11-06',NULL,'UTI',52),(145,'2024-11-07','2024-11-12','UTI',53),(146,'2024-11-13',NULL,'Quarto',53),(147,'2024-12-01','2024-12-05','UTI',54),(148,'2024-12-06','2024-12-10','Quarto',54),(149,'2024-12-11',NULL,'UTI',54),(150,'2024-12-12','2024-12-15','Quarto',55),(151,'2024-12-16','2024-12-20','UTI',55),(152,'2024-12-21',NULL,'UTI',56),(153,'2024-12-22',NULL,'Quarto',57),(154,'2024-12-25','2024-12-30','UTI',58),(155,'2024-12-31',NULL,'Alta',58),(156,'2024-12-26','2024-12-31','Quarto',59),(157,'2024-12-31',NULL,'Alta',59),(158,'2024-12-20','2024-12-25','UTI',60),(159,'2024-12-26','2024-12-27','Óbito',60),(160,'2024-12-28','2024-12-30','Quarto',61),(161,'2024-12-31','2024-12-31','Óbito',61),(162,'2024-01-03','2024-01-10','UTI',62),(163,'2024-01-11',NULL,'Quarto',62),(164,'2024-02-02','2024-02-07','Quarto',63),(165,'2024-02-08',NULL,'UTI',63),(166,'2024-03-01','2024-03-06','UTI',64),(167,'2024-03-07','2024-03-12','Quarto',64),(168,'2024-03-13',NULL,'UTI',64),(169,'2024-04-01',NULL,'UTI',65),(170,'2024-04-02',NULL,'Quarto',66),(171,'2024-05-01','2024-05-10','UTI',67),(172,'2024-05-11',NULL,'Alta',67),(173,'2024-06-01','2024-06-07','Quarto',68),(174,'2024-06-08','2024-06-10','Óbito',68),(175,'2024-07-01','2024-07-10','UTI',69),(176,'2024-07-11',NULL,'Quarto',69),(177,'2024-08-01','2024-08-10','Quarto',70),(178,'2024-08-11',NULL,'UTI',70),(179,'2024-09-01','2024-09-05','UTI',71),(180,'2024-09-06','2024-09-10','Quarto',71),(181,'2024-09-11',NULL,'UTI',71),(182,'2024-10-01',NULL,'UTI',72),(183,'2024-10-02',NULL,'Quarto',73),(184,'2024-11-01','2024-11-10','UTI',74),(185,'2024-11-11',NULL,'Alta',74),(186,'2024-12-01','2024-12-10','Quarto',75),(187,'2024-12-11','2024-12-15','Óbito',75),(257,'2024-01-02','2024-01-05','UTI',1),(258,'2024-01-06',NULL,'Quarto',1),(259,'2024-01-08','2024-01-12','Quarto',2),(260,'2024-01-13',NULL,'UTI',2),(261,'2024-02-01','2024-02-06','Quarto',3),(262,'2024-02-07',NULL,'UTI',3),(263,'2024-02-10','2024-02-15','UTI',4),(264,'2024-02-16',NULL,'Quarto',4),(265,'2024-03-01','2024-03-07','UTI',5),(266,'2024-03-08','2024-03-12','Quarto',5),(267,'2024-03-13',NULL,'UTI',5),(268,'2024-03-15','2024-03-18','Quarto',6),(269,'2024-03-19','2024-03-22','UTI',6),(270,'2024-04-01',NULL,'UTI',7),(271,'2024-04-02',NULL,'Quarto',8),(272,'2024-04-05','2024-04-12','UTI',9),(273,'2024-04-13',NULL,'Alta',9),(274,'2024-04-10','2024-04-18','Quarto',10),(275,'2024-04-19',NULL,'Alta',10),(276,'2024-04-01','2024-04-05','UTI',11),(277,'2024-04-06','2024-04-07','Óbito',11),(278,'2024-04-08','2024-04-15','Quarto',12),(279,'2024-04-16','2024-04-17','Óbito',12),(280,'2024-05-01','2024-05-06','UTI',13),(281,'2024-05-07',NULL,'Quarto',13),(282,'2024-05-08','2024-05-12','Quarto',14),(283,'2024-05-13',NULL,'UTI',14),(284,'2024-06-01','2024-06-05','Quarto',15),(285,'2024-06-06',NULL,'UTI',15),(286,'2024-06-07','2024-06-10','UTI',16),(287,'2024-06-11',NULL,'Quarto',16),(288,'2024-07-01','2024-07-05','UTI',17),(289,'2024-07-06','2024-07-10','Quarto',17),(290,'2024-07-11',NULL,'UTI',17),(291,'2024-07-12','2024-07-15','Quarto',18),(292,'2024-07-16','2024-07-18','UTI',18),(293,'2024-08-01',NULL,'UTI',19),(294,'2024-08-02',NULL,'Quarto',20),(295,'2024-08-05','2024-08-12','UTI',21),(296,'2024-08-13',NULL,'Alta',21),(297,'2024-08-10','2024-08-18','Quarto',22),(298,'2024-08-19',NULL,'Alta',22),(299,'2024-09-01','2024-09-05','UTI',23),(300,'2024-09-06','2024-09-07','Óbito',23),(301,'2024-09-08','2024-09-15','Quarto',24),(302,'2024-09-16','2024-09-17','Óbito',24),(303,'2024-10-01','2024-10-05','UTI',25),(304,'2024-10-06',NULL,'Quarto',25),(305,'2024-10-07','2024-10-10','Quarto',26),(306,'2024-10-11',NULL,'UTI',26),(307,'2024-11-01','2024-11-05','Quarto',27),(308,'2024-11-06',NULL,'UTI',27),(309,'2024-11-07','2024-11-10','UTI',28),(310,'2024-11-11',NULL,'Quarto',28),(311,'2024-12-01','2024-12-05','UTI',29),(312,'2024-12-06','2024-12-10','Quarto',29),(313,'2024-12-11',NULL,'UTI',29),(314,'2024-12-12','2024-12-15','Quarto',30),(315,'2024-12-16','2024-12-18','UTI',30),(316,'2024-12-20',NULL,'UTI',31),(317,'2024-12-21',NULL,'Quarto',32),(318,'2024-12-25','2024-12-30','UTI',33),(319,'2024-12-31',NULL,'Alta',33),(320,'2024-12-26','2024-12-30','Quarto',34),(321,'2024-12-31',NULL,'Alta',34),(322,'2024-12-20','2024-12-25','UTI',35),(323,'2024-12-26','2024-12-27','Óbito',35),(324,'2024-12-28','2024-12-31','Quarto',36),(325,'2024-12-31','2024-12-31','Óbito',36),(326,'2024-08-01',NULL,'UTI',76),(327,'2024-08-03',NULL,'Quarto',76),(328,'2024-08-05',NULL,'UTI',77),(329,'2024-08-07',NULL,'Quarto',77),(330,'2024-08-09',NULL,'UTI',78),(331,'2024-08-11',NULL,'Quarto',78),(332,'2024-08-13',NULL,'UTI',79),(333,'2024-08-15',NULL,'Quarto',79),(334,'2024-08-17',NULL,'UTI',80),(335,'2024-08-19',NULL,'Quarto',80),(336,'2024-08-21','2024-08-23','Quarto',81),(337,'2024-08-24','2024-08-26','UTI',82),(338,'2024-08-27','2024-08-29','Quarto',83),(339,'2024-08-30','2024-09-01','UTI',84),(340,'2024-09-02','2024-09-04','Quarto',85),(341,'2024-09-05','2024-09-07','UTI',86),(342,'2024-09-08','2024-09-10','Quarto',87),(343,'2024-09-11','2024-09-12','UTI',88),(344,'2024-09-13','2024-09-14','Quarto',89),(345,'2024-09-15','2024-09-16','UTI',90),(346,'2024-09-17','2024-09-18','Quarto',91),(347,'2024-09-19','2024-09-20','UTI',92),(348,'2024-12-15',NULL,'Quarto',150),(349,'2024-01-02','2024-01-05','UTI',93),(350,'2024-01-08','2024-01-12','Quarto',94),(351,'2024-02-01','2024-02-06','Quarto',95),(352,'2024-02-10','2024-02-15','UTI',96),(353,'2024-03-01','2024-03-07','UTI',97),(354,'2024-03-08','2024-03-12','Quarto',97),(355,'2024-03-15','2024-03-18','Quarto',98),(356,'2024-03-19','2024-03-22','UTI',98),(357,'2024-04-05','2024-04-12','UTI',101),(358,'2024-04-10','2024-04-18','Quarto',102),(359,'2024-04-01','2024-04-05','UTI',103),(360,'2024-04-06','2024-04-07','?bito',103),(361,'2024-04-08','2024-04-15','Quarto',104),(362,'2024-04-16','2024-04-17','?bito',104),(363,'2024-05-01','2024-05-06','UTI',105),(364,'2024-05-08','2024-05-12','Quarto',106),(365,'2024-06-01','2024-06-05','Quarto',107),(366,'2024-06-07','2024-06-10','UTI',108),(367,'2024-07-01','2024-07-05','UTI',109),(368,'2024-07-06','2024-07-10','Quarto',109),(369,'2024-07-12','2024-07-15','Quarto',110),(370,'2024-07-16','2024-07-18','UTI',110),(371,'2024-08-05','2024-08-12','UTI',113),(372,'2024-08-10','2024-08-18','Quarto',114),(373,'2024-09-01','2024-09-05','UTI',115),(374,'2024-09-06','2024-09-07','?bito',115),(375,'2024-09-08','2024-09-15','Quarto',116),(376,'2024-09-16','2024-09-17','?bito',116),(377,'2024-10-01','2024-10-05','UTI',117),(378,'2024-10-07','2024-10-10','Quarto',118),(379,'2024-11-01','2024-11-05','Quarto',119),(380,'2024-11-07','2024-11-10','UTI',120),(381,'2024-12-01','2024-12-05','UTI',121),(382,'2024-12-06','2024-12-10','Quarto',121),(383,'2024-12-12','2024-12-15','Quarto',122),(384,'2024-12-16','2024-12-18','UTI',122),(385,'2024-12-25','2024-12-30','UTI',125),(386,'2024-12-26','2024-12-30','Quarto',126),(387,'2024-12-20','2024-12-25','UTI',127),(388,'2024-12-26','2024-12-27','?bito',127),(389,'2024-12-28','2024-12-31','Quarto',128),(390,'2024-12-31','2024-12-31','?bito',128),(391,'2024-01-10','2024-01-15','UTI',130),(392,'2024-01-10','2024-01-15','UTI',130),(393,'2024-02-01','2024-02-07','UTI',131),(394,'2024-02-01','2024-02-07','UTI',131),(395,'2024-03-05','2024-03-10','Quarto',132),(396,'2024-03-05','2024-03-10','Quarto',132),(397,'2024-04-02','2024-04-08','UTI',133),(398,'2024-04-02','2024-04-08','UTI',133),(399,'2024-05-01','2024-05-06','UTI',134),(400,'2024-05-07','2024-05-12','Quarto',134),(401,'2024-05-01','2024-05-06','UTI',134),(402,'2024-05-07','2024-05-12','Quarto',134),(403,'2024-06-01','2024-06-05','Quarto',135),(404,'2024-06-06','2024-06-10','UTI',135),(405,'2024-06-01','2024-06-05','Quarto',135),(406,'2024-06-06','2024-06-10','UTI',135),(407,'2024-08-01','2024-08-10','UTI',138),(408,'2024-08-01','2024-08-10','UTI',138),(409,'2024-08-15','2024-08-22','Quarto',139),(410,'2024-08-15','2024-08-22','Quarto',139),(411,'2024-09-01','2024-09-05','UTI',140),(412,'2024-09-06','2024-09-07','?bito',140),(413,'2024-09-01','2024-09-05','UTI',140),(414,'2024-09-06','2024-09-07','?bito',140),(415,'2024-09-10','2024-09-15','Quarto',141),(416,'2024-09-16','2024-09-17','?bito',141),(417,'2024-09-10','2024-09-15','Quarto',141),(418,'2024-09-16','2024-09-17','?bito',141),(419,'2024-10-01','2024-10-05','UTI',142),(420,'2024-10-01','2024-10-05','UTI',142),(421,'2024-10-07','2024-10-12','Quarto',143),(422,'2024-10-07','2024-10-12','Quarto',143),(423,'2024-11-01','2024-11-05','Quarto',144),(424,'2024-11-01','2024-11-05','Quarto',144),(425,'2024-11-07','2024-11-12','UTI',145),(426,'2024-11-07','2024-11-12','UTI',145),(427,'2024-12-01','2024-12-05','UTI',146),(428,'2024-12-06','2024-12-10','Quarto',146),(429,'2024-12-01','2024-12-05','UTI',146),(430,'2024-12-06','2024-12-10','Quarto',146),(431,'2024-12-12','2024-12-15','Quarto',147),(432,'2024-12-16','2024-12-20','UTI',147),(433,'2024-12-12','2024-12-15','Quarto',147),(434,'2024-12-16','2024-12-20','UTI',147),(435,'2024-12-25','2024-12-30','UTI',150),(436,'2024-12-25','2024-12-30','UTI',150);
/*!40000 ALTER TABLE `movimentacao_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimentacoesestoque`
--

DROP TABLE IF EXISTS `movimentacoesestoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimentacoesestoque` (
  `IDMOVIMENTACAO` int DEFAULT NULL,
  `TIPOMOVIMENTACAO` varchar(12) NOT NULL,
  `DATAMOVIMENTACAO` date DEFAULT NULL,
  `QUANTIDADE` decimal(8,2) DEFAULT NULL,
  `IDPRODUTO` int DEFAULT NULL,
  `IDLIBERACAO` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`IDLIBERACAO`),
  KEY `IDPRODUTO_idx` (`IDPRODUTO`),
  CONSTRAINT `IDPRODUTO` FOREIGN KEY (`IDPRODUTO`) REFERENCES `produto` (`IDPRODUTO`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentacoesestoque`
--

LOCK TABLES `movimentacoesestoque` WRITE;
/*!40000 ALTER TABLE `movimentacoesestoque` DISABLE KEYS */;
INSERT INTO `movimentacoesestoque` VALUES (NULL,'Entrada','2024-01-10',50.00,1,1),(NULL,'Entrada','2024-01-15',30.00,2,2),(NULL,'Entrada','2024-02-05',40.00,3,3),(NULL,'Entrada','2024-03-10',60.00,4,4),(NULL,'Entrada','2024-04-05',20.00,5,5),(NULL,'Entrada','2024-05-01',70.00,6,6),(NULL,'Entrada','2024-06-15',25.00,7,7),(NULL,'Entrada','2024-07-01',80.00,8,8),(NULL,'Entrada','2024-08-10',35.00,9,9),(NULL,'Entrada','2024-09-05',50.00,10,10),(NULL,'Entrada','2024-10-01',55.00,11,11),(NULL,'Entrada','2024-11-15',45.00,12,12),(NULL,'Entrada','2024-12-01',60.00,13,13),(NULL,'Entrada','2024-01-20',30.00,14,14),(NULL,'Entrada','2024-02-10',40.00,15,15),(NULL,'Entrada','2024-03-15',25.00,16,16),(NULL,'Entrada','2024-04-10',50.00,17,17),(NULL,'Entrada','2024-05-05',20.00,18,18),(NULL,'Entrada','2024-06-20',45.00,19,19),(NULL,'Entrada','2024-07-15',60.00,20,20),(NULL,'Entrada','2024-08-05',30.00,21,21),(NULL,'Entrada','2024-09-10',55.00,22,22),(NULL,'Entrada','2024-10-20',70.00,23,23),(NULL,'Entrada','2024-11-05',40.00,24,24),(NULL,'Entrada','2024-12-15',25.00,25,25),(NULL,'Entrada','2024-01-05',50.00,26,26),(NULL,'Entrada','2024-02-20',30.00,27,27),(NULL,'Entrada','2024-03-05',45.00,28,28),(NULL,'Entrada','2024-04-15',70.00,29,29),(NULL,'Entrada','2024-05-10',25.00,30,30),(NULL,'Entrada','2024-06-05',60.00,31,31),(NULL,'Entrada','2024-07-20',40.00,32,32),(NULL,'Entrada','2024-08-15',50.00,33,33),(NULL,'Entrada','2024-09-01',35.00,34,34),(NULL,'Entrada','2024-10-05',55.00,35,35),(NULL,'Entrada','2024-11-10',30.00,36,36),(NULL,'Entrada','2024-12-01',45.00,37,37),(NULL,'Entrada','2024-01-15',60.00,38,38),(NULL,'Entrada','2024-02-05',70.00,39,39),(NULL,'Saída','2024-01-20',10.00,1,40),(NULL,'Saída','2024-02-01',15.00,1,41),(NULL,'Saída','2024-03-01',20.00,2,42),(NULL,'Saída','2024-04-01',10.00,2,43),(NULL,'Saída','2024-05-01',25.00,3,44),(NULL,'Saída','2024-06-01',10.00,3,45),(NULL,'Saída','2024-07-01',30.00,4,46),(NULL,'Saída','2024-08-01',20.00,4,47),(NULL,'Saída','2024-09-01',5.00,5,48),(NULL,'Saída','2024-10-01',10.00,5,49),(NULL,'Saída','2024-11-01',20.00,6,50),(NULL,'Saída','2024-12-01',15.00,6,51),(NULL,'Saída','2024-01-25',5.00,7,52),(NULL,'Saída','2024-02-25',15.00,7,53),(NULL,'Saída','2024-03-25',20.00,8,54),(NULL,'Saída','2024-04-25',25.00,8,55),(NULL,'Saída','2024-05-25',10.00,9,56),(NULL,'Saída','2024-06-25',20.00,9,57),(NULL,'Saída','2024-07-25',15.00,10,58),(NULL,'Saída','2024-08-25',10.00,10,59),(NULL,'Saída','2024-09-25',20.00,11,60),(NULL,'Saída','2024-10-25',10.00,11,61),(NULL,'Saída','2024-11-25',30.00,12,62),(NULL,'Saída','2024-12-25',15.00,12,63),(NULL,'Saída','2024-01-30',20.00,13,64),(NULL,'Saída','2024-02-28',15.00,13,65),(NULL,'Saída','2024-03-30',25.00,14,66),(NULL,'Saída','2024-04-30',10.00,14,67),(NULL,'Saída','2024-05-30',30.00,15,68),(NULL,'Saída','2024-06-30',20.00,15,69),(NULL,'Saída','2024-07-30',10.00,16,70),(NULL,'Saída','2024-08-30',5.00,16,71),(NULL,'Saída','2024-09-30',15.00,17,72),(NULL,'Saída','2024-10-30',25.00,17,73),(NULL,'Saída','2024-11-30',20.00,18,74),(NULL,'Saída','2024-12-30',10.00,18,75),(NULL,'Saída','2024-01-15',25.00,19,76),(NULL,'Saída','2024-02-15',30.00,19,77),(NULL,'Saída','2024-03-15',10.00,20,78),(NULL,'Saída','2024-04-15',20.00,20,79),(NULL,'Saída','2024-05-15',15.00,21,80),(NULL,'Saída','2024-06-15',10.00,21,81),(NULL,'Saída','2024-07-15',20.00,22,82),(NULL,'Saída','2024-08-15',15.00,22,83),(NULL,'Saída','2024-09-15',30.00,23,84),(NULL,'Saída','2024-10-15',10.00,23,85),(NULL,'Saída','2024-11-15',20.00,24,86),(NULL,'Saída','2024-12-15',10.00,24,87),(NULL,'Saída','2024-01-25',10.00,25,88),(NULL,'Saída','2024-02-25',15.00,25,89),(NULL,'Saída','2024-03-25',25.00,26,90),(NULL,'Saída','2024-04-25',10.00,26,91),(NULL,'Saída','2024-05-25',30.00,27,92),(NULL,'Saída','2024-06-25',10.00,27,93),(NULL,'Saída','2024-07-25',20.00,28,94),(NULL,'Saída','2024-08-25',15.00,28,95),(NULL,'Saída','2024-09-25',25.00,29,96),(NULL,'Saída','2024-10-25',10.00,29,97),(NULL,'Saída','2024-11-25',20.00,30,98),(NULL,'Saída','2024-12-25',30.00,30,99),(NULL,'Saída','2024-01-30',25.00,31,100),(NULL,'Saída','2024-02-28',15.00,31,101),(NULL,'Saída','2024-03-30',20.00,32,102),(NULL,'Saída','2024-04-30',10.00,32,103),(NULL,'Saída','2024-05-30',30.00,33,104),(NULL,'Saída','2024-06-30',15.00,33,105),(NULL,'Saída','2024-07-30',20.00,34,106),(NULL,'Saída','2024-08-30',10.00,34,107),(NULL,'Saída','2024-09-30',25.00,35,108),(NULL,'Saída','2024-10-30',15.00,35,109),(NULL,'Saída','2024-11-30',20.00,36,110),(NULL,'Saída','2024-12-30',10.00,36,111),(NULL,'Saída','2024-01-15',30.00,37,112),(NULL,'Saída','2024-02-15',20.00,37,113),(NULL,'Saída','2024-03-15',40.00,38,114),(NULL,'Saída','2024-04-15',20.00,38,115),(NULL,'Saída','2024-05-15',30.00,39,116),(NULL,'Saída','2024-06-15',15.00,39,117),(NULL,'Entrada','2024-01-10',50.00,1,118),(NULL,'Entrada','2024-01-15',30.00,2,119),(NULL,'Entrada','2024-02-05',40.00,3,120),(NULL,'Entrada','2024-03-10',60.00,4,121),(NULL,'Entrada','2024-04-05',20.00,5,122),(NULL,'Entrada','2024-05-01',70.00,6,123),(NULL,'Entrada','2024-06-15',25.00,7,124),(NULL,'Entrada','2024-07-01',80.00,8,125),(NULL,'Entrada','2024-08-10',35.00,9,126),(NULL,'Entrada','2024-09-05',50.00,10,127),(NULL,'Saída','2024-02-01',10.00,1,128),(NULL,'Saída','2024-03-01',15.00,1,129),(NULL,'Saída','2024-04-01',20.00,2,130),(NULL,'Saída','2024-05-01',10.00,2,131),(NULL,'Saída','2024-06-01',25.00,3,132),(NULL,'Saída','2024-07-01',10.00,3,133),(NULL,'Saída','2024-08-01',30.00,4,134),(NULL,'Saída','2024-09-01',20.00,4,135),(NULL,'Saída','2024-10-01',5.00,5,136),(NULL,'Saída','2024-11-01',10.00,5,137),(NULL,'Saída','2024-12-01',20.00,6,138),(NULL,'Saída','2024-01-05',15.00,6,139),(NULL,'Saída','2024-02-05',5.00,7,140),(NULL,'Saída','2024-03-05',15.00,7,141),(NULL,'Saída','2024-04-05',20.00,8,142),(NULL,'Saída','2024-05-05',25.00,8,143),(NULL,'Saída','2024-06-05',10.00,9,144),(NULL,'Saída','2024-07-05',20.00,9,145),(NULL,'Saída','2024-08-05',15.00,10,146),(NULL,'Saída','2024-09-05',10.00,10,147),(NULL,'Saída','2024-10-05',20.00,11,148),(NULL,'Saída','2024-11-05',10.00,11,149),(NULL,'Saída','2024-12-05',30.00,12,150),(NULL,'Saída','2024-01-15',15.00,12,151),(NULL,'Saída','2024-02-15',20.00,13,152),(NULL,'Saída','2024-03-15',25.00,13,153),(NULL,'Saída','2024-04-15',10.00,14,154),(NULL,'Saída','2024-05-15',30.00,14,155),(NULL,'Saída','2024-06-15',20.00,15,156),(NULL,'Saída','2024-07-15',10.00,15,157),(NULL,'Saída','2024-08-15',25.00,16,158),(NULL,'Saída','2024-09-15',5.00,16,159),(NULL,'Saída','2024-10-15',15.00,17,160),(NULL,'Saída','2024-11-15',25.00,17,161),(NULL,'Saída','2024-12-15',20.00,18,162),(NULL,'Saída','2024-01-25',10.00,18,163),(NULL,'Saída','2024-02-25',15.00,19,164),(NULL,'Saída','2024-03-25',30.00,19,165),(NULL,'Saída','2024-04-25',10.00,20,166),(NULL,'Saída','2024-05-25',20.00,20,167),(NULL,'Saída','2024-06-25',15.00,21,168),(NULL,'Saída','2024-07-25',10.00,21,169),(NULL,'Saída','2024-08-25',20.00,22,170),(NULL,'Saída','2024-09-25',15.00,22,171),(NULL,'Saída','2024-10-25',30.00,23,172),(NULL,'Saída','2024-11-25',10.00,23,173),(NULL,'Saída','2024-12-25',20.00,24,174),(NULL,'Saída','2024-01-25',10.00,24,175),(NULL,'Saída','2024-02-25',15.00,25,176),(NULL,'Saída','2024-03-25',25.00,26,177),(NULL,'Saída','2024-04-25',10.00,26,178),(NULL,'Saída','2024-05-25',30.00,27,179),(NULL,'Saída','2024-06-25',10.00,27,180),(NULL,'Saída','2024-07-25',20.00,28,181),(NULL,'Saída','2024-08-25',15.00,28,182),(NULL,'Saída','2024-09-25',25.00,29,183),(NULL,'Saída','2024-10-25',20.00,29,184),(NULL,'Saída','2024-11-25',30.00,30,185),(NULL,'Saída','2024-12-25',15.00,30,186),(NULL,'Saída','2024-01-30',25.00,31,187),(NULL,'Saída','2024-02-28',15.00,31,188),(NULL,'Saída','2024-03-30',20.00,32,189),(NULL,'Saída','2024-04-30',10.00,32,190),(NULL,'Saída','2024-05-30',30.00,33,191),(NULL,'Saída','2024-06-30',15.00,33,192),(NULL,'Saída','2024-07-30',20.00,34,193),(NULL,'Saída','2024-08-30',10.00,34,194),(NULL,'Saída','2024-09-30',25.00,35,195),(NULL,'Saída','2024-10-30',15.00,35,196),(NULL,'Saída','2024-11-30',20.00,36,197),(NULL,'Saída','2024-12-30',10.00,36,198),(NULL,'Saída','2024-01-15',30.00,37,199),(NULL,'Saída','2024-02-15',20.00,37,200),(NULL,'Saída','2024-03-15',40.00,38,201),(NULL,'Saída','2024-04-15',20.00,38,202),(NULL,'Saída','2024-05-15',30.00,39,203),(NULL,'Saída','2024-06-15',15.00,39,204);
/*!40000 ALTER TABLE `movimentacoesestoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `IDPACIENTE` int NOT NULL,
  `NOME` varchar(45) DEFAULT NULL,
  `IDPRONTUARIO` int DEFAULT NULL,
  PRIMARY KEY (`IDPACIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'Lucas Ferreira',101),(2,'Mariana Oliveira',102),(3,'Pedro Lima',103),(4,'Sofia Santos',104),(5,'Rafael Costa',105),(6,'Beatriz Almeida',106),(7,'Gustavo Rodrigues',107),(8,'Laura Martins',108),(9,'Ricardo Silva',109),(10,'Ana Clara Gomes',110),(11,'Juliana Pereira',111),(12,'Gabriel Souza',112),(13,'Renata Lima',113),(14,'Felipe Almeida',114),(15,'Paula Carvalho',115),(16,'Victor Santos',116),(17,'Mariana Costa',117),(18,'Eduardo Fernandes',118),(19,'Camila Oliveira',119),(20,'Jorge Martins',120),(21,'Tatiane Rodrigues',121),(22,'Roberto Silva',122),(23,'Cláudia Ferreira',123),(24,'Fernando Oliveira',124),(25,'Isabela Almeida',125),(26,'Carlos Lima',126),(27,'Fernanda Costa',127),(28,'Bruno Pereira',128),(29,'Larissa Silva',129),(30,'Ricardo Costa',130),(31,'Tatiane Santos',131),(32,'Giovanni Oliveira',132),(33,'Elaine Souza',133),(34,'Marcelo Rodrigues',134),(35,'Priscila Martins',135),(36,'André Almeida',136),(37,'Marcela Ferreira',137),(38,'Gustavo Lima',138),(39,'Juliana Costa',139),(40,'Bruno Santos',140),(41,'Tatiane Oliveira',141),(42,'Leonardo Silva',142),(43,'Viviane Souza',143),(44,'Aline Costa',144),(45,'Rafael Almeida',145),(46,'Jéssica Santos',146),(47,'Lucas Oliveira',147),(48,'Priscila Lima',148),(49,'Victor Silva',149),(50,'Roberta Almeida',150),(51,'Carlos Santos',151),(52,'Marina Costa',152),(53,'Igor Rodrigues',153),(54,'Ana Beatriz Oliveira',154),(55,'Felipe Lima',155),(56,'Letícia Silva',156),(57,'Bruno Oliveira',157),(58,'Mariana Fernandes',158),(59,'Ricardo Pereira',159),(60,'Tatiane Martins',160),(61,'Lucas Santos',161),(62,'Júlia Almeida',162),(63,'Gustavo Oliveira',163),(64,'Claudia Silva',164),(65,'Juliana Santos',165),(66,'Carlos Costa',166),(67,'Fernanda Pereira',167),(68,'Igor Silva',168),(69,'Gabriela Santos',169),(70,'Aline Almeida',170),(71,'Felipe Santos',171),(72,'Lucas Fernandes',172),(73,'Tatiane Silva',173),(74,'Juliano Oliveira',174),(75,'Marcia Costa',175),(76,'Rodrigo Almeida',176),(77,'Priscila Rodrigues',177),(78,'Aline Silva',178),(79,'Marcelo Costa',179),(80,'Juliana Pereira',180),(81,'Lucas Silva',181),(82,'Fernanda Rodrigues',182),(83,'Gustavo Costa',183),(84,'Paula Santos',184),(85,'Ricardo Rodrigues',185),(86,'Priscila Almeida',186),(87,'Tatiane Oliveira',187),(88,'Carlos Silva',188),(89,'Roberta Costa',189),(90,'Eduardo Santos',190),(91,'Laura Silva',191),(92,'Fernando Rodrigues',192),(93,'Ana Paula Almeida',193),(94,'Bruno Costa',194),(95,'Viviane Oliveira',195),(96,'Renata Santos',196),(97,'Felipe Costa',197),(98,'Marcela Rodrigues',198),(99,'Lucas Pereira',199),(100,'Tatiane Almeida',200),(101,'Gabriel Oliveira',201),(102,'Fernanda Costa',202),(103,'Ricardo Santos',203),(104,'Priscila Pereira',204),(105,'Marcelo Almeida',205),(106,'Júlia Rodrigues',206),(107,'Carlos Pereira',207),(108,'Ana Costa',208),(109,'Leonardo Santos',209),(110,'Viviane Costa',210),(111,'Eduardo Pereira',211),(112,'Júlia Silva',212),(113,'Fernando Santos',213),(114,'Aline Costa',214),(115,'Tatiane Pereira',215),(116,'Lucas Almeida',216),(117,'Bruno Rodrigues',217),(118,'Mariana Pereira',218),(119,'Ricardo Silva',219),(120,'Juliana Almeida',220),(121,'Carlos Rodrigues',221),(122,'Marcela Pereira',222),(123,'Felipe Oliveira',223),(124,'Renata Costa',224),(125,'Lucas Santos',225),(126,'Gabriela Almeida',226),(127,'Eduardo Costa',227),(128,'Tatiane Silva',228),(129,'Marcelo Santos',229),(130,'Ana Rodrigues',230),(131,'Viviane Almeida',231),(132,'Bruno Pereira',232),(133,'Fernanda Silva',233),(134,'Ricardo Oliveira',234),(135,'Júlia Costa',235),(136,'Carlos Almeida',236),(137,'Paula Oliveira',237),(138,'Felipe Rodrigues',238),(139,'Lucas Silva',239),(140,'Marcela Costa',240),(141,'Tatiane Santos',241),(142,'Eduardo Almeida',242),(143,'Gabriela Costa',243),(144,'Ricardo Pereira',244),(145,'Bruno Santos',245),(146,'Juliana Rodrigues',246),(147,'Ana Silva',247),(148,'Viviane Santos',248),(149,'Carlos Costa',249),(150,'Tatiane Pereira',250);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `IDPRODUTO` int NOT NULL AUTO_INCREMENT,
  `NOMEPRODUTO` varchar(45) NOT NULL,
  `IDTIPOPRODUTO` int NOT NULL,
  `IDFORNECEDOR` int NOT NULL,
  PRIMARY KEY (`IDPRODUTO`),
  KEY `IDTIPO_idx` (`IDTIPOPRODUTO`),
  KEY `IDFORNECEDOR_idx` (`IDFORNECEDOR`),
  CONSTRAINT `IDFORNECEDOR` FOREIGN KEY (`IDFORNECEDOR`) REFERENCES `fornecedor` (`IDFORNECEDOR`),
  CONSTRAINT `IDTIPO` FOREIGN KEY (`IDTIPOPRODUTO`) REFERENCES `tipoproduto` (`IDTIPOPRODUTO`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Diazepam',2,1),(2,'Lorazepam',2,2),(3,'Paracetamol',2,3),(4,'Ibuprofeno',2,3),(5,'Diclofenaco',2,2),(6,'Naproxeno',2,1),(7,'Amoxicilina',2,1),(8,'Ciprofloxacino',2,2),(9,'Cetirizina',2,3),(10,'Loratadina',2,3),(11,'Fluoxetina',2,2),(12,'Sertralina',2,1),(13,'Aspirina',2,2),(14,'Metformina',2,3),(15,'Glibenclamida',2,2),(16,'Enalapril',2,2),(17,'Losartana',2,1),(18,'Varfarina',2,2),(19,'Heparina',2,3),(20,'Ondansetrona',2,2),(21,'Metoclopramida',2,1),(22,'Fluconazol',2,2),(23,'Itraconazol',2,3),(24,'Cloroquina',2,1),(25,'Artem‚ter/Lumefantrina',2,2),(26,'Aciclovir',2,3),(27,'Oseltamivir',2,1),(28,'Olanzapina',2,2),(29,'Risperidona',2,3),(30,'Butilbrometo de Escopolamina',2,2),(31,'Dicyclomina',2,1),(32,'Salbutamol',2,1),(33,'Ipratr¢pio',2,2),(34,'Furosemida',2,3),(35,'Hidroclorotiazida',2,3),(36,'Metilfenidato',2,2),(37,'Modafinil',2,1),(38,'Levotiroxina',2,1),(39,'Insulina',2,2),(40,'Gaze Esterilizada',1,1),(41,'Atadura de Crepe',1,1),(42,'Esparadrapo',1,1),(43,'Máscara Cirúrgica',1,2),(44,'Luvas de Látex',1,2),(45,'Touca Cirúrgica',1,2),(46,'Solução Salina Normal',1,3),(47,'Solução Ringer Lactato',1,3),(48,'Dextrose 5%',1,3),(49,'Antiemético',1,1),(50,'Analgésico',1,1),(51,'Antibiótico',1,1),(52,'Álcool 70%',1,2),(53,'Desinfetante',1,2),(54,'Detergente',1,2);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suprimentos`
--

DROP TABLE IF EXISTS `suprimentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suprimentos` (
  `IDSUPRIMENTO` int NOT NULL AUTO_INCREMENT,
  `IDPRODUTO` int DEFAULT NULL,
  `CATEGORIA` varchar(45) DEFAULT NULL,
  `QUANTIDADE` int DEFAULT NULL,
  `NOME` varchar(45) DEFAULT NULL,
  `TAMANHO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDSUPRIMENTO`),
  KEY `IDPRODUTO_idx` (`IDPRODUTO`),
  CONSTRAINT `IDPRODUTO_2` FOREIGN KEY (`IDPRODUTO`) REFERENCES `produto` (`IDPRODUTO`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suprimentos`
--

LOCK TABLES `suprimentos` WRITE;
/*!40000 ALTER TABLE `suprimentos` DISABLE KEYS */;
INSERT INTO `suprimentos` VALUES (1,40,'Materiais de Curativo',100,'Gaze Esterilizada','10x10 cm'),(2,41,'Materiais de Curativo',50,'Atadura de Crepe','5 cm x 4 m'),(3,42,'Materiais de Curativo',200,'Esparadrapo','2.5 cm x 10 m'),(4,43,'Equipamentos de Proteção Individual',100,'Máscara Cirúrgica','Unidade'),(5,44,'Equipamentos de Proteção Individual',75,'Luvas de Látex','Tamanho M'),(6,45,'Equipamentos de Proteção Individual',80,'Touca Cirúrgica','Unidade'),(7,46,'Soluções Intravenosas',50,'Solução Salina Normal','500 ml'),(8,47,'Soluções Intravenosas',40,'Solução Ringer Lactato','1 L'),(9,48,'Soluções Intravenosas',60,'Dextrose 5%','500 ml'),(10,49,'Medicamentos',30,'Antiemético','10 mg'),(11,50,'Medicamentos',25,'Analgésico','20 mg'),(12,51,'Medicamentos',20,'Antibiótico','500 mg'),(13,52,'Materiais de Limpeza',200,'Álcool 70%','500 ml'),(14,53,'Materiais de Limpeza',150,'Desinfetante','1 L'),(15,54,'Materiais de Limpeza',100,'Detergente','1 L');
/*!40000 ALTER TABLE `suprimentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tec enfermagem`
--

DROP TABLE IF EXISTS `tec_enfermagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tec_enfermagem` (
  `IDTECNICO` int NOT NULL,
  `NOME` varchar(45) DEFAULT NULL,
  `COREN` int DEFAULT NULL,
  PRIMARY KEY (`IDTECNICO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tec enfermagem`
--

LOCK TABLES `tec_enfermagem` WRITE;
/*!40000 ALTER TABLE `tec enfermagem` DISABLE KEYS */;
INSERT INTO `tec_enfermagem` VALUES (1,'João Silva',123456),(2,'Maria Oliveira',789012),(3,'Carlos Santos',345678);
/*!40000 ALTER TABLE `tec enfermagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoproduto`
--

DROP TABLE IF EXISTS `tipoproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoproduto` (
  `IDTIPOPRODUTO` int NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(20) NOT NULL,
  PRIMARY KEY (`IDTIPOPRODUTO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoproduto`
--

LOCK TABLES `tipoproduto` WRITE;
/*!40000 ALTER TABLE `tipoproduto` DISABLE KEYS */;
INSERT INTO `tipoproduto` VALUES (1,'SUPRIMENTO'),(2,'MEDICAMENTO');
/*!40000 ALTER TABLE `tipoproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipousuario` (
  `IDTIPOUSUARIO` int NOT NULL,
  `DESCRICAO` varchar(45) DEFAULT NULL,
  `AREA` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDTIPOUSUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` VALUES (1,'Médico','Saúde'),(2,'Enfermeiro','Saúde'),(3,'Técnico','Saúde'),(4,'Paciente','Saúde');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `IDUSUARIO` int NOT NULL AUTO_INCREMENT,
  `TIPOUSUARIO` int DEFAULT NULL,
  `IDENFERMEIRO` int DEFAULT NULL,
  `IDMEDICO` int DEFAULT NULL,
  `IDPACIENTE` int DEFAULT NULL,
  `IDTECNICO` int DEFAULT NULL,
  PRIMARY KEY (`IDUSUARIO`),
  KEY `TIPOUSUARIO_idx` (`TIPOUSUARIO`),
  KEY `IDENFERMEIRO_idx` (`IDENFERMEIRO`),
  KEY `IDMEDICO_idx` (`IDMEDICO`),
  KEY `IDPACIENTE_idx` (`IDPACIENTE`),
  KEY `IDTECNICO_idx` (`IDTECNICO`),
  CONSTRAINT `IDENFERMEIRO` FOREIGN KEY (`IDENFERMEIRO`) REFERENCES `enfermeiro` (`idENFERMEIRO`),
  CONSTRAINT `IDMEDICO_2` FOREIGN KEY (`IDMEDICO`) REFERENCES `medico` (`IDMEDICO`),
  CONSTRAINT `IDPACIENTE` FOREIGN KEY (`IDPACIENTE`) REFERENCES `paciente` (`IDPACIENTE`),
  CONSTRAINT `IDTECNICO` FOREIGN KEY (`IDTECNICO`) REFERENCES `tec enfermagem` (`IDTECNICO`),
  CONSTRAINT `TIPOUSUARIO` FOREIGN KEY (`TIPOUSUARIO`) REFERENCES `tipousuario` (`IDTIPOUSUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (6,2,1,NULL,NULL,NULL),(7,2,2,NULL,NULL,NULL),(8,2,3,NULL,NULL,NULL),(9,2,4,NULL,NULL,NULL),(10,1,NULL,1,NULL,NULL),(11,1,NULL,2,NULL,NULL),(12,1,NULL,3,NULL,NULL),(13,1,NULL,4,NULL,NULL),(14,1,NULL,5,NULL,NULL),(15,1,NULL,6,NULL,NULL),(16,1,NULL,7,NULL,NULL),(17,1,NULL,8,NULL,NULL),(18,1,NULL,9,NULL,NULL),(19,1,NULL,10,NULL,NULL),(20,4,NULL,NULL,1,NULL),(21,4,NULL,NULL,2,NULL),(22,4,NULL,NULL,3,NULL),(23,4,NULL,NULL,4,NULL),(24,4,NULL,NULL,5,NULL),(25,4,NULL,NULL,6,NULL),(26,4,NULL,NULL,7,NULL),(27,4,NULL,NULL,8,NULL),(28,4,NULL,NULL,9,NULL),(29,4,NULL,NULL,10,NULL),(30,4,NULL,NULL,11,NULL),(31,4,NULL,NULL,12,NULL),(32,4,NULL,NULL,13,NULL),(33,4,NULL,NULL,14,NULL),(34,4,NULL,NULL,15,NULL),(35,4,NULL,NULL,16,NULL),(36,4,NULL,NULL,17,NULL),(37,4,NULL,NULL,18,NULL),(38,4,NULL,NULL,19,NULL),(39,4,NULL,NULL,20,NULL),(40,4,NULL,NULL,21,NULL),(41,4,NULL,NULL,22,NULL),(42,4,NULL,NULL,23,NULL),(43,4,NULL,NULL,24,NULL),(44,4,NULL,NULL,25,NULL),(45,4,NULL,NULL,26,NULL),(46,4,NULL,NULL,27,NULL),(47,4,NULL,NULL,28,NULL),(48,4,NULL,NULL,29,NULL),(49,4,NULL,NULL,30,NULL),(50,4,NULL,NULL,31,NULL),(51,4,NULL,NULL,32,NULL),(52,4,NULL,NULL,33,NULL),(53,4,NULL,NULL,34,NULL),(54,4,NULL,NULL,35,NULL),(55,4,NULL,NULL,36,NULL),(56,4,NULL,NULL,37,NULL),(57,4,NULL,NULL,38,NULL),(58,4,NULL,NULL,39,NULL),(59,4,NULL,NULL,40,NULL),(60,4,NULL,NULL,41,NULL),(61,4,NULL,NULL,42,NULL),(62,4,NULL,NULL,43,NULL),(63,4,NULL,NULL,44,NULL),(64,4,NULL,NULL,45,NULL),(65,4,NULL,NULL,46,NULL),(66,4,NULL,NULL,47,NULL),(67,4,NULL,NULL,48,NULL),(68,4,NULL,NULL,49,NULL),(69,4,NULL,NULL,50,NULL),(70,4,NULL,NULL,51,NULL),(71,4,NULL,NULL,52,NULL),(72,4,NULL,NULL,53,NULL),(73,4,NULL,NULL,54,NULL),(74,4,NULL,NULL,55,NULL),(75,4,NULL,NULL,56,NULL),(76,4,NULL,NULL,57,NULL),(77,4,NULL,NULL,58,NULL),(78,4,NULL,NULL,59,NULL),(79,4,NULL,NULL,60,NULL),(80,4,NULL,NULL,61,NULL),(81,4,NULL,NULL,62,NULL),(82,4,NULL,NULL,63,NULL),(83,4,NULL,NULL,64,NULL),(84,4,NULL,NULL,65,NULL),(85,4,NULL,NULL,66,NULL),(86,4,NULL,NULL,67,NULL),(87,4,NULL,NULL,68,NULL),(88,4,NULL,NULL,69,NULL),(89,4,NULL,NULL,70,NULL),(90,4,NULL,NULL,71,NULL),(91,4,NULL,NULL,72,NULL),(92,4,NULL,NULL,73,NULL),(93,4,NULL,NULL,74,NULL),(94,4,NULL,NULL,75,NULL),(95,4,NULL,NULL,76,NULL),(96,4,NULL,NULL,77,NULL),(97,4,NULL,NULL,78,NULL),(98,4,NULL,NULL,79,NULL),(99,4,NULL,NULL,80,NULL),(100,4,NULL,NULL,81,NULL),(101,4,NULL,NULL,82,NULL),(102,4,NULL,NULL,83,NULL),(103,4,NULL,NULL,84,NULL),(104,4,NULL,NULL,85,NULL),(105,4,NULL,NULL,86,NULL),(106,4,NULL,NULL,87,NULL),(107,4,NULL,NULL,88,NULL),(108,4,NULL,NULL,89,NULL),(109,4,NULL,NULL,90,NULL),(110,4,NULL,NULL,91,NULL),(111,4,NULL,NULL,92,NULL),(112,4,NULL,NULL,93,NULL),(113,4,NULL,NULL,94,NULL),(114,4,NULL,NULL,95,NULL),(115,4,NULL,NULL,96,NULL),(116,4,NULL,NULL,97,NULL),(117,4,NULL,NULL,98,NULL),(118,4,NULL,NULL,99,NULL),(119,4,NULL,NULL,100,NULL),(120,4,NULL,NULL,101,NULL),(121,4,NULL,NULL,102,NULL),(122,4,NULL,NULL,103,NULL),(123,4,NULL,NULL,104,NULL),(124,4,NULL,NULL,105,NULL),(125,4,NULL,NULL,106,NULL),(126,4,NULL,NULL,107,NULL),(127,4,NULL,NULL,108,NULL),(128,4,NULL,NULL,109,NULL),(129,4,NULL,NULL,110,NULL),(130,4,NULL,NULL,111,NULL),(131,4,NULL,NULL,112,NULL),(132,4,NULL,NULL,113,NULL),(133,4,NULL,NULL,114,NULL),(134,4,NULL,NULL,115,NULL),(135,4,NULL,NULL,116,NULL),(136,4,NULL,NULL,117,NULL),(137,4,NULL,NULL,118,NULL),(138,4,NULL,NULL,119,NULL),(139,4,NULL,NULL,120,NULL),(140,4,NULL,NULL,121,NULL),(141,4,NULL,NULL,122,NULL),(142,4,NULL,NULL,123,NULL),(143,4,NULL,NULL,124,NULL),(144,4,NULL,NULL,125,NULL),(145,4,NULL,NULL,126,NULL),(146,4,NULL,NULL,127,NULL),(147,4,NULL,NULL,128,NULL),(148,4,NULL,NULL,129,NULL),(149,4,NULL,NULL,130,NULL),(150,4,NULL,NULL,131,NULL),(151,4,NULL,NULL,132,NULL),(152,4,NULL,NULL,133,NULL),(153,4,NULL,NULL,134,NULL),(154,4,NULL,NULL,135,NULL),(155,4,NULL,NULL,136,NULL),(156,4,NULL,NULL,137,NULL),(157,4,NULL,NULL,138,NULL),(158,4,NULL,NULL,139,NULL),(159,4,NULL,NULL,140,NULL),(160,4,NULL,NULL,141,NULL),(161,4,NULL,NULL,142,NULL),(162,4,NULL,NULL,143,NULL),(163,4,NULL,NULL,144,NULL),(164,4,NULL,NULL,145,NULL),(165,4,NULL,NULL,146,NULL),(166,4,NULL,NULL,147,NULL),(167,4,NULL,NULL,148,NULL),(168,4,NULL,NULL,149,NULL),(169,4,NULL,NULL,150,NULL),(170,3,NULL,NULL,NULL,1),(171,3,NULL,NULL,NULL,2),(172,3,NULL,NULL,NULL,3);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-21 10:32:45
