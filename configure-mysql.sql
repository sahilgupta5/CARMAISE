CREATE USER 'FoodLineTestUser'@'localhost' IDENTIFIED BY 'foodline123!@#';

CREATE DATABASE  IF NOT EXISTS `FoodLineDB` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `FoodLineDB`;

GRANT ALL PRIVILEGES
ON database.FoodLineDB
TO 'FoodLineTestUser'@'localhost'
IDENTIFIED BY 'foodline123!@#';
