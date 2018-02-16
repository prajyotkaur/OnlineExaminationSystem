-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.51b-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema exam
--

CREATE DATABASE IF NOT EXISTS exam;
USE exam;

--
-- Definition of table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `QuestionId` int(10) unsigned NOT NULL auto_increment,
  `QuestionText` varchar(500) NOT NULL,
  `OptionA` varchar(200) NOT NULL,
  `OptionB` varchar(200) NOT NULL,
  `OptionC` varchar(200) NOT NULL,
  `OptionD` varchar(200) NOT NULL,
  `CorrectAnswer` varchar(1) NOT NULL,
  `Subject` varchar(45) NOT NULL,
  `DifficultyLevel` varchar(45) NOT NULL,
  PRIMARY KEY  (`QuestionId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`QuestionId`,`QuestionText`,`OptionA`,`OptionB`,`OptionC`,`OptionD`,`CorrectAnswer`,`Subject`,`DifficultyLevel`) VALUES 
 (1,'Which language is connected with the term WORA','Java','C#','VB.Net','VC++','A','IT','Beginner'),
 (2,'Which of the following is not an RDBMS?','SAP','Derby','SQLite','Sybase','A','IT','Beginner'),
 (3,'Who is the CEO of Microsoft?','Bill Gates','Steve Ballmer','Larry Ellison','Steve Jobs','B','IT','Beginner'),
 (4,'Which of the following is not a Mobile Platform?','Android','Symbian','iOS','Azure','D','IT','Beginner'),
 (5,'The IP Address in IPv6 consists of ____ Bytes','6','8','12','16','D','IT','Beginner'),
 (6,'The Base 10 number 65535 is represented in Hexadecimal as','0xFF','0xFFF','0xFFFF','0xFFFFF','C','IT','Beginner'),
 (7,'Which of the following disk drive does not have moving parts','IDE','SCSI','SATA','Solid State','D','IT','Beginner'),
 (8,'The complement of 1  (i.e. ~1) will result in','0','-1','-2','65534','C','IT','Beginner'),
 (9,'Android is','Language','Platform','Script','Database','B','IT','Beginner'),
 (10,'Which of the following in not a Box technique for software testing','Black Box','Grey Box','Blue Box','White Box','C','IT','Beginner');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;


--
-- Definition of table `reports`
--

DROP TABLE IF EXISTS `reports`;
CREATE TABLE `reports` (
  `ReportId` int(10) unsigned NOT NULL auto_increment,
  `UserId` varchar(45) NOT NULL,
  `UserName` varchar(60) NOT NULL,
  `ExamDate` varchar(45) NOT NULL,
  `Subject` varchar(45) NOT NULL,
  `Level` varchar(45) NOT NULL,
  `TotalQuestions` varchar(45) NOT NULL,
  `CorrectQuestions` varchar(45) NOT NULL,
  `Score` varchar(45) NOT NULL,
  PRIMARY KEY  (`ReportId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reports`
--

/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;


--
-- Definition of table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `Subject` varchar(45) NOT NULL,
  PRIMARY KEY  (`Subject`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` (`Subject`) VALUES 
 ('C#.Net'),
 ('IT'),
 ('Java'),
 ('PHP'),
 ('SQL');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `UserId` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  PRIMARY KEY  (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`FirstName`,`LastName`,`UserId`,`Password`) VALUES 
 ('Nagendra','Dhagarra','admin','abcd');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
