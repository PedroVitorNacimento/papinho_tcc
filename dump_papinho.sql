CREATE DATABASE  IF NOT EXISTS `papinho` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `papinho`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: papinho
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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome_categoria` varchar(100) DEFAULT NULL,
  `descricao_categoria` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crianca`
--

DROP TABLE IF EXISTS `crianca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crianca` (
  `id_crianca` int NOT NULL AUTO_INCREMENT,
  `nome_crianca` varchar(200) NOT NULL,
  `id_responsavel` int DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `genero` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_crianca`),
  KEY `id_responsavel` (`id_responsavel`),
  CONSTRAINT `crianca_ibfk_1` FOREIGN KEY (`id_responsavel`) REFERENCES `responsavel` (`id_responsavel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crianca`
--

LOCK TABLES `crianca` WRITE;
/*!40000 ALTER TABLE `crianca` DISABLE KEYS */;
/*!40000 ALTER TABLE `crianca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagem`
--

DROP TABLE IF EXISTS `imagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagem` (
  `id_imagem` int NOT NULL AUTO_INCREMENT,
  `nome_imagem` varchar(50) NOT NULL,
  `id_categoria` int DEFAULT NULL,
  PRIMARY KEY (`id_imagem`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `imagem_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagem`
--

LOCK TABLES `imagem` WRITE;
/*!40000 ALTER TABLE `imagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iteracoes`
--

DROP TABLE IF EXISTS `iteracoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iteracoes` (
  `id_iteracao` int NOT NULL AUTO_INCREMENT,
  `id_imagem` int DEFAULT NULL,
  `id_crianca` int DEFAULT NULL,
  `data_iteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_iteracao`),
  KEY `id_imagem` (`id_imagem`),
  KEY `id_crianca` (`id_crianca`),
  CONSTRAINT `iteracoes_ibfk_1` FOREIGN KEY (`id_imagem`) REFERENCES `imagem` (`id_imagem`),
  CONSTRAINT `iteracoes_ibfk_2` FOREIGN KEY (`id_crianca`) REFERENCES `crianca` (`id_crianca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iteracoes`
--

LOCK TABLES `iteracoes` WRITE;
/*!40000 ALTER TABLE `iteracoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `iteracoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relatorios`
--

DROP TABLE IF EXISTS `relatorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relatorios` (
  `id_relatorio` int NOT NULL AUTO_INCREMENT,
  `id_crianca` int DEFAULT NULL,
  `gerado_em` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_relatorio`),
  KEY `id_crianca` (`id_crianca`),
  CONSTRAINT `relatorios_ibfk_1` FOREIGN KEY (`id_crianca`) REFERENCES `crianca` (`id_crianca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatorios`
--

LOCK TABLES `relatorios` WRITE;
/*!40000 ALTER TABLE `relatorios` DISABLE KEYS */;
/*!40000 ALTER TABLE `relatorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsavel`
--

DROP TABLE IF EXISTS `responsavel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsavel` (
  `id_responsavel` int NOT NULL AUTO_INCREMENT,
  `nome_responsavel` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `senha` varchar(200) DEFAULT NULL,
  `criado_em` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_responsavel`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsavel`
--

LOCK TABLES `responsavel` WRITE;
/*!40000 ALTER TABLE `responsavel` DISABLE KEYS */;
INSERT INTO `responsavel` VALUES (2,'teste input','testeinput@teste.com','teste input','2025-01-13 15:07:15'),(3,'pedro','p.nac124111@gmail.com','12345678','2025-01-13 15:12:58'),(4,'pedro','p.nac124111@gmail.com','12345678','2025-01-13 15:15:20'),(5,'pedro','p.nac124111@gmail.com','12345678','2025-01-13 15:15:36'),(6,'pedro','p.nac124111@gmail.com','12345678','2025-01-13 15:15:38');
/*!40000 ALTER TABLE `responsavel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-08 18:55:48
