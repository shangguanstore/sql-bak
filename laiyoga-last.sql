-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: LaiYoga
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Account` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `Name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `RecordType` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '瑜伽会所' COMMENT '瑜伽会所、企业客户',
  `Phone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系号码',
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地址',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '该条是否已删除？',
  `OwnerId` int(11) DEFAULT NULL COMMENT '记录的OwnerId',
  `CreatedById` int(11) NOT NULL DEFAULT '0' COMMENT '创建人。系统字段，自动填写',
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。系统字段，自动填写',
  `LastModifiedById` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人。系统字段，自动填写',
  `LastModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间。系统字段，自动填写',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='任何法律实体，例如一家瑜伽馆，一家公司。第1期先不用。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Campaign`
--

DROP TABLE IF EXISTS `Campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Campaign` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `UniqueId` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动的唯一ID，用于定位活动',
  `Name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '活动的名称',
  `Type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动类型：工作坊、公开课、Retreat、户外、静修',
  `HostName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主办方。可以是瑜伽馆，也可以是个人。',
  `IsFreeOfCharge` tinyint(1) NOT NULL DEFAULT '0' COMMENT '该活动是否是免费的活动？1:是 0不是',
  `MaxPerson` int(3) DEFAULT '0' COMMENT '最多允许的人数',
  `SignedUpPerson` int(3) DEFAULT '0' COMMENT '已报名的人数',
  `MinPerson` int(3) DEFAULT '0' COMMENT '最少的人数。少于这个人数自动取消活动。',
  `Description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `Poster` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '海报。保存的是PictureID，多个海报图片用英文逗号隔开。',
  `StartTime` datetime NOT NULL COMMENT '活动开始时间',
  `EndTime` datetime NOT NULL COMMENT '活动结束时间',
  `Location` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '活动地点的名称，例如：Pure Yoga环贸店',
  `Address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '活动的具体地点，例如：上海市上海市徐汇区淮海中路999号',
  `Longitude` decimal(11,7) DEFAULT NULL COMMENT '活动地址的经度',
  `Latitude` decimal(11,7) DEFAULT NULL COMMENT '活动地址的纬度',
  `RegOpenTime` datetime NOT NULL COMMENT '报名开始时间',
  `RegCloseTime` datetime NOT NULL COMMENT '报名开始时间',
  `Status` tinyint(1) DEFAULT '0' COMMENT '活动状态：0草稿、1已发布、2:已开始、3已完成、4已取消',
  `IsHot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '热门活动？',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '该条是否已删除？',
  `OwnerId` int(11) DEFAULT NULL COMMENT '记录的OwnerId',
  `CreatedById` int(11) NOT NULL DEFAULT '0' COMMENT '创建人。系统字段，自动填写',
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。系统字段，自动填写',
  `LastModifiedById` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人。系统字段，自动填写',
  `LastModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间。系统字段，自动填写',
  PRIMARY KEY (`Id`),
  KEY `UniqueIdIndex` (`UniqueId`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='任何一个活动，例如：工作坊、公开课、Retreat、户外、静修等。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Campaign`
--

LOCK TABLES `Campaign` WRITE;
/*!40000 ALTER TABLE `Campaign` DISABLE KEYS */;
INSERT INTO `Campaign` VALUES (169,'fpy3own0xn5dmwa4','2018 第11届亚洲瑜伽大会（AYC）','瑜伽大会','亚洲瑜伽大会有限公司',0,999,2,0,'来瑜伽特价9折，4月底截止！','1','2018-06-07 00:00:00','2018-06-10 23:00:00','','香港会议展览中心',NULL,NULL,'2018-04-14 00:00:00','2018-04-14 00:00:00',1,0,0,NULL,38,'2018-04-02 02:25:51',38,'2018-04-11 02:02:49');
/*!40000 ALTER TABLE `Campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CampaignFeedbackStudent`
--

DROP TABLE IF EXISTS `CampaignFeedbackStudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CampaignFeedbackStudent` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `CampaignId` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '活动的ID 关联UniqueId',
  `ContactId` int(11) NOT NULL COMMENT '填写反馈的User的ContactID',
  `UserId` int(11) DEFAULT NULL COMMENT '填写反馈的User的UserID',
  `AttendedCampaign` tinyint(1) NOT NULL DEFAULT '1' COMMENT '学生是否参加了活动？',
  `OverallRating` tinyint(2) DEFAULT NULL COMMENT '整体满意度：糟糕、一般、很好、推荐',
  `CampaignSummary` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动评价',
  `CampaignPhotos` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动图片。保存的是PictureID，多个图片用英文逗号隔开。',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '该条是否已删除？',
  `OwnerId` int(11) DEFAULT NULL COMMENT '记录的OwnerId',
  `CreatedById` int(11) NOT NULL DEFAULT '0' COMMENT '创建人。系统字段，自动填写',
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。系统字段，自动填写',
  `LastModifiedById` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人。系统字段，自动填写',
  `LastModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间。系统字段，自动填写',
  PRIMARY KEY (`Id`),
  KEY `CampaignIdIndex` (`CampaignId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='活动完成后，学生填写活动的小结。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CampaignFeedbackStudent`
--

LOCK TABLES `CampaignFeedbackStudent` WRITE;
/*!40000 ALTER TABLE `CampaignFeedbackStudent` DISABLE KEYS */;
/*!40000 ALTER TABLE `CampaignFeedbackStudent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CampaignFeedbackTeacher`
--

DROP TABLE IF EXISTS `CampaignFeedbackTeacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CampaignFeedbackTeacher` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `CampaignId` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '活动的ID 关联UniqueId',
  `ContactId` int(11) NOT NULL COMMENT '填写反馈的User的ContactID',
  `UserId` int(11) DEFAULT NULL COMMENT '填写反馈的User的id',
  `CampaignCompleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '活动是否完成？',
  `PlatformRating` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '糟糕、一般、很好、推荐',
  `CampaignSummary` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动小结',
  `CampaignPhotos` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动结束后老师上载的图片，保存的是Picture记录的ID，多个图片用英文逗号隔开。',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '该条是否已删除？',
  `OwnerId` int(11) DEFAULT NULL COMMENT '记录的OwnerId',
  `CreatedById` int(11) NOT NULL DEFAULT '0' COMMENT '创建人。系统字段，自动填写',
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。系统字段，自动填写',
  `LastModifiedById` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人。系统字段，自动填写',
  `LastModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间。系统字段，自动填写',
  PRIMARY KEY (`Id`),
  KEY `CampaignIdIndex` (`CampaignId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='活动完成后，老师填写活动的小结。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CampaignFeedbackTeacher`
--

LOCK TABLES `CampaignFeedbackTeacher` WRITE;
/*!40000 ALTER TABLE `CampaignFeedbackTeacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `CampaignFeedbackTeacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CampaignMember`
--

DROP TABLE IF EXISTS `CampaignMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CampaignMember` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `CampaignUniqueId` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '活动的ID 关联UniqueId',
  `CampaignId` int(11) DEFAULT NULL COMMENT '活动的自增ID',
  `OrderNo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '订单的ID',
  `UserId` int(11) DEFAULT NULL COMMENT '关联的用户ID',
  `ContactId` int(11) NOT NULL COMMENT '报名者User关联的ContactID',
  `Status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1已提交、2已支付、0已取消',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '该条是否已删除？',
  `OwnerId` int(11) DEFAULT NULL COMMENT '记录的OwnerId',
  `CreatedById` int(11) NOT NULL DEFAULT '0' COMMENT '创建人。系统字段，自动填写',
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。系统字段，自动填写',
  `LastModifiedById` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人。系统字段，自动填写',
  `LastModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间。系统字段，自动填写',
  PRIMARY KEY (`Id`),
  KEY `OrderNoIndex` (`CampaignUniqueId`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='活动参与者。每个报名参加Campaign的人。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CampaignMember`
--

LOCK TABLES `CampaignMember` WRITE;
/*!40000 ALTER TABLE `CampaignMember` DISABLE KEYS */;
INSERT INTO `CampaignMember` VALUES (36,'fpy3own0xn5dmwa4',169,'2018040954975410',42,0,1,0,NULL,0,'2018-04-09 07:53:30',0,'2018-04-09 07:53:30'),(38,'fpy3own0xn5dmwa4',169,'2018040954975410',70,0,1,0,NULL,70,'2018-04-09 07:53:30',70,'2018-04-09 07:53:30');
/*!40000 ALTER TABLE `CampaignMember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CampaignShare`
--

DROP TABLE IF EXISTS `CampaignShare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CampaignShare` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `UniqueId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户每在微信端Share一次，前端根据时间戳，加随机串生成这个唯一ID',
  `CampaignId` int(11) NOT NULL COMMENT '活动的ID',
  `ShareFromUserId` int(11) DEFAULT NULL COMMENT '分享者的UserId',
  `ShareMethod` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Wechat、Poster',
  `ShareURL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '分享的URL',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '该条是否已删除？',
  `OwnerId` int(11) DEFAULT NULL COMMENT '记录的OwnerId',
  `CreatedById` int(11) NOT NULL DEFAULT '0' COMMENT '创建人。系统字段，自动填写',
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。系统字段，自动填写',
  `LastModifiedById` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人。系统字段，自动填写',
  `LastModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间。系统字段，自动填写',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `CampaignShareId` (`UniqueId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户分享活动，每次有人打开的时候，写入这张表。第1期先不做。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CampaignShare`
--

LOCK TABLES `CampaignShare` WRITE;
/*!40000 ALTER TABLE `CampaignShare` DISABLE KEYS */;
INSERT INTO `CampaignShare` VALUES (1,'2147483647',169,43,'微信','http://www.hcforce.com:8086//#/campaign/detail/fpy3own0xn5dmwa4/43/15234390981lwevldfj1d',0,NULL,43,'2018-04-11 09:33:17',43,'2018-04-11 09:33:17'),(2,'1523439554rktft2p3gdk',169,43,'微信','http://www.hcforce.com:8086//#/campaign/detail/fpy3own0xn5dmwa4/43/1523439554rktft2p3gdk',0,NULL,43,'2018-04-11 09:39:41',43,'2018-04-11 09:39:41'),(3,'osu3sficx4',169,43,'微信','http://www.hcforce.com:8086//#/campaign/detail/fpy3own0xn5dmwa4/43/osu3sficx4',0,NULL,43,'2018-04-11 09:42:38',43,'2018-04-11 09:42:38'),(4,'1523439832nyg5231m9kf',169,43,'微信','http://www.hcforce.com:8086//#/campaign/detail/fpy3own0xn5dmwa4/43/1523439832nyg5231m9kf',0,NULL,43,'2018-04-11 09:44:32',43,'2018-04-11 09:44:32'),(5,'1523443948qbc79xiwmin',169,43,'微信','http://www.hcforce.com//#/campaign/detail/fpy3own0xn5dmwa4/43/1523443948qbc79xiwmin',0,NULL,43,'2018-04-11 10:53:01',43,'2018-04-11 10:53:01'),(6,'1523445047zlia7wcdcw9',169,43,'微信','http://www.hcforce.com//#/campaign/detail/fpy3own0xn5dmwa4/43/1523445047zlia7wcdcw9',0,NULL,43,'2018-04-11 11:10:55',43,'2018-04-11 11:10:55'),(7,'1523445706je25oyp4zs',169,41,'微信','http://www.hcforce.com//#/campaign/detail/fpy3own0xn5dmwa4/41/1523445706je25oyp4zs',0,NULL,41,'2018-04-11 11:22:42',41,'2018-04-11 11:22:42'),(11,'1523446769mgv9ts7ylm',169,43,'微信','http://www.hcforce.com//#/campaign/detail/fpy3own0xn5dmwa4/43/1523446769mgv9ts7ylm',0,NULL,43,'2018-04-11 11:40:05',43,'2018-04-11 11:40:05'),(13,'1523446845dtdwpktjsyt',169,43,'微信','http://www.hcforce.com//#/campaign/detail/fpy3own0xn5dmwa4/43/1523446845dtdwpktjsyt',0,NULL,43,'2018-04-11 11:40:52',43,'2018-04-11 11:40:52'),(14,'1523446864g3g4rrq6kqu',169,43,'微信','http://www.hcforce.com//#/campaign/detail/fpy3own0xn5dmwa4/43/1523446864g3g4rrq6kqu',0,NULL,43,'2018-04-11 11:41:11',43,'2018-04-11 11:41:11'),(15,'1523447045x5xiieoq829',169,41,'微信','http://www.hcforce.com//#/campaign/detail/fpy3own0xn5dmwa4/41/1523447045x5xiieoq829',0,NULL,41,'2018-04-11 11:44:17',41,'2018-04-11 11:44:17'),(16,'1523447151n56xkamkf3h',169,43,'微信','http://www.hcforce.com//#/campaign/detail/fpy3own0xn5dmwa4/43/1523447151n56xkamkf3h',0,NULL,43,'2018-04-11 11:45:58',43,'2018-04-11 11:45:58'),(18,'1523449260ro5v3h0s1gd',169,39,'微信','http://www.hcforce.com//#/campaign/detail/fpy3own0xn5dmwa4/39/1523449260ro5v3h0s1gd',0,NULL,39,'2018-04-11 12:21:15',39,'2018-04-11 12:21:15'),(19,'1523449346btm24hstny',169,41,'微信','http://www.hcforce.com//#/campaign/detail/fpy3own0xn5dmwa4/41/1523449346btm24hstny',0,NULL,41,'2018-04-11 12:22:43',41,'2018-04-11 12:22:43'),(20,'1523450992ktr2t4z4vm',169,43,'微信','http://www.hcforce.com//#/campaign/detail/fpy3own0xn5dmwa4/43/1523450992ktr2t4z4vm',0,NULL,43,'2018-04-11 12:50:13',43,'2018-04-11 12:50:13'),(21,'1523527175gd2ss70irk8',169,38,'微信','http://www.hcforce.com//#/campaign/detail/fpy3own0xn5dmwa4/38/1523527175gd2ss70irk8',0,NULL,38,'2018-04-12 09:59:46',38,'2018-04-12 09:59:46'),(22,'1523537300fvu0ch0ldeu',169,40,'微信','http://www.hcforce.com//#/campaign/detail/fpy3own0xn5dmwa4/40/1523537300fvu0ch0ldeu',0,NULL,40,'2018-04-12 12:48:24',40,'2018-04-12 12:48:24'),(23,'1523619812lohpzr2oiz',169,43,'微信','http://www.hcforce.com//#/campaign/detail/fpy3own0xn5dmwa4/43/1523619812lohpzr2oiz',0,NULL,43,'2018-04-13 11:45:53',43,'2018-04-13 11:45:53'),(24,'1523620314vb9irn5vps',169,40,'微信','http://www.hcforce.com//#/campaign/detail/fpy3own0xn5dmwa4/40/1523620314vb9irn5vps',0,NULL,40,'2018-04-13 11:52:06',40,'2018-04-13 11:52:06'),(25,'1523672068hwl6kflg2ks',169,64,'微信','http://www.hcforce.com//#/campaign/detail/fpy3own0xn5dmwa4/64/1523672068hwl6kflg2ks',0,NULL,64,'2018-04-14 02:14:44',64,'2018-04-14 02:14:44'),(26,'1523672309av5xuqsizg',169,64,'微信','http://www.hcforce.com//#/campaign/detail/fpy3own0xn5dmwa4/64/1523672309av5xuqsizg',0,NULL,64,'2018-04-14 02:18:37',64,'2018-04-14 02:18:37');
/*!40000 ALTER TABLE `CampaignShare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CampaignShareReceiver`
--

DROP TABLE IF EXISTS `CampaignShareReceiver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CampaignShareReceiver` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `CampaignShareId` int(11) NOT NULL COMMENT 'CampaignShare表的Id',
  `CampaignId` int(11) NOT NULL COMMENT '活动的ID',
  `ShareFromUserId` int(11) DEFAULT NULL COMMENT '分享者的UserId',
  `ShareToUserId` int(11) DEFAULT NULL COMMENT '打开分享链接者的UserId',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '该条是否已删除？',
  `OwnerId` int(11) DEFAULT NULL COMMENT '记录的OwnerId',
  `CreatedById` int(11) NOT NULL DEFAULT '0' COMMENT '创建人。系统字段，自动填写',
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。系统字段，自动填写',
  `LastModifiedById` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人。系统字段，自动填写',
  `LastModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间。系统字段，自动填写',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户分享活动，每次有人打开的时候，写入这张表。第1期先不做。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CampaignShareReceiver`
--

LOCK TABLES `CampaignShareReceiver` WRITE;
/*!40000 ALTER TABLE `CampaignShareReceiver` DISABLE KEYS */;
INSERT INTO `CampaignShareReceiver` VALUES (1,0,169,43,43,0,NULL,43,'2018-04-11 10:29:21',43,'2018-04-11 10:29:21'),(2,0,169,43,43,0,NULL,43,'2018-04-11 10:31:05',43,'2018-04-11 10:31:05'),(3,0,169,43,43,0,NULL,43,'2018-04-11 10:31:40',43,'2018-04-11 10:31:40'),(4,0,169,43,43,0,NULL,43,'2018-04-11 10:32:18',43,'2018-04-11 10:32:18'),(5,0,169,43,43,0,NULL,43,'2018-04-11 10:34:54',43,'2018-04-11 10:34:54'),(6,4,169,43,43,0,NULL,43,'2018-04-11 10:39:40',43,'2018-04-11 10:39:40'),(7,5,169,43,43,0,NULL,43,'2018-04-11 10:53:12',43,'2018-04-11 10:53:12'),(8,5,169,43,43,0,NULL,43,'2018-04-11 11:00:56',43,'2018-04-11 11:00:56'),(9,5,169,43,43,0,NULL,43,'2018-04-11 11:01:14',43,'2018-04-11 11:01:14'),(10,6,169,43,43,0,NULL,43,'2018-04-11 11:11:07',43,'2018-04-11 11:11:07'),(11,16,169,43,41,0,NULL,41,'2018-04-11 11:46:13',41,'2018-04-11 11:46:13'),(12,16,169,43,43,0,NULL,43,'2018-04-11 11:49:27',43,'2018-04-11 11:49:27'),(13,18,169,39,39,0,NULL,39,'2018-04-11 12:21:22',39,'2018-04-11 12:21:22'),(14,20,169,43,64,0,NULL,64,'2018-04-11 12:52:12',64,'2018-04-11 12:52:12'),(15,20,169,43,64,0,NULL,64,'2018-04-11 12:52:22',64,'2018-04-11 12:52:22'),(16,20,169,43,64,0,NULL,64,'2018-04-11 12:52:51',64,'2018-04-11 12:52:51'),(17,21,169,38,38,0,NULL,38,'2018-04-12 10:00:11',38,'2018-04-12 10:00:11'),(18,23,169,43,43,0,NULL,43,'2018-04-13 11:46:14',43,'2018-04-13 11:46:14'),(19,23,169,43,43,0,NULL,43,'2018-04-13 11:46:46',43,'2018-04-13 11:46:46'),(20,24,169,40,40,0,NULL,40,'2018-04-13 11:52:32',40,'2018-04-13 11:52:32'),(21,24,169,40,40,0,NULL,40,'2018-04-13 11:54:22',40,'2018-04-13 11:54:22'),(22,24,169,40,40,0,NULL,40,'2018-04-13 11:54:39',40,'2018-04-13 11:54:39'),(23,24,169,40,40,0,NULL,40,'2018-04-13 12:47:05',40,'2018-04-13 12:47:05');
/*!40000 ALTER TABLE `CampaignShareReceiver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contact`
--

DROP TABLE IF EXISTS `Contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contact` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `Name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `AccountId` int(11) DEFAULT '0' COMMENT '客户ID',
  `Mobile` int(11) DEFAULT '0' COMMENT '用户手机',
  `Email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '邮箱',
  `Sex` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '未知' COMMENT '男、女、未知',
  `Birthday` date DEFAULT NULL COMMENT '生日',
  `HomeAddress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '家庭住宅',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '该条是否已删除？',
  `OwnerId` int(11) DEFAULT NULL COMMENT '记录的OwnerId',
  `CreatedById` int(11) NOT NULL DEFAULT '0' COMMENT '创建人。系统字段，自动填写',
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。系统字段，自动填写',
  `LastModifiedById` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人。系统字段，自动填写',
  `LastModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间。系统字段，自动填写',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户数据。每个用户注册时，自动帮他生成一个联系人记录。我们也可以批量导入联系人。如果这是一个集团客户，那么需要关联到Account表。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contact`
--

LOCK TABLES `Contact` WRITE;
/*!40000 ALTER TABLE `Contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `Contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DiscountCode`
--

DROP TABLE IF EXISTS `DiscountCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DiscountCode` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `DiscountName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '优惠码的名称',
  `DiscountCode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '优惠码',
  `CampaignId` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '活动Id',
  `AssignedToUserId` int(11) DEFAULT NULL COMMENT '这张优惠码分配给了哪个用户？',
  `DiscountType` tinyint(1) NOT NULL DEFAULT '1' COMMENT '优惠方式：1优惠金额、2优惠折扣、3免费',
  `DiscountAmount` decimal(16,2) DEFAULT '0.00' COMMENT '优惠金额',
  `DiscountPercent` decimal(2,1) DEFAULT '0.0' COMMENT '优惠折扣。保存的是例如 9、8.8、7.5 这样的数字。',
  `MaxUsage` int(9) NOT NULL DEFAULT '1' COMMENT '限制使用的次数',
  `UsedCount` int(9) DEFAULT '0' COMMENT '已使用次数',
  `StartTime` datetime NOT NULL COMMENT '开始时间',
  `EndTime` datetime NOT NULL COMMENT '结束时间',
  `Status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '优惠码状态：0:未激活 1已激活',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '该条是否已删除？',
  `OwnerId` int(11) DEFAULT NULL COMMENT '记录的OwnerId',
  `CreatedById` int(11) NOT NULL DEFAULT '0' COMMENT '创建人。系统字段，自动填写',
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。系统字段，自动填写',
  `LastModifiedById` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人。系统字段，自动填写',
  `LastModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间。系统字段，自动填写',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `DiscountCodeUnique` (`DiscountCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='优惠码，每个活动可以创建一个或者多个优惠码。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DiscountCode`
--

LOCK TABLES `DiscountCode` WRITE;
/*!40000 ALTER TABLE `DiscountCode` DISABLE KEYS */;
/*!40000 ALTER TABLE `DiscountCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `File`
--

DROP TABLE IF EXISTS `File`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `File` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `FileOriginalTitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '上载图片时它本来的名称',
  `FileSystemTitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '系统给每张上载的图片生成一个唯一的名称',
  `FileType` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '活动海报、老师小结图片、学生小结图片、老师代言海报、学生代言海报',
  `FilePath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片在服务器上的路径',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '该条是否已删除？',
  `OwnerId` int(11) DEFAULT NULL COMMENT '记录的OwnerId',
  `CreatedById` int(11) NOT NULL DEFAULT '0' COMMENT '创建人。系统字段，自动填写',
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。系统字段，自动填写',
  `LastModifiedById` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人。系统字段，自动填写',
  `LastModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间。系统字段，自动填写',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='每次用户上载图片，都保存在这张表里。例如：活动海报、老师小结图片、学生小结图片、老师代言海报、学生代言海报';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `File`
--

LOCK TABLES `File` WRITE;
/*!40000 ALTER TABLE `File` DISABLE KEYS */;
INSERT INTO `File` VALUES (1,'','','1','upload/file_5ac19358b4af08.66905552.jpeg',0,NULL,38,'2018-04-02 02:20:08',38,'2018-04-02 02:20:08');
/*!40000 ALTER TABLE `File` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `OrderNo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `ContactId` int(11) unsigned NOT NULL COMMENT '购票人',
  `UserId` int(11) DEFAULT NULL COMMENT '购票 userID',
  `ShareFromUserId` int(11) DEFAULT NULL COMMENT '是由于哪个用户分享了活动而买单的？',
  `CampaignId` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动Unique ID',
  `OrderStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '订单状态：1已提交、2已支付、0已取消',
  `TicketId` int(11) unsigned NOT NULL COMMENT '门票',
  `TicketPrice` decimal(16,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '门票价格',
  `TicketQty` int(3) unsigned NOT NULL DEFAULT '1' COMMENT '门票数量',
  `TotalAmount` decimal(16,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `ClassBundle` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'AYC专用：A、B、C、D',
  `DiscountCodeId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠码',
  `DiscountAmount` decimal(16,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  `PayableAmount` decimal(16,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '应付金额',
  `PaidAmount` decimal(16,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '实付金额',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '该条是否已删除？',
  `OwnerId` int(11) DEFAULT NULL COMMENT '记录的OwnerId',
  `CreatedById` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建人。系统字段，自动填写',
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。系统字段，自动填写',
  `LastModifiedById` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新人。系统字段，自动填写',
  `LastModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间。系统字段，自动填写',
  `Email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户邮箱',
  `Username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '真实姓名',
  `Currency_unit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '货币单位',
  `taocan` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '套餐',
  PRIMARY KEY (`Id`),
  KEY `OrderNoIndex` (`OrderNo`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单。用户报名参加Campaign，产生一条Order记录。我们先不弄订单行，因为每次只能购买一张门票，就放在订单头上。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (1,'2018040299100561',0,42,NULL,'fpy3own0xn5dmwa4',1,6,3899.00,1,3899.00,NULL,0,0.00,3899.00,0.00,0,NULL,42,'2018-04-02 02:33:00',42,'2018-04-02 02:33:00','106681855@qq.com','孙玮珉','HK$','1'),(2,'2018040255100515',0,39,NULL,'fpy3own0xn5dmwa4',1,6,3899.00,1,3899.00,NULL,0,0.00,3899.00,0.00,0,NULL,39,'2018-04-02 02:33:11',39,'2018-04-02 02:33:11','jianqing.shan@hcforce.cn','单鉴清','HK$','4'),(3,'2018040250551004',0,39,NULL,'fpy3own0xn5dmwa4',1,6,3899.00,1,3899.00,NULL,0,0.00,3899.00,0.00,0,NULL,39,'2018-04-02 02:34:58',39,'2018-04-02 02:34:58','jianqing.shan@hcforce.com','单鉴清','HK$','1'),(4,'2018040452509854',0,44,NULL,'fpy3own0xn5dmwa4',1,8,3509.10,1,3509.10,NULL,0,0.00,3509.10,0.00,0,NULL,44,'2018-04-04 14:30:12',44,'2018-04-04 14:30:12','1210307558@qq.com','zpp','HK$',''),(5,'2018040499519898',0,44,NULL,'fpy3own0xn5dmwa4',1,8,3509.10,1,3509.10,NULL,0,0.00,3509.10,0.00,0,NULL,44,'2018-04-04 14:41:48',44,'2018-04-04 14:41:48','1210307558@qq.com','zpp','HK$',''),(6,'2018040454975352',0,44,NULL,'fpy3own0xn5dmwa4',1,8,3510.00,1,3510.00,NULL,0,0.00,3510.00,0.00,0,NULL,44,'2018-04-04 14:43:34',44,'2018-04-04 14:43:34','1210307558@qq.com','zpp','HK$',''),(7,'2018040454504810',0,42,NULL,'fpy3own0xn5dmwa4',1,8,3510.00,1,3510.00,NULL,0,0.00,3510.00,0.00,0,NULL,42,'2018-04-04 14:50:46',42,'2018-04-04 14:50:46','106681855@qq.com','153','HK$','2'),(8,'2018040457541005',0,40,NULL,'fpy3own0xn5dmwa4',1,8,3510.00,1,3510.00,NULL,0,0.00,3510.00,0.00,0,NULL,40,'2018-04-04 14:57:45',40,'2018-04-04 14:57:45','68451109@qq.com','陈思捷','HK$','1'),(9,'2018040852545054',0,42,NULL,'fpy3own0xn5dmwa4',1,8,3510.00,1,3510.00,NULL,0,0.00,3510.00,0.00,0,NULL,42,'2018-04-08 08:45:56',42,'2018-04-08 08:45:56','106681855@qq.com','414','HK$','1'),(10,'2018040810110057',0,43,NULL,'fpy3own0xn5dmwa4',1,7,4164.15,1,4164.15,NULL,0,0.00,4164.15,0.00,0,NULL,43,'2018-04-08 13:00:14',43,'2018-04-08 13:00:14','','','',''),(11,'2018040897511005',0,43,NULL,'fpy3own0xn5dmwa4',1,7,4164.15,1,4164.15,NULL,0,0.00,4164.15,0.00,0,NULL,43,'2018-04-08 14:10:34',43,'2018-04-08 14:10:34','','','',''),(12,'2018040851515056',0,43,NULL,'fpy3own0xn5dmwa4',1,7,4164.15,1,4164.15,NULL,0,0.00,4164.15,0.00,0,NULL,43,'2018-04-08 14:11:47',43,'2018-04-08 14:11:47','','','',''),(13,'2018040954975410',0,42,NULL,'fpy3own0xn5dmwa4',2,8,3510.00,1,3510.00,NULL,0,0.00,3510.00,0.00,0,NULL,42,'2018-04-09 07:51:34',42,'2018-04-09 15:53:30','106681855@qq.com','孙玮珉','HK$','2'),(14,'2018040950505552',0,43,NULL,'fpy3own0xn5dmwa4',1,7,4164.15,1,4164.15,NULL,0,0.00,4164.15,0.00,0,NULL,43,'2018-04-09 10:08:50',43,'2018-04-09 10:08:50','','','',''),(15,'2018040997481025',0,43,NULL,'fpy3own0xn5dmwa4',1,7,4164.15,1,4164.15,NULL,0,0.00,4164.15,0.00,0,NULL,43,'2018-04-09 11:12:58',43,'2018-04-09 11:12:58','','','',''),(16,'2018040953559748',0,43,43,'fpy3own0xn5dmwa4',1,7,4164.15,1,4164.15,NULL,0,0.00,4164.15,0.00,0,NULL,43,'2018-04-09 11:40:37',43,'2018-04-09 11:40:37','','','',''),(17,'2018041150561029',0,43,0,'fpy3own0xn5dmwa4',1,8,3510.00,1,3510.00,NULL,0,0.00,3510.00,0.00,0,NULL,43,'2018-04-10 17:39:30',43,'2018-04-10 17:39:30','1375304121@qq.com','qia','HK$',''),(18,'2018041148515449',0,41,0,'fpy3own0xn5dmwa4',1,8,3510.00,1,3510.00,NULL,0,0.00,3510.00,0.00,0,NULL,41,'2018-04-10 17:39:44',41,'2018-04-10 17:39:44','y@y.com','yin','HK$','1'),(19,'2018041148529954',0,41,0,'fpy3own0xn5dmwa4',1,8,3510.00,1,3510.00,NULL,0,0.00,3510.00,0.00,0,NULL,41,'2018-04-10 17:41:20',41,'2018-04-10 17:41:20','y@y.com','ui','HK$','1'),(20,'2018041150535098',0,41,0,'fpy3own0xn5dmwa4',1,8,3510.00,1,3510.00,NULL,0,0.00,3510.00,0.00,0,NULL,41,'2018-04-10 17:43:14',41,'2018-04-10 17:43:14','w@yy.com','yin','HK$','1'),(21,'2018041197489956',0,43,0,'fpy3own0xn5dmwa4',1,8,3510.00,1,3510.00,NULL,0,0.00,3510.00,0.00,0,NULL,43,'2018-04-10 17:45:30',43,'2018-04-10 17:45:30','1375304121@qq.com','qia','HK$',''),(22,'2018041157505651',0,41,0,'fpy3own0xn5dmwa4',1,8,3510.00,1,3510.00,NULL,0,0.00,3510.00,0.00,0,NULL,41,'2018-04-10 17:46:01',41,'2018-04-10 17:46:01','y@q.com','yin','HK$','1'),(23,'2018041110010149',0,43,0,'fpy3own0xn5dmwa4',1,8,3510.00,1,3510.00,NULL,0,0.00,3510.00,0.00,0,NULL,43,'2018-04-10 17:51:41',43,'2018-04-10 17:51:41','1375304121@qq.com','qia','HK$',''),(24,'2018041155559852',0,41,0,'fpy3own0xn5dmwa4',1,8,3510.00,1,3510.00,NULL,0,0.00,3510.00,0.00,0,NULL,41,'2018-04-10 17:52:55',41,'2018-04-10 17:52:55','jj@jj.com','uu','HK$','1'),(25,'2018041110198574',0,41,0,'fpy3own0xn5dmwa4',2,8,1.00,1,1.00,NULL,0,0.00,1.00,0.00,0,NULL,41,'2018-04-10 18:02:38',41,'2018-04-11 02:02:49','uh@qq.cim','uu','HK$','1'),(26,'2018041110197985',0,41,0,'fpy3own0xn5dmwa4',1,8,3510.00,1,3510.00,NULL,0,0.00,3510.00,0.00,0,NULL,41,'2018-04-10 18:05:50',41,'2018-04-10 18:05:50','tedt@trs.com','ui','HK$','1'),(27,'2018041152525151',0,43,0,'fpy3own0xn5dmwa4',1,8,3510.00,1,3510.00,NULL,0,0.00,3510.00,0.00,0,NULL,43,'2018-04-11 10:53:56',43,'2018-04-11 10:53:56','1375304121@qq.com','qia','HK$',''),(28,'2018041150549850',0,43,43,'fpy3own0xn5dmwa4',1,8,3510.00,1,3510.00,NULL,0,0.00,3510.00,0.00,0,NULL,43,'2018-04-11 11:12:02',43,'2018-04-11 11:12:02','1375304121@qq.com','qia','HK$',''),(29,'2018041399995310',0,43,43,'fpy3own0xn5dmwa4',1,8,3510.00,1,3510.00,NULL,0,0.00,3510.00,0.00,0,NULL,43,'2018-04-13 11:47:40',43,'2018-04-13 11:47:40','1375304121@qq.com','qia','HK$',''),(30,'2018041351515610',0,40,40,'fpy3own0xn5dmwa4',1,8,3510.00,1,3510.00,NULL,0,0.00,3510.00,0.00,0,NULL,40,'2018-04-13 11:53:07',40,'2018-04-13 11:53:07','68451109@qq.com','chensj','HK$','1'),(31,'2018041354974810',0,40,40,'fpy3own0xn5dmwa4',1,8,3510.00,1,3510.00,NULL,0,0.00,3510.00,0.00,0,NULL,40,'2018-04-13 12:47:34',40,'2018-04-13 12:47:34','68451109@qq.com','chensj','HK$','1'),(32,'2018041354975410',0,70,NULL,'fpy3own0xn5dmwa4',2,8,3510.00,1,3510.00,NULL,0,0.00,3510.00,0.00,0,NULL,70,'2018-04-14 13:34:30',70,'2018-04-14 13:34:30','lanley@163.com','许晓兰','HK$','3');
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TeacherApplication`
--

DROP TABLE IF EXISTS `TeacherApplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TeacherApplication` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `ContactId` int(11) NOT NULL DEFAULT '0' COMMENT '老师的ID',
  `SubmittedTime` datetime NOT NULL COMMENT '用户提交申请的时间',
  `ApprovalTime` datetime NOT NULL COMMENT '后台批复的时间。批准或者拒绝的时间。',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批时填写的备注',
  `Status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '已提交' COMMENT '老师申请的状态：已提交、已批准、已拒绝',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '该条是否已删除？',
  `OwnerId` int(11) NOT NULL COMMENT '记录的OwnerId',
  `CreatedById` int(11) NOT NULL DEFAULT '0' COMMENT '创建人。系统字段，自动填写',
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。系统字段，自动填写',
  `LastModifiedById` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人。系统字段，自动填写',
  `LastModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间。系统字段，自动填写',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用来保存申请成为老师的请求。用户每次提交，如果没有“已提交”的记录，那么就生成一条TecherApplication记录。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TeacherApplication`
--

LOCK TABLES `TeacherApplication` WRITE;
/*!40000 ALTER TABLE `TeacherApplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `TeacherApplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ticket`
--

DROP TABLE IF EXISTS `Ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ticket` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `Name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '门票名称',
  `CampaignId` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Campaign的ID',
  `Price` decimal(16,2) DEFAULT NULL COMMENT '价格',
  `StartTime` datetime NOT NULL COMMENT '门票开始时间',
  `EndTime` datetime NOT NULL COMMENT '门票结束时间',
  `Status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '1已生效、0已取消',
  `AndDiscountCode` tinyint(1) DEFAULT '0' COMMENT '是否和优惠券一起使用',
  `Level` tinyint(2) DEFAULT '1' COMMENT '首先使用的价格如早鸟价格 越大越优先',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '该条是否已删除？',
  `OwnerId` int(11) DEFAULT NULL COMMENT '记录的OwnerId',
  `CreatedById` int(11) NOT NULL DEFAULT '0' COMMENT '创建人。系统字段，自动填写',
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。系统字段，自动填写',
  `LastModifiedById` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人。系统字段，自动填写',
  `LastModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间。系统字段，自动填写',
  `Currency` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '货币种类',
  `Currency_unit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '货币标识',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='活动门票。一个Campaign可以创建多种门票，例如：早鸟票、正常票。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ticket`
--

LOCK TABLES `Ticket` WRITE;
/*!40000 ALTER TABLE `Ticket` DISABLE KEYS */;
INSERT INTO `Ticket` VALUES (1,'','fpy3own0xn5dmwa4',4899.00,'2018-04-02 00:00:00','2018-04-30 23:59:00','1',0,1,1,NULL,38,'2018-04-02 02:25:51',38,'2018-04-02 10:57:02','HKD','HK$'),(2,'','fpy3own0xn5dmwa4',3899.00,'2018-04-02 00:00:00','2018-04-30 23:59:00','1',0,2,1,NULL,38,'2018-04-02 02:25:51',38,'2018-04-02 10:57:02','HKD','HK$'),(3,'','fpy3own0xn5dmwa4',4899.00,'2018-04-02 00:00:00','2018-04-30 23:59:00','1',0,1,1,NULL,38,'2018-04-02 02:27:23',38,'2018-04-02 10:57:02','CNY','￥'),(4,'','fpy3own0xn5dmwa4',3899.00,'2018-04-02 00:00:00','2018-04-30 23:59:00','1',0,1,1,NULL,38,'2018-04-02 02:27:23',38,'2018-04-02 10:57:02','CNY','￥'),(5,'','fpy3own0xn5dmwa4',4899.00,'2018-04-02 00:00:00','2018-06-04 00:00:00','1',0,1,1,NULL,38,'2018-04-02 02:28:27',38,'2018-04-02 10:57:02','HKD','HK$'),(6,'','fpy3own0xn5dmwa4',3899.00,'2018-04-02 00:00:00','2018-04-30 23:59:00','1',0,1,1,NULL,38,'2018-04-02 02:28:27',38,'2018-04-02 10:57:02','HKD','HK$'),(7,'','fpy3own0xn5dmwa4',4164.15,'2018-04-02 10:56:00','2018-06-04 00:00:00','1',0,1,0,NULL,38,'2018-04-02 02:57:02',38,'2018-04-02 02:57:02','HKD','HK$'),(8,'','fpy3own0xn5dmwa4',3510.00,'2018-04-02 00:00:00','2018-04-30 23:59:00','1',0,1,0,NULL,38,'2018-04-02 02:57:02',38,'2018-04-02 02:57:02','HKD','HK$');
/*!40000 ALTER TABLE `Ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `Name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户姓名',
  `Nickname` varchar(255) CHARACTER SET utf32 NOT NULL COMMENT '为每个用户生成一个密码，需要先加密然后再保存。',
  `Username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '登陆账户名，直接用记录的ID。',
  `Password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '为每个用户生成一个密码，需要先加密然后再保存。',
  `Mobile` bigint(11) DEFAULT '0' COMMENT '用户手机',
  `Email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '邮箱',
  `Avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户头像URL',
  `WeChatOpenID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '微信OpenID，为了识别用户，每个用户针对每个公众号会产生一个安全的OpenID',
  `ContactID` int(11) DEFAULT '0' COMMENT '用户关联的Contact记录',
  `AccountID` int(11) DEFAULT '0' COMMENT '用户关联的Account记录',
  `UserType` tinyint(2) DEFAULT '1' COMMENT '1：老师；2:学生 ',
  `IsActive` tinyint(1) DEFAULT '1' COMMENT '1:激活状态 0：封号',
  `IsAxamine` tinyint(1) DEFAULT '0' COMMENT '1：已审核 0：未审核',
  `CreatedById` int(11) DEFAULT '0' COMMENT '创建人。系统字段，自动填写',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。系统字段，自动填写',
  `LastModifiedById` int(11) DEFAULT '0' COMMENT '最后更新人。系统字段，自动填写',
  `LastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间。系统字段，自动填写',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='一个可以登陆系统的账号，用户注册时自动创建。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (38,'','克里斯','18621800675','',18621800675,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ2y6sic9738mcseBt8Oic3KYhfzqia2MNibr28e7KeeJRFDfxFJ1W75cD5zjvXwaicWp5hL4pzFVGmdfw/132','oJ0s61XioJaJT3eLaL2e35wn73Ns',0,0,1,1,1,0,'2018-04-02 02:16:36',0,'2018-04-02 10:17:07'),(39,'','劳伦斯单','18616388542','',18616388542,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJaj4TKicQ7XP6UxtHRzVGiadAhPRiaS58u1tiajox0BPZIX45sPiaz3n5dU3St4icSK79aFju2giaFkZ4UQ/132','oJ0s61Q13cfAMSkrvRUhjnfu_zLM',0,0,2,1,0,0,'2018-04-02 02:30:48',0,'2018-04-02 10:31:56'),(40,'','Agnes思捷','15618682392','',15618682392,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIXCryra2G4usswWSYx5vXHxQ1okR5TiawZT7jcnwfVWnqADOca334F4waRQk42nNvMSsBcHyzNvxg/132','oJ0s61Yyng_e3lzemevuABdQmzzs',0,0,2,1,0,0,'2018-04-02 02:30:57',0,'2018-04-02 10:31:19'),(41,'','yin','18018508579','',18018508579,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoOI3an8I5NeubAIZB8icSXN8zutbTLAm3vUDG5PMEThgPdj3y2V3SFmKe788bYXQ0iapHNHmKAmpNQ/132','oJ0s61cJpuZERlwpY4ACSzlHcpls',0,0,2,1,0,0,'2018-04-02 02:31:17',0,'2018-04-05 11:31:23'),(42,'','chris','18621348222','',18621348222,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/DbodtJCsibzYxsovy0JNujicEnrxCONMu3DQbicBYFeGKODOd1P493MibDdUqIdC93xwA2TfURibiaqQiay4DicMOX7rdg/132','oJ0s61aAbJONwmsRP5JxF0pRkxTw',0,0,2,1,0,0,'2018-04-02 02:31:30',0,'2018-04-02 10:32:01'),(44,'','张朋鹏','17701810917','',17701810917,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJq7d6MqlepFyY56HicJMvDvSPODC5VyibNzJyaHUiaIFZmxwXv1AWzALulyj1vE39x53Oo5yNxzKuEQ/132','oJ0s61RR8QbMGfqNaSc7mWYLGrvU',0,0,1,1,0,0,'2018-04-04 11:05:31',0,'2018-04-04 19:19:17'),(45,'','衡衡????','','',0,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLyqNCfTibibKTQjmuxfq1pXsy3Sib3gNWe0bacibY6BOuWbn8vofryxvtcHvy61OmT6wvYq4927AxxJw/132','oJ0s61fBKNGkpv7GL5RWrbC1Y_KQ',0,0,1,1,0,0,'2018-04-06 15:37:09',0,'2018-04-06 15:37:09'),(46,'','Arron','','',0,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/J7EkkRBVRYh1SU8DaEqtjyQsXDJCco7eLZnxicKJuvm1kN1tWp7nZfty2DcA7OMwFNMLziaHBVUEN9TkzlCJsPAQ/132','oJ0s61f9wbM3y2jQ7UPWNXIjokls',0,0,1,1,0,0,'2018-04-08 08:00:11',0,'2018-04-08 08:00:11'),(47,'','sharon','13817877198','',13817877198,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIT4zpMD4GDPib2yRZQlKM0LY6rxWcUk5Sp5DGc8CTnPwNCRAzxo9SnWzX8zcDIiao8tTT23GzcfvxQ/132','oJ0s61WNe2zoY6HLW2kiT85FP1dY',0,0,2,1,0,0,'2018-04-09 05:20:32',0,'2018-04-09 13:21:21'),(48,'','xu jing','','',0,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKsg8IJLwibvy2SdcGTTWz2omx0cxw6EZ4HgNGugM0Zvnv3rAoIYyuDQjEm8BYianJw0aAdH3ic9QDGg/132','oJ0s61cnx0L-5ddpVUiYqTbQIFO0',0,0,1,1,0,0,'2018-04-09 05:46:49',0,'2018-04-09 05:46:49'),(49,'','开心果','','',0,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI3aENaB9MC6ibdF5sfXMjsBSnvCdwIHx3byibhdaCsmPa02bBKr5W4EL6V4v9Lzu4BcTibs67yyTOnw/132','oJ0s61ZJKjRAaEir9pYEZMWWQr_c',0,0,1,1,0,0,'2018-04-09 05:50:44',0,'2018-04-09 05:50:44'),(50,'','Jane','','',0,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/TFBXqibkMic1OutnSKCPpNiaywImIcOCRwGZORP6tIfUsmh4uQ6ScGlH3661Q83wnqZoJcgX0icAIvo5lL86IcS4HQ/132','oJ0s61Rnbg9j19QZatiW8MrL3GVs',0,0,1,1,0,0,'2018-04-09 05:56:22',0,'2018-04-09 05:56:22'),(51,'','静走远行','','',0,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqsazAQX8POZxuskn0HUPnSlI6XoKR4jibjbCkLku7STXwhsJMwo0jULtsZ8mhNL96kF5WJekqQ2dw/132','oJ0s61SDrqk8tmMIaXaz0FfOGMwY',0,0,1,1,0,0,'2018-04-09 07:27:42',0,'2018-04-09 07:27:42'),(52,'','晔 QianYe','','',0,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKu2WTp5t6eAkJjeuOxxXFc9RRdXhsDkaUInK4pfOicb28v9XkI4Nic7icBXHeqGyAQtU8Ffo1tj0NYw/132','oJ0s61ZRQDLs3V3SdUPvPXlIv6MY',0,0,1,1,0,0,'2018-04-09 08:40:45',0,'2018-04-09 08:40:45'),(53,'','Sofìa J','','',0,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKicoGPPHz6eGHef1cgEVUI2IJ11UW2hfTd6n26lnb9gMY8BoLogETjZfB1WPhicMtdk94mVgiaHxbWA/132','oJ0s61QnAHjhg-Xn6HO7TSruQPgI',0,0,1,1,0,0,'2018-04-09 14:43:25',0,'2018-04-09 14:43:25'),(54,'','孟俊含','','',0,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eop27u0FGTeHh5GuZvuMdRTFJ2AnnB3gagK6ELjIbzA52EicIM7hk3rOSmxrL93Y0QVLrudvdRRbCQ/132','oJ0s61TFhAztzfJYL6rev4gTo76k',0,0,1,1,0,0,'2018-04-10 02:52:00',0,'2018-04-10 02:52:00'),(55,'','左空','','',0,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83epc3JN3lz6aGlBtibwzecqyfzia5I1wC1g7icSBYcyHm3aOUqzibg6oZsPXwxEZLL6soOXprBjp2bXQCQ/132','oJ0s61TipkAF3VbkmhVlxe36hcfI',0,0,1,1,0,0,'2018-04-10 05:30:17',0,'2018-04-10 05:30:17'),(56,'','alo','13030686986','',13030686986,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83epuhIPKClSaJffxtAD51ic9R8h10WOgyQhNMry5WuwTb32GyErHzbvgic528vbOIP4VGjrCSlp2uJKA/132','oJ0s61XLQFROnM1y0Y8BrLwQJDhA',0,0,2,1,0,0,'2018-04-10 05:36:26',0,'2018-04-10 13:37:07'),(57,'','一朵白白的五花肉','','',0,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTISnvarVE24ibRWN7ygc3Go1d8B9ccOYYIkKAMmlswRRwaBCuV5L7MSzcPXdPkuMTbNkIyEl5Qg3Ag/132','oJ0s61SUAknfKUtTOlSLwQFTSBtA',0,0,1,1,0,0,'2018-04-10 08:37:18',0,'2018-04-10 08:37:18'),(58,'','yin','','',0,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/KQibUwtAbGgb9PnMn1KUj0x2H2d0Jo0PHKh2fFAKEf45WWw2EA20iafGg5R1m09rLDOJ6qmFMCOF4PcrtyicBhRyw/132','oJ0s61Yi0wLKCi189MNn9kKnm5IQ',0,0,1,1,0,0,'2018-04-10 17:37:27',0,'2018-04-10 17:37:27'),(59,'','LILITH','13059351759','',13059351759,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ9ZwVugUvaibxkv2tuNibLyvDtr5ibjsTQ0A0cTEx8YqVvfN8ShTia1nnycuTPVES3QSS1XJOuMAmbEQ/132','oJ0s61RcSDrlvi2JRm98cgFJrIPg',0,0,2,1,0,0,'2018-04-11 01:19:40',0,'2018-04-11 09:20:16'),(60,'','不要说话','17712874616','',17712874616,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTInXBJc2XxIveU3n0Dc0AdGDtxFsfwbBS12Hgria2J1O9jvKAiaugVJ67rKuYADibibOw3ibmPMKxMLcxA/132','oJ0s61VJaZu7KdfkSZbMFyVO9bZA',0,0,2,1,0,0,'2018-04-11 04:46:06',0,'2018-04-11 12:46:34'),(61,'','赵腊腊','18913398700','',18913398700,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/HU41dc2k1MgCMohvPumxLG0RfxvY60q7Z0z2X0B5o8EmPtglpxX2lPmhnpv22r976DiavbnDib0adn49cEjgnc9A/132','oJ0s61Xfg8Au5zmPDFmdcltl9pS0',0,0,2,1,0,0,'2018-04-11 08:04:28',0,'2018-04-11 16:05:33'),(62,'','拼命以求','','',0,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/Yx0WxvW5Y4GN100nIzg1UDoKAEzA1oHOY3hjMA9zZoATXqn0m43GibqGH01c2owaibYiaeBwbeQyLpLtN7v5GbCtA/132','oJ0s61Uh4AF84y7qNZVEmwJ9zfqc',0,0,1,1,0,0,'2018-04-11 08:14:56',0,'2018-04-11 08:14:56'),(63,'','太保沈小芳','','',0,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/bnEEEZKUNIibRJxWj8bR5nKLryCWXgvs5wErHgOZQftxZ8onnq67n3EazcnX6qMrtibfEBdibfXglibvDFyI1vSTIQ/132','oJ0s61TxVLupwxOoun-jRLMSU8O4',0,0,1,1,0,0,'2018-04-11 11:31:23',0,'2018-04-11 11:31:23'),(64,'','A-卉子','18652805930','',18652805930,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoN51Ga7ichsE5wGRibm22VNOjOkuQvMAicjWvXjYgczSAqtY6n7tz6Hl3ibOyzlcE1rSIVHg2lW35ZXg/132','oJ0s61QcPGaN-I4OPC21fy2Qpa28',0,0,2,1,0,0,'2018-04-11 12:50:56',0,'2018-04-11 20:51:30'),(65,'','小螃蟹????','','',0,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqWIum50p3GUyodib9YHQPKGjXVfxpZlS0XoTLibCich6HuqDV0Emg2xMZvpRqhCp78O1su3HDkQCk9Q/132','oJ0s61ZTCTg4cTBZw5UtKJaM0Cm4',0,0,1,1,0,0,'2018-04-12 12:51:37',0,'2018-04-12 12:51:37'),(66,'','小豫','','',0,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKLiciav6lzCAlLOCaIT2BEay54tFPaLF5HVepFC72xicahhd8L6FFsibiaXDFicYjQhHCzj4t4iaZJUHFpw/132','oJ0s61UIjX_oCn78xV-pC2es5psM',0,0,1,1,0,0,'2018-04-13 06:34:15',0,'2018-04-13 06:34:15'),(67,'','希韵瑜伽 ॐ希子','','',0,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIpbXlweEHmcw353acPqbn6qzGXvI9zW6iaITib0xZIr9ibVZFlRHEowIcaGJougBcGEpNdUGlo9oAGw/132','oJ0s61Q7RSpqS7wyd7x9OGae1T_w',0,0,1,1,0,0,'2018-04-13 07:49:33',0,'2018-04-13 07:49:33'),(68,'','巢 Chow','13482652828','',13482652828,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJq695diamJibibLic7J7EFtwQwOHybDiboFCkngVYp20F6yul8KzKl43FfcVebwliajL6NsxbDbKB7O8Hw/132','oJ0s61dyxy6GBoDMEhdXy_OZD7mY',0,0,2,1,0,0,'2018-04-13 08:19:20',0,'2018-04-13 16:21:11'),(69,'','私人教练-晓雪','18641222131','',18641222131,'0','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eribrYpImIyQ4L0dYVZyoAQvSbczUQwDz3HWSfKn9YEB66By6pRnZJyEfk3IQkLoLroy3jJlfO65bg/132','oJ0s61YQxc0tj8zR8N1ik6rFkrwg',0,0,2,1,0,0,'2018-04-13 10:19:24',0,'2018-04-13 18:19:45'),(70,'','','13701811755','',13701811755,'0','','oJ0s61cHEqqfwVtBPoe9zoYXDgsI',0,0,2,1,0,0,'2018-04-13 11:35:27',70,'2018-04-14 12:37:17'),(71,'','','','',0,'0','','oJ0s61ePr4_d2kHLVXJV29QidcbU',0,0,1,1,0,0,'2018-04-13 15:09:07',0,'2018-04-13 15:09:07'),(72,'','','','',0,'0','','oJ0s61VI4oKGnG0sOg4s1E7oL-jc',0,0,1,1,0,0,'2018-04-13 17:09:58',0,'2018-04-13 17:09:58'),(73,'','','','',0,'0','','oJ0s61RTywFa5CXd9brdHH7WW9Q8',0,0,1,1,0,0,'2018-04-14 04:16:20',0,'2018-04-14 04:16:20'),(74,'','','15955146800','',15955146800,'0','','oJ0s61V3tm29QoAXTyNflASOgl74',0,0,2,1,0,0,'2018-04-14 04:22:05',74,'2018-04-14 12:22:34'),(75,'','','','',0,'0','','oJ0s61QRO3k3k218hJOmUniHLJzk',0,0,1,1,0,0,'2018-04-14 05:59:42',0,'2018-04-14 05:59:42'),(76,'','','','',0,'0','','oJ0s61ZlWkK6KmFxH_GnSODB6UmY',0,0,1,1,0,0,'2018-04-14 07:29:46',0,'2018-04-14 07:29:46');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-17 12:29:02
