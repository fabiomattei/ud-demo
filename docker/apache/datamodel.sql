-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Creato il: Set 18, 2019 alle 18:34
-- Versione del server: 10.4.3-MariaDB-1:10.4.3+maria~bionic
-- Versione PHP: 7.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `firststep`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `updated` date NOT NULL,
  `created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `articles`
--

INSERT INTO `articles` (`id`, `title`, `description`, `updated`, `created`) VALUES
(1, 'My first article', 'Lorem ipsum dolor sit amet, elitr volumus dolores pro ei, qui ei mollis senserit, eu labore docendi rationibus quo. Ut cum commodo nonumes reprimique. Eum et meis consulatu efficiendi, sea tacimates signiferumque ut. Ne vel convenire ocurreret, ea nec etiam possit. Ea populo omittam partiendo est.\r\n\r\nPlatonem incorrupte cum ei, te has probo animal, putant equidem offendit in usu. Te ridens blandit pri. Ne adversarium accommodare instructior vim, mutat electram dissentiunt ea vix, ad malis eloquentiam adversarium pro. Ut has postea invidunt. Facete perpetua per ut, nulla virtute denique eu eos, postea propriae suavitate vix no.\r\n\r\nDicta fastidii ei nec, nec corrumpit vituperata omittantur ei. In postulant torquatos dissentiet est, sit molestie noluisse accommodare cu. Nulla nemore copiosae cum in, ne veri quas etiam quo. Nec an magna reque, eam nibh partem in. Duo augue prodesset ex, has oratio inimicus accommodare ei.\r\n\r\nEt eam dolore salutatus, eum brute omnes ut. In eum tota tractatos interpretaris, nemore aliquid indoctum sea ne. Cu his prima adhuc audiam, agam sapientem mei ei. Agam diceret vivendo vix et, eu alia facilis cum, amet percipit vis te. Erant adipiscing ut per, his vide recteque ex. Quidam incorrupte ex pro, at has fugit verear nominati. Qui an platonem ocurreret, vix omnesque percipit incorrupte et.\r\n\r\nDiam integre aliquid eu nam, eu eruditi argumentum omittantur vel. Vix no noster mollis sententiae. Ut tale dictas evertitur sed, convenire similique inciderint id sea, eam aperiam equidem no. Nec diam utamur id, ludus doming an mea. Ei ius salutatus dignissim.', '2019-07-13', '2019-07-13'),
(2, 'My second article', 'Lorem ipsum dolor sit amet, elitr volumus dolores pro ei, qui ei mollis senserit, eu labore docendi rationibus quo. Ut cum commodo nonumes reprimique. Eum et meis consulatu efficiendi, sea tacimates signiferumque ut. Ne vel convenire ocurreret, ea nec etiam possit. Ea populo omittam partiendo est.\r\n\r\nPlatonem incorrupte cum ei, te has probo animal, putant equidem offendit in usu. Te ridens blandit pri. Ne adversarium accommodare instructior vim, mutat electram dissentiunt ea vix, ad malis eloquentiam adversarium pro. Ut has postea invidunt. Facete perpetua per ut, nulla virtute denique eu eos, postea propriae suavitate vix no.\r\n\r\nDicta fastidii ei nec, nec corrumpit vituperata omittantur ei. In postulant torquatos dissentiet est, sit molestie noluisse accommodare cu. Nulla nemore copiosae cum in, ne veri quas etiam quo. Nec an magna reque, eam nibh partem in. Duo augue prodesset ex, has oratio inimicus accommodare ei.\r\n\r\nEt eam dolore salutatus, eum brute omnes ut. In eum tota tractatos interpretaris, nemore aliquid indoctum sea ne. Cu his prima adhuc audiam, agam sapientem mei ei. Agam diceret vivendo vix et, eu alia facilis cum, amet percipit vis te. Erant adipiscing ut per, his vide recteque ex. Quidam incorrupte ex pro, at has fugit verear nominati. Qui an platonem ocurreret, vix omnesque percipit incorrupte et.\r\n\r\nDiam integre aliquid eu nam, eu eruditi argumentum omittantur vel. Vix no noster mollis sententiae. Ut tale dictas evertitur sed, convenire similique inciderint id sea, eam aperiam equidem no. Nec diam utamur id, ludus doming an mea. Ei ius salutatus dignissim.', '2019-07-13', '2019-07-13'),
(3, 'My third article', 'Lorem ipsum dolor sit amet, elitr volumus dolores pro ei, qui ei mollis senserit, eu labore docendi rationibus quo. Ut cum commodo nonumes reprimique. Eum et meis consulatu efficiendi, sea tacimates signiferumque ut. Ne vel convenire ocurreret, ea nec etiam possit. Ea populo omittam partiendo est.\r\n\r\nPlatonem incorrupte cum ei, te has probo animal, putant equidem offendit in usu. Te ridens blandit pri. Ne adversarium accommodare instructior vim, mutat electram dissentiunt ea vix, ad malis eloquentiam adversarium pro. Ut has postea invidunt. Facete perpetua per ut, nulla virtute denique eu eos, postea propriae suavitate vix no.\r\n\r\nDicta fastidii ei nec, nec corrumpit vituperata omittantur ei. In postulant torquatos dissentiet est, sit molestie noluisse accommodare cu. Nulla nemore copiosae cum in, ne veri quas etiam quo. Nec an magna reque, eam nibh partem in. Duo augue prodesset ex, has oratio inimicus accommodare ei.\r\n\r\nEt eam dolore salutatus, eum brute omnes ut. In eum tota tractatos interpretaris, nemore aliquid indoctum sea ne. Cu his prima adhuc audiam, agam sapientem mei ei. Agam diceret vivendo vix et, eu alia facilis cum, amet percipit vis te. Erant adipiscing ut per, his vide recteque ex. Quidam incorrupte ex pro, at has fugit verear nominati. Qui an platonem ocurreret, vix omnesque percipit incorrupte et.\r\n\r\nDiam integre aliquid eu nam, eu eruditi argumentum omittantur vel. Vix no noster mollis sententiae. Ut tale dictas evertitur sed, convenire similique inciderint id sea, eam aperiam equidem no. Nec diam utamur id, ludus doming an mea. Ei ius salutatus dignissim.', '2019-09-18', '2019-09-18'),
(4, 'My forth article', 'Lorem ipsum dolor sit amet, elitr volumus dolores pro ei, qui ei mollis senserit, eu labore docendi rationibus quo. Ut cum commodo nonumes reprimique. Eum et meis consulatu efficiendi, sea tacimates signiferumque ut. Ne vel convenire ocurreret, ea nec etiam possit. Ea populo omittam partiendo est.\r\n\r\nPlatonem incorrupte cum ei, te has probo animal, putant equidem offendit in usu. Te ridens blandit pri. Ne adversarium accommodare instructior vim, mutat electram dissentiunt ea vix, ad malis eloquentiam adversarium pro. Ut has postea invidunt. Facete perpetua per ut, nulla virtute denique eu eos, postea propriae suavitate vix no.\r\n\r\nDicta fastidii ei nec, nec corrumpit vituperata omittantur ei. In postulant torquatos dissentiet est, sit molestie noluisse accommodare cu. Nulla nemore copiosae cum in, ne veri quas etiam quo. Nec an magna reque, eam nibh partem in. Duo augue prodesset ex, has oratio inimicus accommodare ei.\r\n\r\nEt eam dolore salutatus, eum brute omnes ut. In eum tota tractatos interpretaris, nemore aliquid indoctum sea ne. Cu his prima adhuc audiam, agam sapientem mei ei. Agam diceret vivendo vix et, eu alia facilis cum, amet percipit vis te. Erant adipiscing ut per, his vide recteque ex. Quidam incorrupte ex pro, at has fugit verear nominati. Qui an platonem ocurreret, vix omnesque percipit incorrupte et.\r\n\r\nDiam integre aliquid eu nam, eu eruditi argumentum omittantur vel. Vix no noster mollis sententiae. Ut tale dictas evertitur sed, convenire similique inciderint id sea, eam aperiam equidem no. Nec diam utamur id, ludus doming an mea. Ei ius salutatus dignissim.', '2019-09-18', '2019-09-18'),
(5, 'My fifth article', 'Lorem ipsum dolor sit amet, elitr volumus dolores pro ei, qui ei mollis senserit, eu labore docendi rationibus quo. Ut cum commodo nonumes reprimique. Eum et meis consulatu efficiendi, sea tacimates signiferumque ut. Ne vel convenire ocurreret, ea nec etiam possit. Ea populo omittam partiendo est.\r\n\r\nPlatonem incorrupte cum ei, te has probo animal, putant equidem offendit in usu. Te ridens blandit pri. Ne adversarium accommodare instructior vim, mutat electram dissentiunt ea vix, ad malis eloquentiam adversarium pro. Ut has postea invidunt. Facete perpetua per ut, nulla virtute denique eu eos, postea propriae suavitate vix no.\r\n\r\nDicta fastidii ei nec, nec corrumpit vituperata omittantur ei. In postulant torquatos dissentiet est, sit molestie noluisse accommodare cu. Nulla nemore copiosae cum in, ne veri quas etiam quo. Nec an magna reque, eam nibh partem in. Duo augue prodesset ex, has oratio inimicus accommodare ei.\r\n\r\nEt eam dolore salutatus, eum brute omnes ut. In eum tota tractatos interpretaris, nemore aliquid indoctum sea ne. Cu his prima adhuc audiam, agam sapientem mei ei. Agam diceret vivendo vix et, eu alia facilis cum, amet percipit vis te. Erant adipiscing ut per, his vide recteque ex. Quidam incorrupte ex pro, at has fugit verear nominati. Qui an platonem ocurreret, vix omnesque percipit incorrupte et.\r\n\r\nDiam integre aliquid eu nam, eu eruditi argumentum omittantur vel. Vix no noster mollis sententiae. Ut tale dictas evertitur sed, convenire similique inciderint id sea, eam aperiam equidem no. Nec diam utamur id, ludus doming an mea. Ei ius salutatus dignissim.', '2019-09-19', '2019-09-19');

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE `user` (
  `usr_id` bigint(20) NOT NULL,
  `usr_defaultgroup` varchar(80) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `usr_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `usr_surname` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `usr_email` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `usr_hashedpsw` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `usr_password_updated` datetime NOT NULL,
  `usr_updated` datetime NOT NULL,
  `usr_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`usr_id`, `usr_defaultgroup`, `usr_name`, `usr_surname`, `usr_email`, `usr_hashedpsw`, `usr_password_updated`, `usr_updated`, `usr_created`) VALUES
(1, 'administrationgroup', 'Admin', '', 'admin', '$2y$10$gUWxjdAJRE.KyWqEZh4w1.kRDAumgVamek.BBq.Li2CMkK7GGeeV2', '2018-10-28 10:04:49', '2018-10-21 10:13:39', '2018-10-21 00:00:00'),
(2, 'author', 'Manager', '', 'manager', '$2y$10$YmsVMDQrYjnEdbkqfB5pNuLzyeMQep0C/ahaRWQSs/AN63/U5SXTW', '2018-08-07 00:00:00', '2018-08-07 00:00:00', '2018-08-07 00:00:00');

-- --------------------------------------------------------

--
-- Struttura della tabella `usergroup`
--

CREATE TABLE `usergroup` (
  `ug_id` int(10) UNSIGNED NOT NULL,
  `ug_groupslug` varchar(80) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ug_userid` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `ug_updated` datetime NOT NULL,
  `ug_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`usr_id`);

--
-- Indici per le tabelle `usergroup`
--
ALTER TABLE `usergroup`
  ADD PRIMARY KEY (`ug_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `user`
--
ALTER TABLE `user`
  MODIFY `usr_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `usergroup`
--
ALTER TABLE `usergroup`
  MODIFY `ug_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
