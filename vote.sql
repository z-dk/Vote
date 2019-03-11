/*
SQLyog v10.2 
MySQL - 5.7.21-log : Database - vote
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`vote` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `vote`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_name` varchar(255) NOT NULL,
  `ad_password` varchar(255) NOT NULL,
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`ad_id`,`ad_name`,`ad_password`) values (2,'zdk','1111'),(3,'admin','1234');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_password` varchar(16) NOT NULL,
  `phone_num` bigint(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`user_password`,`phone_num`) values (1,'邱明刚','123456',13356295928),(2,'朱登奎','1553510',15535105531),(3,'亓达吉','111111',15535105531),(4,'克白芍','1234',15535105531),(5,'司马懿','1234',15535105531),(6,'司徒凯','1111',15535105531),(7,'user01','111111',15535105531),(9,'欧阳达文','111111',15535105531),(10,'1507084236','123456',15535105531),(12,'qwerty','111111',13342424123),(14,'user03','1111111',13278612342),(15,'111111','123456',13411111111);

/*Table structure for table `user_vote` */

DROP TABLE IF EXISTS `user_vote`;

CREATE TABLE `user_vote` (
  `vote_id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_name` varchar(255) NOT NULL,
  `vote_brief` varchar(255) DEFAULT NULL,
  `u_id` int(11) NOT NULL,
  `vote_type` int(11) NOT NULL DEFAULT '1' COMMENT '投票类型，允许选几个',
  `start_time` datetime DEFAULT NULL COMMENT '投票创建时间',
  `end_time` datetime DEFAULT NULL COMMENT '投票结束时间',
  PRIMARY KEY (`vote_id`),
  KEY `user` (`u_id`),
  CONSTRAINT `user` FOREIGN KEY (`u_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

/*Data for the table `user_vote` */

insert  into `user_vote`(`vote_id`,`vote_name`,`vote_brief`,`u_id`,`vote_type`,`start_time`,`end_time`) values (2,'请选择以下你认为正确的答案','测试用例',7,1,'2018-08-16 15:40:13','2018-11-01 17:19:00'),(8,'平安建行标兵','你心目中的标兵',1,1,'2018-08-16 17:19:04','2018-11-01 17:23:16'),(9,'乌兰察布优秀辅警','交警辅警评选',2,1,'2018-08-16 17:19:09','2018-11-01 17:23:10'),(10,'寻找乡村振兴新青年','优秀青年',7,1,'2018-08-16 17:19:12','2018-11-01 17:23:05'),(11,'最美小区','文明小区评选',3,1,'2018-08-16 17:19:15','2018-11-01 17:23:00'),(12,'最美医生','最佳白衣天使',7,1,'2018-08-16 17:19:18','2018-11-01 17:22:54'),(13,'爱岗敬业新青年','杰出青年代表',4,1,'2018-08-16 17:19:27','2018-11-01 17:22:48'),(14,'先进个人','优秀个人评选',4,1,'2018-08-16 17:19:30','2018-11-01 17:22:39'),(15,'太原楷模（网络投票）','好人',5,1,'2018-08-16 17:19:33','2018-11-01 17:22:34'),(16,'优秀品牌','好口碑',7,1,'2018-08-16 17:19:40','2018-11-01 17:22:28'),(17,'最美护士','杰出护士',5,1,'2018-08-16 17:19:37','2018-11-01 17:22:23'),(18,'社会治安先进工作者','爱岗敬业',7,1,'2018-08-16 17:20:28','2018-11-01 17:22:16'),(19,'好声音评选','好声音',5,1,'2018-08-16 17:20:31','2018-11-01 17:22:10'),(20,'最佳作文','作文评选',5,3,'2018-08-16 17:20:34','2018-11-01 17:22:05'),(21,'最佳代言人','电视代言评选',6,1,'2018-08-16 17:20:40','2018-11-01 17:22:00'),(22,'少儿主持人选拔','主持人评选',7,1,'2018-08-16 17:20:44','2018-11-01 17:21:54'),(23,'最美教师','教师评选',6,1,'2018-08-16 17:20:48','2018-11-01 17:21:48'),(25,'欧阳先生的投票','投票测试用例',9,2,'2018-09-10 15:35:35','2018-09-30 00:00:35'),(29,'第五次','阿道夫',9,1,'2018-09-10 22:40:14','2018-09-30 00:00:14'),(30,'911','2018',9,1,'2018-09-11 15:12:23','2018-09-30 00:00:23'),(31,'“美丽邯郸·最美环保卫士”评选','美丽邯郸',7,1,'2018-09-11 17:07:07','2018-09-30 17:07:10'),(32,'青阳县首届“十大法治人物”网络投票','网络投票',1,1,'2018-09-11 17:08:13','2018-09-30 17:08:16'),(33,'“青春点赞十九大，不忘初心跟党走”','摄影比赛',5,1,'2018-09-11 17:09:48','2018-09-30 17:09:50'),(36,'中国椅子原创设计大赛','网络投票',9,1,'2018-09-11 17:12:39','2018-09-30 17:12:41'),(37,'我的qwert','我的投票二',12,1,'2018-09-15 15:22:26','2018-09-22 15:22:26'),(41,'第六次','',2,1,'2018-09-20 09:51:41','2018-09-27 09:51:41');

/*Table structure for table `user_voted_option` */

DROP TABLE IF EXISTS `user_voted_option`;

CREATE TABLE `user_voted_option` (
  `voted_id` int(11) NOT NULL AUTO_INCREMENT,
  `limit_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`voted_id`),
  KEY `limit` (`limit_id`),
  KEY `voted_option` (`option_id`),
  CONSTRAINT `limit` FOREIGN KEY (`limit_id`) REFERENCES `vote_limit` (`id`),
  CONSTRAINT `voted_option` FOREIGN KEY (`option_id`) REFERENCES `vote_option` (`op_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `user_voted_option` */

insert  into `user_voted_option`(`voted_id`,`limit_id`,`option_id`) values (2,2,124),(4,4,119),(5,5,146),(6,6,127),(7,7,143),(8,8,135),(9,9,116),(10,10,119),(11,11,141),(12,12,216),(13,13,154),(14,14,185),(15,14,186),(16,14,187),(22,20,117),(23,21,143),(24,22,166);

/*Table structure for table `vote_limit` */

DROP TABLE IF EXISTS `vote_limit`;

CREATE TABLE `vote_limit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `vote_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`user_id`),
  KEY `voteid` (`vote_id`),
  CONSTRAINT `userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `voteid` FOREIGN KEY (`vote_id`) REFERENCES `user_vote` (`vote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `vote_limit` */

insert  into `vote_limit`(`id`,`user_id`,`vote_id`) values (2,7,9),(4,9,8),(5,9,13),(6,9,9),(7,9,12),(8,9,11),(9,7,2),(10,7,8),(11,7,12),(12,7,30),(13,7,14),(14,7,20),(20,12,2),(21,12,12),(22,2,17);

/*Table structure for table `vote_option` */

DROP TABLE IF EXISTS `vote_option`;

CREATE TABLE `vote_option` (
  `op_id` int(11) NOT NULL AUTO_INCREMENT,
  `op_name` varchar(255) NOT NULL,
  `op_total` int(11) DEFAULT '0',
  `v_id` int(11) NOT NULL,
  `op_brief` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`op_id`),
  KEY `vote-option` (`v_id`),
  CONSTRAINT `vote-option` FOREIGN KEY (`v_id`) REFERENCES `user_vote` (`vote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8;

/*Data for the table `vote_option` */

insert  into `vote_option`(`op_id`,`op_name`,`op_total`,`v_id`,`op_brief`) values (116,'B选项',1,2,'234'),(117,'C选项',1,2,'345'),(118,'工号1001',0,8,'叶冠源'),(119,'工号1002',2,8,'张恭庆'),(120,'工号1003',1,8,'罗益锋'),(121,'工号1004',0,8,'英若诚'),(122,'警号1101',0,9,'廖琪瑛'),(123,'警号1102',0,9,'艾敬'),(124,'警号1103',1,9,'谭晶'),(125,'警号1104',0,9,'高天骐'),(126,'警号1105',1,9,'江一燕'),(127,'警号1106',1,9,'梁荣忠'),(128,'警号1107',0,9,'赵阳'),(129,'警号1108',0,9,'杨一展'),(130,'警号1109',0,9,'潘安邦'),(131,'王光英',0,10,NULL),(132,'王贵明',0,10,NULL),(133,'王曾敬',0,10,NULL),(134,'申月明',0,10,NULL),(135,'林肯公园',1,11,NULL),(136,'亚太新城',0,11,NULL),(137,'蓝馨花园',0,11,NULL),(138,'翠新苑',1,11,NULL),(139,'刘建章',0,12,NULL),(140,'刘航鹰',0,12,NULL),(141,'李瑞环',1,12,NULL),(142,'吴咏诗',0,12,NULL),(143,'吴　振',2,12,NULL),(144,'张柏峰',0,13,NULL),(145,'郑振妙',0,13,NULL),(146,'陈德丰',1,13,NULL),(147,'陈皓东',0,13,NULL),(148,'杨竞衡',0,13,NULL),(149,'杨溥臣',1,13,NULL),(150,'杨戊辰',0,14,NULL),(151,'朱兆芳',0,14,NULL),(152,'乔维熊',0,14,NULL),(153,'赵克正',0,14,NULL),(154,'赵陆一',1,14,NULL),(155,'姚　峻',0,15,NULL),(156,'蔡超群',0,15,NULL),(157,'穆祥友',0,15,NULL),(158,'潘义清',0,15,NULL),(159,'缪主恩',0,15,NULL),(160,'CCTV',0,16,NULL),(161,'华为',0,16,NULL),(162,'阿里巴巴',0,16,NULL),(163,'腾讯',0,16,NULL),(164,'百度',0,16,NULL),(165,'张秀珍',0,17,NULL),(166,'林兰英',1,17,NULL),(167,'林　雨',0,17,NULL),(168,'赵燕侠',0,17,NULL),(169,'耿玉玲',0,17,NULL),(170,'浦洁修',0,17,NULL),(171,'董新菊',0,17,NULL),(172,'雷洁琼',0,17,NULL),(173,'倪志福',0,18,NULL),(174,'黄子云',0,18,NULL),(175,'赵紫阳',0,18,NULL),(176,'陈丁茂',0,18,NULL),(177,'彭　真',0,18,NULL),(178,'黄英夫',0,18,NULL),(179,'李会元',0,19,NULL),(180,'李瑜铭',0,19,NULL),(181,'杨士惠',0,19,NULL),(182,'王碧霖',0,19,NULL),(183,'王汉斌',0,19,NULL),(184,'陈伦芬',0,19,NULL),(185,'无法释怀',1,20,'作者：赵炳南'),(186,'得而复失',1,20,'作者：张腾霄'),(187,'一转身是永别',1,20,'作者：刘渡舟'),(188,'走丢的小女孩',0,20,'作者：刘　达'),(189,'熟悉的味道',0,20,'作者：孙建勋'),(190,'春风',0,20,'作者：朱维林'),(191,'秋之感伤',0,20,'作者：张万雨'),(192,'后来的我们',0,20,'作者：陈伦芬'),(193,'苏醒',0,20,'作者：季羡林'),(194,'等待',0,20,'作者：周冠五'),(195,'家书',0,20,'作者：雷洁琼'),(196,'丁义朋',0,21,NULL),(197,'王连柱',0,21,NULL),(198,'王明启',0,21,NULL),(199,'杨进山',0,21,NULL),(200,'李　锋',0,21,NULL),(201,'刘宗耀',0,21,NULL),(202,'王昌汉',0,21,NULL),(203,'杜静波',0,22,NULL),(204,'尹秀春',0,22,NULL),(205,'刘兆果',0,22,NULL),(206,'田益兰',0,22,NULL),(207,'邓先灿',0,22,NULL),(208,'李　琦',0,23,NULL),(209,'马志杰',0,23,NULL),(210,'安俊英',0,23,NULL),(211,'孙　湘',0,23,NULL),(212,'杨振兴',0,23,NULL),(213,'孙志奇',0,23,NULL),(214,'孙树桓',0,23,NULL),(215,'A',0,30,''),(216,'1',1,30,''),(217,'2',0,30,''),(218,'4',0,30,''),(219,'D选项第二次第三次',1,2,'123'),(220,'A选项',0,2,'111'),(225,'A一个选项',0,29,'尽量身体那就覅偶是'),(226,'B选项点击',0,29,'飞机司法实例方式就'),(227,'伺服电机',0,29,NULL),(228,'啊覅是否觉得我',0,29,'是否'),(229,'胡四分',0,2,NULL),(238,'李伟',1,31,NULL),(239,'万继静',0,31,NULL),(240,'1微软',0,37,''),(241,'2',0,37,''),(242,'3',0,37,''),(243,'4',0,37,''),(256,'12',0,41,''),(257,'123',0,41,''),(258,'122',0,41,''),(259,'1232',0,41,'');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
