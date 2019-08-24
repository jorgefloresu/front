CREATE DATABASE  IF NOT EXISTS `plusint2_fron677` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `plusint2_fron677`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: dasal.net    Database: jwwwadas_fron677
-- ------------------------------------------------------
-- Server version	5.5.36-34.0

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
-- Table structure for table `fl_areas`
--

DROP TABLE IF EXISTS `fl_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_areas` (
  `area_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`area_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_areas`
--

LOCK TABLES `fl_areas` WRITE;
/*!40000 ALTER TABLE `fl_areas` DISABLE KEYS */;
INSERT INTO `fl_areas` VALUES (1,'Global',0);
/*!40000 ALTER TABLE `fl_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_attachments`
--

DROP TABLE IF EXISTS `fl_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_attachments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(60) NOT NULL DEFAULT '',
  `type_no` int(11) NOT NULL DEFAULT '0',
  `trans_no` int(11) NOT NULL DEFAULT '0',
  `unique_name` varchar(60) NOT NULL DEFAULT '',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `filename` varchar(60) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `filetype` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type_no` (`type_no`,`trans_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_attachments`
--

LOCK TABLES `fl_attachments` WRITE;
/*!40000 ALTER TABLE `fl_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_audit_trail`
--

DROP TABLE IF EXISTS `fl_audit_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) unsigned NOT NULL DEFAULT '0',
  `trans_no` int(11) unsigned NOT NULL DEFAULT '0',
  `user` smallint(6) unsigned NOT NULL DEFAULT '0',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(60) DEFAULT NULL,
  `fiscal_year` int(11) NOT NULL,
  `gl_date` date NOT NULL DEFAULT '0000-00-00',
  `gl_seq` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Seq` (`fiscal_year`,`gl_date`,`gl_seq`),
  KEY `Type_and_Number` (`type`,`trans_no`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_audit_trail`
--

