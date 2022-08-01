-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: store_sec
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `address_store`
--

DROP TABLE IF EXISTS `address_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_store` (
  `id_address_store` int NOT NULL AUTO_INCREMENT,
  `country_address_store` varchar(45) DEFAULT NULL,
  `city_address_store` varchar(45) DEFAULT NULL,
  `street_address_store` varchar(45) DEFAULT NULL,
  `number_house_address_store` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_address_store`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_store`
--

LOCK TABLES `address_store` WRITE;
/*!40000 ALTER TABLE `address_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id_addresses` int NOT NULL AUTO_INCREMENT,
  `country_addresses` varchar(45) DEFAULT NULL,
  `city_addresses` varchar(45) DEFAULT NULL,
  `street_addresses` varchar(45) DEFAULT NULL,
  `numberHouse_addresses` varchar(45) DEFAULT NULL,
  `users_id_users` int NOT NULL,
  PRIMARY KEY (`id_addresses`),
  KEY `fk_addresses_users1_idx` (`users_id_users`),
  CONSTRAINT `fk_addresses_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'BELARUS','Minsk','flowers','124',7),(2,'BELARUS','Mogilev','Firts May','452',7),(3,'BELARUS','Texas','aveny','49',12),(4,'BELARUS','Chicago','Avenu','41',12),(5,'BELARUS','LA','Avenu','912',12),(6,'BELARUS','NY','Avenu','71',12),(7,'BELARUS','Tennessy','Avenu','45',12),(8,'BELARUS','flaffyland','Avenu','41',12),(9,'BELARUS','TX','Avenu','31',12),(10,'BELARUS','Mexico','AlCapone','54',12),(11,'BELARUS','Minsk','Avenu','69',12),(12,'BELARUS','Brest','Avenu','',7),(13,'BELARUS','Minsk','Voly','12',12),(14,'BELARUS','Gomel','Zen','9',12),(15,'BELARUS',' ',' ',' ',12),(16,'BELARUS','Brest','Oil','7',12),(17,'BELARUS','Minsk','Carl-Marks','2',15),(18,'BELARUS','Minsk','Carl-Marks','2',12),(19,'BELARUS','Minsk','Carl','7',12),(20,'BELARUS','dark','str','1',12),(21,'BELARUS','dark','str','1',12),(22,'BELARUS','san','str','8',12),(23,'BELARUS','san','stre','3',12),(24,'BELARUS','Minsk','Carl-Marks','2',12),(29,'BELARUS','MINSK','KARL','21A',15),(33,'FRANCE','PARIS','LE QUAE','7',15),(36,'BELARUS','AZ','AV','XQ4',19),(37,'BELARUS','Minsk','Carl','2',19);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id_categories` int NOT NULL AUTO_INCREMENT,
  `title_categories` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_categories`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Женщинам'),(2,'Мужчинам');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `id_delivery` int NOT NULL AUTO_INCREMENT,
  `date_delivery` date DEFAULT NULL,
  `type_delivery` varchar(45) DEFAULT NULL,
  `addresses_id_addresses` int NOT NULL,
  `status_delivery_id_status_delivery` int NOT NULL,
  PRIMARY KEY (`id_delivery`),
  KEY `fk_delivery_addresses1_idx` (`addresses_id_addresses`),
  KEY `fk_delivery_status_delivery1_idx` (`status_delivery_id_status_delivery`),
  CONSTRAINT `fk_delivery_addresses1` FOREIGN KEY (`addresses_id_addresses`) REFERENCES `addresses` (`id_addresses`),
  CONSTRAINT `fk_delivery_status_delivery1` FOREIGN KEY (`status_delivery_id_status_delivery`) REFERENCES `status_delivery` (`id_status_delivery`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (5,'2021-02-17','ToTheDoor',1,33),(6,'2021-02-17','ToTheDoor',2,33),(7,'2021-02-18','ToTheDoor',3,33),(8,'2021-02-19','ToTheDoor',4,33),(9,'2021-02-19','ToTheDoor',5,33),(10,'2021-02-19','ToTheDoor',6,33),(11,'2021-02-19','ToTheDoor',7,33),(12,'2021-02-21','ToTheDoor',8,33),(13,'2021-02-21','ToTheDoor',9,33),(14,'2021-02-24','ToTheDoor',10,33),(15,'2021-02-27','ToTheDoor',11,33),(16,'2021-03-03','ToTheDoor',12,33),(17,'2021-04-02','ToTheDoor',13,33),(18,'2021-04-16','ToTheDoor',14,33),(20,'2021-04-16','ToTheDoor',15,33),(21,'2021-04-16','ToTheDoor',16,33),(22,'2021-04-21','ToTheDoor',17,33),(23,'2021-05-02','ToTheDoor',18,33),(24,'2021-05-03','ToTheDoor',19,33),(25,'2021-05-03','ToTheDoor',20,33),(26,'2021-05-03','ToTheDoor',21,33),(27,'2021-05-03','ToTheDoor',22,33),(28,'2021-05-03','ToTheDoor',23,33),(29,'2021-05-06','ToTheDoor',24,33),(30,'2022-02-03','ToTheDoor',17,33),(32,'2022-02-04','TO THE DOOR',29,33),(36,'2022-02-04','TO THE DOOR',33,33),(39,'2022-07-17','ToTheDoor',36,33),(40,'2022-07-19','ToTheDoor',37,33);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `id_discount` int NOT NULL AUTO_INCREMENT,
  `value_discount` double DEFAULT NULL,
  `status_discount` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_discount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id_favorites` int NOT NULL AUTO_INCREMENT,
  `users_id_users` int NOT NULL,
  `products_id_products` int NOT NULL,
  PRIMARY KEY (`id_favorites`),
  KEY `fk_favorites_users1_idx` (`users_id_users`),
  KEY `fk_favorites_products1_idx` (`products_id_products`),
  CONSTRAINT `fk_favorites_products1` FOREIGN KEY (`products_id_products`) REFERENCES `products` (`id_products`),
  CONSTRAINT `fk_favorites_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (2,5,2),(13,7,4),(14,7,1),(16,12,1),(17,19,4);
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer` (
  `id_manufacturer` int NOT NULL AUTO_INCREMENT,
  `title_manufacturer` varchar(45) DEFAULT NULL,
  `description_manufacturer` text,
  `country_manufacturer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_manufacturer`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'Bikkembergs','Bikkembergs 1917','Италия'),(2,'Timberland','Timberland 1814',' Швейцария, Via Laveggio, – Switzerland'),(3,'Conte','Conte ','Беларусь'),(4,'Topshop','Topshop','Соединенное Королевство'),(5,'Mango','Mango','Испания'),(6,'Marks & Spencer','Marks & Spencer','Соединенное Королевство'),(7,'Only Carmakoma','Only Carmakoma','ДАНИЯ'),(8,'Rodier','Rodier','ФРАНЦИЯ'),(9,'Gap','Gap','Соединенное Королевство'),(10,'Pimkie','Pimkie','ФРАНЦИЯ'),(11,'Befree','Befree','КИТАЙ'),(12,'Missguided','Missguided','Соединенное Королевство'),(13,'Sela','Sela','Бангладеш');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id_order_details` int NOT NULL AUTO_INCREMENT,
  `quantity_order_details` int DEFAULT NULL,
  `product_size_order_details` varchar(45) DEFAULT NULL,
  `order_id_order` int NOT NULL,
  `products_id_products` int NOT NULL,
  PRIMARY KEY (`id_order_details`),
  KEY `fk_order_details_order1_idx` (`order_id_order`),
  KEY `fk_order_details_products1_idx` (`products_id_products`),
  CONSTRAINT `fk_order_details_order1` FOREIGN KEY (`order_id_order`) REFERENCES `orders` (`id_orders`),
  CONSTRAINT `fk_order_details_products1` FOREIGN KEY (`products_id_products`) REFERENCES `products` (`id_products`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (9,1,'',5,1),(27,1,NULL,1,1),(29,1,NULL,7,3),(30,1,NULL,8,2),(31,1,NULL,9,3),(32,1,NULL,10,3),(34,1,NULL,11,2),(39,1,NULL,12,2),(41,1,NULL,13,2),(42,2,NULL,14,1),(43,1,NULL,14,3),(44,1,NULL,15,1),(45,1,NULL,15,4),(48,2,NULL,6,4),(49,1,NULL,6,1),(52,2,NULL,16,4),(55,1,'M',18,1),(56,2,NULL,19,4),(57,1,NULL,20,4),(60,2,NULL,24,4),(67,1,'m',21,1),(68,3,'s',21,1),(69,1,'m',26,1),(70,1,'s',26,1),(71,1,'xs',26,1),(72,1,'m',27,1),(73,1,'xs',27,1),(74,2,'xs',28,1),(75,2,'s',29,1),(76,1,'xs',29,1),(83,1,'xs',30,1),(84,1,'L',17,7),(85,1,'XS',17,6),(86,1,'XS',17,13),(87,1,'M',17,9),(90,3,'M',25,15),(91,1,'M',34,16),(92,1,'S',34,16),(93,1,'S',34,17),(94,5,'L',34,17),(96,2,'XS',36,5),(100,1,'S',37,10);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id_orders` int NOT NULL AUTO_INCREMENT,
  `date_orders` datetime DEFAULT NULL,
  `status_order` varchar(45) DEFAULT NULL,
  `total_price_orders` decimal(10,2) DEFAULT NULL,
  `users_id_users` int NOT NULL,
  `discount_id_discount` int DEFAULT NULL,
  `delivery_id_delivery` int DEFAULT NULL,
  `store_id_store` int DEFAULT NULL,
  PRIMARY KEY (`id_orders`),
  KEY `fk_order_users1_idx` (`users_id_users`),
  KEY `fk_order_discount1_idx` (`discount_id_discount`),
  KEY `fk_orders_delivery1_idx` (`delivery_id_delivery`),
  KEY `fk_orders_store1_idx` (`store_id_store`),
  CONSTRAINT `fk_order_discount1` FOREIGN KEY (`discount_id_discount`) REFERENCES `discount` (`id_discount`),
  CONSTRAINT `fk_order_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id_users`),
  CONSTRAINT `fk_orders_delivery1` FOREIGN KEY (`delivery_id_delivery`) REFERENCES `delivery` (`id_delivery`),
  CONSTRAINT `fk_orders_store1` FOREIGN KEY (`store_id_store`) REFERENCES `store` (`id_store`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2021-02-17 00:00:00','ORDER',NULL,7,NULL,6,NULL),(2,NULL,'CART',NULL,8,NULL,NULL,NULL),(3,NULL,'CART',NULL,9,NULL,NULL,NULL),(4,NULL,'CART',NULL,10,NULL,NULL,NULL),(5,NULL,'CART',NULL,11,NULL,NULL,NULL),(6,'2021-03-03 00:00:00','ORDER',NULL,7,NULL,16,NULL),(7,'2021-02-18 00:00:00','ORDER',NULL,12,NULL,7,NULL),(8,'2021-02-19 00:00:00','ORDER',NULL,12,NULL,8,NULL),(9,'2021-02-19 00:00:00','ORDER',NULL,12,NULL,9,NULL),(10,'2021-02-19 00:00:00','ORDER',NULL,12,NULL,10,NULL),(11,'2021-02-19 00:00:00','ORDER',NULL,12,NULL,11,NULL),(12,'2021-02-21 00:00:00','ORDER',NULL,12,NULL,12,NULL),(13,'2021-02-21 00:00:00','ORDER',NULL,12,NULL,13,NULL),(14,'2021-02-24 00:00:00','ORDER',NULL,12,NULL,14,NULL),(15,'2021-02-27 00:00:00','ORDER',NULL,12,NULL,15,NULL),(16,'2021-04-02 00:00:00','ORDER',NULL,12,NULL,17,NULL),(17,NULL,'CART',NULL,7,NULL,NULL,NULL),(18,'2021-04-12 00:00:00','ORDER',NULL,12,NULL,18,NULL),(19,'2021-04-12 00:00:00','ORDER',NULL,12,NULL,20,NULL),(20,'2021-04-12 00:00:00','ORDER',NULL,12,NULL,21,NULL),(21,'2021-04-28 00:00:00','ORDER',NULL,12,NULL,23,NULL),(22,NULL,'CART',NULL,13,NULL,NULL,NULL),(23,NULL,'CART',NULL,14,NULL,NULL,NULL),(24,'2021-04-17 00:00:00','ORDER',NULL,15,NULL,22,NULL),(25,'2022-01-31 12:31:14','ORDER',NULL,15,NULL,32,NULL),(26,'2021-04-29 00:00:00','ORDER',NULL,12,NULL,24,NULL),(27,'2021-04-29 00:00:00','ORDER',NULL,12,NULL,26,NULL),(28,'2021-04-29 00:00:00','ORDER',NULL,12,NULL,27,NULL),(29,'2021-04-29 00:00:00','ORDER',NULL,12,NULL,28,NULL),(30,'2021-05-02 00:00:00','ORDER',NULL,12,NULL,29,NULL),(31,NULL,'CART',NULL,12,NULL,NULL,NULL),(32,NULL,'CART',NULL,16,NULL,NULL,NULL),(33,NULL,'CART',NULL,17,NULL,NULL,NULL),(34,'2022-01-31 13:20:02','ORDER',NULL,15,NULL,36,NULL),(35,NULL,'CART',NULL,18,NULL,NULL,NULL),(36,'2022-07-13 13:40:45','ORDER',NULL,19,NULL,39,NULL),(37,'2022-07-15 18:27:07','ORDER',NULL,19,NULL,40,NULL),(38,NULL,'CART',NULL,19,NULL,NULL,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id_payment` int NOT NULL AUTO_INCREMENT,
  `type_payment` varchar(45) DEFAULT NULL,
  `date_payment` varchar(45) DEFAULT NULL,
  `status_payment` varchar(45) DEFAULT NULL,
  `order_id_order` int NOT NULL,
  PRIMARY KEY (`id_payment`),
  KEY `fk_payment_order1_idx` (`order_id_order`),
  CONSTRAINT `fk_payment_order1` FOREIGN KEY (`order_id_order`) REFERENCES `orders` (`id_orders`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (3,'cash',NULL,NULL,1),(4,'card',NULL,NULL,1),(5,'cash',NULL,NULL,7),(6,'card',NULL,NULL,8),(7,'card',NULL,NULL,9),(8,'cash',NULL,NULL,10),(9,'cash',NULL,NULL,11),(10,'cash',NULL,NULL,12),(11,'card',NULL,NULL,13),(12,'card',NULL,NULL,14),(13,'cash',NULL,NULL,15),(14,NULL,NULL,NULL,6),(15,'cash',NULL,NULL,16),(16,'card',NULL,NULL,18),(17,NULL,NULL,NULL,19),(18,'cash',NULL,'notPayment',20),(19,'cash',NULL,'notPayment',24),(20,'cash',NULL,'notPayment',21),(21,'cash',NULL,'notPayment',26),(22,'cash',NULL,'notPayment',27),(23,'cash',NULL,'notPayment',27),(24,'cash',NULL,'notPayment',28),(25,'cash',NULL,'notPayment',29),(26,'cash',NULL,'notPayment',30),(27,'CASH',NULL,'NOT PAID',25),(31,'CARD',NULL,'NOT PAID',34),(32,'cash',NULL,'notPaid',36),(33,'card',NULL,'notPaid',36),(34,'card',NULL,'notPaid',36),(35,'cash',NULL,'notPaid',37);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `id_product_image` int NOT NULL AUTO_INCREMENT,
  `image_product_image` varchar(255) DEFAULT NULL,
  `products_id_products` int NOT NULL,
  PRIMARY KEY (`id_product_image`),
  KEY `fk_product_image_products1_idx` (`products_id_products`),
  CONSTRAINT `fk_product_image_products1` FOREIGN KEY (`products_id_products`) REFERENCES `products` (`id_products`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (1,'m1.jpg',1),(2,'m2.jpg',1),(3,'m3.jpg',1),(4,'m4.jpg',1),(5,'fren2red',2),(6,'tightsBlack2.jpg',4),(7,'cardiganGTopshopW1.jpg',5),(8,'cardiganGTopshopW2.jpg',5),(9,'cardiganGTopshopW3.jpg',5),(12,'jumperCMangoW1.jpg',6),(13,'jumperCMangoW2.jpg',6),(15,'pulloverRMarksSpenserW1.jpg',7),(16,'pulloverRMarksSpenserW2.jpg',7),(17,'pulloverRMarksSpenserW3.jpg',7),(18,'jumperPOnlyCarmakomaW1.jpg',8),(19,'jumperPOnlyCarmakomaW2.jpg',8),(20,'jumperPOnlyCarmakomaW3.jpg',8),(21,'cardiganDBRodierW1.jpg',9),(22,'cardiganDBRodierW2.jpg',9),(23,'cardiganDBRodierW3.jpg',9),(24,'shirtWGapW1.jpg',10),(25,'shirtWGapW2.jpg',10),(26,'shirtWGapW3.jpg',10),(27,'blouseTPimkieW1.jpg',11),(28,'blouseTPimkieW2.jpg',11),(29,'blouseTPimkieW3.jpg',11),(30,'blouseBBefreeW1.jpg',12),(31,'blouseBBefreeW2.jpg',12),(32,'blouseBBefreeW3.jpg',12),(33,'shirtGMissguidedW1.jpg',13),(34,'shirtGMissguidedW2.jpg',13),(35,'shirtGMissguidedW3.jpg',13),(36,'shirtPGapW1.jpg',14),(37,'shirtPGapW2.jpg',14),(38,'shirtPGapW3.jpg',14),(39,'tshirtWSelaW1.jpg',15),(40,'tshirtWSelaW2.jpg',15),(41,'tshirtDBMarksSpencerW1.jpg',16),(42,'tshirtDBMarksSpencerW2.jpg',16),(43,'tshirtDBMarksSpencerW3.jpg',16),(44,'tshirtTMissguidedW1.jpg ',17),(45,'tshirtTMissguidedW2.jpg ',17);
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sizes`
--

DROP TABLE IF EXISTS `product_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_sizes` (
  `id_product_sizes` int NOT NULL AUTO_INCREMENT,
  `size_product_sizes` varchar(45) DEFAULT NULL,
  `quantity_product_sizes` int DEFAULT NULL,
  `products_id_products` int NOT NULL,
  PRIMARY KEY (`id_product_sizes`),
  KEY `fk_products_products_size1_idx` (`products_id_products`),
  CONSTRAINT `fk_product_sizes_products1` FOREIGN KEY (`products_id_products`) REFERENCES `products` (`id_products`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sizes`
--

LOCK TABLES `product_sizes` WRITE;
/*!40000 ALTER TABLE `product_sizes` DISABLE KEYS */;
INSERT INTO `product_sizes` VALUES (1,'xs',5,1),(2,'s',5,1),(3,'m',1,1),(4,'XS',23,5),(5,'S',30,5),(6,'M',30,5),(7,'L',30,5),(8,'XS',30,6),(9,'S',30,6),(10,'M',30,6),(11,'L',30,6),(12,'XS',30,7),(13,'S',30,7),(14,'M',30,7),(15,'L',30,7),(16,'XS',10,8),(17,'S',1,8),(18,'M',30,8),(19,'L',30,8),(20,'XS',30,9),(21,'S',30,9),(22,'M',30,9),(23,'L',30,9),(24,'XS',30,10),(25,'S',29,10),(26,'M',30,10),(27,'L',30,10),(28,'XS',30,11),(29,'S',30,11),(30,'M',30,11),(31,'L',30,11),(32,'XS',30,12),(33,'S',30,12),(34,'M',30,12),(35,'L',30,12),(36,'XS',30,13),(37,'S',30,13),(38,'M',30,13),(39,'L',30,13),(40,'XS',30,14),(41,'S',30,14),(42,'M',30,14),(43,'L',30,14),(44,'XS',30,15),(45,'S',30,15),(46,'M',24,15),(47,'L',30,15),(48,'XS',30,16),(49,'S',29,16),(50,'M',29,16),(51,'L',30,16),(52,'XS',30,17),(53,'S',29,17),(54,'M',30,17),(55,'L',25,17);
/*!40000 ALTER TABLE `product_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id_products` int NOT NULL AUTO_INCREMENT,
  `title_products` varchar(45) DEFAULT NULL,
  `description_products` text,
  `year_products` int DEFAULT NULL,
  `price_products` double DEFAULT NULL,
  `quantity_products` int DEFAULT NULL,
  `date_add_products` date DEFAULT NULL,
  `image_products` varchar(45) DEFAULT NULL,
  `color_products` varchar(45) DEFAULT NULL,
  `manufacturer_id_manufacturer` int NOT NULL,
  `subcategories_id_subcategories` int NOT NULL,
  PRIMARY KEY (`id_products`),
  KEY `fk_products_manufacturer1_idx` (`manufacturer_id_manufacturer`) /*!80000 INVISIBLE */,
  KEY `fk_products_subcategories1_idx` (`subcategories_id_subcategories`),
  FULLTEXT KEY `title` (`title_products`),
  FULLTEXT KEY `color` (`color_products`),
  FULLTEXT KEY `titleAndColot` (`title_products`,`color_products`),
  CONSTRAINT `fk_products_manufacturer1` FOREIGN KEY (`manufacturer_id_manufacturer`) REFERENCES `manufacturer` (`id_manufacturer`),
  CONSTRAINT `fk_products_subcategories1` FOREIGN KEY (`subcategories_id_subcategories`) REFERENCES `subcategories` (`id_subcategories`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Bikkembergs рубашка','Состав: Хлопок - 99%, Эластан - 1%',2020,120,26,'2020-10-10','m1.jpg','серый',1,1),(2,'рубашка','ласка',2019,20,1,'2020-11-09','fretchMain',NULL,1,1),(3,'Timberland ботинки','Ботинки выполнены из высококачественной кожи с водонепроницаемой мембраной TimberDry ™. Твердая резиновая подошва обеспечивает сцепление с мокрой поверхностью. Полиуретановая подошва с удобной амортизацией.',2020,770,3,'2020-09-17','bootsMenMain',NULL,2,22),(4,'Conte Колготки 50 den','полиамид 82%, эластан 17%, полипропилен 1%',2020,22,2,'2021-02-24','tightsBlack1.jpg',NULL,3,20),(5,'Topshop кардиган','Состав: Акрил - 100%',2020,135,10,'2021-04-20','cardiganGTopshopW.jpg','серый',4,23),(6,'Mango джемпер - CIRCLE','Состав: Хлопок - 73%, Полиэстер - 27%',2021,99,20,'2021-04-20','jumperCMangoW.jpg',NULL,5,23),(7,'Marks & Spencer пуловер','Состав: Вискоза - 48%, Полиэстер - 30%, Полиамид - 22%',2021,81.7,30,'2021-04-20','pulloverRMarksSpenserW.jpg','красный',6,23),(8,'Only Carmakoma джемпер','Состав: Хлопок - 50%, Акрил - 50%',2021,102,30,'2021-04-20','jumperPOnlyCarmakomaW.jpg',NULL,7,23),(9,'Rodier кардиган','Состав: Хлопок - 90%, Кашемир - 10%',2021,99,30,'2021-04-20','cardiganDBRodierW.jpg','синий',8,23),(10,'Gap рубашка','Состав: Хлопок - 100%',2021,88,30,'2021-04-20','shirtWGapW.jpg','серый',9,24),(11,'Pimkie блуза','Состав: Лиоцелл - 74%, Полиамид - 26%',2020,54.99,30,'2021-04-20','blouseTPimkieW.jpg',NULL,10,24),(12,'Befree блуза','Состав: Полиэстер - 65%, Хлопок - 35%',2021,19.99,30,'2021-04-21','blouseBBefreeW.jpg','голубой',11,24),(13,'Missguided рубашка','Состав: Полиэстер - 100%',2021,61.7,30,'2021-04-21','shirtGMissguidedW.jpg','серый',12,24),(14,'Gap рубашка','Состав: Хлопок - 100%',2021,54,30,'2021-04-21','shirtPGapW.jpg',NULL,9,24),(15,'Sela футболка','Состав: Хлопок - 95%, Эластан - 5%',2021,8.4,30,'2021-04-21','tshirtWSelaW.jpg',NULL,13,25),(16,'Marks & Spencer футболка','Состав: Хлопок - 100%',2020,10,30,'2021-04-21','tshirtDBMarksSpencerW.jpg','синий',6,25),(17,'Missguided футболка','Состав: Хлопок - 95%, Эластан - 5%',2021,21,30,'2021-04-21','tshirtTMissguidedW.jpg ',NULL,12,25);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id_reviews` int NOT NULL AUTO_INCREMENT,
  `type_reviews` varchar(45) DEFAULT NULL,
  `text_reviews` text,
  `rating_reviews` int DEFAULT NULL,
  `date_reviews` date DEFAULT NULL,
  `status_reviews` varchar(45) DEFAULT NULL,
  `users_id_users` int NOT NULL,
  `products_id_products` int NOT NULL,
  PRIMARY KEY (`id_reviews`),
  KEY `fk_review_users1_idx` (`users_id_users`),
  KEY `fk_review_products1_idx` (`products_id_products`),
  CONSTRAINT `fk_review_products1` FOREIGN KEY (`products_id_products`) REFERENCES `products` (`id_products`),
  CONSTRAINT `fk_review_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'POSITIVE','super',4,'2020-12-15','ACTIVE',1,1),(3,'no','super',3,'2021-01-04','DELETED',2,1),(30,'no','cool',5,'2021-01-05','ACTIVE',5,1),(31,'no','ugly',4,'2021-01-29','DELETED',7,1),(32,'no','cool',2,'2021-03-05','ACTIVE',12,1),(33,'no','wow',1,'2021-03-06','ACTIVE',1,1),(34,'no','badly',5,'2021-03-30','ACTIVE',12,4),(35,'none','Soft:)',3,'2021-04-11','ACTIVE',12,4),(36,NULL,'cute',5,'2021-11-09','ACTIVE',7,1);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_roles` int NOT NULL AUTO_INCREMENT,
  `role_roles` varchar(45) NOT NULL,
  PRIMARY KEY (`id_roles`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_USER'),(2,'ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `id_sale` int NOT NULL AUTO_INCREMENT,
  `discount_sale` int DEFAULT NULL,
  `discount_start_date_sale` date DEFAULT NULL,
  `discount_end_date_sale` date DEFAULT NULL,
  `status_sale` varchar(45) DEFAULT NULL,
  `products_id_products` int NOT NULL,
  PRIMARY KEY (`id_sale`),
  KEY `fk_sale_products1_idx` (`products_id_products`),
  CONSTRAINT `fk_sale_products1` FOREIGN KEY (`products_id_products`) REFERENCES `products` (`id_products`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_delivery`
--

DROP TABLE IF EXISTS `status_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_delivery` (
  `id_status_delivery` int NOT NULL AUTO_INCREMENT,
  `status_delivery` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_status_delivery`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_delivery`
--

LOCK TABLES `status_delivery` WRITE;
/*!40000 ALTER TABLE `status_delivery` DISABLE KEYS */;
INSERT INTO `status_delivery` VALUES (33,'Оформлен'),(34,'В пути'),(35,'Доставлен');
/*!40000 ALTER TABLE `status_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `id_store` int NOT NULL AUTO_INCREMENT,
  `title_store` varchar(45) DEFAULT NULL,
  `phone_store` varchar(45) DEFAULT NULL,
  `address_store_id_address_store` int NOT NULL,
  PRIMARY KEY (`id_store`),
  KEY `fk_store_address_store1_idx` (`address_store_id_address_store`),
  CONSTRAINT `fk_store_address_store1` FOREIGN KEY (`address_store_id_address_store`) REFERENCES `address_store` (`id_address_store`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategories` (
  `id_subcategories` int NOT NULL AUTO_INCREMENT,
  `title_subcategories` varchar(45) DEFAULT NULL,
  `image_subcategories` varchar(45) DEFAULT NULL,
  `categories_id_categories` int NOT NULL,
  PRIMARY KEY (`id_subcategories`),
  KEY `fk_subcategories_categories1_idx` (`categories_id_categories`),
  CONSTRAINT `fk_subcategories_categories1` FOREIGN KEY (`categories_id_categories`) REFERENCES `categories` (`id_categories`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (1,'Рубашки','shirtSubcatM.jpg',2),(2,'Верхняя одежда','jacketSubcatM.jpg',2),(12,'Носки','socksSubcatM.jpg',2),(13,'Джинсы','jeansSubcatM.jpg',2),(14,'Джемперы и кардиганы','jumpersSubcatM.jpg',2),(15,'Футболки и майки','poloSubcatM.jpg',2),(16,'Худи','hoodySubcatM.jpg',2),(17,'Шорты','shortsSubcatM.jpg',2),(18,'Жилеты','vestSubcatM.jpg',2),(19,'Водолазки','turtleneckSubcatM.jpg',2),(20,'Колготки','tightsSubcat.jpg',1),(21,'Носки','socksSubcatW.jpg',1),(22,'Кроссовки и кеды ',NULL,2),(23,'Джемперы и кардиганы','jumpersSubcatW.jpg',1),(24,'Блузы и рубашки ','shirtSubcatW.jpg',1),(25,'Футболки и майки','poloSubcatW.jpg',1),(26,'Худи','hoodySubcatW.jpg',1),(27,'Джинсы','jeansSubcatW.jpg',1),(28,'Верхняя одежда','jacketSubcatW.jpg',1),(29,'Юбки','skirtSubcatW.jpg',1),(30,'Платья','dressSubcatW.jpg',1);
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_users` int NOT NULL AUTO_INCREMENT,
  `name_users` varchar(45) NOT NULL,
  `surname_users` varchar(45) DEFAULT NULL,
  `email_users` varchar(45) NOT NULL,
  `password_users` varchar(255) NOT NULL,
  `phone_users` varchar(45) DEFAULT NULL,
  `gender_users` varchar(45) DEFAULT NULL,
  `status_users` varchar(45) DEFAULT NULL,
  `date_of_birth_users` date DEFAULT NULL,
  `isActive_users` tinyint DEFAULT NULL,
  `roles_id_roles` int NOT NULL,
  PRIMARY KEY (`id_users`),
  UNIQUE KEY `password_users_UNIQUE` (`password_users`),
  KEY `fk_users_roles1_idx` (`roles_id_roles`),
  CONSTRAINT `fk_users_roles1` FOREIGN KEY (`roles_id_roles`) REFERENCES `roles` (`id_roles`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Vinny','Van','van@mail.ru','123456','1234567','none','ACTIVE','1989-04-11',NULL,1),(2,'Fin','Gradson','fin@mail.ru','123456789','+375291479516','none','ACTIVE','1984-04-04',NULL,1),(3,'x','x','xx@mail.ru','x','+375441247799','none','ACTIVE','1954-10-26',NULL,1),(5,'z','z','z@zzz.ru','z','+375441247799','none','ACTIVE','1264-10-09',NULL,1),(6,'Ivan','Ivanov','ivan@box.com','ivan','+375441247799','none','ACTIVE','2003-10-02',NULL,1),(7,'Sunny','Fun','san@mail.com','sosi','+375441247799','male','ACTIVE','1970-04-23',NULL,1),(8,'Ян','Минсков','yan@box.com','yan123','+375441247799','male','ACTIVE','2001-10-11',NULL,1),(9,'Ян','Минсков','yanm@box.com','yanm123','+375441247799','male','ACTIVE','2001-10-11',NULL,1),(10,'Ян','Минсков','yanma@box.com','yanma123','+375441247799','male','ACTIVE','2001-10-11',NULL,1),(11,'Света','Иванова','sveta@mail.com','sveta123456','+375441247799','female','ACTIVE','1984-06-05',NULL,1),(12,'Linda','Loo','linda@mail.com','+3214789Li','+375441247799','female','ACTIVE','1999-10-03',NULL,1),(13,'Steve','St','steve@mail.com','+123456789St','+375441247799','male','ACTIVE','2020-10-10',NULL,1),(14,'Jane','Jane','jane@mail.com','+7512394Jn','+375441247799','female','ACTIVE','1993-04-03',NULL,1),(15,'April','April','april@gmail.com','++321654Sv','+375441247799','female','ACTIVE','1997-04-07',NULL,1),(16,'Fish','fish','fish@mail.com','214233d402909c76f1eeeb99560cdc38e9fbfe0ef362b5b129ff450f3794b80e6019c63c5024db405261a07416316e4355b10f54e5e4a65cc398f39128e5c334','+375441247799','none','ACTIVE','1999-01-31',1,1),(17,'Sar','sar','sar@mail.com','1000:c7cdd87c1f49740ddd6571fe66989a8b:a16fce28eddf67bfb2a28a38fe029389c8d164be731e1e9698afc1f2b3ad59fd13c73a16d813ac8c6b87c70cf962a867d5242c81351ec50910d409513ed44346','+375441247799','none','ACTIVE','1999-02-01',1,1),(18,'Mr','Beer','beer@gmail.com','$2a$10$zmSZFT3KsKhUfBBil.lpMeimpPHw9ym15lA49McC2AOBdGEnOz37C','+375441247799','none','ACTIVE','2000-01-23',1,1),(19,'Mr','Mb','mb@mail.com','$2a$10$JKamJmXR4xcU61zWbxYoBONM2gvhqmfbSkVheYTQJ6xYcR313hIOK','+375441247799','none','ACTIVE','1999-01-09',1,2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'store_sec'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_product_to_cart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_product_to_cart`(
IN orderId int,
IN productId int,
IN quantityProduct int,
IN productSize varchar(45),
OUT isAddProduct boolean )
proc_label:BEGIN

DECLARE quantity INT;
DECLARE id INT;
DECLARE sum decimal(10,2);
DECLARE price_prod decimal(10,2);

SELECT price_products into price_prod FROM products P INNER JOIN product_sizes Ps ON P.id_products = Ps.products_id_products WHERE P.id_products=productId AND Ps.size_product_sizes = productSize AND Ps.quantity_product_sizes >= quantityProduct;

IF price_prod != 0
THEN 
	SELECT id_order_details into id FROM order_details WHERE order_details.order_id_order=orderId 
	AND order_details.products_id_products=productId 
	AND order_details.product_size_order_details=productSize;
  
  IF id != 0 
    THEN
    
        SET quantity = quantity + quantityProduct;
        SET sum = price_prod * quantityProduct;
      	update order_details ord_det set ord_det.quantity_order_details = ord_det.quantity_order_details + quantityProduct 
		where ord_det.id_order_details = id;
        update orders ord set ord.total_price_orders = ord.total_price_orders + sum where ord.id_orders = orderId;
        SET isAddProduct = true;
        
        ELSE
            SET sum = price_prod * quantityProduct;
           	insert into order_details(quantity_order_details,product_size_order_details,order_id_order,products_id_products) values(quantityProduct, productSize,orderId,productId);
            update orders ord set ord.total_price_orders = ord.total_price_orders + sum where ord.id_orders = orderId;
            SET isAddProduct = true;


      END IF;

   ELSE 
        SET isAddProduct = false;
        leave proc_label;
   END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `checkout` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkout`(
IN orderId int,
IN country varchar(45),
IN city varchar(45),
IN street varchar(45),
IN numberHouse varchar(45),
IN typePayment varchar(45),
IN statusPayment varchar(45),
IN typeDelivery varchar(45),
IN userId int,
OUT isReady boolean,
OUT productIdNoStock int,
OUT productSizeNoStock varchar(45))
BEGIN

    DECLARE exit_loop BOOLEAN DEFAULT FALSE;
    DECLARE i, c  INT;
    DECLARE s varchar(45);
    
    DECLARE addressId INT;
    DECLARE deliveryId INT;
    DECLARE paymentId INT;
    DECLARE quantityProductSize INT;
    DECLARE  statusDeliveryId INT  DEFAULT 33;
    
    DECLARE employee_cursor CURSOR FOR SELECT od.products_id_products, od.quantity_order_details,od.product_size_order_details 
    FROM order_details od where od.order_id_order = orderId;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = TRUE;

    SET isReady = true;
    SET productIdNoStock = 0;
    SET productSizeNoStock = "0";


   START TRANSACTION;
   
   	insert into addresses(country_addresses,city_addresses,street_addresses,numberHouse_addresses,users_id_users) values(country,city,street,numberHouse,userId);

    SET addressId = LAST_INSERT_ID();

    insert into delivery(date_delivery,type_delivery,addresses_id_addresses,status_delivery_id_status_delivery) values(DATE_ADD(now(), interval 4 DAY),typeDelivery,addressId,statusDeliveryId);
   
    SET deliveryId = LAST_INSERT_ID();
   
   	insert into payment(type_payment,status_payment,order_id_order) values(typePayment,statusPayment,orderId);

    SET paymentId = LAST_INSERT_ID();
    
	update orders ord set ord.date_orders = now(), ord.delivery_id_delivery = deliveryId,ord.status_order = 'ORDER'
		where ord.id_orders = orderId AND ord.status_order = 'CART';
		
    SET exit_loop = false;
    OPEN employee_cursor;

	employee_loop: LOOP
     FETCH NEXT FROM employee_cursor INTO i, c,s;
		
     IF exit_loop THEN
         CLOSE employee_cursor;
         LEAVE employee_loop;
     END IF;
     
         SELECT quantity_product_sizes into quantityProductSize FROM product_sizes ps WHERE ps.products_id_products = i 
       AND ps.size_product_sizes = s;
        
        IF quantityProductSize > c 
			THEN
			   update product_sizes ps set ps.quantity_product_sizes = (ps.quantity_product_sizes - c) where ps.products_id_products = i 
			   AND ps.size_product_sizes = s;
       ELSE
			 rollback;
			 SET isReady = false;
             SET productIdNoStock = i;
             SET productSizeNoStock = s;

       END IF;
       
   END LOOP employee_loop;
   
   COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_product_from_cart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_product_from_cart`(
IN productId int,
IN productSize varchar(45),
IN quantity int,
IN orderId int,
OUT isDeletedProduct boolean 
)
BEGIN

DECLARE id INT;
DECLARE sum decimal(10,2);
DECLARE price_prod decimal(10,2);
DECLARE quantity_ord_det INT;

SET isDeletedProduct = false;            

	SELECT id_order_details,quantity_order_details into id,quantity_ord_det FROM order_details WHERE order_details.order_id_order=orderId 
	AND order_details.products_id_products=productId 
	AND order_details.product_size_order_details=productSize AND order_details.quantity_order_details >= quantity ;
    
    IF id !=0 AND quantity_ord_det = quantity
        THEN
			DELETE FROM order_details WHERE order_details.id_order_details = id;
            
            SELECT price_products into price_prod FROM products P INNER JOIN product_sizes Ps ON P.id_products = Ps.products_id_products 
            WHERE P.id_products=productId AND Ps.size_product_sizes = productSize;
        
			SET sum = price_prod * quantity;
            update orders ord set ord.total_price_orders = ord.total_price_orders - sum where ord.id_orders = orderId;
            SET isDeletedProduct = true;            

	   ELSE IF  id !=0 
			THEN

				SELECT price_products into price_prod FROM products P INNER JOIN product_sizes Ps ON P.id_products = Ps.products_id_products 
				WHERE P.id_products=productId AND Ps.size_product_sizes = productSize;
			
				SET sum = price_prod * quantity;
				update order_details ord_det set ord_det.quantity_order_details = ord_det.quantity_order_details - quantity
				where ord_det.id_order_details = id;
				update orders ord set ord.total_price_orders = ord.total_price_orders - sum where ord.id_orders = orderId;

				SET isDeletedProduct = true;
           
        END IF;  
     
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-01 19:52:58
