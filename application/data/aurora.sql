-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 09, 2012 at 09:34 PM
-- Server version: 5.5.9
-- PHP Version: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `aurora`
--

-- --------------------------------------------------------

--
-- Table structure for table `appSettings`
--

DROP TABLE IF EXISTS `appSettings`;
CREATE TABLE IF NOT EXISTS `appSettings` (
  `variable` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `settingType` tinytext NOT NULL,
  KEY `variable` (`variable`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `appSettings`
--

INSERT INTO `appSettings` VALUES('allowTags', '<h1>,<h2>,<h3>,<h4>,<h5>,<h6>,<hr>', 'Textarea');
INSERT INTO `appSettings` VALUES('enableCaptcha', '1', 'Checkbox');
INSERT INTO `appSettings` VALUES('recaptchaPrivateKey', '6Lewcs0SAAAAADCeIUYYuiHBWemBpQ5FkuI_cK7H', 'Textarea');
INSERT INTO `appSettings` VALUES('recaptchaPublicKey', '6Lewcs0SAAAAAGfBkJsG1mxf-yGFUjq9JgglSwRL', 'Textarea');
INSERT INTO `appSettings` VALUES('seoKeyWords', 'Dirextion Inc, Dxcore, Php, Development, MySQL', 'Textarea');
INSERT INTO `appSettings` VALUES('siteName', 'Aurora CMS', 'Text');
INSERT INTO `appSettings` VALUES('webMasterEmail', 'noreply@dirextion.com', 'Text');
INSERT INTO `appSettings` VALUES('remoteLicenseKey', 'SingleDomain18446aad51de8a3a596b594c3fcca5d137cf8c34', 'Textarea');
INSERT INTO `appSettings` VALUES('siteEmail', 'jsmith@dirextion.com', 'Text');
INSERT INTO `appSettings` VALUES('enableMobileSupport', '0', 'CheckBox');
INSERT INTO `appSettings` VALUES('seoDescription', 'Custom CMS', 'Textarea');
INSERT INTO `appSettings` VALUES('facebookAppId', '431812843521907', 'Text');
INSERT INTO `appSettings` VALUES('facebookAppSecret', 'd86702c59bd48f3a76bc57d923cd237e', 'Text');
INSERT INTO `appSettings` VALUES('enableFbPageLink', '1', 'CheckBox');
INSERT INTO `appSettings` VALUES('enableFbOpenGraph', '0', 'Checkbox');
INSERT INTO `appSettings` VALUES('sessionLength', '86400', 'Text');
INSERT INTO `appSettings` VALUES('showOnlineList', '1', 'Checkbox');
INSERT INTO `appSettings` VALUES('enableLogging', '1', 'Checkbox');

-- --------------------------------------------------------

--
-- Table structure for table `installedModules`
--

DROP TABLE IF EXISTS `installedModules`;
CREATE TABLE IF NOT EXISTS `installedModules` (
  `moduleId` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `nameSpace` varchar(255) NOT NULL,
  `publicName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`moduleId`),
  UNIQUE KEY `name` (`name`,`nameSpace`),
  KEY `publicName` (`publicName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `installedModules`
--

INSERT INTO `installedModules` VALUES(1, 'admin', 'Admin_', 'Admin Area');
INSERT INTO `installedModules` VALUES(2, 'user', 'User_', NULL);
INSERT INTO `installedModules` VALUES(3, 'pages', 'Pages_', NULL);
INSERT INTO `installedModules` VALUES(4, 'media', 'Media_', 'Gallery');

-- --------------------------------------------------------

--
-- Table structure for table `lang`
--

DROP TABLE IF EXISTS `lang`;
CREATE TABLE IF NOT EXISTS `lang` (
  `langKey` varchar(255) NOT NULL,
  `langText` mediumtext NOT NULL,
  `locale` varchar(5) NOT NULL,
  PRIMARY KEY (`langKey`),
  KEY `locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lang`
--

INSERT INTO `lang` VALUES('welcomeGuest', 'Welcome back guest. We can add some more text here blah blah.', 'en_US');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `logId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `fileId` int(11) NOT NULL DEFAULT '0',
  `userName` varchar(255) NOT NULL,
  `timeStamp` varchar(255) NOT NULL,
  `priorityName` varchar(20) NOT NULL,
  `priority` int(1) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=519 ;

--
-- Dumping data for table `log`
--

INSERT INTO `log` VALUES(1, 0, 0, '', '10-04-2012 10:57:44', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(2, 0, 0, '', '10-04-2012 10:57:44', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(3, 0, 0, '', '10-04-2012 10:57:44', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(4, 0, 0, '', '10-04-2012 10:57:44', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(5, 0, 0, '', '10-04-2012 10:58:34', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(6, 0, 0, '', '10-04-2012 10:58:34', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(7, 0, 0, '', '10-04-2012 10:58:34', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(8, 0, 0, '', '10-04-2012 10:58:34', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(9, 0, 0, '', '10-04-2012 10:58:43', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(10, 0, 0, '', '10-04-2012 10:58:43', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(11, 0, 0, '', '10-04-2012 11:00:12', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(12, 0, 0, '', '10-04-2012 11:00:12', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(13, 0, 0, '', '10-04-2012 11:00:12', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(14, 0, 0, '', '10-04-2012 11:00:12', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(15, 0, 0, '', '10-04-2012 11:02:31', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(16, 0, 0, '', '10-04-2012 11:02:31', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(17, 0, 0, '', '10-04-2012 11:02:31', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(18, 0, 0, '', '10-04-2012 11:02:31', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(19, 0, 0, '', '10-04-2012 11:06:49', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(20, 0, 0, '', '10-04-2012 11:06:49', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(21, 0, 0, '', '10-04-2012 11:06:50', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(22, 0, 0, '', '10-04-2012 11:06:50', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(23, 0, 0, '', '10-04-2012 11:06:56', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(24, 0, 0, '', '10-04-2012 11:06:56', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(25, 0, 0, '', '10-04-2012 11:06:56', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(26, 0, 0, '', '10-04-2012 11:06:56', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(27, 0, 0, '', '10-04-2012 11:09:29', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(28, 0, 0, '', '10-04-2012 11:09:29', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(29, 0, 0, '', '10-04-2012 11:09:29', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(30, 0, 0, '', '10-04-2012 11:09:29', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(31, 0, 0, '', '10-04-2012 11:25:40', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(32, 0, 0, '', '10-04-2012 11:25:40', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(33, 0, 0, '', '10-04-2012 11:29:48', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(34, 0, 0, '', '10-04-2012 11:29:48', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(35, 0, 0, '', '10-04-2012 11:29:48', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(36, 0, 0, '', '10-04-2012 11:29:48', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(37, 0, 0, '', '10-04-2012 11:32:11', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(38, 0, 0, '', '10-04-2012 11:32:11', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(39, 0, 0, '', '10-04-2012 11:32:59', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(40, 0, 0, '', '10-04-2012 11:32:59', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(41, 0, 0, '', '10-04-2012 11:32:59', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(42, 0, 0, '', '10-04-2012 11:32:59', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(43, 0, 0, '', '10-04-2012 11:36:39', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(44, 0, 0, '', '10-04-2012 11:36:39', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(45, 0, 0, '', '10-04-2012 11:36:39', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(46, 0, 0, '', '10-04-2012 11:36:39', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(47, 0, 0, '', '10-04-2012 11:36:44', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(48, 0, 0, '', '10-04-2012 11:36:44', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(49, 0, 0, '', '10-04-2012 11:36:45', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(50, 0, 0, '', '10-04-2012 11:36:45', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(51, 0, 0, '', '10-04-2012 11:38:48', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(52, 0, 0, '', '10-04-2012 11:38:48', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(53, 0, 0, '', '10-04-2012 11:38:48', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(54, 0, 0, '', '10-04-2012 11:38:48', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(55, 0, 0, '', '10-04-2012 11:47:40', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(56, 0, 0, '', '10-04-2012 11:47:40', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(57, 0, 0, '', '10-05-2012 12:29:13', 'CRIT', 2, '<img src="/images/500-error.png" alt="error" height="179" width="438" /> \n\nSorry, the server encountered an unexpected error.');
INSERT INTO `log` VALUES(58, 0, 0, '', '10-05-2012 12:29:13', 'CRIT', 2, 'Request Parameters');
INSERT INTO `log` VALUES(59, 0, 0, '', '10-05-2012 12:30:30', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(60, 0, 0, '', '10-05-2012 12:30:30', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(61, 0, 0, '', '10-05-2012 12:30:33', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(62, 0, 0, '', '10-05-2012 12:30:33', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(63, 0, 0, '', '10-05-2012 12:30:36', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(64, 0, 0, '', '10-05-2012 12:30:36', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(65, 0, 0, '', '10-05-2012 12:30:46', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(66, 0, 0, '', '10-05-2012 12:30:46', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(67, 0, 0, '', '10-05-2012 12:30:48', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(68, 0, 0, '', '10-05-2012 12:30:48', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(69, 0, 0, '', '10-05-2012 12:30:51', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(70, 0, 0, '', '10-05-2012 12:30:51', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(71, 0, 0, '', '10-05-2012 12:30:54', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(72, 0, 0, '', '10-05-2012 12:30:54', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(73, 0, 0, '', '10-05-2012 12:30:57', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(74, 0, 0, '', '10-05-2012 12:30:57', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(75, 0, 0, '', '10-05-2012 12:31:00', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(76, 0, 0, '', '10-05-2012 12:31:00', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(77, 0, 0, '', '10-05-2012 12:31:03', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(78, 0, 0, '', '10-05-2012 12:31:03', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(79, 0, 0, '', '10-05-2012 12:31:07', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(80, 0, 0, '', '10-05-2012 12:31:07', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(81, 0, 0, '', '10-05-2012 12:31:09', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(82, 0, 0, '', '10-05-2012 12:31:09', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(83, 0, 0, '', '10-05-2012 12:31:12', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(84, 0, 0, '', '10-05-2012 12:31:12', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(85, 0, 0, '', '10-05-2012 12:31:16', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(86, 0, 0, '', '10-05-2012 12:31:16', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(87, 0, 0, '', '10-05-2012 12:31:18', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(88, 0, 0, '', '10-05-2012 12:31:18', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(89, 0, 0, '', '10-05-2012 12:31:21', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(90, 0, 0, '', '10-05-2012 12:31:21', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(91, 0, 0, '', '10-05-2012 12:31:24', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(92, 0, 0, '', '10-05-2012 12:31:24', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(93, 0, 0, '', '10-05-2012 12:31:28', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(94, 0, 0, '', '10-05-2012 12:31:28', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(95, 0, 0, '', '10-05-2012 12:31:30', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(96, 0, 0, '', '10-05-2012 12:31:30', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(97, 0, 0, '', '10-05-2012 12:31:33', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(98, 0, 0, '', '10-05-2012 12:31:33', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(99, 0, 0, '', '10-05-2012 12:31:36', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(100, 0, 0, '', '10-05-2012 12:31:36', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(101, 0, 0, '', '10-05-2012 12:31:39', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(102, 0, 0, '', '10-05-2012 12:31:39', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(103, 0, 0, '', '10-05-2012 12:31:42', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(104, 0, 0, '', '10-05-2012 12:31:42', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(105, 0, 0, '', '10-05-2012 12:31:45', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(106, 0, 0, '', '10-05-2012 12:31:45', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(107, 0, 0, '', '10-05-2012 12:31:48', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(108, 0, 0, '', '10-05-2012 12:31:48', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(109, 0, 0, '', '10-05-2012 12:31:51', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(110, 0, 0, '', '10-05-2012 12:31:51', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(111, 0, 0, '', '10-05-2012 12:31:55', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(112, 0, 0, '', '10-05-2012 12:31:55', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(113, 0, 0, '', '10-05-2012 12:31:57', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(114, 0, 0, '', '10-05-2012 12:31:57', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(115, 0, 0, '', '10-05-2012 12:32:00', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(116, 0, 0, '', '10-05-2012 12:32:00', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(117, 0, 0, '', '10-05-2012 12:32:03', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(118, 0, 0, '', '10-05-2012 12:32:03', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(119, 0, 0, '', '10-05-2012 12:32:06', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(120, 0, 0, '', '10-05-2012 12:32:06', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(121, 0, 0, '', '10-05-2012 12:32:09', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(122, 0, 0, '', '10-05-2012 12:32:09', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(123, 0, 0, '', '10-05-2012 12:32:12', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(124, 0, 0, '', '10-05-2012 12:32:12', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(125, 0, 0, '', '10-05-2012 12:32:15', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(126, 0, 0, '', '10-05-2012 12:32:15', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(127, 0, 0, '', '10-05-2012 12:32:18', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(128, 0, 0, '', '10-05-2012 12:32:18', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(129, 0, 0, '', '10-05-2012 12:32:22', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(130, 0, 0, '', '10-05-2012 12:32:22', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(131, 0, 0, '', '10-05-2012 12:32:24', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(132, 0, 0, '', '10-05-2012 12:32:24', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(133, 0, 0, '', '10-05-2012 12:32:27', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(134, 0, 0, '', '10-05-2012 12:32:27', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(135, 0, 0, '', '10-05-2012 12:32:30', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(136, 0, 0, '', '10-05-2012 12:32:30', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(137, 0, 0, '', '10-05-2012 12:32:33', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(138, 0, 0, '', '10-05-2012 12:32:33', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(139, 0, 0, '', '10-05-2012 12:32:36', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(140, 0, 0, '', '10-05-2012 12:32:36', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(141, 0, 0, '', '10-05-2012 12:32:39', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(142, 0, 0, '', '10-05-2012 12:32:39', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(143, 0, 0, '', '10-05-2012 12:32:42', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(144, 0, 0, '', '10-05-2012 12:32:42', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(145, 0, 0, '', '10-05-2012 12:32:45', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(146, 0, 0, '', '10-05-2012 12:32:45', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(147, 0, 0, '', '10-05-2012 12:32:48', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(148, 0, 0, '', '10-05-2012 12:32:48', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(149, 0, 0, '', '10-05-2012 12:32:51', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(150, 0, 0, '', '10-05-2012 12:32:51', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(151, 0, 0, '', '10-05-2012 12:32:54', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(152, 0, 0, '', '10-05-2012 12:32:54', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(153, 0, 0, '', '10-05-2012 12:32:57', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(154, 0, 0, '', '10-05-2012 12:32:57', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(155, 0, 0, '', '10-05-2012 12:33:00', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(156, 0, 0, '', '10-05-2012 12:33:00', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(157, 0, 0, '', '10-05-2012 12:33:03', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(158, 0, 0, '', '10-05-2012 12:33:03', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(159, 0, 0, '', '10-05-2012 12:33:06', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(160, 0, 0, '', '10-05-2012 12:33:06', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(161, 0, 0, '', '10-05-2012 12:33:10', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(162, 0, 0, '', '10-05-2012 12:33:10', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(163, 0, 0, '', '10-05-2012 12:33:12', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(164, 0, 0, '', '10-05-2012 12:33:12', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(165, 0, 0, '', '10-05-2012 12:33:15', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(166, 0, 0, '', '10-05-2012 12:33:15', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(167, 0, 0, '', '10-05-2012 12:33:18', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(168, 0, 0, '', '10-05-2012 12:33:18', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(169, 0, 0, '', '10-05-2012 12:33:21', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(170, 0, 0, '', '10-05-2012 12:33:21', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(171, 0, 0, '', '10-05-2012 12:33:24', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(172, 0, 0, '', '10-05-2012 12:33:24', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(173, 0, 0, '', '10-05-2012 12:33:27', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(174, 0, 0, '', '10-05-2012 12:33:27', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(175, 0, 0, '', '10-05-2012 12:33:31', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(176, 0, 0, '', '10-05-2012 12:33:31', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(177, 0, 0, '', '10-05-2012 12:33:39', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(178, 0, 0, '', '10-05-2012 12:33:39', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(179, 0, 0, '', '10-05-2012 12:33:42', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(180, 0, 0, '', '10-05-2012 12:33:42', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(181, 0, 0, '', '10-05-2012 12:33:45', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(182, 0, 0, '', '10-05-2012 12:33:45', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(183, 0, 0, '', '10-05-2012 12:33:48', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(184, 0, 0, '', '10-05-2012 12:33:48', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(185, 0, 0, '', '10-05-2012 12:33:51', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(186, 0, 0, '', '10-05-2012 12:33:51', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(187, 0, 0, '', '10-05-2012 12:33:54', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(188, 0, 0, '', '10-05-2012 12:33:54', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(189, 0, 0, '', '10-05-2012 12:33:57', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(190, 0, 0, '', '10-05-2012 12:33:57', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(191, 0, 0, '', '10-05-2012 12:34:00', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(192, 0, 0, '', '10-05-2012 12:34:00', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(193, 0, 0, '', '10-05-2012 12:34:03', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(194, 0, 0, '', '10-05-2012 12:34:03', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(195, 0, 0, '', '10-05-2012 12:34:06', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(196, 0, 0, '', '10-05-2012 12:34:06', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(197, 0, 0, '', '10-05-2012 12:34:09', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(198, 0, 0, '', '10-05-2012 12:34:09', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(199, 0, 0, '', '10-05-2012 12:34:12', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(200, 0, 0, '', '10-05-2012 12:34:12', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(201, 0, 0, '', '10-05-2012 12:34:15', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(202, 0, 0, '', '10-05-2012 12:34:15', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(203, 0, 0, '', '10-05-2012 12:34:18', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(204, 0, 0, '', '10-05-2012 12:34:18', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(205, 0, 0, '', '10-05-2012 12:34:21', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(206, 0, 0, '', '10-05-2012 12:34:21', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(207, 0, 0, '', '10-05-2012 12:34:25', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(208, 0, 0, '', '10-05-2012 12:34:25', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(209, 0, 0, '', '10-05-2012 12:34:27', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(210, 0, 0, '', '10-05-2012 12:34:27', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(211, 0, 0, '', '10-05-2012 12:34:30', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(212, 0, 0, '', '10-05-2012 12:34:30', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(213, 0, 0, '', '10-05-2012 12:34:33', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(214, 0, 0, '', '10-05-2012 12:34:33', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(215, 0, 0, '', '10-05-2012 12:34:36', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(216, 0, 0, '', '10-05-2012 12:34:36', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(217, 0, 0, '', '10-05-2012 12:34:39', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(218, 0, 0, '', '10-05-2012 12:34:39', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(219, 0, 0, '', '10-05-2012 12:34:42', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(220, 0, 0, '', '10-05-2012 12:34:42', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(221, 0, 0, '', '10-05-2012 12:34:45', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(222, 0, 0, '', '10-05-2012 12:34:45', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(223, 0, 0, '', '10-05-2012 12:34:48', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(224, 0, 0, '', '10-05-2012 12:34:48', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(225, 0, 0, '', '10-05-2012 12:34:51', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(226, 0, 0, '', '10-05-2012 12:34:51', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(227, 0, 0, '', '10-05-2012 12:34:54', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(228, 0, 0, '', '10-05-2012 12:34:54', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(229, 0, 0, '', '10-05-2012 12:34:57', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(230, 0, 0, '', '10-05-2012 12:34:57', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(231, 0, 0, '', '10-05-2012 12:35:00', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(232, 0, 0, '', '10-05-2012 12:35:00', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(233, 0, 0, '', '10-05-2012 12:43:56', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(234, 0, 0, '', '10-05-2012 12:43:56', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(235, 0, 0, '', '10-05-2012 12:44:06', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(236, 0, 0, '', '10-05-2012 12:44:06', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(237, 0, 0, '', '10-05-2012 12:44:08', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(238, 0, 0, '', '10-05-2012 12:44:08', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(239, 0, 0, '', '10-05-2012 12:44:11', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(240, 0, 0, '', '10-05-2012 12:44:11', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(241, 0, 0, '', '10-05-2012 12:44:14', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(242, 0, 0, '', '10-05-2012 12:44:14', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(243, 0, 0, '', '10-05-2012 12:44:17', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(244, 0, 0, '', '10-05-2012 12:44:17', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(245, 0, 0, '', '10-05-2012 12:44:20', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(246, 0, 0, '', '10-05-2012 12:44:20', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(247, 0, 0, '', '10-05-2012 12:44:23', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(248, 0, 0, '', '10-05-2012 12:44:23', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(249, 0, 0, '', '10-05-2012 12:44:26', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(250, 0, 0, '', '10-05-2012 12:44:26', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(251, 0, 0, '', '10-05-2012 12:44:29', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(252, 0, 0, '', '10-05-2012 12:44:29', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(253, 0, 0, '', '10-05-2012 12:44:32', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(254, 0, 0, '', '10-05-2012 12:44:32', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(255, 0, 0, '', '10-05-2012 12:44:35', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(256, 0, 0, '', '10-05-2012 12:44:35', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(257, 0, 0, '', '10-05-2012 12:44:38', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(258, 0, 0, '', '10-05-2012 12:44:38', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(259, 0, 0, '', '10-05-2012 12:44:41', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(260, 0, 0, '', '10-05-2012 12:44:41', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(261, 0, 0, '', '10-05-2012 12:44:44', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(262, 0, 0, '', '10-05-2012 12:44:44', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(263, 0, 0, '', '10-05-2012 12:44:47', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(264, 0, 0, '', '10-05-2012 12:44:47', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(265, 0, 0, '', '10-05-2012 12:44:50', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(266, 0, 0, '', '10-05-2012 12:44:50', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(267, 0, 0, '', '10-05-2012 12:44:53', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(268, 0, 0, '', '10-05-2012 12:44:53', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(269, 0, 0, '', '10-05-2012 12:44:56', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(270, 0, 0, '', '10-05-2012 12:44:56', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(271, 0, 0, '', '10-05-2012 12:44:59', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(272, 0, 0, '', '10-05-2012 12:44:59', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(273, 0, 0, '', '10-05-2012 12:45:02', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(274, 0, 0, '', '10-05-2012 12:45:02', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(275, 0, 0, '', '10-05-2012 12:45:05', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(276, 0, 0, '', '10-05-2012 12:45:05', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(277, 0, 0, '', '10-05-2012 12:45:08', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(278, 0, 0, '', '10-05-2012 12:45:08', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(279, 0, 0, '', '10-05-2012 12:45:11', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(280, 0, 0, '', '10-05-2012 12:45:11', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(281, 0, 0, '', '10-05-2012 12:45:14', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(282, 0, 0, '', '10-05-2012 12:45:14', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(283, 0, 0, '', '10-05-2012 12:45:17', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(284, 0, 0, '', '10-05-2012 12:45:17', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(285, 0, 0, '', '10-05-2012 12:45:20', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(286, 0, 0, '', '10-05-2012 12:45:20', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(287, 0, 0, '', '10-05-2012 12:45:23', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(288, 0, 0, '', '10-05-2012 12:45:23', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(289, 0, 0, '', '10-05-2012 12:45:26', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(290, 0, 0, '', '10-05-2012 12:45:26', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(291, 0, 0, '', '10-05-2012 12:45:29', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(292, 0, 0, '', '10-05-2012 12:45:29', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(293, 0, 0, '', '10-05-2012 12:45:32', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(294, 0, 0, '', '10-05-2012 12:45:32', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(295, 0, 0, '', '10-05-2012 12:45:35', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(296, 0, 0, '', '10-05-2012 12:45:35', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(297, 0, 0, '', '10-05-2012 12:45:38', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(298, 0, 0, '', '10-05-2012 12:45:38', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(299, 0, 0, '', '10-05-2012 12:45:41', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(300, 0, 0, '', '10-05-2012 12:45:41', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(301, 0, 0, '', '10-05-2012 12:45:44', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(302, 0, 0, '', '10-05-2012 12:45:44', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(303, 0, 0, '', '10-05-2012 12:45:47', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(304, 0, 0, '', '10-05-2012 12:45:47', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(305, 0, 0, '', '10-05-2012 12:45:50', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(306, 0, 0, '', '10-05-2012 12:45:50', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(307, 0, 0, '', '10-05-2012 12:45:53', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(308, 0, 0, '', '10-05-2012 12:45:53', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(309, 0, 0, '', '10-05-2012 12:45:56', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(310, 0, 0, '', '10-05-2012 12:45:56', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(311, 0, 0, '', '10-05-2012 12:46:00', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(312, 0, 0, '', '10-05-2012 12:46:00', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(313, 0, 0, '', '10-05-2012 12:46:02', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(314, 0, 0, '', '10-05-2012 12:46:02', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(315, 0, 0, '', '10-05-2012 12:46:05', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(316, 0, 0, '', '10-05-2012 12:46:05', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(317, 0, 0, '', '10-05-2012 12:46:14', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(318, 0, 0, '', '10-05-2012 12:46:14', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(319, 0, 0, '', '10-05-2012 12:46:25', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(320, 0, 0, '', '10-05-2012 12:46:25', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(321, 0, 0, '', '10-05-2012 12:46:28', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(322, 0, 0, '', '10-05-2012 12:46:28', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(323, 0, 0, '', '10-05-2012 12:46:32', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(324, 0, 0, '', '10-05-2012 12:46:32', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(325, 0, 0, '', '10-05-2012 12:46:34', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(326, 0, 0, '', '10-05-2012 12:46:34', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(327, 0, 0, '', '10-05-2012 12:46:37', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(328, 0, 0, '', '10-05-2012 12:46:37', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(329, 0, 0, '', '10-05-2012 12:46:40', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(330, 0, 0, '', '10-05-2012 12:46:40', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(331, 0, 0, '', '10-05-2012 12:46:43', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(332, 0, 0, '', '10-05-2012 12:46:43', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(333, 0, 0, '', '10-05-2012 12:46:46', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(334, 0, 0, '', '10-05-2012 12:46:46', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(335, 0, 0, '', '10-05-2012 12:46:49', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(336, 0, 0, '', '10-05-2012 12:46:49', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(337, 0, 0, '', '10-05-2012 12:46:52', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(338, 0, 0, '', '10-05-2012 12:46:52', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(339, 0, 0, '', '10-05-2012 12:46:55', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(340, 0, 0, '', '10-05-2012 12:46:55', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(341, 0, 0, '', '10-05-2012 12:46:58', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(342, 0, 0, '', '10-05-2012 12:46:58', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(343, 0, 0, '', '10-05-2012 12:47:01', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(344, 0, 0, '', '10-05-2012 12:47:01', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(345, 0, 0, '', '10-05-2012 12:47:04', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(346, 0, 0, '', '10-05-2012 12:47:04', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(347, 0, 0, '', '10-05-2012 12:47:07', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(348, 0, 0, '', '10-05-2012 12:47:07', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(349, 0, 0, '', '10-05-2012 12:47:10', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(350, 0, 0, '', '10-05-2012 12:47:10', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(351, 0, 0, '', '10-05-2012 12:47:13', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(352, 0, 0, '', '10-05-2012 12:47:13', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(353, 0, 0, '', '10-05-2012 12:47:16', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(354, 0, 0, '', '10-05-2012 12:47:16', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(355, 0, 0, '', '10-05-2012 12:47:20', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(356, 0, 0, '', '10-05-2012 12:47:20', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(357, 0, 0, '', '10-05-2012 12:47:22', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(358, 0, 0, '', '10-05-2012 12:47:22', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(359, 0, 0, '', '10-05-2012 12:47:25', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(360, 0, 0, '', '10-05-2012 12:47:25', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(361, 0, 0, '', '10-05-2012 12:47:28', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(362, 0, 0, '', '10-05-2012 12:47:28', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(363, 0, 0, '', '10-05-2012 12:47:31', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(364, 0, 0, '', '10-05-2012 12:47:31', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(365, 0, 0, '', '10-05-2012 12:47:34', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(366, 0, 0, '', '10-05-2012 12:47:34', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(367, 0, 0, '', '10-05-2012 12:47:37', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(368, 0, 0, '', '10-05-2012 12:47:37', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(369, 0, 0, '', '10-05-2012 12:47:40', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(370, 0, 0, '', '10-05-2012 12:47:40', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(371, 0, 0, '', '10-05-2012 12:47:43', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(372, 0, 0, '', '10-05-2012 12:47:43', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(373, 0, 0, '', '10-05-2012 12:47:46', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(374, 0, 0, '', '10-05-2012 12:47:46', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(375, 0, 0, '', '10-05-2012 12:47:49', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(376, 0, 0, '', '10-05-2012 12:47:49', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(377, 0, 0, '', '10-05-2012 12:47:52', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(378, 0, 0, '', '10-05-2012 12:47:52', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(379, 0, 0, '', '10-05-2012 12:47:55', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(380, 0, 0, '', '10-05-2012 12:47:55', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(381, 0, 0, '', '10-05-2012 12:47:58', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(382, 0, 0, '', '10-05-2012 12:47:58', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(383, 0, 0, '', '10-05-2012 12:48:01', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(384, 0, 0, '', '10-05-2012 12:48:01', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(385, 0, 0, '', '10-05-2012 12:48:04', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(386, 0, 0, '', '10-05-2012 12:48:04', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(387, 0, 0, '', '10-05-2012 02:52:50', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(388, 0, 0, '', '10-05-2012 02:52:50', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(389, 0, 0, '', '10-05-2012 05:27:52', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(390, 0, 0, '', '10-05-2012 05:27:52', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(391, 0, 0, '', '10-05-2012 06:20:53', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(392, 0, 0, '', '10-05-2012 06:20:53', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(393, 0, 0, '', '10-05-2012 06:48:26', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(394, 0, 0, '', '10-05-2012 06:48:26', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(395, 0, 0, '', '10-05-2012 07:01:50', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(396, 0, 0, '', '10-05-2012 07:01:50', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(397, 0, 0, '', '10-05-2012 08:52:38', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(398, 0, 0, '', '10-05-2012 08:52:38', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(399, 0, 0, '', '10-05-2012 08:52:42', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(400, 0, 0, '', '10-05-2012 08:52:42', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(401, 0, 0, '', '10-05-2012 08:56:10', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(402, 0, 0, '', '10-05-2012 08:56:10', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(403, 0, 0, '', '10-05-2012 08:56:10', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(404, 0, 0, '', '10-05-2012 08:56:10', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(405, 0, 0, '', '10-05-2012 08:56:50', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(406, 0, 0, '', '10-05-2012 08:56:50', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(407, 0, 0, '', '10-05-2012 08:56:50', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(408, 0, 0, '', '10-05-2012 08:56:50', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(409, 0, 0, '', '10-05-2012 08:57:51', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(410, 0, 0, '', '10-05-2012 08:57:51', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(411, 0, 0, '', '10-05-2012 08:57:51', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(412, 0, 0, '', '10-05-2012 08:57:51', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(413, 0, 0, '', '10-05-2012 08:59:46', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(414, 0, 0, '', '10-05-2012 08:59:46', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(415, 0, 0, '', '10-05-2012 08:59:46', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(416, 0, 0, '', '10-05-2012 08:59:46', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(417, 0, 0, '', '10-05-2012 09:01:53', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(418, 0, 0, '', '10-05-2012 09:01:53', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(419, 0, 0, '', '10-05-2012 09:01:53', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(420, 0, 0, '', '10-05-2012 09:01:53', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(421, 0, 0, '', '10-05-2012 12:33:01', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(422, 0, 0, '', '10-05-2012 12:33:01', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(423, 0, 0, '', '10-05-2012 12:55:05', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(424, 0, 0, '', '10-05-2012 12:55:05', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(425, 0, 0, '', '10-05-2012 02:37:42', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(426, 0, 0, '', '10-05-2012 02:37:42', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(427, 0, 0, '', '10-05-2012 02:37:46', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(428, 0, 0, '', '10-05-2012 02:37:46', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(429, 0, 0, '', '10-05-2012 02:37:48', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(430, 0, 0, '', '10-05-2012 02:37:48', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(431, 0, 0, '', '10-05-2012 02:37:56', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(432, 0, 0, '', '10-05-2012 02:37:56', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(433, 0, 0, '', '10-05-2012 02:37:59', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(434, 0, 0, '', '10-05-2012 02:37:59', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(435, 0, 0, '', '10-05-2012 02:41:39', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(436, 0, 0, '', '10-05-2012 02:41:39', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(437, 0, 0, '', '10-05-2012 02:41:39', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(438, 0, 0, '', '10-05-2012 02:41:39', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(439, 0, 0, '', '10-05-2012 11:52:13', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(440, 0, 0, '', '10-05-2012 11:52:13', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(441, 0, 0, '', '10-05-2012 11:55:36', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(442, 0, 0, '', '10-05-2012 11:55:36', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(443, 0, 0, '', '10-06-2012 02:04:54', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(444, 0, 0, '', '10-06-2012 02:04:54', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(445, 0, 0, '', '10-06-2012 02:14:14', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(446, 0, 0, '', '10-06-2012 02:14:14', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(447, 0, 0, '', '10-06-2012 02:30:50', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(448, 0, 0, '', '10-06-2012 02:30:50', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(449, 0, 0, '', '10-06-2012 03:38:10', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(450, 0, 0, '', '10-06-2012 03:38:10', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(451, 0, 0, '', '10-06-2012 03:47:14', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(452, 0, 0, '', '10-06-2012 03:47:14', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(453, 0, 0, '', '10-06-2012 04:43:11', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(454, 0, 0, '', '10-06-2012 04:43:11', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(455, 0, 0, '', '10-06-2012 04:45:34', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(456, 0, 0, '', '10-06-2012 04:45:34', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(457, 0, 0, '', '10-06-2012 05:45:48', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(458, 0, 0, '', '10-06-2012 05:45:48', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(459, 0, 0, '', '10-06-2012 06:45:26', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(460, 0, 0, '', '10-06-2012 06:45:26', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(461, 0, 0, '', '10-06-2012 07:33:58', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(462, 0, 0, '', '10-06-2012 07:33:58', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(463, 0, 0, '', '10-06-2012 08:14:50', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(464, 0, 0, '', '10-06-2012 08:14:50', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(465, 0, 0, '', '10-06-2012 01:33:17', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(466, 0, 0, '', '10-06-2012 01:33:17', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(467, 0, 0, '', '10-07-2012 10:42:42', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(468, 0, 0, '', '10-07-2012 10:42:42', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(469, 0, 0, '', '10-07-2012 11:48:08', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(470, 0, 0, '', '10-07-2012 11:48:08', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(471, 0, 0, '', '10-08-2012 03:25:48', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(472, 0, 0, '', '10-08-2012 03:25:48', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(473, 0, 0, '', '10-08-2012 03:49:37', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(474, 0, 0, '', '10-08-2012 03:49:37', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(475, 0, 0, '', '10-08-2012 08:01:24', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(476, 0, 0, '', '10-08-2012 08:01:24', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(477, 0, 0, '', '10-08-2012 08:33:16', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(478, 0, 0, '', '10-08-2012 08:33:16', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(479, 0, 0, '', '10-08-2012 08:33:16', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(480, 0, 0, '', '10-08-2012 08:33:16', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(481, 0, 0, '', '10-08-2012 09:02:57', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(482, 0, 0, '', '10-08-2012 09:02:57', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(483, 0, 0, '', '10-09-2012 03:19:53', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(484, 0, 0, '', '10-09-2012 03:19:53', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(485, 0, 0, '', '10-09-2012 08:57:25', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(486, 0, 0, '', '10-09-2012 08:57:25', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(487, 0, 0, '', '10-09-2012 08:58:21', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(488, 0, 0, '', '10-09-2012 08:58:21', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(489, 0, 0, '', '10-09-2012 08:58:21', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(490, 0, 0, '', '10-09-2012 08:58:21', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(491, 0, 0, '', '10-09-2012 08:58:29', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(492, 0, 0, '', '10-09-2012 08:58:29', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(493, 0, 0, '', '10-09-2012 08:58:29', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(494, 0, 0, '', '10-09-2012 08:58:29', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(495, 0, 0, '', '10-09-2012 08:58:38', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(496, 0, 0, '', '10-09-2012 08:58:38', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(497, 0, 0, '', '10-09-2012 08:58:38', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(498, 0, 0, '', '10-09-2012 08:58:38', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(499, 0, 0, '', '10-09-2012 09:20:10', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(500, 0, 0, '', '10-09-2012 09:20:10', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(501, 0, 0, '', '10-09-2012 09:43:52', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(502, 0, 0, '', '10-09-2012 09:43:52', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(503, 0, 0, '', '10-09-2012 09:59:21', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(504, 0, 0, '', '10-09-2012 09:59:21', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(505, 0, 0, '', '10-09-2012 10:38:09', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(506, 0, 0, '', '10-09-2012 10:38:09', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(507, 0, 0, '', '10-09-2012 11:44:59', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(508, 0, 0, '', '10-09-2012 11:44:59', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(509, 0, 0, '', '10-09-2012 12:19:38', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(510, 0, 0, '', '10-09-2012 12:19:38', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(511, 0, 0, '', '10-09-2012 12:58:44', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(512, 0, 0, '', '10-09-2012 12:58:44', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(513, 0, 0, '', '10-09-2012 01:15:47', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(514, 0, 0, '', '10-09-2012 01:15:47', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(515, 0, 0, '', '10-09-2012 01:50:52', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(516, 0, 0, '', '10-09-2012 01:50:52', 'NOTICE', 5, 'Request Parameters');
INSERT INTO `log` VALUES(517, 0, 0, '', '10-09-2012 01:50:52', 'NOTICE', 5, '<img src="/images/404-error.png" alt="error" height="179" width="438" /> \n\n<h2>Sorry, the page you requested cannot be found.</h2>');
INSERT INTO `log` VALUES(518, 0, 0, '', '10-09-2012 01:50:52', 'NOTICE', 5, 'Request Parameters');

-- --------------------------------------------------------

--
-- Table structure for table `mediaAlbums`
--

DROP TABLE IF EXISTS `mediaAlbums`;
CREATE TABLE IF NOT EXISTS `mediaAlbums` (
  `albumId` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL DEFAULT '0',
  `albumName` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'guest',
  `passWord` varchar(40) DEFAULT NULL,
  `albumDesc` mediumtext,
  PRIMARY KEY (`albumId`),
  KEY `albumName` (`albumName`,`userId`),
  KEY `role` (`role`),
  KEY `parentId` (`parentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `mediaAlbums`
--

INSERT INTO `mediaAlbums` VALUES(-3, 0, 'Slider', 1, 'guest', NULL, NULL);
INSERT INTO `mediaAlbums` VALUES(-2, 0, 'Media', 1, 'guest', NULL, 'This is the default Album for the Media module. This album can not be deleted as the system is dependent upon it for correct operation.');
INSERT INTO `mediaAlbums` VALUES(-1, 0, 'Pages', 1, 'guest', NULL, 'This is the default Album for the Pages module. This album can not be deleted as the system is dependent upon it for correct operation.');
INSERT INTO `mediaAlbums` VALUES(9, 0, 'MediaMediaTest', 6, 'guest', NULL, NULL);
INSERT INTO `mediaAlbums` VALUES(11, 0, 'afterhour', 4, 'guest', NULL, NULL);
INSERT INTO `mediaAlbums` VALUES(12, 0, 'earlymorning', 4, 'guest', NULL, NULL);
INSERT INTO `mediaAlbums` VALUES(14, 0, 'latenight', 4, 'guest', NULL, NULL);
INSERT INTO `mediaAlbums` VALUES(17, 0, 'Test', 1, 'guest', NULL, NULL);
INSERT INTO `mediaAlbums` VALUES(18, 0, 'Developer', 1, 'guest', NULL, NULL);
INSERT INTO `mediaAlbums` VALUES(19, 0, 'bigday', 4, 'guest', NULL, NULL);
INSERT INTO `mediaAlbums` VALUES(20, 0, 'Cultural', 6, 'guest', NULL, NULL);
INSERT INTO `mediaAlbums` VALUES(21, 0, 'testingsubs', 1, 'guest', NULL, NULL);
INSERT INTO `mediaAlbums` VALUES(22, 0, 'firstchild', 1, 'guest', NULL, NULL);
INSERT INTO `mediaAlbums` VALUES(23, 0, 'Goboy', 4, 'guest', NULL, NULL);
INSERT INTO `mediaAlbums` VALUES(24, 0, 'Happy', 4, 'guest', NULL, NULL);
INSERT INTO `mediaAlbums` VALUES(25, 0, 'ParentOne', 1, 'guest', NULL, NULL);
INSERT INTO `mediaAlbums` VALUES(26, 0, 'ParentOne', 1, 'guest', NULL, NULL);
INSERT INTO `mediaAlbums` VALUES(27, 0, 'ChildOne', 1, 'guest', NULL, NULL);
INSERT INTO `mediaAlbums` VALUES(28, 0, 'ParentTwo', 1, 'guest', NULL, NULL);
INSERT INTO `mediaAlbums` VALUES(29, 0, 'ChildTwo', 1, 'guest', NULL, NULL);
INSERT INTO `mediaAlbums` VALUES(30, 28, 'ChildThree', 1, 'guest', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mediaFiles`
--

DROP TABLE IF EXISTS `mediaFiles`;
CREATE TABLE IF NOT EXISTS `mediaFiles` (
  `fileId` int(11) NOT NULL AUTO_INCREMENT,
  `albumId` int(11) DEFAULT NULL,
  `fileName` varchar(255) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`fileId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- Dumping data for table `mediaFiles`
--

INSERT INTO `mediaFiles` VALUES(2, -2, 'Sites.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(3, -2, 'Smart.png', 'title', 'alt', 'iamge desc text', 0);
INSERT INTO `mediaFiles` VALUES(4, -2, 'System.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(22, 9, 'defaultimg1.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(23, 9, 'defaultimg2.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(24, 9, 'defaultimg3.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(25, 9, 'defaultimg4.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(27, 11, 'defaultimg4.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(28, 12, 'defaultimg1.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(29, 12, 'defaultimg2.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(30, 12, 'defaultimg3.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(31, 12, 'defaultimg4.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(34, 14, 'defaultimg1.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(35, 14, 'defaultimg2.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(39, 17, 'defaultimg1.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(40, 17, 'defaultimg4.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(41, 19, '513px-Rebecca_Blank_official_portrait.jpg', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(42, 19, '1823.jpg', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(43, 19, 'Alan_Krueger_official_portrait_3.jpg', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(44, -2, 'Applications.png', 'Application Icon', 'Application.png', 'This is the application icon', 0);
INSERT INTO `mediaFiles` VALUES(45, -2, 'Burn.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(46, -2, 'Desktop.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(47, -2, 'Developer.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(48, -2, 'Document.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(49, -2, 'Downloads.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(50, -2, 'Generic.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(51, -2, 'Group.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(52, -2, 'Library.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(53, -2, 'Movies.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(54, -2, 'Music.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(55, -2, 'Open.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(56, -2, 'Dan.jpg', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(57, 23, 'Dan.jpg', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(58, 23, 'Dan.jpg', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(59, 23, 'defaultimg1.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(60, 24, 'Dan.jpg', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(61, 24, '1823.jpg', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(62, 24, 'defaultimg1.png', NULL, NULL, '', 0);
INSERT INTO `mediaFiles` VALUES(64, -3, 'toystory.jpg', 'TOY STORY', '', 'CAPTION CAPTION CAPTION CAPTION CAPTION!!!!!', 0);
INSERT INTO `mediaFiles` VALUES(65, -3, 'down.jpg', '', '', 'This is a description in the title tag', 0);

-- --------------------------------------------------------

--
-- Table structure for table `moduleSettings`
--

DROP TABLE IF EXISTS `moduleSettings`;
CREATE TABLE IF NOT EXISTS `moduleSettings` (
  `moduleName` varchar(255) NOT NULL,
  `variable` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `settingType` tinytext NOT NULL,
  PRIMARY KEY (`variable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `moduleSettings`
--

INSERT INTO `moduleSettings` VALUES('user', 'showEmail', '1', 'Checkbox');

-- --------------------------------------------------------

--
-- Table structure for table `pageCategories`
--

DROP TABLE IF EXISTS `pageCategories`;
CREATE TABLE IF NOT EXISTS `pageCategories` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(50) NOT NULL,
  `parentId` int(11) NOT NULL DEFAULT '0',
  `visibility` enum('public','private') NOT NULL,
  PRIMARY KEY (`categoryId`),
  KEY `categoryName` (`categoryName`,`parentId`,`visibility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `pageCategories`
--


-- --------------------------------------------------------

--
-- Table structure for table `pageComments`
--

DROP TABLE IF EXISTS `pageComments`;
CREATE TABLE IF NOT EXISTS `pageComments` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdDate` int(11) NOT NULL,
  `modifiedDate` int(11) NOT NULL,
  `visibility` enum('public','private') NOT NULL,
  `commentText` longtext NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `pageId` (`pageId`,`userId`,`createdDate`,`modifiedDate`,`visibility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `pageComments`
--


-- --------------------------------------------------------

--
-- Table structure for table `pageFiles`
--

DROP TABLE IF EXISTS `pageFiles`;
CREATE TABLE IF NOT EXISTS `pageFiles` (
  `fileId` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) NOT NULL,
  `pageId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `isMainImage` int(1) DEFAULT NULL,
  PRIMARY KEY (`fileId`),
  KEY `pageId` (`pageId`,`userId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `pageFiles`
--

INSERT INTO `pageFiles` VALUES(3, 'Smart.png', 10, 1, 1);
INSERT INTO `pageFiles` VALUES(4, 'System.png', 10, 1, 1);
INSERT INTO `pageFiles` VALUES(5, 'defaultimg1.png', 24, 4, 1);
INSERT INTO `pageFiles` VALUES(6, 'defaultimg2.png', 24, 4, 1);
INSERT INTO `pageFiles` VALUES(7, 'defaultimg3.png', 24, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pageLookup`
--

DROP TABLE IF EXISTS `pageLookup`;
CREATE TABLE IF NOT EXISTS `pageLookup` (
  `pageId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`pageId`),
  KEY `parentId` (`parentId`,`categoryId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pageLookup`
--

INSERT INTO `pageLookup` VALUES(1, 1, NULL, NULL);
INSERT INTO `pageLookup` VALUES(2, 1, NULL, NULL);
INSERT INTO `pageLookup` VALUES(3, 1, 2, NULL);
INSERT INTO `pageLookup` VALUES(4, 1, 1, 1);
INSERT INTO `pageLookup` VALUES(6, 1, NULL, NULL);
INSERT INTO `pageLookup` VALUES(7, 1, 1, NULL);
INSERT INTO `pageLookup` VALUES(8, 1, NULL, NULL);
INSERT INTO `pageLookup` VALUES(9, 3, NULL, NULL);
INSERT INTO `pageLookup` VALUES(10, 1, 4, NULL);
INSERT INTO `pageLookup` VALUES(11, 1, NULL, NULL);
INSERT INTO `pageLookup` VALUES(12, 1, NULL, NULL);
INSERT INTO `pageLookup` VALUES(13, 4, NULL, NULL);
INSERT INTO `pageLookup` VALUES(14, 1, NULL, NULL);
INSERT INTO `pageLookup` VALUES(15, 1, 1, NULL);
INSERT INTO `pageLookup` VALUES(16, 1, NULL, NULL);
INSERT INTO `pageLookup` VALUES(17, 1, NULL, NULL);
INSERT INTO `pageLookup` VALUES(18, 1, NULL, NULL);
INSERT INTO `pageLookup` VALUES(19, 4, NULL, NULL);
INSERT INTO `pageLookup` VALUES(20, 4, 15, NULL);
INSERT INTO `pageLookup` VALUES(21, 4, NULL, NULL);
INSERT INTO `pageLookup` VALUES(22, 4, NULL, NULL);
INSERT INTO `pageLookup` VALUES(23, 4, NULL, NULL);
INSERT INTO `pageLookup` VALUES(24, 4, 1, NULL);
INSERT INTO `pageLookup` VALUES(25, 6, NULL, NULL);
INSERT INTO `pageLookup` VALUES(26, 4, NULL, NULL);
INSERT INTO `pageLookup` VALUES(27, 1, NULL, NULL);
INSERT INTO `pageLookup` VALUES(28, 1, 27, NULL);
INSERT INTO `pageLookup` VALUES(29, 1, 1, NULL);
INSERT INTO `pageLookup` VALUES(31, 1, NULL, NULL);
INSERT INTO `pageLookup` VALUES(32, 4, NULL, NULL);
INSERT INTO `pageLookup` VALUES(33, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pageMenuLinks`
--

DROP TABLE IF EXISTS `pageMenuLinks`;
CREATE TABLE IF NOT EXISTS `pageMenuLinks` (
  `menuId` int(11) NOT NULL,
  `linkText` varchar(50) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `role` varchar(100) NOT NULL,
  `resource` varchar(255) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `visibility` enum('public','private') NOT NULL,
  PRIMARY KEY (`menuId`),
  KEY `linkText` (`linkText`,`uri`,`role`,`visibility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pageMenuLinks`
--


-- --------------------------------------------------------

--
-- Table structure for table `pageMenus`
--

DROP TABLE IF EXISTS `pageMenus`;
CREATE TABLE IF NOT EXISTS `pageMenus` (
  `menuId` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `visibility` enum('public','private') NOT NULL,
  PRIMARY KEY (`menuId`),
  KEY `pageId` (`pageId`,`userId`,`visibility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `pageMenus`
--


-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `pageId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `parentId` int(11) NOT NULL DEFAULT '0',
  `role` varchar(100) NOT NULL DEFAULT 'user',
  `pageName` varchar(50) NOT NULL,
  `visibility` enum('public','private') NOT NULL DEFAULT 'public',
  `createdDate` int(11) DEFAULT NULL,
  `publishDate` int(11) DEFAULT NULL,
  `modifiedDate` int(11) DEFAULT NULL,
  `archivedDate` int(11) DEFAULT NULL,
  `pageOrder` int(11) DEFAULT NULL,
  `pageType` varchar(255) NOT NULL DEFAULT 'page',
  `pageText` longtext NOT NULL,
  `keyWords` varchar(255) NOT NULL,
  `showSlider` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pageId`),
  UNIQUE KEY `pageName` (`pageName`),
  KEY `userId` (`visibility`,`createdDate`,`modifiedDate`,`archivedDate`,`pageOrder`,`pageType`),
  KEY `parentId` (`parentId`),
  KEY `role` (`role`),
  KEY `publishDate` (`publishDate`),
  KEY `userId_2` (`userId`),
  KEY `keyWords` (`keyWords`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` VALUES(1, 1, 0, 'guest', 'home', 'public', 2012, 0, 0, 0, 1, 'home', '<p>\r\n   This is test text for the first testing page. Test Edit.</p>\r\n<p>\r\n &nbsp;</p>\r\n<ul>\r\n  <li>\r\n        Item One</li>\r\n   <li>\r\n        Item Two</li>\r\n   <li>\r\n        Item Three</li>\r\n <li>\r\n        Item Four</li>\r\n  <li>\r\n        Item Five</li>\r\n</ul>\r\n', ' Testing, Extra,Keywords', 0);
INSERT INTO `pages` VALUES(15, 1, 1, 'guest', 'services', 'public', 2012, NULL, NULL, NULL, 2, 'page', '<p>\r\n This is the services page. This is where the services content will go.</p>\r\n<p>\r\n   Blah</p>\r\n<p>\r\n Blah</p>\r\n<p>\r\n Blah</p>\r\n<p>\r\n blah again</p>\r\n<p>\r\n   edit</p>\r\n', '', 0);
INSERT INTO `pages` VALUES(19, 1, 0, 'guest', 'contact', 'public', 2012, NULL, NULL, NULL, 6, 'contact', '<p>\r\n   Call Us anytime!</p>\r\n<p>\r\n &nbsp;</p>\r\n<ul>\r\n  <li>\r\n        Company One : <a href="http://clients.dirextion.com" target="_blank">Dirextion</a></li>\r\n <li>\r\n        Company Two :</li>\r\n  <li>\r\n        Company Three :</li>\r\n    <li>\r\n        Company Four :</li>\r\n <li>\r\n        Company Five :</li>\r\n <li>\r\n        Company Six :</li>\r\n  <li>\r\n        Company Seven :</li>\r\n    <li>\r\n        Company Eight :</li>\r\n    <li>\r\n        Company Nine :</li>\r\n <li>\r\n        Company Ten :</li>\r\n</ul>\r\n', '', 0);
INSERT INTO `pages` VALUES(23, 1, 0, 'guest', 'blog', 'public', 2012, NULL, NULL, NULL, 3, 'page', '<p>\r\n say what you like but this is easy</p>\r\n', '', 1);
INSERT INTO `pages` VALUES(25, 1, 0, 'guest', 'media', 'public', 1346994000, NULL, NULL, NULL, 7, 'media', '<p>\r\n Media test&nbsp;</p>\r\n', '', 0);
INSERT INTO `pages` VALUES(26, 1, 23, 'guest', 'food', 'public', 2012, NULL, NULL, NULL, NULL, 'page', '<p>\r\n hereisanexample</p>\r\n', '', 0);
INSERT INTO `pages` VALUES(27, 1, 23, 'user', 'support', 'public', 2012, NULL, NULL, NULL, NULL, 'page', '<p>\r\n   This is a test parent support page that will have a child page that is a media page, lets see if this works.</p>\r\n', '', 0);
INSERT INTO `pages` VALUES(28, 1, 27, 'user', 'training', 'public', 1347339600, NULL, NULL, NULL, NULL, 'media', '<p>\r\n   Support / Training, will hold a gallery</p>\r\n', '', 0);
INSERT INTO `pages` VALUES(29, 0, 1, 'guest', 'testing', 'public', 1347598800, NULL, NULL, NULL, NULL, 'page', 'This is some test text, also need to test why this does not render the editor when the useragent is set to iOS in my firefox addon.', '', 0);
INSERT INTO `pages` VALUES(31, 0, 0, 'guest', 'testone', 'public', 2012, NULL, NULL, NULL, 2, 'page', '<p>\r\n  fbsrgbdsrrgt</p>\r\n<p>\r\n &nbsp;</p>\r\n<p>\r\n   kjnuvbuytvyvt</p>\r\n', '', 0);
INSERT INTO `pages` VALUES(32, 0, 0, 'guest', 'products', 'public', 2012, NULL, NULL, NULL, 4, 'page', '<p>\r\n test2</p>\r\n', '', 0);
INSERT INTO `pages` VALUES(33, 0, 0, 'guest', 'top', 'public', 1348117200, NULL, NULL, NULL, 5, 'page', '<ol>\r\n   <li>\r\n        here we are</li>\r\n</ol>\r\n', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pageTypes`
--

DROP TABLE IF EXISTS `pageTypes`;
CREATE TABLE IF NOT EXISTS `pageTypes` (
  `pageTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`pageTypeId`),
  UNIQUE KEY `type_2` (`type`),
  KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pageTypes`
--

INSERT INTO `pageTypes` VALUES(2, 'contact');
INSERT INTO `pageTypes` VALUES(1, 'home');
INSERT INTO `pageTypes` VALUES(3, 'media');
INSERT INTO `pageTypes` VALUES(4, 'page');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) NOT NULL,
  `inheritsFrom` varchar(255) NOT NULL,
  `publicName` varchar(100) NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` VALUES(1, 'admin', 'jradmin', '');
INSERT INTO `roles` VALUES(2, 'jradmin', 'moderator', '');
INSERT INTO `roles` VALUES(3, 'moderator', 'user', '');
INSERT INTO `roles` VALUES(4, 'user', 'guest', '');
INSERT INTO `roles` VALUES(5, 'guest', 'none', '');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id` char(32) NOT NULL DEFAULT '',
  `modified` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `session`
--

INSERT INTO `session` VALUES('621e8aeac5531490939cb1d7d236f8c4', 1349389328, 86400, '.Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:15.0) Gecko/20100101 Firefox/15.0.1 FirePHP/0.7.1|a:1:{s:7:"storage";s:3050:"a:6:{s:12:"browser_type";s:7:"desktop";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:27:"Zend_Http_UserAgent_Desktop";s:6:"device";s:2490:"a:6:{s:10:"_aFeatures";a:28:{s:21:"browser_compatibility";s:7:"Firefox";s:14:"browser_engine";s:5:"Gecko";s:12:"browser_name";s:7:"FirePHP";s:13:"browser_token";s:19:"Intel Mac OS X 10.6";s:15:"browser_version";s:5:"0.7.1";s:7:"comment";a:2:{s:4:"full";s:39:"Macintosh; Intel Mac OS X 10.6; rv:15.0";s:6:"detail";a:3:{i:0;s:9:"Macintosh";i:1;s:20:" Intel Mac OS X 10.6";i:2;s:8:" rv:15.0";}}s:18:"compatibility_flag";s:9:"Macintosh";s:15:"device_os_token";s:7:"rv:15.0";s:6:"others";a:2:{s:4:"full";s:43:"Gecko/20100101 Firefox/15.0.1 FirePHP/0.7.1";s:6:"detail";a:3:{i:0;a:3:{i:0;s:14:"Gecko/20100101";i:1;s:5:"Gecko";i:2;s:8:"20100101";}i:1;a:3:{i:0;s:14:"Firefox/15.0.1";i:1;s:7:"Firefox";i:2;s:6:"15.0.1";}i:2;a:3:{i:0;s:13:"FirePHP/0.7.1";i:1;s:7:"FirePHP";i:2;s:5:"0.7.1";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:0;s:10:"is_desktop";b:1;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:9:"127.0.0.1";s:11:"php_version";s:5:"5.3.6";s:9:"server_os";s:6:"apache";s:17:"server_os_version";i:1;s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:14:"en-us,en;q=0.5";s:9:"server_ip";s:9:"127.0.0.1";s:11:"server_name";s:20:"aurora.dirextion.net";}s:7:"_aGroup";a:2:{s:12:"product_info";a:21:{i:0;s:21:"browser_compatibility";i:1;s:14:"browser_engine";i:2;s:12:"browser_name";i:3;s:13:"browser_token";i:4;s:15:"browser_version";i:5;s:7:"comment";i:6;s:18:"compatibility_flag";i:7;s:15:"device_os_token";i:8;s:6:"others";i:9;s:12:"product_name";i:10;s:15:"product_version";i:11;s:10:"user_agent";i:12;s:18:"is_wireless_device";i:13;s:9:"is_mobile";i:14;s:10:"is_desktop";i:15;s:9:"is_tablet";i:16;s:6:"is_bot";i:17;s:8:"is_email";i:18;s:7:"is_text";i:19;s:25:"device_claims_web_support";i:20;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:7:"FirePHP";s:15:"_browserVersion";s:5:"0.7.1";s:10:"_userAgent";s:97:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:15.0) Gecko/20100101 Firefox/15.0.1 FirePHP/0.7.1";s:7:"_images";a:6:{i:0;s:4:"jpeg";i:1;s:3:"gif";i:2;s:3:"png";i:3;s:5:"pjpeg";i:4;s:5:"x-png";i:5;s:3:"bmp";}}";s:10:"user_agent";s:97:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:15.0) Gecko/20100101 Firefox/15.0.1 FirePHP/0.7.1";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}Zend_Auth|a:1:{s:7:"storage";O:8:"stdClass":3:{s:6:"userId";s:1:"1";s:8:"userName";s:7:"dxadmin";s:4:"role";s:7:"dxadmin";}}');
INSERT INTO `session` VALUES('c79f61cb1da9b4078e2f99c60b8e3a70', 1349409751, 86400, '.Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:15.0) Gecko/20100101 Firefox/15.0.1 FirePHP/0.7.1|a:1:{s:7:"storage";s:3059:"a:6:{s:12:"browser_type";s:7:"desktop";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:27:"Zend_Http_UserAgent_Desktop";s:6:"device";s:2499:"a:6:{s:10:"_aFeatures";a:28:{s:21:"browser_compatibility";s:7:"Firefox";s:14:"browser_engine";s:5:"Gecko";s:12:"browser_name";s:7:"FirePHP";s:13:"browser_token";s:19:"Intel Mac OS X 10.6";s:15:"browser_version";s:5:"0.7.1";s:7:"comment";a:2:{s:4:"full";s:39:"Macintosh; Intel Mac OS X 10.6; rv:15.0";s:6:"detail";a:3:{i:0;s:9:"Macintosh";i:1;s:20:" Intel Mac OS X 10.6";i:2;s:8:" rv:15.0";}}s:18:"compatibility_flag";s:9:"Macintosh";s:15:"device_os_token";s:7:"rv:15.0";s:6:"others";a:2:{s:4:"full";s:43:"Gecko/20100101 Firefox/15.0.1 FirePHP/0.7.1";s:6:"detail";a:3:{i:0;a:3:{i:0;s:14:"Gecko/20100101";i:1;s:5:"Gecko";i:2;s:8:"20100101";}i:1;a:3:{i:0;s:14:"Firefox/15.0.1";i:1;s:7:"Firefox";i:2;s:6:"15.0.1";}i:2;a:3:{i:0;s:13:"FirePHP/0.7.1";i:1;s:7:"FirePHP";i:2;s:5:"0.7.1";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:0;s:10:"is_desktop";b:1;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:12:"99.71.180.90";s:11:"php_version";s:5:"5.3.6";s:9:"server_os";s:6:"apache";s:17:"server_os_version";i:1;s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:14:"en-us,en;q=0.5";s:9:"server_ip";s:13:"192.168.1.140";s:11:"server_name";s:20:"aurora.dirextion.net";}s:7:"_aGroup";a:2:{s:12:"product_info";a:21:{i:0;s:21:"browser_compatibility";i:1;s:14:"browser_engine";i:2;s:12:"browser_name";i:3;s:13:"browser_token";i:4;s:15:"browser_version";i:5;s:7:"comment";i:6;s:18:"compatibility_flag";i:7;s:15:"device_os_token";i:8;s:6:"others";i:9;s:12:"product_name";i:10;s:15:"product_version";i:11;s:10:"user_agent";i:12;s:18:"is_wireless_device";i:13;s:9:"is_mobile";i:14;s:10:"is_desktop";i:15;s:9:"is_tablet";i:16;s:6:"is_bot";i:17;s:8:"is_email";i:18;s:7:"is_text";i:19;s:25:"device_claims_web_support";i:20;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:7:"FirePHP";s:15:"_browserVersion";s:5:"0.7.1";s:10:"_userAgent";s:97:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:15.0) Gecko/20100101 Firefox/15.0.1 FirePHP/0.7.1";s:7:"_images";a:6:{i:0;s:4:"jpeg";i:1;s:3:"gif";i:2;s:3:"png";i:3;s:5:"pjpeg";i:4;s:5:"x-png";i:5;s:3:"bmp";}}";s:10:"user_agent";s:97:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:15.0) Gecko/20100101 Firefox/15.0.1 FirePHP/0.7.1";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}Zend_Auth|a:1:{s:7:"storage";O:8:"stdClass":3:{s:6:"userId";s:1:"1";s:8:"userName";s:7:"dxadmin";s:4:"role";s:7:"dxadmin";}}');
INSERT INTO `session` VALUES('f76a9da4c91ec805bfac230015dded90', 1349409523, 86400, '.Microsoft-WebDAV-MiniRedir/6.1.7600|a:1:{s:7:"storage";s:1866:"a:6:{s:12:"browser_type";s:7:"desktop";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:27:"Zend_Http_UserAgent_Desktop";s:6:"device";s:1437:"a:6:{s:10:"_aFeatures";a:19:{s:12:"browser_name";s:26:"Microsoft-WebDAV-MiniRedir";s:15:"browser_version";s:8:"6.1.7600";s:12:"product_name";s:26:"Microsoft-WebDAV-MiniRedir";s:15:"product_version";s:8:"6.1.7600";s:10:"user_agent";s:35:"Microsoft-WebDAV-MiniRedir/6.1.7600";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:0;s:10:"is_desktop";b:1;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:15:"115.119.119.148";s:11:"php_version";s:5:"5.3.6";s:9:"server_os";s:6:"apache";s:17:"server_os_version";i:1;s:9:"server_ip";s:13:"192.168.1.140";s:11:"server_name";s:11:"24.179.4.69";}s:7:"_aGroup";a:2:{s:12:"product_info";a:14:{i:0;s:12:"browser_name";i:1;s:15:"browser_version";i:2;s:12:"product_name";i:3;s:15:"product_version";i:4;s:10:"user_agent";i:5;s:18:"is_wireless_device";i:6;s:9:"is_mobile";i:7;s:10:"is_desktop";i:8;s:9:"is_tablet";i:9;s:6:"is_bot";i:10;s:8:"is_email";i:11;s:7:"is_text";i:12;s:25:"device_claims_web_support";i:13;s:9:"client_ip";}s:11:"server_info";a:5:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:9:"server_ip";i:4;s:11:"server_name";}}s:8:"_browser";s:26:"Microsoft-WebDAV-MiniRedir";s:15:"_browserVersion";s:8:"6.1.7600";s:10:"_userAgent";s:35:"Microsoft-WebDAV-MiniRedir/6.1.7600";s:7:"_images";a:6:{i:0;s:4:"jpeg";i:1;s:3:"gif";i:2;s:3:"png";i:3;s:5:"pjpeg";i:4;s:5:"x-png";i:5;s:3:"bmp";}}";s:10:"user_agent";s:35:"Microsoft-WebDAV-MiniRedir/6.1.7600";s:11:"http_accept";N;}";}');

-- --------------------------------------------------------

--
-- Table structure for table `skins`
--

DROP TABLE IF EXISTS `skins`;
CREATE TABLE IF NOT EXISTS `skins` (
  `skinId` int(11) NOT NULL AUTO_INCREMENT,
  `isCurrentSkin` int(1) NOT NULL DEFAULT '0',
  `skinName` varchar(50) DEFAULT NULL,
  `includeDefault` int(1) NOT NULL DEFAULT '1',
  `skinCssPath` varchar(255) DEFAULT NULL,
  `skinCssMobiPath` varchar(255) NOT NULL,
  `skinTemplatePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`skinId`),
  UNIQUE KEY `skinName` (`skinName`),
  KEY `skinCssPath` (`skinCssPath`,`skinTemplatePath`),
  KEY `includeDefault` (`includeDefault`),
  KEY `isCurrentSkin` (`isCurrentSkin`),
  KEY `skinCssMobiPath` (`skinCssMobiPath`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `skins`
--

INSERT INTO `skins` VALUES(1, 1, 'default', 0, 'skins/default/style.css', '', NULL);
INSERT INTO `skins` VALUES(9, 0, 'red', 1, 'skins/red/style.css', 'skins/red/style.mobi.css', NULL);
INSERT INTO `skins` VALUES(11, 0, 'green', 1, 'skins/green/style.css', 'skins/green/style.mobi.css', NULL);
INSERT INTO `skins` VALUES(12, 0, 'yellow', 1, 'skins/yellow/style.css', 'skins/yellow/style.mobi.css', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliderSettings`
--

DROP TABLE IF EXISTS `sliderSettings`;
CREATE TABLE IF NOT EXISTS `sliderSettings` (
  `name` varchar(255) NOT NULL,
  `isActive` int(1) NOT NULL DEFAULT '0' COMMENT 'used for boolean',
  `effect` varchar(255) NOT NULL DEFAULT 'fade',
  `slices` int(11) NOT NULL DEFAULT '15',
  `boxCols` int(11) NOT NULL DEFAULT '8',
  `boxRows` int(11) NOT NULL DEFAULT '4',
  `animSpeed` int(11) NOT NULL DEFAULT '500',
  `pauseTime` int(11) NOT NULL DEFAULT '3000',
  `startSlide` int(11) NOT NULL DEFAULT '1',
  `directionNav` int(1) NOT NULL DEFAULT '1' COMMENT 'used for boolean',
  `controlNav` int(1) NOT NULL DEFAULT '1' COMMENT 'used for boolean',
  `controlNavThumbs` int(1) NOT NULL DEFAULT '0' COMMENT 'used for boolean',
  `pauseOnHover` int(1) NOT NULL DEFAULT '1' COMMENT 'used for boolean',
  `manualAdvance` int(1) NOT NULL DEFAULT '0' COMMENT 'used for boolean',
  `prevText` varchar(25) NOT NULL DEFAULT 'Prev' COMMENT 'label for prev text',
  `nextText` varchar(25) NOT NULL DEFAULT 'Next' COMMENT 'label for next text',
  `randomStart` int(1) NOT NULL DEFAULT '0' COMMENT 'used for boolean',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sliderSettings`
--

INSERT INTO `sliderSettings` VALUES('default', 1, 'fade', 15, 8, 4, 500, 3000, 1, 1, 1, 0, 1, 0, 'Prev', 'Next', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `userName` varchar(128) NOT NULL,
  `firstName` varchar(128) NOT NULL,
  `lastName` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `passWord` char(40) NOT NULL,
  `salt` char(32) NOT NULL,
  `role` varchar(100) NOT NULL DEFAULT 'user',
  `uStatus` varchar(8) NOT NULL DEFAULT 'disabled',
  `registeredDate` varchar(11) NOT NULL,
  `hash` int(10) NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `email_pass` (`email`,`passWord`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` VALUES(1, '', 'dxadmin', 'Joey', 'Smith', 'jsmith@dirextion.com', 'e1da551374f0a6f136916647ab0f157cc192ea22', '', 'dxadmin', 'enabled', '1336427046', 0);
INSERT INTO `user` VALUES(2, 'testUser', 'testuser', 'test', 'user', 'test@test.com', 'e1da551374f0a6f136916647ab0f157cc192ea22', '', 'user', 'disabled', '', 0);
INSERT INTO `user` VALUES(3, '', 'Sam', 'Samantha', 'Gibbons', 'sgibbons@dirextion.com', '3caeb09c2c36c26f2e72f3d494d31a2e11c96b03', '', 'dxadmin', 'enabled', '1345822521', 0);
INSERT INTO `user` VALUES(4, '', 'dsweet', 'Dan', 'Sweet', 'dsweet@dirextion.com', '9c3fb3e4ab3227804ebad3d82a6649c0475c1eae', '', 'dxadmin', 'enabled', '1345822700', 0);
INSERT INTO `user` VALUES(5, '', 'mrumore', 'Michael', 'Rumore', 'webmaster@dirextion.com', 'c00f564401ee5bde839dd6256edde7fe14ffd73f', '', 'dxadmin', 'enabled', '1346781800', 0);
INSERT INTO `user` VALUES(6, '', 'Samantha', 'Samantha', 'Gibbons', 'sgibbons@dirextion.com', '3caeb09c2c36c26f2e72f3d494d31a2e11c96b03', '', 'dxadmin', 'enabled', '1346950260', 0);