LOCK TABLES `fl_audit_trail` WRITE;
/*!40000 ALTER TABLE `fl_audit_trail` DISABLE KEYS */;
INSERT INTO `fl_audit_trail` VALUES (1,18,1,1,'2014-06-04 04:27:50','',7,'2014-06-03',0),(2,25,1,1,'2014-06-04 04:27:50','',7,'2014-06-03',0),(3,20,1,1,'2014-06-04 04:27:50','',7,'2014-06-03',0),(4,30,1,1,'2014-06-04 04:30:11','',7,'2014-06-03',0),(5,13,1,1,'2014-06-04 04:30:12','',7,'2014-06-03',0),(6,10,1,1,'2014-06-04 04:30:12','',7,'2014-06-03',0),(7,12,1,1,'2014-06-04 04:30:12','',7,'2014-06-03',0),(8,18,2,1,'2014-06-05 04:54:46','',7,'2014-06-04',0),(9,25,2,1,'2014-06-05 04:54:46','',7,'2014-06-04',0),(10,20,2,1,'2014-06-05 04:54:46','',7,'2014-06-04',0),(11,30,2,1,'2014-06-05 04:57:52','',7,'2014-06-04',0),(12,13,2,1,'2014-06-05 04:57:52','',7,'2014-06-04',0),(13,10,2,1,'2014-06-05 04:57:52','',7,'2014-06-04',0),(14,12,2,1,'2014-06-05 04:57:52','',7,'2014-06-04',0),(15,18,3,1,'2014-07-02 17:22:22','',7,'2014-07-02',0),(16,25,3,1,'2014-07-02 17:22:23','',7,'2014-07-02',0),(17,20,3,1,'2014-07-02 17:22:23','',7,'2014-07-02',0),(18,32,1,1,'2014-07-02 17:42:21','',7,'2014-07-02',NULL),(19,32,1,1,'2014-07-02 17:42:21','Updated.',7,'2014-07-02',0),(20,30,3,1,'2014-07-10 22:49:17','',7,'2014-07-02',NULL),(21,13,3,1,'2014-07-03 17:37:54','',7,'2014-07-03',0),(22,10,3,1,'2014-07-10 16:52:25','',7,'2014-07-03',NULL),(23,32,2,1,'2014-07-04 02:54:52','',7,'2014-07-03',NULL),(24,32,2,1,'2014-07-04 02:54:52','Actualizado.',7,'2014-07-03',0),(25,10,3,1,'2014-07-10 16:52:25','Actualizado.',7,'2014-07-03',0),(26,30,3,1,'2014-07-11 01:00:33','Actualizado.',7,'2014-07-02',NULL),(27,30,3,1,'2014-07-11 01:00:33','Actualizado.',7,'2014-07-02',0),(28,32,3,1,'2014-07-11 01:03:09','',7,'2014-07-10',0),(29,22,1,1,'2014-08-14 22:26:01','',7,'2014-08-14',0),(30,22,2,1,'2014-08-15 00:02:09','',7,'2014-08-14',0);
/*!40000 ALTER TABLE `fl_audit_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_bank_accounts`
--

DROP TABLE IF EXISTS `fl_bank_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_bank_accounts` (
  `account_code` varchar(15) NOT NULL DEFAULT '',
  `account_type` smallint(6) NOT NULL DEFAULT '0',
  `bank_account_name` varchar(60) NOT NULL DEFAULT '',
  `bank_account_number` varchar(100) NOT NULL DEFAULT '',
  `bank_name` varchar(60) NOT NULL DEFAULT '',
  `bank_address` tinytext,
  `bank_curr_code` char(3) NOT NULL DEFAULT '',
  `dflt_curr_act` tinyint(1) NOT NULL DEFAULT '0',
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `last_reconciled_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ending_reconcile_balance` double NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bank_account_name` (`bank_account_name`),
  KEY `bank_account_number` (`bank_account_number`),
  KEY `account_code` (`account_code`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_bank_accounts`
--

LOCK TABLES `fl_bank_accounts` WRITE;
/*!40000 ALTER TABLE `fl_bank_accounts` DISABLE KEYS */;
INSERT INTO `fl_bank_accounts` VALUES ('1060',0,'Current account','N/A','N/A','','USD',1,1,'0000-00-00 00:00:00',0,0),('1065',3,'Petty Cash account','N/A','N/A','','USD',0,2,'0000-00-00 00:00:00',0,0);
/*!40000 ALTER TABLE `fl_bank_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_bank_trans`
--

DROP TABLE IF EXISTS `fl_bank_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_bank_trans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) DEFAULT NULL,
  `trans_no` int(11) DEFAULT NULL,
  `bank_act` varchar(15) NOT NULL DEFAULT '',
  `ref` varchar(40) DEFAULT NULL,
  `trans_date` date NOT NULL DEFAULT '0000-00-00',
  `amount` double DEFAULT NULL,
  `dimension_id` int(11) NOT NULL DEFAULT '0',
  `dimension2_id` int(11) NOT NULL DEFAULT '0',
  `person_type_id` int(11) NOT NULL DEFAULT '0',
  `person_id` tinyblob,
  `reconciled` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_act` (`bank_act`,`ref`),
  KEY `type` (`type`,`trans_no`),
  KEY `bank_act_2` (`bank_act`,`reconciled`),
  KEY `bank_act_3` (`bank_act`,`trans_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_bank_trans`
--

LOCK TABLES `fl_bank_trans` WRITE;
/*!40000 ALTER TABLE `fl_bank_trans` DISABLE KEYS */;
INSERT INTO `fl_bank_trans` VALUES (1,12,1,'2','1','2014-06-03',210.91,0,0,2,'1',NULL),(2,12,2,'2','2','2014-06-04',175.76,0,0,2,'1',NULL),(3,22,1,'1','1','2014-08-14',-59.4,0,0,3,'2',NULL),(4,22,2,'1','2','2014-08-14',-60000,0,0,3,'1',NULL);
/*!40000 ALTER TABLE `fl_bank_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_bom`
--

DROP TABLE IF EXISTS `fl_bom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_bom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` char(20) NOT NULL DEFAULT '',
  `component` char(20) NOT NULL DEFAULT '',
  `workcentre_added` int(11) NOT NULL DEFAULT '0',
  `loc_code` char(5) NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT '1',
  PRIMARY KEY (`parent`,`component`,`workcentre_added`,`loc_code`),
  KEY `component` (`component`),
  KEY `id` (`id`),
  KEY `loc_code` (`loc_code`),
  KEY `parent` (`parent`,`loc_code`),
  KEY `workcentre_added` (`workcentre_added`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_bom`
--

LOCK TABLES `fl_bom` WRITE;
/*!40000 ALTER TABLE `fl_bom` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_bom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_budget_trans`
--

DROP TABLE IF EXISTS `fl_budget_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_budget_trans` (
  `counter` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `type_no` bigint(16) NOT NULL DEFAULT '1',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `account` varchar(15) NOT NULL DEFAULT '',
  `memo_` tinytext NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `dimension_id` int(11) DEFAULT '0',
  `dimension2_id` int(11) DEFAULT '0',
  `person_type_id` int(11) DEFAULT NULL,
  `person_id` tinyblob,
  PRIMARY KEY (`counter`),
  KEY `Type_and_Number` (`type`,`type_no`),
  KEY `Account` (`account`,`tran_date`,`dimension_id`,`dimension2_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_budget_trans`
--

LOCK TABLES `fl_budget_trans` WRITE;
/*!40000 ALTER TABLE `fl_budget_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_budget_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_chart_class`
--

DROP TABLE IF EXISTS `fl_chart_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_chart_class` (
  `cid` varchar(3) NOT NULL,
  `class_name` varchar(60) NOT NULL DEFAULT '',
  `ctype` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_chart_class`
--

LOCK TABLES `fl_chart_class` WRITE;
/*!40000 ALTER TABLE `fl_chart_class` DISABLE KEYS */;
INSERT INTO `fl_chart_class` VALUES ('1','Assets',1,0),('2','Liabilities',2,0),('3','Income',4,0),('4','Costs',6,0);
/*!40000 ALTER TABLE `fl_chart_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_chart_master`
--

DROP TABLE IF EXISTS `fl_chart_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_chart_master` (
  `account_code` varchar(15) NOT NULL DEFAULT '',
  `account_code2` varchar(15) NOT NULL DEFAULT '',
  `account_name` varchar(60) NOT NULL DEFAULT '',
  `account_type` varchar(10) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_code`),
  KEY `account_name` (`account_name`),
  KEY `accounts_by_type` (`account_type`,`account_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_chart_master`
--

LOCK TABLES `fl_chart_master` WRITE;
/*!40000 ALTER TABLE `fl_chart_master` DISABLE KEYS */;
INSERT INTO `fl_chart_master` VALUES ('1060','','Checking Account','1',0),('1065','','Petty Cash','1',0),('1200','','Accounts Receivables','1',0),('1205','','Allowance for doubtful accounts','1',0),('1510','','Inventory','2',0),('1520','','Stocks of Raw Materials','2',0),('1530','','Stocks of Work In Progress','2',0),('1540','','Stocks of Finsihed Goods','2',0),('1550','','Goods Received Clearing account','2',0),('1820','','Office Furniture &amp; Equipment','3',0),('1825','','Accum. Amort. -Furn. &amp; Equip.','3',0),('1840','','Vehicle','3',0),('1845','','Accum. Amort. -Vehicle','3',0),('2100','','Accounts Payable','4',0),('2110','','Accrued Income Tax - Federal','4',0),('2120','','Accrued Income Tax - State','4',0),('2130','','Accrued Franchise Tax','4',0),('2140','','Accrued Real &amp; Personal Prop Tax','4',0),('2150','','Sales Tax','4',0),('2160','','Accrued Use Tax Payable','4',0),('2210','','Accrued Wages','4',0),('2220','','Accrued Comp Time','4',0),('2230','','Accrued Holiday Pay','4',0),('2240','','Accrued Vacation Pay','4',0),('2310','','Accr. Benefits - 401K','4',0),('2320','','Accr. Benefits - Stock Purchase','4',0),('2330','','Accr. Benefits - Med, Den','4',0),('2340','','Accr. Benefits - Payroll Taxes','4',0),('2350','','Accr. Benefits - Credit Union','4',0),('2360','','Accr. Benefits - Savings Bond','4',0),('2370','','Accr. Benefits - Garnish','4',0),('2380','','Accr. Benefits - Charity Cont.','4',0),('2620','','Bank Loans','5',0),('2680','','Loans from Shareholders','5',0),('3350','','Common Shares','6',0),('3590','','Retained Earnings - prior years','7',0),('4010','','Sales','8',0),('4430','','Shipping &amp; Handling','9',0),('4440','','Interest','9',0),('4450','','Foreign Exchange Gain','9',0),('4500','','Prompt Payment Discounts','9',0),('4510','','Discounts Given','9',0),('5010','','Cost of Goods Sold - Retail','10',0),('5020','','Material Usage Varaiance','10',0),('5030','','Consumable Materials','10',0),('5040','','Purchase price Variance','10',0),('5050','','Purchases of materials','10',0),('5060','','Discounts Received','10',0),('5100','','Freight','10',0),('5410','','Wages &amp; Salaries','11',0),('5420','','Wages - Overtime','11',0),('5430','','Benefits - Comp Time','11',0),('5440','','Benefits - Payroll Taxes','11',0),('5450','','Benefits - Workers Comp','11',0),('5460','','Benefits - Pension','11',0),('5470','','Benefits - General Benefits','11',0),('5510','','Inc Tax Exp - Federal','11',0),('5520','','Inc Tax Exp - State','11',0),('5530','','Taxes - Real Estate','11',0),('5540','','Taxes - Personal Property','11',0),('5550','','Taxes - Franchise','11',0),('5560','','Taxes - Foreign Withholding','11',0),('5610','','Accounting &amp; Legal','12',0),('5615','','Advertising &amp; Promotions','12',0),('5620','','Bad Debts','12',0),('5660','','Amortization Expense','12',0),('5685','','Insurance','12',0),('5690','','Interest &amp; Bank Charges','12',0),('5700','','Office Supplies','12',0),('5760','','Rent','12',0),('5765','','Repair &amp; Maintenance','12',0),('5780','','Telephone','12',0),('5785','','Travel &amp; Entertainment','12',0),('5790','','Utilities','12',0),('5795','','Registrations','12',0),('5800','','Licenses','12',0),('5810','','Foreign Exchange Loss','12',0),('9990','','Year Profit/Loss','12',0);
/*!40000 ALTER TABLE `fl_chart_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_chart_types`
--

DROP TABLE IF EXISTS `fl_chart_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_chart_types` (
  `id` varchar(10) NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '',
  `class_id` varchar(3) NOT NULL DEFAULT '',
  `parent` varchar(10) NOT NULL DEFAULT '-1',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `class_id` (`class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_chart_types`
--

LOCK TABLES `fl_chart_types` WRITE;
/*!40000 ALTER TABLE `fl_chart_types` DISABLE KEYS */;
INSERT INTO `fl_chart_types` VALUES ('1','Current Assets','1','',0),('2','Inventory Assets','1','',0),('3','Capital Assets','1','',0),('4','Current Liabilities','2','',0),('5','Long Term Liabilities','2','',0),('6','Share Capital','2','',0),('7','Retained Earnings','2','',0),('8','Sales Revenue','3','',0),('9','Other Revenue','3','',0),('10','Cost of Goods Sold','4','',0),('11','Payroll Expenses','4','',0),('12','General &amp; Administrative expenses','4','',0);
/*!40000 ALTER TABLE `fl_chart_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_comments`
--

DROP TABLE IF EXISTS `fl_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_comments` (
  `type` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `date_` date DEFAULT '0000-00-00',
  `memo_` tinytext,
  KEY `type_and_id` (`type`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_comments`
--

LOCK TABLES `fl_comments` WRITE;
/*!40000 ALTER TABLE `fl_comments` DISABLE KEYS */;
INSERT INTO `fl_comments` VALUES (12,1,'2014-06-03','Cash invoice 1'),(12,2,'2014-06-04','Cash invoice 2'),(13,3,'2014-07-03','Sales Quotation # 1'),(10,3,'2014-07-03','producto: Institucional');
/*!40000 ALTER TABLE `fl_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_credit_status`
--

DROP TABLE IF EXISTS `fl_credit_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_credit_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason_description` char(100) NOT NULL DEFAULT '',
  `dissallow_invoices` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reason_description` (`reason_description`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_credit_status`
--

LOCK TABLES `fl_credit_status` WRITE;
/*!40000 ALTER TABLE `fl_credit_status` DISABLE KEYS */;
INSERT INTO `fl_credit_status` VALUES (1,'Good History',0,0),(3,'No more work until payment received',1,0),(4,'In liquidation',1,0);
/*!40000 ALTER TABLE `fl_credit_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_crm_categories`
--

DROP TABLE IF EXISTS `fl_crm_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_crm_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pure technical key',
  `type` varchar(20) NOT NULL COMMENT 'contact type e.g. customer',
  `action` varchar(20) NOT NULL COMMENT 'detailed usage e.g. department',
  `name` varchar(30) NOT NULL COMMENT 'for category selector',
  `description` tinytext NOT NULL COMMENT 'usage description',
  `system` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'nonzero for core system usage',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`action`),
  UNIQUE KEY `type_2` (`type`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_crm_categories`
--

LOCK TABLES `fl_crm_categories` WRITE;
/*!40000 ALTER TABLE `fl_crm_categories` DISABLE KEYS */;
INSERT INTO `fl_crm_categories` VALUES (1,'cust_branch','general','General','General contact data for customer branch (overrides company setting)',1,0),(2,'cust_branch','invoice','Invoices','Invoice posting (overrides company setting)',1,0),(3,'cust_branch','order','Orders','Order confirmation (overrides company setting)',1,0),(4,'cust_branch','delivery','Deliveries','Delivery coordination (overrides company setting)',1,0),(5,'customer','general','General','General contact data for customer',1,0),(6,'customer','order','Orders','Order confirmation',1,0),(7,'customer','delivery','Deliveries','Delivery coordination',1,0),(8,'customer','invoice','Invoices','Invoice posting',1,0),(9,'supplier','general','General','General contact data for supplier',1,0),(10,'supplier','order','Orders','Order confirmation',1,0),(11,'supplier','delivery','Deliveries','Delivery coordination',1,0),(12,'supplier','invoice','Invoices','Invoice posting',1,0);
/*!40000 ALTER TABLE `fl_crm_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_crm_contacts`
--

DROP TABLE IF EXISTS `fl_crm_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_crm_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL DEFAULT '0' COMMENT 'foreign key to crm_contacts',
  `type` varchar(20) NOT NULL COMMENT 'foreign key to crm_categories',
  `action` varchar(20) NOT NULL COMMENT 'foreign key to crm_categories',
  `entity_id` varchar(11) DEFAULT NULL COMMENT 'entity id in related class table',
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`action`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_crm_contacts`
--

LOCK TABLES `fl_crm_contacts` WRITE;
/*!40000 ALTER TABLE `fl_crm_contacts` DISABLE KEYS */;
INSERT INTO `fl_crm_contacts` VALUES (1,1,'cust_branch','general','1'),(2,1,'customer','general','1'),(3,2,'supplier','general','1'),(4,3,'supplier','general','2'),(5,4,'supplier','general','3'),(8,5,'customer','general','2'),(10,5,'cust_branch','general','2');
/*!40000 ALTER TABLE `fl_crm_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_crm_persons`
--

DROP TABLE IF EXISTS `fl_crm_persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_crm_persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `name` varchar(60) NOT NULL,
  `name2` varchar(60) DEFAULT NULL,
  `address` tinytext,
  `phone` varchar(30) DEFAULT NULL,
  `phone2` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `lang` char(5) DEFAULT NULL,
  `notes` tinytext NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ref` (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_crm_persons`
--

LOCK TABLES `fl_crm_persons` WRITE;
/*!40000 ALTER TABLE `fl_crm_persons` DISABLE KEYS */;
INSERT INTO `fl_crm_persons` VALUES (1,'Sancho BBDO','Sancho BBDO','','','','','','','','',0),(2,'Westend61','','','','','','','','','',0),(3,'40260.com','','','','','','','','','',0),(4,'Fancy','','','','','','','','','',0),(5,'TORO LOVE SAS','Bibiana','Pinzon','Calle 120 No. 67','3173331','','','bibiana.pinzon@torolove.com','','',0);
/*!40000 ALTER TABLE `fl_crm_persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_currencies`
--

DROP TABLE IF EXISTS `fl_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_currencies` (
  `currency` varchar(60) NOT NULL DEFAULT '',
  `curr_abrev` char(3) NOT NULL DEFAULT '',
  `curr_symbol` varchar(10) NOT NULL DEFAULT '',
  `country` varchar(100) NOT NULL DEFAULT '',
  `hundreds_name` varchar(15) NOT NULL DEFAULT '',
  `auto_update` tinyint(1) NOT NULL DEFAULT '1',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`curr_abrev`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_currencies`
--

LOCK TABLES `fl_currencies` WRITE;
/*!40000 ALTER TABLE `fl_currencies` DISABLE KEYS */;
INSERT INTO `fl_currencies` VALUES ('US Dollars','USD','$','United States','Cents',1,0),('CA Dollars','CAD','$','Canada','Cents',1,0),('Euro','EUR','?','Europe','Cents',1,0),('Pounds','GBP','?','England','Pence',1,0),('Pesos','COP','$','Colombia','Centavos',1,0);
/*!40000 ALTER TABLE `fl_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_cust_allocations`
--

DROP TABLE IF EXISTS `fl_cust_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_cust_allocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amt` double unsigned DEFAULT NULL,
  `date_alloc` date NOT NULL DEFAULT '0000-00-00',
  `trans_no_from` int(11) DEFAULT NULL,
  `trans_type_from` int(11) DEFAULT NULL,
  `trans_no_to` int(11) DEFAULT NULL,
  `trans_type_to` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `From` (`trans_type_from`,`trans_no_from`),
  KEY `To` (`trans_type_to`,`trans_no_to`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_cust_allocations`
--

LOCK TABLES `fl_cust_allocations` WRITE;
/*!40000 ALTER TABLE `fl_cust_allocations` DISABLE KEYS */;
INSERT INTO `fl_cust_allocations` VALUES (1,417600,'2014-06-04',1,12,1,10),(2,348000,'2014-06-05',2,12,2,10);
/*!40000 ALTER TABLE `fl_cust_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_cust_branch`
--

DROP TABLE IF EXISTS `fl_cust_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_cust_branch` (
  `branch_code` int(11) NOT NULL AUTO_INCREMENT,
  `debtor_no` int(11) NOT NULL DEFAULT '0',
  `br_name` varchar(60) NOT NULL DEFAULT '',
  `branch_ref` varchar(30) NOT NULL DEFAULT '',
  `br_address` tinytext NOT NULL,
  `area` int(11) DEFAULT NULL,
  `salesman` int(11) NOT NULL DEFAULT '0',
  `contact_name` varchar(60) NOT NULL DEFAULT '',
  `default_location` varchar(5) NOT NULL DEFAULT '',
  `tax_group_id` int(11) DEFAULT NULL,
  `sales_account` varchar(15) NOT NULL DEFAULT '',
  `sales_discount_account` varchar(15) NOT NULL DEFAULT '',
  `receivables_account` varchar(15) NOT NULL DEFAULT '',
  `payment_discount_account` varchar(15) NOT NULL DEFAULT '',
  `default_ship_via` int(11) NOT NULL DEFAULT '1',
  `disable_trans` tinyint(4) NOT NULL DEFAULT '0',
  `br_post_address` tinytext NOT NULL,
  `group_no` int(11) NOT NULL DEFAULT '0',
  `notes` tinytext NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`branch_code`,`debtor_no`),
  KEY `branch_code` (`branch_code`),
  KEY `branch_ref` (`branch_ref`),
  KEY `group_no` (`group_no`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_cust_branch`
--

LOCK TABLES `fl_cust_branch` WRITE;
/*!40000 ALTER TABLE `fl_cust_branch` DISABLE KEYS */;
INSERT INTO `fl_cust_branch` VALUES (1,1,'Sancho BBDO','Sancho BBDO','',1,1,'','DEF',1,'','4510','1200','4500',1,0,'',0,'',0),(2,2,'COLPATRIA','COLPATRIA','',1,1,'','DEF',1,'','4510','1200','4500',1,0,'Calle 100 No. 40',0,'',0);
/*!40000 ALTER TABLE `fl_cust_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_debtor_trans`
--

DROP TABLE IF EXISTS `fl_debtor_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_debtor_trans` (
  `trans_no` int(11) unsigned NOT NULL DEFAULT '0',
  `type` smallint(6) unsigned NOT NULL DEFAULT '0',
  `version` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `debtor_no` int(11) unsigned DEFAULT NULL,
  `branch_code` int(11) NOT NULL DEFAULT '-1',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `due_date` date NOT NULL DEFAULT '0000-00-00',
  `reference` varchar(60) NOT NULL DEFAULT '',
  `tpe` int(11) NOT NULL DEFAULT '0',
  `order_` int(11) NOT NULL DEFAULT '0',
  `ov_amount` double NOT NULL DEFAULT '0',
  `ov_gst` double NOT NULL DEFAULT '0',
  `ov_freight` double NOT NULL DEFAULT '0',
  `ov_freight_tax` double NOT NULL DEFAULT '0',
  `ov_discount` double NOT NULL DEFAULT '0',
  `alloc` double NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '1',
  `ship_via` int(11) DEFAULT NULL,
  `dimension_id` int(11) NOT NULL DEFAULT '0',
  `dimension2_id` int(11) NOT NULL DEFAULT '0',
  `payment_terms` int(11) DEFAULT NULL,
  PRIMARY KEY (`type`,`trans_no`),
  KEY `debtor_no` (`debtor_no`,`branch_code`),
  KEY `tran_date` (`tran_date`),
  KEY `order_` (`order_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_debtor_trans`
--

LOCK TABLES `fl_debtor_trans` WRITE;
/*!40000 ALTER TABLE `fl_debtor_trans` DISABLE KEYS */;
INSERT INTO `fl_debtor_trans` VALUES (1,10,0,1,1,'2014-06-03','2014-06-03','1',4,1,360000,57600,0,0,0,417600,1,1,0,0,4),(2,10,0,1,1,'2014-06-04','2014-06-04','2',5,2,300000,48000,0,0,0,348000,1,1,0,0,4),(3,10,0,2,2,'2014-07-03','2014-09-01','3',7,3,690000,110400,0,0,0,0,1,1,0,0,1),(1,12,0,1,1,'2014-06-03','0000-00-00','1',0,0,417600,0,0,0,0,417600,1,0,0,0,NULL),(2,12,0,1,1,'2014-06-04','0000-00-00','2',0,0,348000,0,0,0,0,348000,1,0,0,0,NULL),(1,13,1,1,1,'2014-06-03','2014-06-03','auto',4,1,360000,57600,0,0,0,0,1,1,0,0,4),(2,13,1,1,1,'2014-06-04','2014-06-04','auto',5,2,300000,48000,0,0,0,0,1,1,0,0,4),(3,13,2,2,2,'2014-07-03','2014-07-09','1',7,3,690000,110400,0,0,0,0,1,1,0,0,1);
/*!40000 ALTER TABLE `fl_debtor_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_debtor_trans_details`
--

DROP TABLE IF EXISTS `fl_debtor_trans_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_debtor_trans_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `debtor_trans_no` int(11) DEFAULT NULL,
  `debtor_trans_type` int(11) DEFAULT NULL,
  `stock_id` varchar(20) NOT NULL DEFAULT '',
  `description` tinytext,
  `unit_price` double NOT NULL DEFAULT '0',
  `unit_tax` double NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `discount_percent` double NOT NULL DEFAULT '0',
  `standard_cost` double NOT NULL DEFAULT '0',
  `qty_done` double NOT NULL DEFAULT '0',
  `src_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Transaction` (`debtor_trans_type`,`debtor_trans_no`),
  KEY `src_id` (`src_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_debtor_trans_details`
--

LOCK TABLES `fl_debtor_trans_details` WRITE;
/*!40000 ALTER TABLE `fl_debtor_trans_details` DISABLE KEYS */;
INSERT INTO `fl_debtor_trans_details` VALUES (1,1,13,'rm-ap-3c','OSP-000665',360000,57600,1,0,100000,1,1),(2,1,10,'rm-ap-3c','OSP-000665',360000,57600,1,0,100000,0,1),(3,2,13,'rf-40260-baja','12345',300000,48000,1,0,196020,1,2),(4,2,10,'rf-40260-baja','12345',300000,48000,1,0,196020,0,3),(5,3,13,'FNC-42-46885527','FNC-42-46885527',690000,110400,1,0,504.9,1,4),(6,3,10,'FNC-42-46885527','FNC-42-46885527: royalty free, baja, 50MB, 300dpi',690000,110400,1,0,504.9,0,5);
/*!40000 ALTER TABLE `fl_debtor_trans_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_debtors_master`
--

DROP TABLE IF EXISTS `fl_debtors_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_debtors_master` (
  `debtor_no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `debtor_ref` varchar(30) NOT NULL,
  `address` tinytext,
  `tax_id` varchar(55) NOT NULL DEFAULT '',
  `curr_code` char(3) NOT NULL DEFAULT '',
  `sales_type` int(11) NOT NULL DEFAULT '1',
  `dimension_id` int(11) NOT NULL DEFAULT '0',
  `dimension2_id` int(11) NOT NULL DEFAULT '0',
  `credit_status` int(11) NOT NULL DEFAULT '0',
  `payment_terms` int(11) DEFAULT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `pymt_discount` double NOT NULL DEFAULT '0',
  `credit_limit` float NOT NULL DEFAULT '1000',
  `notes` tinytext NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`debtor_no`),
  UNIQUE KEY `debtor_ref` (`debtor_ref`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_debtors_master`
--

LOCK TABLES `fl_debtors_master` WRITE;
/*!40000 ALTER TABLE `fl_debtors_master` DISABLE KEYS */;
INSERT INTO `fl_debtors_master` VALUES (1,'Sancho BBDO','Sancho BBDO','','','COP',1,0,0,1,4,0,0,1000,'',0),(2,'TORO LOVE SAS','TORO LOVE SAS','Calle 100 No. 50\nTel. 3173331','123abc','COP',1,0,0,1,1,0,0,1000,'',0);
/*!40000 ALTER TABLE `fl_debtors_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_dimensions`
--

DROP TABLE IF EXISTS `fl_dimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_dimensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `type_` tinyint(1) NOT NULL DEFAULT '1',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  `due_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference` (`reference`),
  KEY `date_` (`date_`),
  KEY `due_date` (`due_date`),
  KEY `type_` (`type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_dimensions`
--

LOCK TABLES `fl_dimensions` WRITE;
/*!40000 ALTER TABLE `fl_dimensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_dimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_exchange_rates`
--

DROP TABLE IF EXISTS `fl_exchange_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_exchange_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curr_code` char(3) NOT NULL DEFAULT '',
  `rate_buy` double NOT NULL DEFAULT '0',
  `rate_sell` double NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `curr_code` (`curr_code`,`date_`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_exchange_rates`
--

LOCK TABLES `fl_exchange_rates` WRITE;
/*!40000 ALTER TABLE `fl_exchange_rates` DISABLE KEYS */;
INSERT INTO `fl_exchange_rates` VALUES (1,'COP',1970,1970,'2014-06-03'),(2,'USD',1980,1980,'2014-06-03'),(3,'USD',1980,1980,'2014-06-04');
/*!40000 ALTER TABLE `fl_exchange_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_fiscal_year`
--

DROP TABLE IF EXISTS `fl_fiscal_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_fiscal_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `begin` date DEFAULT '0000-00-00',
  `end` date DEFAULT '0000-00-00',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `begin` (`begin`),
  UNIQUE KEY `end` (`end`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_fiscal_year`
--

LOCK TABLES `fl_fiscal_year` WRITE;
/*!40000 ALTER TABLE `fl_fiscal_year` DISABLE KEYS */;
INSERT INTO `fl_fiscal_year` VALUES (1,'2008-01-01','2008-12-31',0),(2,'2009-01-01','2009-12-31',0),(3,'2010-01-01','2010-12-31',0),(4,'2011-01-01','2011-12-31',0),(5,'2012-01-01','2012-12-31',0),(6,'2013-01-01','2013-12-31',0),(7,'2014-01-01','2014-12-31',0);
/*!40000 ALTER TABLE `fl_fiscal_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_gl_trans`
--

DROP TABLE IF EXISTS `fl_gl_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_gl_trans` (
  `counter` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `type_no` bigint(16) NOT NULL DEFAULT '1',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `account` varchar(15) NOT NULL DEFAULT '',
  `memo_` tinytext NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `dimension_id` int(11) NOT NULL DEFAULT '0',
  `dimension2_id` int(11) NOT NULL DEFAULT '0',
  `person_type_id` int(11) DEFAULT NULL,
  `person_id` tinyblob,
  PRIMARY KEY (`counter`),
  KEY `Type_and_Number` (`type`,`type_no`),
  KEY `dimension_id` (`dimension_id`),
  KEY `dimension2_id` (`dimension2_id`),
  KEY `tran_date` (`tran_date`),
  KEY `account_and_tran_date` (`account`,`tran_date`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_gl_trans`
--

LOCK TABLES `fl_gl_trans` WRITE;
/*!40000 ALTER TABLE `fl_gl_trans` DISABLE KEYS */;
INSERT INTO `fl_gl_trans` VALUES (1,25,1,'2014-06-03','1510','rm-ap-3c',100000,0,0,3,'1'),(2,25,1,'2014-06-03','1550','',-100000,0,0,3,''),(3,20,1,'2014-06-03','2100','',-100000,0,0,3,'1'),(4,20,1,'2014-06-03','1550','',100000,0,0,3,'1'),(5,13,1,'2014-06-03','5010','',100000,0,0,2,'1'),(6,13,1,'2014-06-03','1510','',-100000,0,0,2,'1'),(7,10,1,'2014-06-03','4010','',-360000,0,0,2,'1'),(8,10,1,'2014-06-03','1200','',417600,0,0,2,'1'),(9,10,1,'2014-06-03','2150','',-57600,0,0,2,'1'),(10,12,1,'2014-06-03','1065','',417600,0,0,2,'1'),(11,12,1,'2014-06-03','1200','',-417600,0,0,2,'1'),(12,25,2,'2014-06-04','1510','rf-40260-baja',196020,0,0,3,'2'),(13,25,2,'2014-06-04','1550','',-196020,0,0,3,''),(14,20,2,'2014-06-04','2100','',-196020,0,0,3,'2'),(15,20,2,'2014-06-04','1550','',196020,0,0,3,'2'),(16,13,2,'2014-06-04','5010','',196020,0,0,2,'1'),(17,13,2,'2014-06-04','1510','',-196020,0,0,2,'1'),(18,10,2,'2014-06-04','4010','',-300000,0,0,2,'1'),(19,10,2,'2014-06-04','1200','',348000,0,0,2,'1'),(20,10,2,'2014-06-04','2150','',-48000,0,0,2,'1'),(21,12,2,'2014-06-04','1065','',348000,0,0,2,'1'),(22,12,2,'2014-06-04','1200','',-348000,0,0,2,'1'),(23,25,3,'2014-07-02','1510','FNC-42-46885527',504.9,0,0,3,'3'),(24,25,3,'2014-07-02','1550','',-504.9,0,0,3,''),(25,20,3,'2014-07-02','2100','',-504.9,0,0,3,'3'),(26,20,3,'2014-07-02','1550','',504.9,0,0,3,'3'),(27,13,3,'2014-07-03','5010','',504.9,0,0,2,'2'),(28,13,3,'2014-07-03','1510','',-504.9,0,0,2,'2'),(29,10,3,'2014-07-03','4010','',0,0,0,2,'2'),(30,10,3,'2014-07-03','1200','',0,0,0,2,'2'),(31,10,3,'2014-07-03','2150','',0,0,0,2,'2'),(32,10,3,'2014-07-03','4010','',-690000,0,0,2,'2'),(33,10,3,'2014-07-03','1200','',800400,0,0,2,'2'),(34,10,3,'2014-07-03','2150','',-110400,0,0,2,'2'),(35,22,1,'2014-08-14','2100','',196020,0,0,3,'2'),(36,22,1,'2014-08-14','5060','',-78408,0,0,3,'2'),(37,22,1,'2014-08-14','1060','',-117612,0,0,3,'2'),(38,22,2,'2014-08-14','2100','',100000,0,0,3,'1'),(39,22,2,'2014-08-14','5060','',-40000,0,0,3,'1'),(40,22,2,'2014-08-14','1060','',-118800000,0,0,3,'1'),(41,22,2,'2014-08-14','4450','',118740000,0,0,3,'1');
/*!40000 ALTER TABLE `fl_gl_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_grn_batch`
--

DROP TABLE IF EXISTS `fl_grn_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_grn_batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `purch_order_no` int(11) DEFAULT NULL,
  `reference` varchar(60) NOT NULL DEFAULT '',
  `delivery_date` date NOT NULL DEFAULT '0000-00-00',
  `loc_code` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delivery_date` (`delivery_date`),
  KEY `purch_order_no` (`purch_order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_grn_batch`
--

LOCK TABLES `fl_grn_batch` WRITE;
/*!40000 ALTER TABLE `fl_grn_batch` DISABLE KEYS */;
INSERT INTO `fl_grn_batch` VALUES (1,1,1,'auto','2014-06-03','DEF'),(2,2,2,'auto','2014-06-04','DEF'),(3,3,3,'auto','2014-07-02','DEF');
/*!40000 ALTER TABLE `fl_grn_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_grn_items`
--

DROP TABLE IF EXISTS `fl_grn_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_grn_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grn_batch_id` int(11) DEFAULT NULL,
  `po_detail_item` int(11) NOT NULL DEFAULT '0',
  `item_code` varchar(20) NOT NULL DEFAULT '',
  `description` tinytext,
  `qty_recd` double NOT NULL DEFAULT '0',
  `quantity_inv` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `grn_batch_id` (`grn_batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_grn_items`
--

LOCK TABLES `fl_grn_items` WRITE;
/*!40000 ALTER TABLE `fl_grn_items` DISABLE KEYS */;
INSERT INTO `fl_grn_items` VALUES (1,1,1,'rm-ap-3c','OSP-000665',1,1),(2,2,2,'rf-40260-baja','12345',1,1),(3,3,3,'FNC-42-46885527','FNC-42-46885527',1,1);
/*!40000 ALTER TABLE `fl_grn_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_groups`
--

DROP TABLE IF EXISTS `fl_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_groups` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(60) NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_groups`
--

LOCK TABLES `fl_groups` WRITE;
/*!40000 ALTER TABLE `fl_groups` DISABLE KEYS */;
INSERT INTO `fl_groups` VALUES (1,'Small',0),(2,'Medium',0),(3,'Large',0);
/*!40000 ALTER TABLE `fl_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_item_codes`
--

DROP TABLE IF EXISTS `fl_item_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_item_codes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_code` varchar(20) NOT NULL,
  `stock_id` varchar(20) NOT NULL,
  `description` varchar(200) NOT NULL DEFAULT '',
  `category_id` smallint(6) unsigned NOT NULL,
  `quantity` double NOT NULL DEFAULT '1',
  `is_foreign` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stock_id` (`stock_id`,`item_code`),
  KEY `item_code` (`item_code`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_item_codes`
--

LOCK TABLES `fl_item_codes` WRITE;
/*!40000 ALTER TABLE `fl_item_codes` DISABLE KEYS */;
INSERT INTO `fl_item_codes` VALUES (1,'rm-ap-3c','rm-ap-3c','OSP-000665',5,1,0,0),(2,'S001','S001','Servicio 1',4,1,0,0),(3,'rf-40260-baja','rf-40260-baja','royalty free, baja, 50MB, 300dpi',6,1,0,0),(4,'FNC-42-46885527','FNC-42-46885527','FNC-42-46885527: royalty free, baja, 50MB, 300dpi',6,1,0,0);
/*!40000 ALTER TABLE `fl_item_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_item_tax_type_exemptions`
--

DROP TABLE IF EXISTS `fl_item_tax_type_exemptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_item_tax_type_exemptions` (
  `item_tax_type_id` int(11) NOT NULL DEFAULT '0',
  `tax_type_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_tax_type_id`,`tax_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_item_tax_type_exemptions`
--

LOCK TABLES `fl_item_tax_type_exemptions` WRITE;
/*!40000 ALTER TABLE `fl_item_tax_type_exemptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_item_tax_type_exemptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_item_tax_types`
--

DROP TABLE IF EXISTS `fl_item_tax_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_item_tax_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `exempt` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_item_tax_types`
--

LOCK TABLES `fl_item_tax_types` WRITE;
/*!40000 ALTER TABLE `fl_item_tax_types` DISABLE KEYS */;
INSERT INTO `fl_item_tax_types` VALUES (1,'Regular',0,0);
/*!40000 ALTER TABLE `fl_item_tax_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_item_units`
--

DROP TABLE IF EXISTS `fl_item_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_item_units` (
  `abbr` varchar(20) NOT NULL,
  `name` varchar(40) NOT NULL,
  `decimals` tinyint(2) NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`abbr`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_item_units`
--

LOCK TABLES `fl_item_units` WRITE;
/*!40000 ALTER TABLE `fl_item_units` DISABLE KEYS */;
INSERT INTO `fl_item_units` VALUES ('ea.','Each',0,0),('item','Producto',0,0);
/*!40000 ALTER TABLE `fl_item_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_loc_stock`
--

DROP TABLE IF EXISTS `fl_loc_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_loc_stock` (
  `loc_code` char(5) NOT NULL DEFAULT '',
  `stock_id` char(20) NOT NULL DEFAULT '',
  `reorder_level` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`loc_code`,`stock_id`),
  KEY `stock_id` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_loc_stock`
--

LOCK TABLES `fl_loc_stock` WRITE;
/*!40000 ALTER TABLE `fl_loc_stock` DISABLE KEYS */;
INSERT INTO `fl_loc_stock` VALUES ('DEF','FNC-42-46885527',0),('DEF','rf-40260-baja',0),('DEF','rm-ap-3c',0),('DEF','S001',0);
/*!40000 ALTER TABLE `fl_loc_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_locations`
--

DROP TABLE IF EXISTS `fl_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_locations` (
  `loc_code` varchar(5) NOT NULL DEFAULT '',
  `location_name` varchar(60) NOT NULL DEFAULT '',
  `delivery_address` tinytext NOT NULL,
  `phone` varchar(30) NOT NULL DEFAULT '',
  `phone2` varchar(30) NOT NULL DEFAULT '',
  `fax` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `contact` varchar(30) NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`loc_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_locations`
--

LOCK TABLES `fl_locations` WRITE;
/*!40000 ALTER TABLE `fl_locations` DISABLE KEYS */;
INSERT INTO `fl_locations` VALUES ('DEF','Default','N/A','','','','','',0);
/*!40000 ALTER TABLE `fl_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_movement_types`
--

DROP TABLE IF EXISTS `fl_movement_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_movement_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_movement_types`
--

LOCK TABLES `fl_movement_types` WRITE;
/*!40000 ALTER TABLE `fl_movement_types` DISABLE KEYS */;
INSERT INTO `fl_movement_types` VALUES (1,'Adjustment',0);
/*!40000 ALTER TABLE `fl_movement_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_payment_terms`
--

DROP TABLE IF EXISTS `fl_payment_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_payment_terms` (
  `terms_indicator` int(11) NOT NULL AUTO_INCREMENT,
  `terms` char(80) NOT NULL DEFAULT '',
  `days_before_due` smallint(6) NOT NULL DEFAULT '0',
  `day_in_following_month` smallint(6) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`terms_indicator`),
  UNIQUE KEY `terms` (`terms`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_payment_terms`
--

LOCK TABLES `fl_payment_terms` WRITE;
/*!40000 ALTER TABLE `fl_payment_terms` DISABLE KEYS */;
INSERT INTO `fl_payment_terms` VALUES (1,'Crédito a 60 dias',60,0,0),(3,'Crédito a 30 dias',30,0,0),(4,'Contado',5,0,0);
/*!40000 ALTER TABLE `fl_payment_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_prices`
--

DROP TABLE IF EXISTS `fl_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` varchar(20) NOT NULL DEFAULT '',
  `sales_type_id` int(11) NOT NULL DEFAULT '0',
  `curr_abrev` char(3) NOT NULL DEFAULT '',
  `price` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `price` (`stock_id`,`sales_type_id`,`curr_abrev`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_prices`
--

LOCK TABLES `fl_prices` WRITE;
/*!40000 ALTER TABLE `fl_prices` DISABLE KEYS */;
INSERT INTO `fl_prices` VALUES (1,'rm-ap-3c',3,'COP',450000),(2,'rm-ap-3c',4,'COP',360000),(3,'rf-40260-baja',7,'COP',500000),(4,'rf-40260-baja',6,'COP',400000),(5,'FNC-42-46885527',7,'COP',690000);
/*!40000 ALTER TABLE `fl_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_print_profiles`
--

DROP TABLE IF EXISTS `fl_print_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_print_profiles` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `profile` varchar(30) NOT NULL,
  `report` varchar(5) DEFAULT NULL,
  `printer` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile` (`profile`,`report`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_print_profiles`
--

LOCK TABLES `fl_print_profiles` WRITE;
/*!40000 ALTER TABLE `fl_print_profiles` DISABLE KEYS */;
INSERT INTO `fl_print_profiles` VALUES (1,'Out of office','',0),(2,'Sales Department','',0),(3,'Central','',2),(4,'Sales Department','104',2),(5,'Sales Department','105',2),(6,'Sales Department','107',2),(7,'Sales Department','109',2),(8,'Sales Department','110',2),(9,'Sales Department','201',2);
/*!40000 ALTER TABLE `fl_print_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_printers`
--

DROP TABLE IF EXISTS `fl_printers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_printers` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(60) NOT NULL,
  `queue` varchar(20) NOT NULL,
  `host` varchar(40) NOT NULL,
  `port` smallint(11) unsigned NOT NULL,
  `timeout` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_printers`
--

LOCK TABLES `fl_printers` WRITE;
/*!40000 ALTER TABLE `fl_printers` DISABLE KEYS */;
INSERT INTO `fl_printers` VALUES (1,'QL500','Label printer','QL500','server',127,20),(2,'Samsung','Main network printer','scx4521F','server',515,5),(3,'Local','Local print server at user IP','lp','',515,10);
/*!40000 ALTER TABLE `fl_printers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_purch_data`
--

DROP TABLE IF EXISTS `fl_purch_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_purch_data` (
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `stock_id` char(20) NOT NULL DEFAULT '',
  `price` double NOT NULL DEFAULT '0',
  `suppliers_uom` char(50) NOT NULL DEFAULT '',
  `conversion_factor` double NOT NULL DEFAULT '1',
  `supplier_description` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`supplier_id`,`stock_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_purch_data`
--

LOCK TABLES `fl_purch_data` WRITE;
/*!40000 ALTER TABLE `fl_purch_data` DISABLE KEYS */;
INSERT INTO `fl_purch_data` VALUES (1,'rm-ap-3c',100000,'',1,'OSP-000665'),(2,'rf-40260-baja',99,'',1,'12345'),(3,'FNC-42-46885527',255,'',1,'FNC-42-46885527');
/*!40000 ALTER TABLE `fl_purch_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_purch_order_details`
--

DROP TABLE IF EXISTS `fl_purch_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_purch_order_details` (
  `po_detail_item` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` int(11) NOT NULL DEFAULT '0',
  `item_code` varchar(20) NOT NULL DEFAULT '',
  `description` tinytext,
  `delivery_date` date NOT NULL DEFAULT '0000-00-00',
  `qty_invoiced` double NOT NULL DEFAULT '0',
  `unit_price` double NOT NULL DEFAULT '0',
  `act_price` double NOT NULL DEFAULT '0',
  `std_cost_unit` double NOT NULL DEFAULT '0',
  `quantity_ordered` double NOT NULL DEFAULT '0',
  `quantity_received` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`po_detail_item`),
  KEY `order` (`order_no`,`po_detail_item`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_purch_order_details`
--

LOCK TABLES `fl_purch_order_details` WRITE;
/*!40000 ALTER TABLE `fl_purch_order_details` DISABLE KEYS */;
INSERT INTO `fl_purch_order_details` VALUES (1,1,'rm-ap-3c','OSP-000665','2014-06-03',1,100000,100000,100000,1,1),(2,2,'rf-40260-baja','12345','2014-06-04',1,99,99,196020,1,1),(3,3,'FNC-42-46885527','FNC-42-46885527','2014-07-02',1,255,255,504.9,1,1);
/*!40000 ALTER TABLE `fl_purch_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_purch_orders`
--

DROP TABLE IF EXISTS `fl_purch_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_purch_orders` (
  `order_no` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `comments` tinytext,
  `ord_date` date NOT NULL DEFAULT '0000-00-00',
  `reference` tinytext NOT NULL,
  `requisition_no` tinytext,
  `into_stock_location` varchar(5) NOT NULL DEFAULT '',
  `delivery_address` tinytext NOT NULL,
  `total` double NOT NULL DEFAULT '0',
  `tax_included` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_no`),
  KEY `ord_date` (`ord_date`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_purch_orders`
--

LOCK TABLES `fl_purch_orders` WRITE;
/*!40000 ALTER TABLE `fl_purch_orders` DISABLE KEYS */;
INSERT INTO `fl_purch_orders` VALUES (1,1,'','2014-06-03','auto','1','DEF','N/A',100000,0),(2,2,'','2014-06-04','auto','2','DEF','N/A',99,0),(3,3,'','2014-07-02','auto','3','DEF','N/A',255,0);
/*!40000 ALTER TABLE `fl_purch_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_quick_entries`
--

DROP TABLE IF EXISTS `fl_quick_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_quick_entries` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(60) NOT NULL,
  `base_amount` double NOT NULL DEFAULT '0',
  `base_desc` varchar(60) DEFAULT NULL,
  `bal_type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `description` (`description`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_quick_entries`
--

LOCK TABLES `fl_quick_entries` WRITE;
/*!40000 ALTER TABLE `fl_quick_entries` DISABLE KEYS */;
INSERT INTO `fl_quick_entries` VALUES (1,1,'Maintenance',0,'Amount',0),(2,4,'Phone',0,'Amount',0),(3,2,'Cash Sales',0,'Amount',0);
/*!40000 ALTER TABLE `fl_quick_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_quick_entry_lines`
--

DROP TABLE IF EXISTS `fl_quick_entry_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_quick_entry_lines` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `qid` smallint(6) unsigned NOT NULL,
  `amount` double DEFAULT '0',
  `action` varchar(2) NOT NULL,
  `dest_id` varchar(15) NOT NULL DEFAULT '',
  `dimension_id` smallint(6) unsigned DEFAULT NULL,
  `dimension2_id` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qid` (`qid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_quick_entry_lines`
--

LOCK TABLES `fl_quick_entry_lines` WRITE;
/*!40000 ALTER TABLE `fl_quick_entry_lines` DISABLE KEYS */;
INSERT INTO `fl_quick_entry_lines` VALUES (1,1,0,'t-','1',0,0),(2,2,0,'t-','1',0,0),(3,3,0,'t-','1',0,0),(4,3,0,'=','4010',0,0),(5,1,0,'=','5765',0,0),(6,2,0,'=','5780',0,0);
/*!40000 ALTER TABLE `fl_quick_entry_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_recurrent_invoices`
--

DROP TABLE IF EXISTS `fl_recurrent_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_recurrent_invoices` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(60) NOT NULL DEFAULT '',
  `order_no` int(11) unsigned NOT NULL,
  `debtor_no` int(11) unsigned DEFAULT NULL,
  `group_no` smallint(6) unsigned DEFAULT NULL,
  `days` int(11) NOT NULL DEFAULT '0',
  `monthly` int(11) NOT NULL DEFAULT '0',
  `begin` date NOT NULL DEFAULT '0000-00-00',
  `end` date NOT NULL DEFAULT '0000-00-00',
  `last_sent` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_recurrent_invoices`
--

LOCK TABLES `fl_recurrent_invoices` WRITE;
/*!40000 ALTER TABLE `fl_recurrent_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_recurrent_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_refs`
--

DROP TABLE IF EXISTS `fl_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_refs` (
  `id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `reference` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`type`),
  KEY `Type_and_Reference` (`type`,`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_refs`
--

LOCK TABLES `fl_refs` WRITE;
/*!40000 ALTER TABLE `fl_refs` DISABLE KEYS */;
INSERT INTO `fl_refs` VALUES (1,10,'1'),(2,10,'2'),(3,10,'3'),(1,12,'1'),(2,12,'2'),(3,13,'1'),(1,13,'auto'),(2,13,'auto'),(1,18,'auto'),(2,18,'auto'),(3,18,'auto'),(1,20,'1'),(2,20,'2'),(3,20,'3'),(1,22,'1'),(2,22,'2'),(1,25,'auto'),(2,25,'auto'),(3,25,'auto'),(3,30,'1'),(1,30,'auto'),(2,30,'auto'),(2,32,'1'),(1,32,'1698'),(3,32,'2');
/*!40000 ALTER TABLE `fl_refs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_sales_order_details`
--

DROP TABLE IF EXISTS `fl_sales_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_sales_order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` int(11) NOT NULL DEFAULT '0',
  `trans_type` smallint(6) NOT NULL DEFAULT '30',
  `stk_code` varchar(20) NOT NULL DEFAULT '',
  `description` tinytext,
  `qty_sent` double NOT NULL DEFAULT '0',
  `unit_price` double NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `discount_percent` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sorder` (`trans_type`,`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_sales_order_details`
--

LOCK TABLES `fl_sales_order_details` WRITE;
/*!40000 ALTER TABLE `fl_sales_order_details` DISABLE KEYS */;
INSERT INTO `fl_sales_order_details` VALUES (1,1,30,'rm-ap-3c','OSP-000665',1,360000,1,0),(2,2,30,'rf-40260-baja','12345',1,300000,1,0),(3,1,32,'FNC-42-46885527','FNC-42-46885527',1,690000,1,0),(4,3,30,'FNC-42-46885527','FNC-42-46885527: royalty free, baja, 50MB, 300dpi',1,690000,1,0),(5,2,32,'FNC-42-46885527','royalty free, baja, 50MB, 300dpi',0,690000,1,0),(6,2,32,'rf-40260-baja','royalty free, baja, 50MB, 300dpi',0,500000,1,0),(8,3,32,'FNC-42-46885527','FNC-42-46885527: royalty free, baja, 50MB, 300dpi',0,690000,1,0),(9,3,32,'rf-40260-baja','royalty free, baja, 50MB, 300dpi',0,500000,1,0);
/*!40000 ALTER TABLE `fl_sales_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_sales_orders`
--

DROP TABLE IF EXISTS `fl_sales_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_sales_orders` (
  `order_no` int(11) NOT NULL,
  `trans_type` smallint(6) NOT NULL DEFAULT '30',
  `version` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `debtor_no` int(11) NOT NULL DEFAULT '0',
  `branch_code` int(11) NOT NULL DEFAULT '0',
  `reference` varchar(100) NOT NULL DEFAULT '',
  `customer_ref` tinytext NOT NULL,
  `comments` tinytext,
  `ord_date` date NOT NULL DEFAULT '0000-00-00',
  `order_type` int(11) NOT NULL DEFAULT '0',
  `ship_via` int(11) NOT NULL DEFAULT '0',
  `delivery_address` tinytext NOT NULL,
  `contact_phone` varchar(30) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `deliver_to` tinytext NOT NULL,
  `freight_cost` double NOT NULL DEFAULT '0',
  `from_stk_loc` varchar(5) NOT NULL DEFAULT '',
  `delivery_date` date NOT NULL DEFAULT '0000-00-00',
  `payment_terms` int(11) DEFAULT NULL,
  `total` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`trans_type`,`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_sales_orders`
--

LOCK TABLES `fl_sales_orders` WRITE;
/*!40000 ALTER TABLE `fl_sales_orders` DISABLE KEYS */;
INSERT INTO `fl_sales_orders` VALUES (1,30,1,0,1,1,'auto','','','2014-06-03',4,1,'','',NULL,'Sancho BBDO',0,'DEF','2014-06-03',4,417600),(2,30,1,0,1,1,'auto','','','2014-06-04',5,1,'','',NULL,'Sancho BBDO',0,'DEF','2014-06-04',4,348000),(3,30,3,0,2,2,'1','','Sales Quotation # 1','2014-07-02',7,1,'Calle 71 # 6-51','3173331',NULL,'TORO LOVE SAS',0,'DEF','2014-07-09',1,800400),(1,32,1,0,2,2,'1698','','Foto Compra/\nRoyalty Free \n28 Mb /300 dpi\nTodos los medios\nTiempo Indefinido\nTodos los territorios\nSin exclusividad\n\n','2014-07-02',7,1,'','3173331',NULL,'TORO LOVE SAS',0,'DEF','2014-07-09',1,800400),(2,32,1,0,1,1,'1','12345','','2014-07-03',7,1,'.','',NULL,'Sancho BBDO',0,'DEF','2014-07-04',3,1380400),(3,32,0,0,2,2,'2','','','2014-07-10',7,1,'','3173331',NULL,'COLPATRIA',0,'DEF','2014-07-11',1,1380400);
/*!40000 ALTER TABLE `fl_sales_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_sales_pos`
--

DROP TABLE IF EXISTS `fl_sales_pos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_sales_pos` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `pos_name` varchar(30) NOT NULL,
  `cash_sale` tinyint(1) NOT NULL,
  `credit_sale` tinyint(1) NOT NULL,
  `pos_location` varchar(5) NOT NULL,
  `pos_account` smallint(6) unsigned NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pos_name` (`pos_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_sales_pos`
--

LOCK TABLES `fl_sales_pos` WRITE;
/*!40000 ALTER TABLE `fl_sales_pos` DISABLE KEYS */;
INSERT INTO `fl_sales_pos` VALUES (1,'Default',1,1,'DEF',2,0);
/*!40000 ALTER TABLE `fl_sales_pos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_sales_types`
--

DROP TABLE IF EXISTS `fl_sales_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_sales_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_type` char(50) NOT NULL DEFAULT '',
  `tax_included` int(1) NOT NULL DEFAULT '0',
  `factor` double NOT NULL DEFAULT '1',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sales_type` (`sales_type`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_sales_types`
--

LOCK TABLES `fl_sales_types` WRITE;
/*!40000 ALTER TABLE `fl_sales_types` DISABLE KEYS */;
INSERT INTO `fl_sales_types` VALUES (1,'Retail',1,1,0),(2,'Wholesale',0,0.7,0),(3,'RM-Afiche-3m-Exc',0,1,0),(4,'RM-Afiche-3m-NoE',0,1,0),(5,'RF-40260-Baja',0,1,0),(6,'RF-40260-Media',0,1,0),(7,'RF-Fancy-Media',0,1,0);
/*!40000 ALTER TABLE `fl_sales_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_salesman`
--

DROP TABLE IF EXISTS `fl_salesman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_salesman` (
  `salesman_code` int(11) NOT NULL AUTO_INCREMENT,
  `salesman_name` char(60) NOT NULL DEFAULT '',
  `salesman_phone` char(30) NOT NULL DEFAULT '',
  `salesman_fax` char(30) NOT NULL DEFAULT '',
  `salesman_email` varchar(100) NOT NULL DEFAULT '',
  `provision` double NOT NULL DEFAULT '0',
  `break_pt` double NOT NULL DEFAULT '0',
  `provision2` double NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`salesman_code`),
  UNIQUE KEY `salesman_name` (`salesman_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_salesman`
--

LOCK TABLES `fl_salesman` WRITE;
/*!40000 ALTER TABLE `fl_salesman` DISABLE KEYS */;
INSERT INTO `fl_salesman` VALUES (1,'Carolina Arévalo','','','',5,1000,4,0);
/*!40000 ALTER TABLE `fl_salesman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_security_roles`
--

DROP TABLE IF EXISTS `fl_security_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_security_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(30) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `sections` text,
  `areas` text,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role` (`role`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_security_roles`
--

LOCK TABLES `fl_security_roles` WRITE;
/*!40000 ALTER TABLE `fl_security_roles` DISABLE KEYS */;
INSERT INTO `fl_security_roles` VALUES (1,'Inquiries','Inquiries','768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15872;16128','257;258;259;260;513;514;515;516;517;518;519;520;521;522;523;524;525;773;774;2822;3073;3075;3076;3077;3329;3330;3331;3332;3333;3334;3335;5377;5633;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8450;8451;10497;10753;11009;11010;11012;13313;13315;15617;15618;15619;15620;15621;15622;15623;15624;15625;15626;15873;15882;16129;16130;16131;16132',0),(2,'System Administrator','System Administrator','256;512;768;2816;3072;3328;5376;5632;5888;7936;8192;8448;10496;10752;11008;13056;13312;15616;15872;16128','257;258;259;260;513;514;515;516;517;518;519;520;521;522;523;524;525;526;769;770;771;772;773;774;2817;2818;2819;2820;2821;2822;2823;3073;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5636;5637;5641;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8195;8196;8197;8449;8450;8451;10497;10753;10754;10755;10756;10757;11009;11010;11011;11012;13057;13313;13314;13315;15617;15618;15619;15620;15621;15622;15623;15624;15628;15625;15626;15627;15873;15874;15875;15876;15877;15878;15879;15880;15883;15881;15882;16129;16130;16131;16132',0),(3,'Salesman','Salesman','768;3072;5632;8192;15872','773;774;3073;3075;3081;5633;8194;15873',0),(4,'Stock Manager','Stock Manager','2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15872;16128','2818;2822;3073;3076;3077;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5640;5889;5890;5891;8193;8194;8450;8451;10753;11009;11010;11012;13313;13315;15882;16129;16130;16131;16132',0),(5,'Production Manager','Production Manager','512;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128','521;523;524;2818;2819;2820;2821;2822;2823;3073;3074;3076;3077;3078;3079;3080;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5640;5640;5889;5890;5891;8193;8194;8196;8197;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15876;15877;15880;15882;16129;16130;16131;16132',0),(6,'Purchase Officer','Purchase Officer','512;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128','521;523;524;2818;2819;2820;2821;2822;2823;3073;3074;3076;3077;3078;3079;3080;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5377;5633;5635;5640;5640;5889;5890;5891;8193;8194;8196;8197;8449;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15876;15877;15880;15882;16129;16130;16131;16132',0),(7,'AR Officer','AR Officer','512;768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128','521;523;524;771;773;774;2818;2819;2820;2821;2822;2823;3073;3073;3074;3075;3076;3077;3078;3079;3080;3081;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5633;5634;5637;5638;5639;5640;5640;5889;5890;5891;8193;8194;8194;8196;8197;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15873;15876;15877;15878;15880;15882;16129;16130;16131;16132',0),(8,'AP Officer','AP Officer','512;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128','257;258;259;260;521;523;524;769;770;771;772;773;774;2818;2819;2820;2821;2822;2823;3073;3074;3082;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5635;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8197;8449;8450;8451;10497;10753;10755;11009;11010;11012;13057;13313;13315;15617;15619;15620;15621;15624;15876;15877;15880;15882;16129;16130;16131;16132',0),(9,'Accountant','New Accountant','512;768;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128','257;258;259;260;521;523;524;771;772;773;774;2818;2819;2820;2821;2822;2823;3073;3074;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5637;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8197;8449;8450;8451;10497;10753;10755;11009;11010;11012;13313;13315;15617;15618;15619;15620;15621;15624;15873;15876;15877;15878;15880;15882;16129;16130;16131;16132',0),(10,'Sub Admin','Sub Admin','512;768;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128','257;258;259;260;521;523;524;771;772;773;774;2818;2819;2820;2821;2822;2823;3073;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5637;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8197;8449;8450;8451;10497;10753;10755;11009;11010;11012;13057;13313;13315;15617;15619;15620;15621;15624;15873;15874;15876;15877;15878;15879;15880;15882;16129;16130;16131;16132',0);
/*!40000 ALTER TABLE `fl_security_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_shippers`
--

DROP TABLE IF EXISTS `fl_shippers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_shippers` (
  `shipper_id` int(11) NOT NULL AUTO_INCREMENT,
  `shipper_name` varchar(60) NOT NULL DEFAULT '',
  `phone` varchar(30) NOT NULL DEFAULT '',
  `phone2` varchar(30) NOT NULL DEFAULT '',
  `contact` tinytext NOT NULL,
  `address` tinytext NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`shipper_id`),
  UNIQUE KEY `name` (`shipper_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_shippers`
--

LOCK TABLES `fl_shippers` WRITE;
/*!40000 ALTER TABLE `fl_shippers` DISABLE KEYS */;
INSERT INTO `fl_shippers` VALUES (1,'Default','','','','',0);
/*!40000 ALTER TABLE `fl_shippers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_sql_trail`
--

DROP TABLE IF EXISTS `fl_sql_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_sql_trail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sql` text NOT NULL,
  `result` tinyint(1) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_sql_trail`
--

LOCK TABLES `fl_sql_trail` WRITE;
/*!40000 ALTER TABLE `fl_sql_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_sql_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_stock_category`
--

DROP TABLE IF EXISTS `fl_stock_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_stock_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) NOT NULL DEFAULT '',
  `dflt_tax_type` int(11) NOT NULL DEFAULT '1',
  `dflt_units` varchar(20) NOT NULL DEFAULT 'each',
  `dflt_mb_flag` char(1) NOT NULL DEFAULT 'B',
  `dflt_sales_act` varchar(15) NOT NULL DEFAULT '',
  `dflt_cogs_act` varchar(15) NOT NULL DEFAULT '',
  `dflt_inventory_act` varchar(15) NOT NULL DEFAULT '',
  `dflt_adjustment_act` varchar(15) NOT NULL DEFAULT '',
  `dflt_assembly_act` varchar(15) NOT NULL DEFAULT '',
  `dflt_dim1` int(11) DEFAULT NULL,
  `dflt_dim2` int(11) DEFAULT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `dflt_no_sale` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_stock_category`
--

LOCK TABLES `fl_stock_category` WRITE;
/*!40000 ALTER TABLE `fl_stock_category` DISABLE KEYS */;
INSERT INTO `fl_stock_category` VALUES (1,'Components',1,'each','B','4010','5010','1510','5040','1530',0,0,0,0),(2,'Charges',1,'each','D','4010','5010','1510','5040','1530',0,0,0,0),(3,'Systems',1,'each','M','4010','5010','1510','5040','1530',0,0,0,0),(4,'Services',1,'hrs','D','4010','5010','1510','5040','1530',0,0,0,0),(5,'Right Managed',1,'ea.','B','4010','5010','1510','5040','1530',0,0,0,0),(6,'Royalty Free',1,'ea.','B','4010','5010','1510','5040','1530',0,0,0,0);
/*!40000 ALTER TABLE `fl_stock_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_stock_master`
--

DROP TABLE IF EXISTS `fl_stock_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_stock_master` (
  `stock_id` varchar(20) NOT NULL DEFAULT '',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `tax_type_id` int(11) NOT NULL DEFAULT '0',
  `description` varchar(200) NOT NULL DEFAULT '',
  `long_description` tinytext NOT NULL,
  `units` varchar(20) NOT NULL DEFAULT 'each',
  `mb_flag` char(1) NOT NULL DEFAULT 'B',
  `sales_account` varchar(15) NOT NULL DEFAULT '',
  `cogs_account` varchar(15) NOT NULL DEFAULT '',
  `inventory_account` varchar(15) NOT NULL DEFAULT '',
  `adjustment_account` varchar(15) NOT NULL DEFAULT '',
  `assembly_account` varchar(15) NOT NULL DEFAULT '',
  `dimension_id` int(11) DEFAULT NULL,
  `dimension2_id` int(11) DEFAULT NULL,
  `actual_cost` double NOT NULL DEFAULT '0',
  `last_cost` double NOT NULL DEFAULT '0',
  `material_cost` double NOT NULL DEFAULT '0',
  `labour_cost` double NOT NULL DEFAULT '0',
  `overhead_cost` double NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `no_sale` tinyint(1) NOT NULL DEFAULT '0',
  `editable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_stock_master`
--

LOCK TABLES `fl_stock_master` WRITE;
/*!40000 ALTER TABLE `fl_stock_master` DISABLE KEYS */;
INSERT INTO `fl_stock_master` VALUES ('FNC-42-46885527',6,1,'FNC-42-46885527: royalty free, baja, 50MB, 300dpi','Usos: todos los medios; Tiempo: indefinido; Todos los territorios; Sin exclusividad ','ea.','B','4010','5010','1510','5040','1530',0,0,0,0,504.9,0,0,0,0,0),('rf-40260-baja',6,1,'royalty free, baja, 50MB, 300dpi','Foto compra, royalty free, baja, 50MB, 300dpi','ea.','B','4010','5010','1510','5040','1530',0,0,0,0,196020,0,0,0,0,0),('rm-ap-3c',5,1,'OSP-000665','Foto, Afiche Publicitario, 3 meses, Sin exclusividad','ea.','B','4010','5010','1510','5040','1530',0,0,0,0,100000,0,0,0,0,0),('S001',4,1,'Servicio 1','','ea.','D','4010','5010','1510','5040','1530',0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `fl_stock_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_stock_moves`
--

DROP TABLE IF EXISTS `fl_stock_moves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_stock_moves` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_no` int(11) NOT NULL DEFAULT '0',
  `stock_id` char(20) NOT NULL DEFAULT '',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `loc_code` char(5) NOT NULL DEFAULT '',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `person_id` int(11) DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `reference` char(40) NOT NULL DEFAULT '',
  `qty` double NOT NULL DEFAULT '1',
  `discount_percent` double NOT NULL DEFAULT '0',
  `standard_cost` double NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`trans_id`),
  KEY `type` (`type`,`trans_no`),
  KEY `Move` (`stock_id`,`loc_code`,`tran_date`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_stock_moves`
--

LOCK TABLES `fl_stock_moves` WRITE;
/*!40000 ALTER TABLE `fl_stock_moves` DISABLE KEYS */;
INSERT INTO `fl_stock_moves` VALUES (1,1,'rm-ap-3c',25,'DEF','2014-06-03',1,100000,'',1,0,100000,1),(2,1,'rm-ap-3c',13,'DEF','2014-06-03',0,360000,'auto',-1,0,100000,1),(3,2,'rf-40260-baja',25,'DEF','2014-06-04',2,99,'',1,0,196020,1),(4,2,'rf-40260-baja',13,'DEF','2014-06-04',0,300000,'auto',-1,0,196020,1),(5,3,'FNC-42-46885527',25,'DEF','2014-07-02',3,255,'',1,0,504.9,1),(6,3,'FNC-42-46885527',13,'DEF','2014-07-03',0,690000,'1',-1,0,504.9,1);
/*!40000 ALTER TABLE `fl_stock_moves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_supp_allocations`
--

DROP TABLE IF EXISTS `fl_supp_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_supp_allocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amt` double unsigned DEFAULT NULL,
  `date_alloc` date NOT NULL DEFAULT '0000-00-00',
  `trans_no_from` int(11) DEFAULT NULL,
  `trans_type_from` int(11) DEFAULT NULL,
  `trans_no_to` int(11) DEFAULT NULL,
  `trans_type_to` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `From` (`trans_type_from`,`trans_no_from`),
  KEY `To` (`trans_type_to`,`trans_no_to`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_supp_allocations`
--

LOCK TABLES `fl_supp_allocations` WRITE;
/*!40000 ALTER TABLE `fl_supp_allocations` DISABLE KEYS */;
INSERT INTO `fl_supp_allocations` VALUES (1,99,'2014-08-14',1,22,2,20),(2,100000,'2014-08-14',2,22,1,20);
/*!40000 ALTER TABLE `fl_supp_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_supp_invoice_items`
--

DROP TABLE IF EXISTS `fl_supp_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_supp_invoice_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supp_trans_no` int(11) DEFAULT NULL,
  `supp_trans_type` int(11) DEFAULT NULL,
  `gl_code` varchar(15) NOT NULL DEFAULT '',
  `grn_item_id` int(11) DEFAULT NULL,
  `po_detail_item_id` int(11) DEFAULT NULL,
  `stock_id` varchar(20) NOT NULL DEFAULT '',
  `description` tinytext,
  `quantity` double NOT NULL DEFAULT '0',
  `unit_price` double NOT NULL DEFAULT '0',
  `unit_tax` double NOT NULL DEFAULT '0',
  `memo_` tinytext,
  PRIMARY KEY (`id`),
  KEY `Transaction` (`supp_trans_type`,`supp_trans_no`,`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_supp_invoice_items`
--

LOCK TABLES `fl_supp_invoice_items` WRITE;
/*!40000 ALTER TABLE `fl_supp_invoice_items` DISABLE KEYS */;
INSERT INTO `fl_supp_invoice_items` VALUES (1,1,20,'0',1,1,'rm-ap-3c','OSP-000665',1,100000,0,''),(2,2,20,'0',2,2,'rf-40260-baja','12345',1,99,0,''),(3,3,20,'0',3,3,'FNC-42-46885527','FNC-42-46885527',1,255,0,'');
/*!40000 ALTER TABLE `fl_supp_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_supp_trans`
--

DROP TABLE IF EXISTS `fl_supp_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_supp_trans` (
  `trans_no` int(11) unsigned NOT NULL DEFAULT '0',
  `type` smallint(6) unsigned NOT NULL DEFAULT '0',
  `supplier_id` int(11) unsigned DEFAULT NULL,
  `reference` tinytext NOT NULL,
  `supp_reference` varchar(60) NOT NULL DEFAULT '',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `due_date` date NOT NULL DEFAULT '0000-00-00',
  `ov_amount` double NOT NULL DEFAULT '0',
  `ov_discount` double NOT NULL DEFAULT '0',
  `ov_gst` double NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '1',
  `alloc` double NOT NULL DEFAULT '0',
  `tax_included` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`type`,`trans_no`),
  KEY `supplier_id` (`supplier_id`),
  KEY `SupplierID_2` (`supplier_id`,`supp_reference`),
  KEY `type` (`type`),
  KEY `tran_date` (`tran_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_supp_trans`
--

LOCK TABLES `fl_supp_trans` WRITE;
/*!40000 ALTER TABLE `fl_supp_trans` DISABLE KEYS */;
INSERT INTO `fl_supp_trans` VALUES (1,20,1,'1','1','2014-06-03','2014-06-03',100000,0,0,1,100000,0),(2,20,2,'2','2','2014-06-04','2014-06-04',99,0,0,1980,99,0),(3,20,3,'3','3','2014-07-02','2014-07-02',255,0,0,1.98,0,0),(1,22,2,'1','','2014-08-14','2014-08-14',-59.4,-39.6,0,1980,99,0),(2,22,1,'2','','2014-08-14','2014-08-14',-60000,-40000,0,1,100000,0);
/*!40000 ALTER TABLE `fl_supp_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_suppliers`
--

DROP TABLE IF EXISTS `fl_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_suppliers` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supp_name` varchar(60) NOT NULL DEFAULT '',
  `supp_ref` varchar(30) NOT NULL DEFAULT '',
  `address` tinytext NOT NULL,
  `supp_address` tinytext NOT NULL,
  `gst_no` varchar(25) NOT NULL DEFAULT '',
  `contact` varchar(60) NOT NULL DEFAULT '',
  `supp_account_no` varchar(40) NOT NULL DEFAULT '',
  `website` varchar(100) NOT NULL DEFAULT '',
  `bank_account` varchar(60) NOT NULL DEFAULT '',
  `curr_code` char(3) DEFAULT NULL,
  `payment_terms` int(11) DEFAULT NULL,
  `tax_included` tinyint(1) NOT NULL DEFAULT '0',
  `dimension_id` int(11) DEFAULT '0',
  `dimension2_id` int(11) DEFAULT '0',
  `tax_group_id` int(11) DEFAULT NULL,
  `credit_limit` double NOT NULL DEFAULT '0',
  `purchase_account` varchar(15) NOT NULL DEFAULT '',
  `payable_account` varchar(15) NOT NULL DEFAULT '',
  `payment_discount_account` varchar(15) NOT NULL DEFAULT '',
  `notes` tinytext NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`supplier_id`),
  KEY `supp_ref` (`supp_ref`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_suppliers`
--

LOCK TABLES `fl_suppliers` WRITE;
/*!40000 ALTER TABLE `fl_suppliers` DISABLE KEYS */;
INSERT INTO `fl_suppliers` VALUES (1,'Westend61','Westend61','','','','','0.4','','','COP',4,0,0,0,2,0,'','2100','5060','',0),(2,'40260.com','40260.com','','','','','0.5','','','USD',4,0,0,0,2,0,'','2100','5060','',0),(3,'Photostock - Fancy','Fancy','','','','','0.6','','','USD',4,0,0,0,2,0,'','2100','5060','',0);
/*!40000 ALTER TABLE `fl_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_sys_prefs`
--

DROP TABLE IF EXISTS `fl_sys_prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_sys_prefs` (
  `name` varchar(35) NOT NULL DEFAULT '',
  `category` varchar(30) DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT '',
  `length` smallint(6) DEFAULT NULL,
  `value` tinytext,
  PRIMARY KEY (`name`),
  KEY `category` (`category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_sys_prefs`
--

LOCK TABLES `fl_sys_prefs` WRITE;
/*!40000 ALTER TABLE `fl_sys_prefs` DISABLE KEYS */;
INSERT INTO `fl_sys_prefs` VALUES ('coy_name','setup.company','varchar',60,'Latin Color Images S.A.S.'),('gst_no','setup.company','varchar',25,'900115126-9'),('coy_no','setup.company','varchar',25,''),('tax_prd','setup.company','int',11,'1'),('tax_last','setup.company','int',11,'1'),('postal_address','setup.company','tinytext',0,'Calle 169a No.56-57 Torre 3 Oficina 504'),('phone','setup.company','varchar',30,'571 6940506 / 314 2958463 / 317 3289504'),('fax','setup.company','varchar',30,''),('email','setup.company','varchar',100,'info@latincolorimages.com'),('coy_logo','setup.company','varchar',100,''),('domicile','setup.company','varchar',55,'Bogotá'),('curr_default','setup.company','char',3,'COP'),('use_dimension','setup.company','tinyint',1,'1'),('f_year','setup.company','int',11,'7'),('no_item_list','setup.company','tinyint',1,'0'),('no_customer_list','setup.company','tinyint',1,'0'),('no_supplier_list','setup.company','tinyint',1,'0'),('base_sales','setup.company','int',11,'1'),('time_zone','setup.company','tinyint',1,'0'),('add_pct','setup.company','int',5,'-1'),('round_to','setup.company','int',5,'1'),('login_tout','setup.company','smallint',6,'21600'),('past_due_days','glsetup.general','int',11,'30'),('profit_loss_year_act','glsetup.general','varchar',15,'9990'),('retained_earnings_act','glsetup.general','varchar',15,'3590'),('bank_charge_act','glsetup.general','varchar',15,'5690'),('exchange_diff_act','glsetup.general','varchar',15,'4450'),('default_credit_limit','glsetup.customer','int',11,'1000'),('accumulate_shipping','glsetup.customer','tinyint',1,'0'),('legal_text','glsetup.customer','tinytext',0,''),('freight_act','glsetup.customer','varchar',15,'4430'),('debtors_act','glsetup.sales','varchar',15,'1200'),('default_sales_act','glsetup.sales','varchar',15,'4010'),('default_sales_discount_act','glsetup.sales','varchar',15,'4510'),('default_prompt_payment_act','glsetup.sales','varchar',15,'4500'),('default_delivery_required','glsetup.sales','smallint',6,'1'),('default_dim_required','glsetup.dims','int',11,'20'),('pyt_discount_act','glsetup.purchase','varchar',15,'5060'),('creditors_act','glsetup.purchase','varchar',15,'2100'),('po_over_receive','glsetup.purchase','int',11,'10'),('po_over_charge','glsetup.purchase','int',11,'10'),('allow_negative_stock','glsetup.inventory','tinyint',1,'0'),('default_inventory_act','glsetup.items','varchar',15,'1510'),('default_cogs_act','glsetup.items','varchar',15,'5010'),('default_adj_act','glsetup.items','varchar',15,'5040'),('default_inv_sales_act','glsetup.items','varchar',15,'4010'),('default_assembly_act','glsetup.items','varchar',15,'1530'),('default_workorder_required','glsetup.manuf','int',11,'20'),('version_id','system','varchar',11,'2.3rc'),('auto_curr_reval','setup.company','smallint',6,'1'),('grn_clearing_act','glsetup.purchase','varchar',15,'1550'),('bcc_email','setup.company','varchar',100,'');
/*!40000 ALTER TABLE `fl_sys_prefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_sys_types`
--

DROP TABLE IF EXISTS `fl_sys_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_sys_types` (
  `type_id` smallint(6) NOT NULL DEFAULT '0',
  `type_no` int(11) NOT NULL DEFAULT '1',
  `next_reference` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_sys_types`
--

LOCK TABLES `fl_sys_types` WRITE;
/*!40000 ALTER TABLE `fl_sys_types` DISABLE KEYS */;
INSERT INTO `fl_sys_types` VALUES (0,17,'1'),(1,7,'1'),(2,4,'1'),(4,3,'1'),(10,16,'4'),(11,2,'1'),(12,6,'3'),(13,1,'2'),(16,2,'1'),(17,2,'1'),(18,1,'1'),(20,6,'4'),(21,1,'1'),(22,3,'3'),(25,1,'1'),(26,1,'1'),(28,1,'1'),(29,1,'1'),(30,0,'2'),(32,0,'3'),(35,1,'1'),(40,1,'1');
/*!40000 ALTER TABLE `fl_sys_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_tag_associations`
--

DROP TABLE IF EXISTS `fl_tag_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_tag_associations` (
  `record_id` varchar(15) NOT NULL,
  `tag_id` int(11) NOT NULL,
  UNIQUE KEY `record_id` (`record_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_tag_associations`
--

LOCK TABLES `fl_tag_associations` WRITE;
/*!40000 ALTER TABLE `fl_tag_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_tag_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_tags`
--

DROP TABLE IF EXISTS `fl_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(60) DEFAULT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_tags`
--

LOCK TABLES `fl_tags` WRITE;
/*!40000 ALTER TABLE `fl_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_tax_group_items`
--

DROP TABLE IF EXISTS `fl_tax_group_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_tax_group_items` (
  `tax_group_id` int(11) NOT NULL DEFAULT '0',
  `tax_type_id` int(11) NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`tax_group_id`,`tax_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_tax_group_items`
--

LOCK TABLES `fl_tax_group_items` WRITE;
/*!40000 ALTER TABLE `fl_tax_group_items` DISABLE KEYS */;
INSERT INTO `fl_tax_group_items` VALUES (1,1,5);
/*!40000 ALTER TABLE `fl_tax_group_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_tax_groups`
--

DROP TABLE IF EXISTS `fl_tax_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_tax_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `tax_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_tax_groups`
--

LOCK TABLES `fl_tax_groups` WRITE;
/*!40000 ALTER TABLE `fl_tax_groups` DISABLE KEYS */;
INSERT INTO `fl_tax_groups` VALUES (1,'Tax',0,0),(2,'Tax Exempt',0,0);
/*!40000 ALTER TABLE `fl_tax_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_tax_types`
--

DROP TABLE IF EXISTS `fl_tax_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_tax_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rate` double NOT NULL DEFAULT '0',
  `sales_gl_code` varchar(15) NOT NULL DEFAULT '',
  `purchasing_gl_code` varchar(15) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_tax_types`
--

LOCK TABLES `fl_tax_types` WRITE;
/*!40000 ALTER TABLE `fl_tax_types` DISABLE KEYS */;
INSERT INTO `fl_tax_types` VALUES (1,16,'2150','2150','IVA',0);
/*!40000 ALTER TABLE `fl_tax_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_trans_tax_details`
--

DROP TABLE IF EXISTS `fl_trans_tax_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_trans_tax_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_type` smallint(6) DEFAULT NULL,
  `trans_no` int(11) DEFAULT NULL,
  `tran_date` date NOT NULL,
  `tax_type_id` int(11) NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '0',
  `ex_rate` double NOT NULL DEFAULT '1',
  `included_in_price` tinyint(1) NOT NULL DEFAULT '0',
  `net_amount` double NOT NULL DEFAULT '0',
  `amount` double NOT NULL DEFAULT '0',
  `memo` tinytext,
  PRIMARY KEY (`id`),
  KEY `Type_and_Number` (`trans_type`,`trans_no`),
  KEY `tran_date` (`tran_date`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_trans_tax_details`
--

LOCK TABLES `fl_trans_tax_details` WRITE;
/*!40000 ALTER TABLE `fl_trans_tax_details` DISABLE KEYS */;
INSERT INTO `fl_trans_tax_details` VALUES (1,13,1,'2014-06-03',1,16,1,0,360000,57600,'auto'),(2,10,1,'2014-06-03',1,16,1,0,360000,57600,'1'),(3,13,2,'2014-06-04',1,16,1,0,300000,48000,'auto'),(4,10,2,'2014-06-04',1,16,1,0,300000,48000,'2'),(5,13,3,'2014-07-03',1,16,1,0,690000,110400,'1'),(6,10,3,'2014-07-03',1,16,1,0,0,0,'3'),(7,10,3,'2014-07-03',1,16,1,0,690000,110400,'3');
/*!40000 ALTER TABLE `fl_trans_tax_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_useronline`
--

DROP TABLE IF EXISTS `fl_useronline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_useronline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(15) NOT NULL DEFAULT '0',
  `ip` varchar(40) NOT NULL DEFAULT '',
  `file` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `timestamp` (`timestamp`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_useronline`
--

LOCK TABLES `fl_useronline` WRITE;
/*!40000 ALTER TABLE `fl_useronline` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_useronline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_users`
--

DROP TABLE IF EXISTS `fl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_users` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `real_name` varchar(100) NOT NULL DEFAULT '',
  `role_id` int(11) NOT NULL DEFAULT '1',
  `phone` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(100) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `date_format` tinyint(1) NOT NULL DEFAULT '0',
  `date_sep` tinyint(1) NOT NULL DEFAULT '0',
  `tho_sep` tinyint(1) NOT NULL DEFAULT '0',
  `dec_sep` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL DEFAULT 'default',
  `page_size` varchar(20) NOT NULL DEFAULT 'A4',
  `prices_dec` smallint(6) NOT NULL DEFAULT '2',
  `qty_dec` smallint(6) NOT NULL DEFAULT '2',
  `rates_dec` smallint(6) NOT NULL DEFAULT '4',
  `percent_dec` smallint(6) NOT NULL DEFAULT '1',
  `show_gl` tinyint(1) NOT NULL DEFAULT '1',
  `show_codes` tinyint(1) NOT NULL DEFAULT '0',
  `show_hints` tinyint(1) NOT NULL DEFAULT '0',
  `last_visit_date` datetime DEFAULT NULL,
  `query_size` tinyint(1) DEFAULT '10',
  `graphic_links` tinyint(1) DEFAULT '1',
  `pos` smallint(6) DEFAULT '1',
  `print_profile` varchar(30) NOT NULL DEFAULT '1',
  `rep_popup` tinyint(1) DEFAULT '1',
  `sticky_doc_date` tinyint(1) DEFAULT '0',
  `startup_tab` varchar(20) NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_users`
--

LOCK TABLES `fl_users` WRITE;
/*!40000 ALTER TABLE `fl_users` DISABLE KEYS */;
INSERT INTO `fl_users` VALUES (1,'admin','83cb26c2c67eb699e8b4ebba8677b583','Administrator',2,'','jflores@codemar.net','es_CL',1,0,1,1,'default','Letter',2,2,4,1,1,0,0,'2014-08-25 08:27:35',10,1,1,'',1,0,'orders',0);
/*!40000 ALTER TABLE `fl_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_voided`
--

DROP TABLE IF EXISTS `fl_voided`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_voided` (
  `type` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  `memo_` tinytext NOT NULL,
  UNIQUE KEY `id` (`type`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_voided`
--

LOCK TABLES `fl_voided` WRITE;
/*!40000 ALTER TABLE `fl_voided` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_voided` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_wo_issue_items`
--

DROP TABLE IF EXISTS `fl_wo_issue_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_wo_issue_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` varchar(40) DEFAULT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `qty_issued` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_wo_issue_items`
--

LOCK TABLES `fl_wo_issue_items` WRITE;
/*!40000 ALTER TABLE `fl_wo_issue_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_wo_issue_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_wo_issues`
--

DROP TABLE IF EXISTS `fl_wo_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_wo_issues` (
  `issue_no` int(11) NOT NULL AUTO_INCREMENT,
  `workorder_id` int(11) NOT NULL DEFAULT '0',
  `reference` varchar(100) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `loc_code` varchar(5) DEFAULT NULL,
  `workcentre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`issue_no`),
  KEY `workorder_id` (`workorder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_wo_issues`
--

LOCK TABLES `fl_wo_issues` WRITE;
/*!40000 ALTER TABLE `fl_wo_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_wo_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_wo_manufacture`
--

DROP TABLE IF EXISTS `fl_wo_manufacture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_wo_manufacture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(100) DEFAULT NULL,
  `workorder_id` int(11) NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  KEY `workorder_id` (`workorder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_wo_manufacture`
--

LOCK TABLES `fl_wo_manufacture` WRITE;
/*!40000 ALTER TABLE `fl_wo_manufacture` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_wo_manufacture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_wo_requirements`
--

DROP TABLE IF EXISTS `fl_wo_requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_wo_requirements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workorder_id` int(11) NOT NULL DEFAULT '0',
  `stock_id` char(20) NOT NULL DEFAULT '',
  `workcentre` int(11) NOT NULL DEFAULT '0',
  `units_req` double NOT NULL DEFAULT '1',
  `std_cost` double NOT NULL DEFAULT '0',
  `loc_code` char(5) NOT NULL DEFAULT '',
  `units_issued` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `workorder_id` (`workorder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_wo_requirements`
--

LOCK TABLES `fl_wo_requirements` WRITE;
/*!40000 ALTER TABLE `fl_wo_requirements` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_wo_requirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_workcentres`
--

DROP TABLE IF EXISTS `fl_workcentres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_workcentres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `description` char(50) NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_workcentres`
--

LOCK TABLES `fl_workcentres` WRITE;
/*!40000 ALTER TABLE `fl_workcentres` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_workcentres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_workorders`
--

DROP TABLE IF EXISTS `fl_workorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fl_workorders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wo_ref` varchar(60) NOT NULL DEFAULT '',
  `loc_code` varchar(5) NOT NULL DEFAULT '',
  `units_reqd` double NOT NULL DEFAULT '1',
  `stock_id` varchar(20) NOT NULL DEFAULT '',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `required_by` date NOT NULL DEFAULT '0000-00-00',
  `released_date` date NOT NULL DEFAULT '0000-00-00',
  `units_issued` double NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `released` tinyint(1) NOT NULL DEFAULT '0',
  `additional_costs` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wo_ref` (`wo_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_workorders`
--

LOCK TABLES `fl_workorders` WRITE;
/*!40000 ALTER TABLE `fl_workorders` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_workorders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-25  9:42:31
