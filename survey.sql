/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.62 : Database - survey
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`survey` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `survey`;

/*Table structure for table `papers` */

DROP TABLE IF EXISTS `papers`;

CREATE TABLE `papers` (
  `paperId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `paperTitle` varchar(100) DEFAULT NULL,
  `paperSummary` varchar(300) DEFAULT NULL,
  `paperStartDate` datetime DEFAULT NULL,
  `paperEndDate` datetime DEFAULT NULL,
  `paperBg` varchar(255) DEFAULT NULL,
  `paperType` int(11) DEFAULT NULL,
  `paperStatus` int(11) DEFAULT NULL,
  `paperCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`paperId`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `papers` */

insert  into `papers`(`paperId`,`userId`,`paperTitle`,`paperSummary`,`paperStartDate`,`paperEndDate`,`paperBg`,`paperType`,`paperStatus`,`paperCount`) values (11,2,'当今NBA第一人是谁？','NBA的趋势','2018-09-06 18:33:12','2018-10-06 18:33:12','img/4.jpg',2,0,0),(12,2,'海贼王好看吗？','动漫','2018-09-06 19:10:57','2018-10-06 19:10:57','img/3.jpg',4,0,0),(13,2,'华为好用吗？','找靓机','2018-09-06 19:18:18','2018-10-06 19:18:18','img/5.jpg',5,0,0),(14,3,'我现在在什么队','nba','2018-09-06 19:21:28','2018-10-06 19:21:28','img/1.jpg',4,0,0),(15,2,'费德勒天王 ','网球','2018-09-06 20:38:17','2018-10-06 20:38:17','img/2.jpg',2,0,0),(16,2,'你好','问候','2018-09-06 21:05:16','2018-10-06 21:05:16','img/7.jpg',3,0,0),(17,2,'天为什么是蓝色的？','问答','2018-09-06 21:07:08','2018-10-06 21:07:08','img/8.jpg',2,0,0),(19,2,'软件','software','2018-09-08 15:05:28','2018-10-08 15:05:28','/D:/????/eclipse/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SurveySystem/img/1.jpg',1,0,0),(20,2,'阿甘正传','他的奔跑人生','2018-09-08 15:11:08','2018-10-08 15:11:08','img/11.jpg',1,0,0),(21,2,'55','55','2018-09-08 15:44:11','2018-10-08 15:44:11','img/10.jpg',1,0,0),(22,2,'你好','詹姆斯','2018-09-08 16:42:42','2018-10-08 16:42:42','img/5.jpg',6,0,0),(23,2,'55','5igikgohjkh','2018-09-08 18:26:08','2018-10-08 18:26:08','img/12.jpg',4,0,0),(24,2,'1','1','2018-09-09 11:27:25','2018-10-09 11:27:25','img/1.jpg',1,0,0),(25,2,'1','1','2018-09-09 11:28:26','2018-10-09 11:28:26','img/1.jpg',1,0,0),(26,2,'2','2','2018-09-09 11:30:47','2018-10-09 11:30:47','img/1.jpg',1,0,0),(27,2,'7','7','2018-09-09 11:40:50','2018-10-09 11:40:50','img/1.jpg',1,0,0),(28,2,'谷歌','android更新','2018-09-12 09:34:21','2018-10-12 09:34:21','img/11.jpg',2,0,0);

/*Table structure for table `questions` */

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `qstId` int(11) NOT NULL AUTO_INCREMENT,
  `paperId` int(11) DEFAULT NULL,
  `qstType` int(11) DEFAULT NULL,
  `qstTitle` varchar(100) DEFAULT NULL,
  `qstOption` varchar(1000) DEFAULT NULL,
  `qstAnswer` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`qstId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `questions` */

insert  into `questions`(`qstId`,`paperId`,`qstType`,`qstTitle`,`qstOption`,`qstAnswer`) values (5,11,1,'NBA第一人？','詹姆斯哈登#维斯布鲁克#勒布朗詹姆斯#凯文杜兰特','0&0&0&0'),(6,11,2,'NBA大结局了吗？','','0&0&0&0'),(7,12,1,'橡皮人是谁？','妮可罗宾#布鲁克#蒙奇D路飞#孙悟空','0&0&0&0'),(8,13,1,'全球销量第一是什么手机？','apple#sangsung#huawei#blackbarry','0&0&0&0'),(9,14,1,'我现在在什么队？','湖人#火箭#骑士#热火','0&0&0&0'),(10,15,1,'费德勒获得冠军最多的大满贯最多的赛事是哪一项？','澳网#温网#法网#美网','0&0&0&0'),(11,15,2,'费德勒是谁？','','0&0&0&0'),(12,16,1,'你好吗？','我很好#你也很好#他也很好#她也很好','0&0&0&0'),(13,17,1,'天是蓝色的？','红#绿#蓝#白','0&0&0&0'),(14,0,1,'什么是软件测试？','我爱#番茄#炒#蛋','0&0&0&0'),(15,18,1,'4','4#4#4#4','0&0&0&0'),(16,19,1,'软件的发展史是什么？','我爱#tomatoes#and#eggs','0&0&0&0'),(17,19,2,'测试概论的具体？','','0&0&0&0'),(18,20,1,'阿甘正传主演是谁？','汤姆汉克斯#汤姆克鲁斯#小罗伯特唐尼#孙悟空','0&0&0&0'),(19,20,2,'结局是什么？','','0&0&0&0'),(20,21,1,'5','5#5#5#5','0&0&0&0'),(21,22,1,'com','ad#ga#gaf#gaf','0&0&0&0'),(22,23,1,'hjhjhbj','jbkb#kjbk#bkjk#bkj','0&0&0&0'),(23,23,2,'falghaoghaog','','0&0&0&0'),(24,25,1,'1','1#1#1#1','0&0&0&0'),(25,25,1,'1','1#1#1#1','0&0&0&0');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(40) DEFAULT NULL,
  `userPassword` varchar(40) DEFAULT NULL,
  `userIcon` varchar(40) DEFAULT 'default_icon.png',
  `userMail` varchar(40) DEFAULT NULL,
  `userReg` datetime DEFAULT NULL,
  `userSex` int(11) DEFAULT NULL,
  `userRole` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`userId`,`userName`,`userPassword`,`userIcon`,`userMail`,`userReg`,`userSex`,`userRole`) values (1,'admin','admin','admin.png','admin@singlex.net','2018-08-12 12:12:12',1,0),(2,'smile','111','default_icon.png','11111111@qq.com','2018-09-05 17:26:05',1,1),(3,'james','111','default_icon.png','king@qq.com','2018-09-06 18:22:41',1,1),(4,'xiu','111','default_icon.png','jinxiu@qq.com','2018-09-06 19:04:46',1,1),(5,'apple','111','default_icon.png','apple@gmail.com','2018-09-08 14:32:13',1,1),(6,'huang','123','default_icon.png','245898344@qq.com','2018-12-26 00:12:23',1,1),(7,'lebron','123','default_icon.png','0852666173@qq.com','2018-12-26 21:14:34',1,1),(8,'one','123','default_icon.png','13432929676@qq.com','2018-12-26 21:28:55',1,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
