
CREATE DATABASE IF NOT EXISTS `base`
USE `base`;


-- Export de la structure de table base. contacts
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

INSERT INTO `contacts` (`id`, `firstname`, `lastname`, `email`) VALUES
	(1, 'David', 'Caranouga', 'david.caranouga@gmail.com'),
	(2, 'Mathieu', 'Grassouillet', 'mathieu.grassouillet@gmail.com'),
	(3, 'Francine', 'Agatot', 'francine.agatot@gmail.com');
