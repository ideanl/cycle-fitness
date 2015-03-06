-- MySQL dump 10.15  Distrib 10.0.15-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: cyclefitness
-- ------------------------------------------------------
-- Server version	10.0.15-MariaDB-log

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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  `answer` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (16,'Where can I buy bikes?','You can buy bikes online or by coming into the shop at 123 Avenue of the America, New York, NY 20013.','2015-02-26 03:08:08','2015-02-28 02:17:49'),(21,'What are your other services?','As well as bikes we sell gear for them, such as helmets, lights, racks, bags, you name it! We also have a bike repair shop so if you have any issues make sure to just stop by. Additionally we organize weekly rides during the Spring, Summer, and Fall on Saturdays at 10:00 AM, and have guest speakers come to give talks about fitness and biking.','2015-02-28 02:04:57','2015-03-01 04:45:50'),(23,'Can I learn to maintain my bike?','Our staff all knows a good deal about bikes and are always happy to help! Just come in and they can teach how to keep your bike in perfect condition over the years.','2015-02-28 02:06:08','2015-02-28 02:23:27'),(24,'Why do I need a helmet?','Helmets makes riding your bike much safer by protecting your head so if you do get in an accident you won’t suffer head injury, shown statistically to reduce head injury risk by 85%.','2015-02-28 02:06:32','2015-02-28 02:06:32'),(25,'Do I need lights for my bike?','Bike lights aren’t required for casual daytime riding, but if you ride your bike when it gets darker out they become a necessity. It\'s best to have one light in front to see where you’re going and don’t get injured by terrain ahead and one light in the back so cars can see you and can do their job to keep you both safe.','2015-02-28 02:07:27','2015-02-28 02:24:58'),(27,'Why not a department store?','True, department stores can sell you bikes for cheaper, but this is because the bikes are worse quality. They’re made out of cheap parts which will inevitably twist and break, coming in for repairs 10-1 compared to bikes we sell at our own shop, and the costs of this will add up quickly to outweigh their lower price.','2015-02-28 02:14:19','2015-02-28 02:25:31'),(28,'How do you ship?','We use premium UPS shipping to ensure our bikes and gear safely reach their destinations, and we can ship anywhere within New York.  Costs depend on distance you are from us. 2-day shipping is also an available option.','2015-02-28 02:17:03','2015-03-01 04:33:13'),(29,'What\'s your return policy?','We’ll take back any defective or unused products within one month of retail for a full refund.','2015-02-28 02:17:24','2015-03-02 19:06:57'),(30,'How do I choose a bike?','Come into the shop anytime, our staff is all very knowledgeable about our inventory. Just tell them what you’re looking for and they can point you to the best bike for you.','2015-03-01 04:51:10','2015-03-01 04:51:47');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(191) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20141116054708'),('20141116070118'),('20141206041005'),('20150207074604'),('20150216043910');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'idean1.labib@gmail.com','$2a$10$ayNyfLMVQIBUFWdEi5nv1OqMoYWZfJqy7ZXO47YMK8KKuNhPBYvUG',NULL,NULL,NULL,25,'2015-03-02 19:06:21','2015-03-01 04:50:30','168.212.239.66','198.23.103.90','2014-11-16 07:20:13','2015-03-02 19:06:21','root'),(3,'moocow@mailinator.com','$2a$10$OxQ2WhjmGYLqrGxfizifR.BGCzCxhzVQ1XCfdW4tAuSPSiZslsNGe',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-02-19 19:12:04','2015-02-19 19:12:04','moo'),(4,'nshabdar@gmail.com','$2a$10$s5nztQkOzbRj.OxF/OROKuph5FeOwQZb0Er9fLqnNHOfpaopDdWTS',NULL,NULL,'2015-02-28 02:18:23',6,'2015-02-28 02:18:23','2015-02-28 02:01:23','73.53.94.81','73.53.94.81','2015-02-26 03:00:46','2015-02-28 02:18:23','nshabdar');
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

-- Dump completed on 2015-03-05 19:19:19
