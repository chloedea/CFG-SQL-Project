CREATE DATABASE  IF NOT EXISTS `dog_hotels` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dog_hotels`;
-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: 127.0.0.1    Database: dog_hotels
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_id` int NOT NULL,
  `hotel_id` int DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `pet_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `start_date` date NOT NULL,
  `duration` int NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `fk_bookings_hotels` (`hotel_id`),
  KEY `fk_bookings_owners` (`owner_id`),
  KEY `fk_bookings_pets` (`pet_id`),
  KEY `fk_bookings_staff` (`staff_id`),
  CONSTRAINT `fk_bookings_hotels` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`hotel_id`),
  CONSTRAINT `fk_bookings_owners` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`owner_id`),
  CONSTRAINT `fk_bookings_pets` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`pet_id`),
  CONSTRAINT `fk_bookings_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,1,2,7,1,'2024-07-02',3),(2,3,7,4,9,'2024-07-05',3),(3,3,7,5,9,'2024-07-05',3),(4,4,8,3,10,'2024-07-08',1),(5,2,6,8,2,'2024-07-09',2),(6,1,1,10,7,'2024-07-12',1),(7,5,9,17,5,'2024-07-13',3),(8,6,4,15,12,'2024-07-22',2),(9,6,4,20,12,'2024-07-22',2),(10,2,5,12,8,'2024-07-27',1),(11,1,1,10,1,'2024-07-15',2),(12,3,7,5,3,'2024-07-20',2),(13,4,8,3,4,'2024-07-25',1),(14,5,10,9,5,'2024-07-30',3),(15,6,12,11,6,'2024-07-18',1),(16,2,8,8,2,'2024-07-21',2),(17,1,2,7,1,'2024-07-23',3),(18,3,15,13,3,'2024-07-26',2),(19,4,4,15,4,'2024-07-28',1),(20,5,9,17,5,'2024-07-29',2),(21,1,14,6,1,'2024-07-17',2),(22,2,3,2,8,'2024-07-25',3),(23,3,15,13,9,'2024-07-28',2),(24,4,13,16,10,'2024-07-30',1),(25,5,4,15,11,'2024-07-31',2),(26,6,1,10,12,'2024-07-25',2),(27,1,8,3,7,'2024-07-26',3),(28,2,14,6,8,'2024-07-22',1),(29,3,12,11,3,'2024-07-29',3),(30,4,7,4,4,'2024-07-19',2);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `hotel_bookings_by_breed`
--

