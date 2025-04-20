-- MariaDB dump 10.19  Distrib 10.9.8-MariaDB, for Linux (x86_64)
--
-- Host: 10.200.208.126    Database: lperez5484_db_DatabaseProject
-- ------------------------------------------------------
-- Server version	10.4.33-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Conditions`
--

DROP TABLE IF EXISTS `Conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Conditions` (
  `Condition_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Condition_Name` varchar(50) DEFAULT NULL,
  `Condition_Type` varchar(50) DEFAULT NULL,
  `Severity_Level` varchar(50) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Condition_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Conditions`
--

LOCK TABLES `Conditions` WRITE;
/*!40000 ALTER TABLE `Conditions` DISABLE KEYS */;
INSERT INTO `Conditions` VALUES
(1,'Hot','Temperature','Medium','Requires warm climate'),
(2,'Cold','Temperature','High','Requires cold climate'),
(3,'Humidity','Moisture','Low','Requires high humidity');
/*!40000 ALTER TABLE `Conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `Cus_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Cus_FNAME` varchar(50) DEFAULT NULL,
  `Cus_LNAME` varchar(50) DEFAULT NULL,
  `Cus_PHONE` varchar(15) DEFAULT NULL,
  `Cus_ADDRESS` varchar(50) DEFAULT NULL,
  `Cus_AREA_CODE` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cus_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES
(1,'First1','Last1','555-1001','1 Main St',67397),
(2,'First2','Last2','555-1002','2 Main St',62792),
(3,'First3','Last3','555-1003','3 Main St',96600),
(4,'First4','Last4','555-1004','4 Main St',39531),
(5,'First5','Last5','555-1005','5 Main St',42332),
(6,'First6','Last6','555-1006','6 Main St',96404),
(7,'First7','Last7','555-1007','7 Main St',62813),
(8,'First8','Last8','555-1008','8 Main St',25131),
(9,'First9','Last9','555-1009','9 Main St',75945),
(10,'First10','Last10','555-1010','10 Main St',35998),
(11,'First11','Last11','555-1011','11 Main St',74072),
(12,'First12','Last12','555-1012','12 Main St',48899),
(13,'First13','Last13','555-1013','13 Main St',47111),
(14,'First14','Last14','555-1014','14 Main St',52753),
(15,'First15','Last15','555-1015','15 Main St',93128),
(16,'First16','Last16','555-1016','16 Main St',61927),
(17,'First17','Last17','555-1017','17 Main St',93709),
(18,'First18','Last18','555-1018','18 Main St',90191),
(19,'First19','Last19','555-1019','19 Main St',37930),
(20,'First20','Last20','555-1020','20 Main St',25280),
(21,'First21','Last21','555-1021','21 Main St',30537),
(22,'First22','Last22','555-1022','22 Main St',69865),
(23,'First23','Last23','555-1023','23 Main St',19125),
(24,'First24','Last24','555-1024','24 Main St',99972),
(25,'First25','Last25','555-1025','25 Main St',33902),
(26,'First26','Last26','555-1026','26 Main St',59809),
(27,'First27','Last27','555-1027','27 Main St',70649),
(28,'First28','Last28','555-1028','28 Main St',39796),
(29,'First29','Last29','555-1029','29 Main St',76942),
(30,'First30','Last30','555-1030','30 Main St',79749),
(31,'First31','Last31','555-1031','31 Main St',45870),
(32,'First32','Last32','555-1032','32 Main St',58290),
(33,'First33','Last33','555-1033','33 Main St',78670),
(34,'First34','Last34','555-1034','34 Main St',94623),
(35,'First35','Last35','555-1035','35 Main St',87335),
(36,'First36','Last36','555-1036','36 Main St',43882),
(37,'First37','Last37','555-1037','37 Main St',53243),
(38,'First38','Last38','555-1038','38 Main St',99529),
(39,'First39','Last39','555-1039','39 Main St',21613),
(40,'First40','Last40','555-1040','40 Main St',55717),
(41,'First41','Last41','555-1041','41 Main St',59781),
(42,'First42','Last42','555-1042','42 Main St',38868),
(43,'First43','Last43','555-1043','43 Main St',94479),
(44,'First44','Last44','555-1044','44 Main St',80945),
(45,'First45','Last45','555-1045','45 Main St',99161),
(46,'First46','Last46','555-1046','46 Main St',39079),
(47,'First47','Last47','555-1047','47 Main St',73943),
(48,'First48','Last48','555-1048','48 Main St',39094),
(49,'First49','Last49','555-1049','49 Main St',96937),
(50,'First50','Last50','555-1050','50 Main St',95895),
(51,'First51','Last51','555-1051','51 Main St',70669),
(52,'First52','Last52','555-1052','52 Main St',81969),
(53,'First53','Last53','555-1053','53 Main St',25949),
(54,'First54','Last54','555-1054','54 Main St',54049),
(55,'First55','Last55','555-1055','55 Main St',82020),
(56,'First56','Last56','555-1056','56 Main St',27768),
(57,'First57','Last57','555-1057','57 Main St',88158),
(58,'First58','Last58','555-1058','58 Main St',92538),
(59,'First59','Last59','555-1059','59 Main St',29425),
(60,'First60','Last60','555-1060','60 Main St',14765),
(61,'First61','Last61','555-1061','61 Main St',90359),
(62,'First62','Last62','555-1062','62 Main St',10825),
(63,'First63','Last63','555-1063','63 Main St',61546),
(64,'First64','Last64','555-1064','64 Main St',40858),
(65,'First65','Last65','555-1065','65 Main St',99753),
(66,'First66','Last66','555-1066','66 Main St',46086),
(67,'First67','Last67','555-1067','67 Main St',10504),
(68,'First68','Last68','555-1068','68 Main St',45584),
(69,'First69','Last69','555-1069','69 Main St',63988),
(70,'First70','Last70','555-1070','70 Main St',13427),
(71,'First71','Last71','555-1071','71 Main St',92000),
(72,'First72','Last72','555-1072','72 Main St',65555),
(73,'First73','Last73','555-1073','73 Main St',98149),
(74,'First74','Last74','555-1074','74 Main St',26450),
(75,'First75','Last75','555-1075','75 Main St',46876),
(76,'First76','Last76','555-1076','76 Main St',71757),
(77,'First77','Last77','555-1077','77 Main St',94701),
(78,'First78','Last78','555-1078','78 Main St',75392),
(79,'First79','Last79','555-1079','79 Main St',54792),
(80,'First80','Last80','555-1080','80 Main St',72761),
(81,'First81','Last81','555-1081','81 Main St',62179),
(82,'First82','Last82','555-1082','82 Main St',10436),
(83,'First83','Last83','555-1083','83 Main St',94513),
(84,'First84','Last84','555-1084','84 Main St',58744),
(85,'First85','Last85','555-1085','85 Main St',20592),
(86,'First86','Last86','555-1086','86 Main St',52196),
(87,'First87','Last87','555-1087','87 Main St',35235),
(88,'First88','Last88','555-1088','88 Main St',83631),
(89,'First89','Last89','555-1089','89 Main St',20837),
(90,'First90','Last90','555-1090','90 Main St',70936),
(91,'First91','Last91','555-1091','91 Main St',48529),
(92,'First92','Last92','555-1092','92 Main St',17934),
(93,'First93','Last93','555-1093','93 Main St',82281),
(94,'First94','Last94','555-1094','94 Main St',58003),
(95,'First95','Last95','555-1095','95 Main St',45033),
(96,'First96','Last96','555-1096','96 Main St',14452),
(97,'First97','Last97','555-1097','97 Main St',19602),
(98,'First98','Last98','555-1098','98 Main St',92173),
(99,'First99','Last99','555-1099','99 Main St',21845),
(100,'First100','Last100','555-1100','100 Main St',46165);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Incubator`
--

DROP TABLE IF EXISTS `Incubator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Incubator` (
  `INC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Cus_ID` int(11) NOT NULL,
  `INC_START_DATE` date DEFAULT NULL,
  `INC_END_DATE` date DEFAULT NULL,
  `P_CODE` int(11) DEFAULT NULL,
  `INC_CAPACITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`INC_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  KEY `P_CODE` (`P_CODE`),
  CONSTRAINT `Incubator_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `Customer` (`Cus_ID`),
  CONSTRAINT `Incubator_ibfk_2` FOREIGN KEY (`P_CODE`) REFERENCES `Products` (`P_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Incubator`
--

LOCK TABLES `Incubator` WRITE;
/*!40000 ALTER TABLE `Incubator` DISABLE KEYS */;
INSERT INTO `Incubator` VALUES
(1,1,'2025-01-01','2025-01-10',1,50),
(2,2,'2025-01-05','2025-01-15',2,40),
(3,3,'2025-02-01','2025-02-20',3,30);
/*!40000 ALTER TABLE `Incubator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inventory`
--

DROP TABLE IF EXISTS `Inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inventory` (
  `INV_ID` int(11) NOT NULL AUTO_INCREMENT,
  `P_CODE` int(11) DEFAULT NULL,
  `INV_QUANTITY` int(11) DEFAULT NULL,
  `INV_INSTOCK` int(11) DEFAULT NULL,
  PRIMARY KEY (`INV_ID`),
  KEY `P_CODE` (`P_CODE`),
  CONSTRAINT `Inventory_ibfk_1` FOREIGN KEY (`P_CODE`) REFERENCES `Products` (`P_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventory`
--

LOCK TABLES `Inventory` WRITE;
/*!40000 ALTER TABLE `Inventory` DISABLE KEYS */;
INSERT INTO `Inventory` VALUES
(1,1,947,682),
(2,2,616,943),
(3,3,0,996),
(4,4,212,600),
(5,5,839,648),
(6,6,530,290),
(7,7,426,690),
(8,8,687,234),
(9,9,111,390),
(10,10,190,594),
(11,11,756,320),
(12,12,293,679),
(13,13,961,646),
(14,14,631,115),
(15,15,61,681),
(16,16,227,641),
(17,17,592,680),
(18,18,874,359),
(19,19,909,1),
(20,20,9,98),
(21,21,792,580),
(22,22,845,459),
(23,23,627,732),
(24,24,208,171),
(25,25,948,53),
(26,26,694,582),
(27,27,492,660),
(28,28,84,658),
(29,29,300,861),
(30,30,666,817),
(31,31,666,17),
(32,32,548,436),
(33,33,922,325),
(34,34,734,996),
(35,35,754,267),
(36,36,762,915),
(37,37,27,297),
(38,38,871,965),
(39,39,816,353),
(40,40,650,623),
(41,41,661,226),
(42,42,460,743),
(43,43,240,101),
(44,44,115,246),
(45,45,551,510),
(46,46,63,194),
(47,47,737,123),
(48,48,637,269),
(49,49,809,938),
(50,50,287,362),
(51,51,625,233),
(52,52,245,234),
(53,53,107,814),
(54,54,734,332),
(55,55,825,97),
(56,56,11,708),
(57,57,19,840),
(58,58,638,865),
(59,59,175,233),
(60,60,816,647),
(61,61,807,605),
(62,62,776,582),
(63,63,742,37),
(64,64,56,380),
(65,65,584,300),
(66,66,277,266),
(67,67,810,948),
(68,68,55,774),
(69,69,61,611),
(70,70,799,860),
(71,71,400,914),
(72,72,237,689),
(73,73,972,278),
(74,74,888,369),
(75,75,615,413),
(76,76,203,582),
(77,77,657,732),
(78,78,444,290),
(79,79,491,84),
(80,80,481,754),
(81,81,923,280),
(82,82,445,19),
(83,83,757,588),
(84,84,370,850),
(85,85,783,966),
(86,86,722,879),
(87,87,161,67),
(88,88,164,462),
(89,89,595,36),
(90,90,2,195),
(91,91,446,933),
(92,92,368,264),
(93,93,338,72),
(94,94,287,412),
(95,95,769,594),
(96,96,418,675),
(97,97,859,322),
(98,98,356,333),
(99,99,668,951),
(100,100,739,295);
/*!40000 ALTER TABLE `Inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice`
--

DROP TABLE IF EXISTS `Invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoice` (
  `Invo_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Cus_ID` int(11) DEFAULT NULL,
  `INV_DATE` date DEFAULT NULL,
  `INV_Status` varchar(50) DEFAULT NULL,
  `Payment_Method` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Invo_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `Invoice_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `Customer` (`Cus_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice`
--

LOCK TABLES `Invoice` WRITE;
/*!40000 ALTER TABLE `Invoice` DISABLE KEYS */;
INSERT INTO `Invoice` VALUES
(1,14,'2024-10-03','Paid','PayPal'),
(2,84,'2024-01-07','Pending','Credit Card'),
(3,99,'2024-03-07','Paid','Cash'),
(4,58,'2024-08-15','Canceled','Credit Card'),
(5,62,'2024-09-05','Canceled','PayPal'),
(6,19,'2024-12-07','Shipped','Bank Transfer'),
(7,50,'2024-11-05','Pending','PayPal'),
(8,85,'2024-12-19','Pending','Cash'),
(9,49,'2024-04-21','Pending','Cash'),
(10,20,'2025-03-08','Shipped','PayPal'),
(11,64,'2024-11-14','Paid','Cash'),
(12,27,'2025-01-13','Shipped','PayPal'),
(13,66,'2024-10-15','Shipped','Bank Transfer'),
(14,69,'2024-12-09','Pending','Bank Transfer'),
(15,86,'2024-12-29','Shipped','Bank Transfer'),
(16,96,'2024-08-17','Paid','Bank Transfer'),
(17,28,'2024-09-01','Canceled','PayPal'),
(18,93,'2024-12-20','Pending','Bank Transfer'),
(19,12,'2024-06-27','Canceled','Cash'),
(20,3,'2024-11-21','Shipped','Bank Transfer'),
(21,23,'2024-08-02','Paid','PayPal'),
(22,95,'2025-02-28','Paid','Credit Card'),
(23,80,'2024-02-03','Paid','Cash'),
(24,45,'2024-08-03','Shipped','Bank Transfer'),
(25,99,'2024-09-20','Shipped','PayPal'),
(26,82,'2025-03-13','Shipped','PayPal'),
(27,81,'2024-05-03','Paid','Bank Transfer'),
(28,79,'2024-04-29','Shipped','Credit Card'),
(29,13,'2024-01-03','Pending','Credit Card'),
(30,49,'2024-09-20','Canceled','Credit Card'),
(31,62,'2024-10-29','Canceled','Cash'),
(32,31,'2025-01-12','Canceled','PayPal'),
(33,84,'2024-11-22','Canceled','Cash'),
(34,44,'2024-09-21','Pending','Bank Transfer'),
(35,45,'2024-04-03','Canceled','Cash'),
(36,53,'2024-06-01','Shipped','PayPal'),
(37,49,'2024-06-24','Shipped','Bank Transfer'),
(38,11,'2024-09-12','Canceled','Credit Card'),
(39,92,'2024-10-26','Pending','Credit Card'),
(40,17,'2024-05-03','Pending','PayPal'),
(41,10,'2024-08-31','Paid','Credit Card'),
(42,60,'2025-01-01','Canceled','Cash'),
(43,11,'2024-08-03','Canceled','PayPal'),
(44,73,'2024-05-14','Paid','Bank Transfer'),
(45,95,'2024-07-12','Pending','Cash'),
(46,60,'2024-09-01','Paid','PayPal'),
(47,9,'2024-09-10','Pending','PayPal'),
(48,90,'2024-03-01','Paid','PayPal'),
(49,78,'2025-03-22','Paid','Bank Transfer'),
(50,75,'2025-02-28','Paid','PayPal'),
(51,90,'2025-01-04','Canceled','Credit Card'),
(52,80,'2025-01-31','Canceled','Credit Card'),
(53,75,'2025-01-15','Shipped','Cash'),
(54,26,'2024-01-07','Paid','Cash'),
(55,76,'2024-10-09','Paid','PayPal'),
(56,30,'2025-02-17','Shipped','PayPal'),
(57,38,'2024-07-13','Paid','Bank Transfer'),
(58,95,'2024-02-18','Pending','Cash'),
(59,87,'2024-10-22','Shipped','Bank Transfer'),
(60,31,'2024-09-24','Canceled','Cash'),
(61,88,'2024-09-05','Canceled','Bank Transfer'),
(62,68,'2024-05-16','Shipped','Credit Card'),
(63,49,'2025-02-07','Paid','Bank Transfer'),
(64,28,'2024-05-10','Canceled','PayPal'),
(65,8,'2024-11-05','Shipped','Cash'),
(66,44,'2024-12-22','Paid','Bank Transfer'),
(67,40,'2024-08-04','Shipped','Bank Transfer'),
(68,100,'2025-04-14','Canceled','PayPal'),
(69,76,'2025-03-03','Pending','Cash'),
(70,77,'2024-06-22','Shipped','PayPal'),
(71,75,'2024-01-11','Canceled','PayPal'),
(72,49,'2025-02-16','Pending','Bank Transfer'),
(73,14,'2024-11-18','Paid','PayPal'),
(74,82,'2024-09-28','Pending','PayPal'),
(75,45,'2024-08-24','Pending','Cash'),
(76,4,'2024-09-24','Canceled','Cash'),
(77,16,'2024-01-01','Pending','Bank Transfer'),
(78,70,'2025-03-27','Shipped','PayPal'),
(79,54,'2024-01-09','Pending','Credit Card'),
(80,25,'2024-01-10','Paid','Bank Transfer'),
(81,77,'2024-11-10','Paid','Cash'),
(82,98,'2024-01-26','Canceled','Bank Transfer'),
(83,51,'2024-04-25','Paid','Bank Transfer'),
(84,77,'2025-02-06','Canceled','Cash'),
(85,9,'2024-07-28','Paid','Bank Transfer'),
(86,94,'2024-06-17','Shipped','Credit Card'),
(87,64,'2024-09-28','Canceled','PayPal'),
(88,40,'2024-06-18','Paid','Credit Card'),
(89,63,'2024-05-02','Canceled','Bank Transfer'),
(90,98,'2024-11-03','Paid','Bank Transfer'),
(91,44,'2024-01-16','Canceled','Bank Transfer'),
(92,8,'2024-09-06','Canceled','Credit Card'),
(93,53,'2024-10-06','Paid','Bank Transfer'),
(94,24,'2024-02-29','Pending','Credit Card'),
(95,8,'2024-10-13','Shipped','Cash'),
(96,78,'2024-08-06','Pending','Credit Card'),
(97,82,'2024-07-24','Paid','Cash'),
(98,36,'2025-02-19','Pending','PayPal'),
(99,83,'2024-06-24','Pending','PayPal'),
(100,64,'2025-01-04','Shipped','PayPal');
/*!40000 ALTER TABLE `Invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice_History`
--

DROP TABLE IF EXISTS `Invoice_History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoice_History` (
  `InvHist_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Invo_ID` int(11) NOT NULL,
  `Cus_ID` int(11) NOT NULL,
  `INV_Status` varchar(50) DEFAULT NULL,
  `INV_OldStatus` varchar(50) DEFAULT NULL,
  `LastChanged` date DEFAULT NULL,
  PRIMARY KEY (`InvHist_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  KEY `Invo_ID` (`Invo_ID`),
  CONSTRAINT `Invoice_History_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `Customer` (`Cus_ID`),
  CONSTRAINT `Invoice_History_ibfk_2` FOREIGN KEY (`Invo_ID`) REFERENCES `Invoice` (`Invo_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice_History`
--

LOCK TABLES `Invoice_History` WRITE;
/*!40000 ALTER TABLE `Invoice_History` DISABLE KEYS */;
INSERT INTO `Invoice_History` VALUES
(1,1,1,'Pending','Paid','2025-01-05'),
(2,2,2,'Pending','Canceled','2025-01-10'),
(3,3,3,'Pending','Paid','2025-02-02'),
(4,4,4,'Pending','Shipped','2025-02-15'),
(5,5,5,'Shipped','Delivered','2025-03-01');
/*!40000 ALTER TABLE `Invoice_History` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice_Line`
--

DROP TABLE IF EXISTS `Invoice_Line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoice_Line` (
  `Line_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Invo_ID` int(11) NOT NULL,
  `P_CODE` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Unit_Price` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`Line_ID`),
  KEY `Invo_ID` (`Invo_ID`),
  KEY `P_CODE` (`P_CODE`),
  CONSTRAINT `Invoice_Line_ibfk_1` FOREIGN KEY (`Invo_ID`) REFERENCES `Invoice` (`Invo_ID`),
  CONSTRAINT `Invoice_Line_ibfk_2` FOREIGN KEY (`P_CODE`) REFERENCES `Products` (`P_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice_Line`
--

LOCK TABLES `Invoice_Line` WRITE;
/*!40000 ALTER TABLE `Invoice_Line` DISABLE KEYS */;
INSERT INTO `Invoice_Line` VALUES
(1,1,1,2,19.99),
(2,1,5,1,49.50),
(3,2,3,4,5.00),
(4,3,2,1,12.75),
(5,3,4,2,7.25),
(6,4,6,3,15.00),
(7,5,1,1,19.99),
(8,6,7,5,25.00),
(9,7,8,2,30.00),
(10,8,9,1,100.00);
/*!40000 ALTER TABLE `Invoice_Line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `Invoice_Total`
--

DROP TABLE IF EXISTS `Invoice_Total`;
/*!50001 DROP VIEW IF EXISTS `Invoice_Total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Invoice_Total` AS SELECT
 1 AS `Invo_ID`,
  1 AS `Cus_ID`,
  1 AS `INV_DATE`,
  1 AS `Total` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Materials`
--

DROP TABLE IF EXISTS `Materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Materials` (
  `P_CODE` int(11) NOT NULL,
  `Mat_Weight` varchar(50) DEFAULT NULL,
  `Mat_Size` varchar(50) DEFAULT NULL,
  `Mat_Type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`P_CODE`),
  CONSTRAINT `Materials_ibfk_1` FOREIGN KEY (`P_CODE`) REFERENCES `Products` (`P_CODE`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Materials`
--

LOCK TABLES `Materials` WRITE;
/*!40000 ALTER TABLE `Materials` DISABLE KEYS */;
INSERT INTO `Materials` VALUES
(6,'2kg','30x20cm','Metal'),
(7,'0.5kg','10x10cm','Plastic');
/*!40000 ALTER TABLE `Materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plant_Region_Availability`
--

DROP TABLE IF EXISTS `Plant_Region_Availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Plant_Region_Availability` (
  `Availability_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Plant_ID` int(11) NOT NULL,
  `Region_ID` int(11) NOT NULL,
  `Is_Allowed` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Availability_ID`),
  KEY `Plant_ID` (`Plant_ID`),
  KEY `Region_ID` (`Region_ID`),
  CONSTRAINT `Plant_Region_Availability_ibfk_1` FOREIGN KEY (`Plant_ID`) REFERENCES `Plants` (`Plant_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Plant_Region_Availability_ibfk_2` FOREIGN KEY (`Region_ID`) REFERENCES `Region` (`Region_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plant_Region_Availability`
--

LOCK TABLES `Plant_Region_Availability` WRITE;
/*!40000 ALTER TABLE `Plant_Region_Availability` DISABLE KEYS */;
INSERT INTO `Plant_Region_Availability` VALUES
(1,101,1,'Y'),
(2,102,2,'N');
/*!40000 ALTER TABLE `Plant_Region_Availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plant_Region_Restriction`
--

DROP TABLE IF EXISTS `Plant_Region_Restriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Plant_Region_Restriction` (
  `Restriction_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Plant_ID` int(11) NOT NULL,
  `Region_ID` int(11) NOT NULL,
  `Condition_ID` int(11) NOT NULL,
  `Is_Active` varchar(50) DEFAULT NULL,
  `Notes` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Restriction_ID`),
  KEY `Plant_ID` (`Plant_ID`),
  KEY `Region_ID` (`Region_ID`),
  KEY `Condition_ID` (`Condition_ID`),
  CONSTRAINT `Plant_Region_Restriction_ibfk_1` FOREIGN KEY (`Plant_ID`) REFERENCES `Plants` (`Plant_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Plant_Region_Restriction_ibfk_2` FOREIGN KEY (`Region_ID`) REFERENCES `Region` (`Region_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Plant_Region_Restriction_ibfk_3` FOREIGN KEY (`Condition_ID`) REFERENCES `Conditions` (`Condition_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plant_Region_Restriction`
--

LOCK TABLES `Plant_Region_Restriction` WRITE;
/*!40000 ALTER TABLE `Plant_Region_Restriction` DISABLE KEYS */;
INSERT INTO `Plant_Region_Restriction` VALUES
(1,101,1,1,'Y','Summer only'),
(2,102,2,2,'Y','Winter shipping only');
/*!40000 ALTER TABLE `Plant_Region_Restriction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plants`
--

DROP TABLE IF EXISTS `Plants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Plants` (
  `P_CODE` int(11) NOT NULL,
  `Plant_ID` int(11) NOT NULL,
  `Plant_Species` varchar(50) DEFAULT NULL,
  `Plant_Description` varchar(200) DEFAULT NULL,
  `Plant_Size` varchar(50) DEFAULT NULL,
  `Plant_Region` varchar(50) DEFAULT NULL,
  `Plant_Water_Req` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`P_CODE`),
  UNIQUE KEY `Plant_ID` (`Plant_ID`),
  CONSTRAINT `Plants_ibfk_1` FOREIGN KEY (`P_CODE`) REFERENCES `Products` (`P_CODE`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plants`
--

LOCK TABLES `Plants` WRITE;
/*!40000 ALTER TABLE `Plants` DISABLE KEYS */;
INSERT INTO `Plants` VALUES
(1,101,'Ficus','Indoor ficus tree','Medium','Tropical','Moderate'),
(2,102,'Aloe','Succulent aloe vera','Small','Desert','Low'),
(3,103,'Oak','Oak seedling','Large','Temperate','High');
/*!40000 ALTER TABLE `Plants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Products` (
  `P_CODE` int(11) NOT NULL AUTO_INCREMENT,
  `P_DESCRIPTION` varchar(200) DEFAULT NULL,
  `V_ID` int(11) NOT NULL,
  `P_TYPE` varchar(50) DEFAULT NULL,
  `P_DISCOUNT` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`P_CODE`),
  KEY `V_ID` (`V_ID`),
  CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`V_ID`) REFERENCES `Vendor` (`V_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES
(1,'Product description 1',44,'TypeA',22.50),
(2,'Product description 2',11,'TypeC',1.61),
(3,'Product description 3',25,'TypeA',10.08),
(4,'Product description 4',90,'TypeC',27.62),
(5,'Product description 5',97,'TypeA',42.34),
(6,'Product description 6',17,'TypeB',48.33),
(7,'Product description 7',31,'TypeA',12.70),
(8,'Product description 8',47,'TypeB',27.73),
(9,'Product description 9',90,'TypeB',9.83),
(10,'Product description 10',6,'TypeC',48.45),
(11,'Product description 11',6,'TypeC',0.58),
(12,'Product description 12',93,'TypeA',11.27),
(13,'Product description 13',6,'TypeA',12.73),
(14,'Product description 14',78,'TypeC',1.81),
(15,'Product description 15',64,'TypeB',34.18),
(16,'Product description 16',10,'TypeC',14.80),
(17,'Product description 17',96,'TypeC',2.18),
(18,'Product description 18',85,'TypeC',44.90),
(19,'Product description 19',70,'TypeA',21.83),
(20,'Product description 20',54,'TypeC',5.72),
(21,'Product description 21',61,'TypeC',36.33),
(22,'Product description 22',54,'TypeB',5.72),
(23,'Product description 23',77,'TypeA',12.84),
(24,'Product description 24',4,'TypeC',43.78),
(25,'Product description 25',75,'TypeB',49.53),
(26,'Product description 26',75,'TypeC',35.67),
(27,'Product description 27',82,'TypeB',37.43),
(28,'Product description 28',88,'TypeC',36.35),
(29,'Product description 29',75,'TypeA',36.98),
(30,'Product description 30',21,'TypeB',31.97),
(31,'Product description 31',58,'TypeA',6.06),
(32,'Product description 32',43,'TypeB',44.00),
(33,'Product description 33',89,'TypeA',32.99),
(34,'Product description 34',91,'TypeA',25.46),
(35,'Product description 35',70,'TypeC',39.62),
(36,'Product description 36',6,'TypeC',14.75),
(37,'Product description 37',95,'TypeB',1.06),
(38,'Product description 38',60,'TypeA',49.25),
(39,'Product description 39',17,'TypeC',41.91),
(40,'Product description 40',22,'TypeC',16.92),
(41,'Product description 41',55,'TypeA',6.18),
(42,'Product description 42',86,'TypeA',24.17),
(43,'Product description 43',51,'TypeB',11.03),
(44,'Product description 44',39,'TypeB',7.11),
(45,'Product description 45',77,'TypeA',39.60),
(46,'Product description 46',12,'TypeC',12.14),
(47,'Product description 47',54,'TypeA',44.07),
(48,'Product description 48',51,'TypeC',38.15),
(49,'Product description 49',9,'TypeB',36.48),
(50,'Product description 50',42,'TypeB',22.01),
(51,'Product description 51',79,'TypeB',16.33),
(52,'Product description 52',21,'TypeA',46.22),
(53,'Product description 53',61,'TypeC',47.27),
(54,'Product description 54',31,'TypeC',11.37),
(55,'Product description 55',74,'TypeC',35.67),
(56,'Product description 56',76,'TypeB',36.66),
(57,'Product description 57',15,'TypeA',27.96),
(58,'Product description 58',58,'TypeA',46.00),
(59,'Product description 59',29,'TypeB',28.86),
(60,'Product description 60',44,'TypeB',39.10),
(61,'Product description 61',74,'TypeC',11.95),
(62,'Product description 62',3,'TypeC',28.15),
(63,'Product description 63',17,'TypeC',32.35),
(64,'Product description 64',15,'TypeA',4.87),
(65,'Product description 65',36,'TypeB',11.01),
(66,'Product description 66',71,'TypeB',26.47),
(67,'Product description 67',81,'TypeA',31.26),
(68,'Product description 68',65,'TypeC',27.33),
(69,'Product description 69',71,'TypeB',44.45),
(70,'Product description 70',97,'TypeA',4.58),
(71,'Product description 71',93,'TypeA',41.47),
(72,'Product description 72',52,'TypeC',6.52),
(73,'Product description 73',43,'TypeA',49.85),
(74,'Product description 74',35,'TypeB',17.63),
(75,'Product description 75',9,'TypeB',37.89),
(76,'Product description 76',26,'TypeB',23.52),
(77,'Product description 77',13,'TypeB',31.43),
(78,'Product description 78',98,'TypeA',44.48),
(79,'Product description 79',94,'TypeC',13.75),
(80,'Product description 80',35,'TypeC',49.41),
(81,'Product description 81',45,'TypeC',45.34),
(82,'Product description 82',47,'TypeC',45.38),
(83,'Product description 83',33,'TypeB',6.25),
(84,'Product description 84',29,'TypeA',0.20),
(85,'Product description 85',44,'TypeC',45.11),
(86,'Product description 86',84,'TypeC',41.45),
(87,'Product description 87',98,'TypeC',40.51),
(88,'Product description 88',100,'TypeC',27.69),
(89,'Product description 89',79,'TypeC',46.59),
(90,'Product description 90',6,'TypeB',8.43),
(91,'Product description 91',98,'TypeA',34.98),
(92,'Product description 92',61,'TypeC',27.64),
(93,'Product description 93',28,'TypeC',17.22),
(94,'Product description 94',28,'TypeB',17.54),
(95,'Product description 95',63,'TypeB',2.92),
(96,'Product description 96',4,'TypeA',20.05),
(97,'Product description 97',26,'TypeA',36.42),
(98,'Product description 98',62,'TypeC',17.04),
(99,'Product description 99',18,'TypeB',16.21),
(100,'Product description 100',39,'TypeC',39.63);
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Region`
--

DROP TABLE IF EXISTS `Region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Region` (
  `Region_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Region_Name` varchar(50) DEFAULT NULL,
  `Region_Type` varchar(50) DEFAULT NULL,
  `Region_Restrictions` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Region_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Region`
--

LOCK TABLES `Region` WRITE;
/*!40000 ALTER TABLE `Region` DISABLE KEYS */;
INSERT INTO `Region` VALUES
(1,'North America','Continent','None'),
(2,'Europe','Continent','Pesticide restrictions');
/*!40000 ALTER TABLE `Region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subscription`
--

DROP TABLE IF EXISTS `Subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Subscription` (
  `P_CODE` int(11) NOT NULL,
  `Sub_Type` varchar(50) DEFAULT NULL,
  `Sub_Period` varchar(50) DEFAULT NULL,
  `Sub_Cost` decimal(8,2) DEFAULT NULL,
  `Sub_Location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`P_CODE`),
  CONSTRAINT `Subscription_ibfk_1` FOREIGN KEY (`P_CODE`) REFERENCES `Products` (`P_CODE`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subscription`
--

LOCK TABLES `Subscription` WRITE;
/*!40000 ALTER TABLE `Subscription` DISABLE KEYS */;
INSERT INTO `Subscription` VALUES
(4,'Monthly','1 month',9.99,'Online'),
(5,'Annual','12 months',99.99,'In-Store');
/*!40000 ALTER TABLE `Subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vendor`
--

DROP TABLE IF EXISTS `Vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vendor` (
  `V_ID` int(11) NOT NULL AUTO_INCREMENT,
  `V_NAME` varchar(50) DEFAULT NULL,
  `V_CONTACT` varchar(50) DEFAULT NULL,
  `V_PHONE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`V_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vendor`
--

LOCK TABLES `Vendor` WRITE;
/*!40000 ALTER TABLE `Vendor` DISABLE KEYS */;
INSERT INTO `Vendor` VALUES
(1,'Vendor1','Contact1','555-2001'),
(2,'Vendor2','Contact2','555-2002'),
(3,'Vendor3','Contact3','555-2003'),
(4,'Vendor4','Contact4','555-2004'),
(5,'Vendor5','Contact5','555-2005'),
(6,'Vendor6','Contact6','555-2006'),
(7,'Vendor7','Contact7','555-2007'),
(8,'Vendor8','Contact8','555-2008'),
(9,'Vendor9','Contact9','555-2009'),
(10,'Vendor10','Contact10','555-2010'),
(11,'Vendor11','Contact11','555-2011'),
(12,'Vendor12','Contact12','555-2012'),
(13,'Vendor13','Contact13','555-2013'),
(14,'Vendor14','Contact14','555-2014'),
(15,'Vendor15','Contact15','555-2015'),
(16,'Vendor16','Contact16','555-2016'),
(17,'Vendor17','Contact17','555-2017'),
(18,'Vendor18','Contact18','555-2018'),
(19,'Vendor19','Contact19','555-2019'),
(20,'Vendor20','Contact20','555-2020'),
(21,'Vendor21','Contact21','555-2021'),
(22,'Vendor22','Contact22','555-2022'),
(23,'Vendor23','Contact23','555-2023'),
(24,'Vendor24','Contact24','555-2024'),
(25,'Vendor25','Contact25','555-2025'),
(26,'Vendor26','Contact26','555-2026'),
(27,'Vendor27','Contact27','555-2027'),
(28,'Vendor28','Contact28','555-2028'),
(29,'Vendor29','Contact29','555-2029'),
(30,'Vendor30','Contact30','555-2030'),
(31,'Vendor31','Contact31','555-2031'),
(32,'Vendor32','Contact32','555-2032'),
(33,'Vendor33','Contact33','555-2033'),
(34,'Vendor34','Contact34','555-2034'),
(35,'Vendor35','Contact35','555-2035'),
(36,'Vendor36','Contact36','555-2036'),
(37,'Vendor37','Contact37','555-2037'),
(38,'Vendor38','Contact38','555-2038'),
(39,'Vendor39','Contact39','555-2039'),
(40,'Vendor40','Contact40','555-2040'),
(41,'Vendor41','Contact41','555-2041'),
(42,'Vendor42','Contact42','555-2042'),
(43,'Vendor43','Contact43','555-2043'),
(44,'Vendor44','Contact44','555-2044'),
(45,'Vendor45','Contact45','555-2045'),
(46,'Vendor46','Contact46','555-2046'),
(47,'Vendor47','Contact47','555-2047'),
(48,'Vendor48','Contact48','555-2048'),
(49,'Vendor49','Contact49','555-2049'),
(50,'Vendor50','Contact50','555-2050'),
(51,'Vendor51','Contact51','555-2051'),
(52,'Vendor52','Contact52','555-2052'),
(53,'Vendor53','Contact53','555-2053'),
(54,'Vendor54','Contact54','555-2054'),
(55,'Vendor55','Contact55','555-2055'),
(56,'Vendor56','Contact56','555-2056'),
(57,'Vendor57','Contact57','555-2057'),
(58,'Vendor58','Contact58','555-2058'),
(59,'Vendor59','Contact59','555-2059'),
(60,'Vendor60','Contact60','555-2060'),
(61,'Vendor61','Contact61','555-2061'),
(62,'Vendor62','Contact62','555-2062'),
(63,'Vendor63','Contact63','555-2063'),
(64,'Vendor64','Contact64','555-2064'),
(65,'Vendor65','Contact65','555-2065'),
(66,'Vendor66','Contact66','555-2066'),
(67,'Vendor67','Contact67','555-2067'),
(68,'Vendor68','Contact68','555-2068'),
(69,'Vendor69','Contact69','555-2069'),
(70,'Vendor70','Contact70','555-2070'),
(71,'Vendor71','Contact71','555-2071'),
(72,'Vendor72','Contact72','555-2072'),
(73,'Vendor73','Contact73','555-2073'),
(74,'Vendor74','Contact74','555-2074'),
(75,'Vendor75','Contact75','555-2075'),
(76,'Vendor76','Contact76','555-2076'),
(77,'Vendor77','Contact77','555-2077'),
(78,'Vendor78','Contact78','555-2078'),
(79,'Vendor79','Contact79','555-2079'),
(80,'Vendor80','Contact80','555-2080'),
(81,'Vendor81','Contact81','555-2081'),
(82,'Vendor82','Contact82','555-2082'),
(83,'Vendor83','Contact83','555-2083'),
(84,'Vendor84','Contact84','555-2084'),
(85,'Vendor85','Contact85','555-2085'),
(86,'Vendor86','Contact86','555-2086'),
(87,'Vendor87','Contact87','555-2087'),
(88,'Vendor88','Contact88','555-2088'),
(89,'Vendor89','Contact89','555-2089'),
(90,'Vendor90','Contact90','555-2090'),
(91,'Vendor91','Contact91','555-2091'),
(92,'Vendor92','Contact92','555-2092'),
(93,'Vendor93','Contact93','555-2093'),
(94,'Vendor94','Contact94','555-2094'),
(95,'Vendor95','Contact95','555-2095'),
(96,'Vendor96','Contact96','555-2096'),
(97,'Vendor97','Contact97','555-2097'),
(98,'Vendor98','Contact98','555-2098'),
(99,'Vendor99','Contact99','555-2099'),
(100,'Vendor100','Contact100','555-2100');
/*!40000 ALTER TABLE `Vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `Invoice_Total`
--

/*!50001 DROP VIEW IF EXISTS `Invoice_Total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`lperez5484`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Invoice_Total` AS select `Invoice`.`Invo_ID` AS `Invo_ID`,`Invoice`.`Cus_ID` AS `Cus_ID`,`Invoice`.`INV_DATE` AS `INV_DATE`,sum(`Invoice_Line`.`Quantity` * `Invoice_Line`.`Unit_Price`) AS `Total` from (`Invoice` join `Invoice_Line` on(`Invoice`.`Invo_ID` = `Invoice_Line`.`Invo_ID`)) group by `Invoice`.`Invo_ID`,`Invoice`.`Cus_ID`,`Invoice`.`INV_DATE` */;
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

-- Dump completed on 2025-04-19 22:54:39
