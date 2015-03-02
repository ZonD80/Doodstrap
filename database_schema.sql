SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cpa`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--
CREATE TABLE IF NOT EXISTS `logs` (
  `account_id` int(10) unsigned DEFAULT NULL,
  `action` text NOT NULL COMMENT 'action description',
  `data_before` text,
  `data_after` text,
  `added` int(10) unsigned NOT NULL COMMENT 'unix timestamp',
  `type` varchar(255) NOT NULL COMMENT 'type of log',
  `object_id` int(10) unsigned NOT NULL COMMENT 'id of object action applied to',
  `ip` varchar(15) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `post` text NOT NULL,
  `get` text NOT NULL,
  KEY `account_id` (`account_id`,`type`),
  KEY `object_id` (`object_id`),
  KEY `added` (`added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='log admicp actions';


CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID аккаунта',
  `email` varchar(45) DEFAULT NULL,
  `pass_hash` varchar(32) DEFAULT NULL COMMENT 'Хеш пароля\n',
  `pass_salt` varchar(5) DEFAULT NULL COMMENT 'Соль пароля',
  `reset_hash` varchar(32) DEFAULT NULL COMMENT 'Хеш сброса пароля',
  `expired` int(10) DEFAULT NULL COMMENT 'Время отключения аккаунта',
  `name` varchar(255) DEFAULT NULL,
  `lang` varchar(2) DEFAULT NULL COMMENT 'Language code to use',
  `unsubscribed` tinyint(1) DEFAULT NULL COMMENT 'unsubscribed from all emails',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `reset_hash` (`reset_hash`),
  KEY `unsubscribed` (`email`,`unsubscribed`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_configuration`
--

CREATE TABLE IF NOT EXISTS `accounts_configuration` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID конфигурации',
  `account_id` int(11) DEFAULT NULL COMMENT 'ID Аккаунта',
  `name` varchar(45) DEFAULT NULL COMMENT 'Название параметра конфигурации\n',
  `value` text COMMENT 'Значение параметра',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_id` (`account_id`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `lkey` varchar(255) NOT NULL,
  `ltranslate` varchar(2) NOT NULL,
  `lvalue` text NOT NULL,
  UNIQUE KEY `key` (`lkey`,`ltranslate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`lkey`, `ltranslate`, `lvalue`) VALUES
('test', 'en', 'test'),
('test', 'ru', 'Тест');


-- --------------------------------------------------------

--
-- Table structure for table `seorules`
--

CREATE TABLE IF NOT EXISTS `seorules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `script` varchar(100) DEFAULT NULL,
  `parameter` varchar(100) DEFAULT NULL,
  `repl` varchar(255) DEFAULT NULL,
  `unset_params` varchar(255) DEFAULT NULL,
  `sort` int(2) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `script` (`script`,`parameter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

--
-- Dumping data for table `seorules`
--


-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `phpsessid` varchar(32) NOT NULL,
  `ip` varchar(15) DEFAULT NULL COMMENT 'IP адрес',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'ID пользователя',
  `user_agent` varchar(255) DEFAULT NULL COMMENT 'USER_AGENT пользователя',
  `started` int(10) unsigned NOT NULL COMMENT 'UNIX_TIMESTAMP старта сессии',
  PRIMARY KEY (`phpsessid`),
  KEY `started` (`started`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;