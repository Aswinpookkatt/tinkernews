/*
SQLyog Community Edition- MySQL GUI v8.03 
MySQL - 5.6.12-log : Database - tinker_blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`tinker_blog` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `tinker_blog`;

/*Table structure for table `blog` */

DROP TABLE IF EXISTS `blog`;

CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(400) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `urlToImage` varchar(1000) DEFAULT NULL,
  `description` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `blog` */

insert  into `blog`(`id`,`title`,`date`,`urlToImage`,`description`) values (1,'From Newbie to Pro in a Month: A UI Design Challenge Story!','28 May 2020','https://miro.medium.com/max/700/1*woVJAEGKEtEWYos-qfF8QA.jpeg','Harish Kumar is a student of MES College, Marampally, Kerala. At the beginning of April, he was one of the 2.5k applicants of the Learn From Home program. A complete beginner, he rose from newbie status to professional designer in less than a month. Currently, he is a UI Designer at Wanders, an IT firm in Kochi. Let’s ask this talented guy what encouraged him to take up the UI design course and how he created those brilliant designs that were widely appreciated in the social space. Hello, TinkerHub community! Thanks for choosing to tell my story. I am a BCA student at MES College, Marampally. I love illustrating, digital art, sketching, and doodling. I have been drawing since I was 6 — 7 years old. At that age, my cousin was an artist. She was always drawing. And I was curious about her drawings. My first inspiration and learning came from her. It was after twelfth grade that I resumed drawing after a long break. That’s when I got to know that it was possible to draw on a phone or computer — digital art. Since I did not have a computer at the time, I started working on digital art on my phone. Later, a cousin offered me his computer. Then, I started working on digital art in Photoshop. Now I can create illustrations in Photoshop and Illustrator. Towards the end of that project, I fell in love with UI designing. Then I made a Dribbble account to explore designs for inspiration. It’s a great way to learn and grow.'),(2,'Organizing an Online Introduction to Programming Course: The TinkPy Story','1 June 2020','https://miro.medium.com/max/700/1*JuLa0OuMcK9-t4p56al73A.jpeg','In almost all engineering colleges across India and probably everywhere else, students who aren’t familiar with programming languages suffer and struggle in their language classes. Having observed the disparity between the students who already have a computer science background and those who don’t, the MEC Chapter of Tinkerhub Foundation took a step to bridge the gap.TinkPy is a beginner level programming course designed and hosted by TinkerHub MEC. The intended audiences were students in their freshman and sophomore years in Biomedical Engineering and Electrical and Electronics Engineering at Model Engineering College, Kochi. The purpose of the course was to hone their skills in the area of programming. A total of 151 registrations were received and 64 students successfully completed the course. Through effective follow-ups and management, we were able to keep our learners motivated throughout the event. We try to keep the group from being dead and share valuable content. Thus wewrapped up our first fully online dream event, TinkPy. The key to its success was not the initiative but how effective the follow-ups were done by the volunteers and mentors and how much the event was needed by its learners.'),(4,'Full-time Developer by day and Community Builder by night: How Gopikrishnan Juggles Roles while Solving Real-World Problems','28 February 2021','https://miro.medium.com/max/400/1*6c2rxy-5micjjO8xLEIasw.jpeg','When life throws challenges at you, it’s easy to give up, sit back and mourn. But it takes some real courage and determination to fight back and win against all the odds. Do you know what’s more difficult? To keep taking on new challenges and continuously work on making them better. Meet Gopikrishnan Sasikumar. Chapter Lead at TinkerHub RIT, full-time ML engineer at FullContact and Director of Campus Community Relations at TinkerHub Foundation.\n Hi Gopi! Tell us all about yourself! :)\n I like to describe myself as an engineer who believes that my life’s purpose is to solve the world’s problems with the skills I have and the knowledge I acquire. I love sharing knowledge. I took 30+ workshops on Machine Learning and building the skills for the 21st century all across Kerala. This started during my college days, and I still show up for events. I also founded the RIT chapter of TinkerHub.A Few months ago, I co-founded an initiative called KuttyCoders with people at TinkerHub for helping school students learn technology. And now, this is how my life goes: During the day I work at FullContact.com solving machine learning problems. At night I work with TinkerHub team to nurture tech talent.I am not someone who makes long term goals. Currently, I am taking up Projects and initiatives under TinkerHub. I believe that this will help students get started with doing projects and thereby make them employable.');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
