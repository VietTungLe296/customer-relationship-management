CREATE DATABASE  IF NOT EXISTS `web_customer_tracker`;
USE `web_customer_tracker`;

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;


--
-- Dumping data for table `customer`
--

INSERT INTO `customer` VALUES 
	(1,'David','Alaba','david@qwe.com'),
	(2,'John','Terry','john@qwe.com'),
	(3,'Ajay','lexis','ajay@qwe.com'),
	(4,'Mary','Jane','mary@qwe.com'),
	(5,'Maxwell','GVA','max@lqwe.com');