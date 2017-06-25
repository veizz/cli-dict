-- MySQL dump 10.13  Distrib 5.6.21, for osx10.8 (x86_64)
--
-- Host: localhost    Database: db_dict
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Current Database: `db_dict`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_dict` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `db_dict`;

--
-- Table structure for table `tbl_words`
--

DROP TABLE IF EXISTS `tbl_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(45) NOT NULL,
  `means` varchar(1000) DEFAULT NULL,
  `exchange` varchar(256) DEFAULT NULL,
  `pronounce_uk` varchar(128) DEFAULT NULL,
  `pronounce_us` varchar(128) DEFAULT NULL,
  `uk_mp3` varchar(1024) DEFAULT NULL,
  `us_mp3` varchar(1024) DEFAULT NULL,
  `tts_mp3` varchar(1024) DEFAULT NULL,
  `cnt` int(11) DEFAULT NULL,
  `example` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_words`
--

LOCK TABLES `tbl_words` WRITE;
/*!40000 ALTER TABLE `tbl_words` DISABLE KEYS */;
INSERT INTO `tbl_words` VALUES (1,'word','[{\"part\":\"n.\",\"means\":[\"单词\",\"话语\",\"诺言\",\"消息\"]},{\"part\":\"vt.\",\"means\":[\"措辞，用词\",\"用言语表达\"]},{\"part\":\"vi.\",\"means\":[\"讲话\"]}]','{\"word_pl\":[\"words\"],\"word_past\":[\"worded\"],\"word_done\":[\"worded\"],\"word_ing\":[\"wording\"],\"word_third\":[\"words\"],\"word_er\":\"\",\"word_est\":\"\"}','wɜ:d','wɜrd','http://res.iciba.com/resource/amp3/0/0/c4/7d/c47d187067c6cf953245f128b5fde62a.mp3','http://res.iciba.com/resource/amp3/1/0/c4/7d/c47d187067c6cf953245f128b5fde62a.mp3','http://res-tts.iciba.com/c/4/7/c47d187067c6cf953245f128b5fde62a.mp3',3,NULL,'2017-06-25 15:22:55'),(2,'hello','[{\"part\":\"int.\",\"means\":[\"哈喽，喂\",\"你好，您好\",\"表示问候\",\"打招呼\"]},{\"part\":\"n.\",\"means\":[\"“喂”的招呼声或问候声\"]},{\"part\":\"vi.\",\"means\":[\"喊“喂”\"]}]','{\"word_pl\":[\"hellos\"],\"word_past\":\"\",\"word_done\":\"\",\"word_ing\":\"\",\"word_third\":\"\",\"word_er\":\"\",\"word_est\":\"\"}','hə\'ləʊ','həˈloʊ','','http://res.iciba.com/resource/amp3/1/0/5d/41/5d41402abc4b2a76b9719d911017c592.mp3','http://res-tts.iciba.com/5/d/4/5d41402abc4b2a76b9719d911017c592.mp3',12,'','2017-06-25 17:00:17'),(3,'undefined','[{\"part\":\"adj.\",\"means\":[\"未阐明的\",\"未限定的\"]}]','{\"word_pl\":\"\",\"word_past\":\"\",\"word_done\":\"\",\"word_ing\":\"\",\"word_third\":\"\",\"word_er\":\"\",\"word_est\":\"\"}','ˌʌndɪˈfaɪnd','ˌʌndɪˈfaɪnd','http://res.iciba.com/resource/amp3/oxford/0/31/a9/31a9b68727bd9a65bd4f364053204cf7.mp3','','http://res-tts.iciba.com/5/e/5/5e543256c480ac577d30f76f9120eb74.mp3',1,'','2017-06-25 17:44:41'),(5,'web','[{\"part\":\"n.\",\"means\":[\"蜘蛛网，网状物\",\"[机]万维网\",\"织物\",\"圈套\"]},{\"part\":\"vt.\",\"means\":[\"在…上织网\",\"用网缠住\",\"使中圈套\",\"形成网状\"]}]','{\"word_pl\":[\"webs\"],\"word_third\":[\"webs\"],\"word_past\":[\"webbed\"],\"word_done\":[\"webbed\"],\"word_ing\":[\"webbing\"],\"word_er\":\"\",\"word_est\":\"\"}','web','wɛb','http://res.iciba.com/resource/amp3/oxford/0/31/44/3144bd439aa47f49c6fcc17bc983658e.mp3','http://res.iciba.com/resource/amp3/1/0/25/67/2567a5ec9705eb7ac2c984033e06189d.mp3','http://res-tts.iciba.com/2/5/6/2567a5ec9705eb7ac2c984033e06189d.mp3',1,'','2017-06-25 17:59:23');
/*!40000 ALTER TABLE `tbl_words` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-25 18:10:56
