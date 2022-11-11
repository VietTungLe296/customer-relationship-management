DROP DATABASE  IF EXISTS `spring_security_crm_bcrypt`;

CREATE DATABASE  IF NOT EXISTS `spring_security_crm_bcrypt`;
USE `spring_security_crm_bcrypt`;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` char(68) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `users` 
VALUES 
('user','{bcrypt}$2a$12$Zo2ab82kRy7ZGhaHyNXQe.gCds5fNqNazicr6WHiY2h7I7I21yr.G',1),
('admin','{bcrypt}$2a$12$/usI3XMm7DpA/P83O4aIkeg8dw7k7fs6ewHrif91O7BlhzNlm6vqS',1);

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `authorities` 
VALUES 
('user','ROLE_USER'),
('admin','ROLE_ADMIN');


