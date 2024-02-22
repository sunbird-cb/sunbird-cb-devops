-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: frac_tool
-- ------------------------------------------------------
-- Server version	5.7.33-0ubuntu0.16.04.1

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
-- Table structure for table `additional_properties`
--

DROP TABLE IF EXISTS `additional_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `additional_properties` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `node_id` varchar(20) NOT NULL,
  `prop_key` varchar(45) NOT NULL,
  `prop_name` varchar(100) DEFAULT NULL,
  `prop_value` text,
  PRIMARY KEY (`id`),
  KEY `dn_id_idx` (`node_id`),
  KEY `children_id_idx` (`prop_key`),
  CONSTRAINT `dn_id_11` FOREIGN KEY (`node_id`) REFERENCES `data_node` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2932 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bookmarks`
--

DROP TABLE IF EXISTS `bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmarks` (
  `node_id` varchar(20) NOT NULL,
  `type` varchar(45) NOT NULL,
  `user_id` varchar(150) NOT NULL,
  KEY `fk_bookmarks_1_idx` (`node_id`),
  CONSTRAINT `fk_bookmarks_1` FOREIGN KEY (`node_id`) REFERENCES `data_node` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_node`
--

DROP TABLE IF EXISTS `data_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_node` (
  `id` varchar(20) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` varchar(2500) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `secondary_status` varchar(45) DEFAULT NULL,
  `source` varchar(45) DEFAULT NULL,
  `level` varchar(45) DEFAULT NULL,
  `review_comments` varchar(1000) DEFAULT NULL,
  `secondary_review_comments` varchar(1000) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(150) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` varchar(150) DEFAULT NULL,
  `reviewed_date` datetime DEFAULT NULL,
  `reviewed_by` varchar(150) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_mapping_child`
--

DROP TABLE IF EXISTS `node_mapping_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_mapping_child` (
  `id` int(11) NOT NULL,
  `child_id` varchar(45) NOT NULL,
  KEY `fk_node_mapping_child_2_idx` (`child_id`),
  KEY `fk_node_mapping_child_1_idx` (`id`),
  CONSTRAINT `fk_node_mapping_child_1` FOREIGN KEY (`id`) REFERENCES `node_mapping_parent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_node_mapping_child_2` FOREIGN KEY (`child_id`) REFERENCES `data_node` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_mapping_parent`
--

DROP TABLE IF EXISTS `node_mapping_parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_mapping_parent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` varchar(45) NOT NULL,
  `parent_id` varchar(45) NOT NULL,
  `child` varchar(45) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parent_child` (`parent_id`,`child`),
  KEY `fk_node_mapping_parent_1_idx` (`parent_id`),
  CONSTRAINT `fk_node_mapping_parent_1` FOREIGN KEY (`parent_id`) REFERENCES `data_node` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7428 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `storage_service`
--

DROP TABLE IF EXISTS `storage_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(45) NOT NULL,
  `container` varchar(45) NOT NULL,
  `identity` varchar(150) NOT NULL,
  `credential` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nodeLevelId` (`provider`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-17  7:10:13