DROP TABLE IF EXISTS `hotel_bookings_by_breed`;
/*!50001 DROP VIEW IF EXISTS `hotel_bookings_by_breed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `hotel_bookings_by_breed` AS SELECT 
 1 AS `hotel_id`,
 1 AS `city`,
 1 AS `breed`,
 1 AS `number_of_bookings`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels` (
  `hotel_id` int NOT NULL,
  `city` varchar(100) NOT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (1,'Manchester',7),(2,'Leeds',7),(3,'London',8),(4,'Edinburgh',5),(5,'Birmingham',6),(6,'Liverpool',5);
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners` (
  `owner_id` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners`
--

LOCK TABLES `owners` WRITE;
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` VALUES (1,'Grace','Clark','07560394857','grace.clark@outlook.com'),(2,'Henry','Lewis','07561938572','henry.lewis@gmail.com'),(3,'Isla','Walker','07562475839','isla.walker@yahoo.co.uk'),(4,'Jack','Hall','07563928475','jack.hall@gmail.com'),(5,'Karen','Allen','07564837495','karen.allen@outlook.com'),(6,'Liam','Young','07565192847','liam.young@gmail.com'),(7,'Mia','King','07566938475','mia.king@yahoo.co.uk'),(8,'Noah','Wright','07567485729','noah.wright@outlook.com'),(9,'Olivia','Scott','07568374859','olivia.scott@gmail.com'),(10,'Paul','Green','07569284758','paul.green@yahoo.co.uk'),(11,'Quinn','Adams','07560193847','quinn.adams@gmail.com'),(12,'Ruby','Baker','07561284759','ruby.baker@outlook.com'),(13,'Naomi','Donahue','07562394857','naomi.donahue@gmail.com'),(14,'Melanie','Arndt','07564572839','melanie.arndt@gmail.com'),(15,'Gavin','Michael','07565649382','gavin.michael@yahoo.co.uk');
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets` (
  `pet_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `breed` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  PRIMARY KEY (`pet_id`),
  KEY `fk_pets_owners` (`owner_id`),
  CONSTRAINT `fk_pets_owners` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES (1,'Max','Labrador',7,11),(2,'Bella','German Shepherd',3,3),(3,'Charlie','Golden Retriever',10,8),(4,'Daisy','French Bulldog',5,7),(5,'Cooper','French Bulldog',5,7),(6,'Luna','Beagle',5,14),(7,'Rocky','Poodle',12,2),(8,'Sadie','Rottweiler',4,6),(9,'Buddy','Labrador',6,10),(10,'Molly','German Shepherd',3,1),(11,'Dunkel','Dachshund',9,12),(12,'Sophie','Corgi',1,5),(13,'Duke','Husky',7,15),(14,'Riley','Great Dane',11,15),(15,'Jack','Golden Retriever',5,4),(16,'Maggie','Shih Tzu',7,13),(17,'Oliver','Miniature Schnauzer',3,9),(18,'Bailey','Beagle',10,3),(19,'Tucker','Shih Tzu',2,13),(20,'Zoey','Labrador',8,4);
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `hotel_id` int DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `fk_staff_hotels` (`hotel_id`),
  CONSTRAINT `fk_staff_hotels` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Oliver','Smith',1),(2,'Emma','Johnson',2),(3,'Noah','Williams',3),(4,'Ava','Brown',4),(5,'Liam','Jones',5),(6,'Sophia','Garcia',6),(7,'Elijah','Martinez',1),(8,'Isabella','Robinson',2),(9,'Mason','Clark',3),(10,'Mia','Lewis',4),(11,'Lucas','Walker',5),(12,'Amelia','Hall',6),(13,'Ethan','White',3),(14,'Bradley','Shark',NULL);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `staff_locations`
--

DROP TABLE IF EXISTS `staff_locations`;
/*!50001 DROP VIEW IF EXISTS `staff_locations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `staff_locations` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `location`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'dog_hotels'
--

--
-- Dumping routines for database 'dog_hotels'
--
/*!50003 DROP FUNCTION IF EXISTS `dog_full_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `dog_full_name`(pet_id INT) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE dog_full_name VARCHAR(200);
    SELECT CONCAT(p.name, ' ', o.last_name) INTO dog_full_name
    FROM pets AS p
    INNER JOIN owners AS o ON p.owner_id = o.owner_id
    WHERE p.pet_id = pet_id;
    RETURN dog_full_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `total_bookings_by_hotel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `total_bookings_by_hotel`()
BEGIN
    SELECT b.hotel_id, h.city, COUNT(b.booking_id) AS booking_count
    FROM Bookings AS b
    INNER JOIN Hotels AS h ON b.hotel_id = h.hotel_id
    GROUP BY b.hotel_id, h.city
    ORDER BY booking_count DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `hotel_bookings_by_breed`
--

/*!50001 DROP VIEW IF EXISTS `hotel_bookings_by_breed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `hotel_bookings_by_breed` AS select `h`.`hotel_id` AS `hotel_id`,`h`.`city` AS `city`,`p`.`breed` AS `breed`,count(`b`.`booking_id`) AS `number_of_bookings` from ((`hotels` `h` join `bookings` `b` on((`h`.`hotel_id` = `b`.`hotel_id`))) join `pets` `p` on((`b`.`pet_id` = `p`.`pet_id`))) group by `h`.`hotel_id`,`h`.`city`,`p`.`breed` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `staff_locations`
--

/*!50001 DROP VIEW IF EXISTS `staff_locations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `staff_locations` AS select `s`.`first_name` AS `first_name`,`s`.`last_name` AS `last_name`,`h`.`city` AS `location` from (`staff` `s` left join `hotels` `h` on((`s`.`hotel_id` = `h`.`hotel_id`))) */;
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

-- Dump completed on 2024-07-21 10:16:05
