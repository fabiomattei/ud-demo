-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Creato il: Dic 27, 2020 alle 08:18
-- Versione del server: 10.4.10-MariaDB-1:10.4.10+maria~bionic
-- Versione PHP: 7.4.1

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
-- Struttura della tabella `ud_blockedip`
--

CREATE TABLE `ud_blockedip` (
                             `ip_id` int(10) UNSIGNED NOT NULL,
                             `ip_ipaddress` varchar(20) COLLATE utf8_bin NOT NULL,
                             `ip_failed_attepts` int(10) UNSIGNED NOT NULL DEFAULT 0,
                             `ip_time_to_remove` datetime NOT NULL,
                             `ip_updated` datetime NOT NULL,
                             `ip_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `ud_deactivateduser`
--

CREATE TABLE `ud_deactivateduser` (
                                   `du_id` int(10) UNSIGNED NOT NULL,
                                   `du_username` varchar(255) COLLATE utf8_bin NOT NULL,
                                   `du_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `requests`
--

CREATE TABLE `requests` (
                            `id` int(11) NOT NULL,
                            `name` varchar(255) NOT NULL,
                            `amount` decimal(8,2) NOT NULL,
                            `duedate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `requests`
--

INSERT INTO `requests` (`id`, `name`, `amount`, `duedate`) VALUES
(1, 'Fabio', '13.45', '2019-10-02'),
(2, 'John', '12.54', '2019-10-02'),
(3, 'Hellen', '10.00', '2019-10-02');

-- --------------------------------------------------------

--
-- Struttura della tabella `ud_ud_securitylog`
--

CREATE TABLE `ud_securitylog` (
                               `sl_id` int(10) UNSIGNED NOT NULL,
                               `sl_ipaddress` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
                               `sl_username` varchar(255) COLLATE utf8_bin NOT NULL,
                               `sl_password` varchar(255) COLLATE utf8_bin NOT NULL,
                               `sl_description` varchar(255) COLLATE utf8_bin NOT NULL,
                               `sl_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `ud_users`
--

CREATE TABLE `ud_users` (
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
-- Dump dei dati per la tabella `ud_users`
--

INSERT INTO `ud_users` (`usr_id`, `usr_defaultgroup`, `usr_name`, `usr_surname`, `usr_email`, `usr_hashedpsw`, `usr_password_updated`, `usr_updated`, `usr_created`) VALUES
(1, 'administrationgroup', 'Admin', '', 'admin', '$2y$10$gUWxjdAJRE.KyWqEZh4w1.kRDAumgVamek.BBq.Li2CMkK7GGeeV2', '2018-10-28 10:04:49', '2018-10-21 10:13:39', '2018-10-21 00:00:00'),
(2, 'author', 'Author', '', 'author', '$2y$10$z9DHuhUuVjbwsRtwrwMVQOlE5k6ZCD6Dt5PmfA03wL75Geo14wLKm', '2020-12-27 08:15:28', '2018-08-07 00:00:00', '2018-08-07 00:00:00');

-- --------------------------------------------------------

--
-- Struttura della tabella `ud_usergroup`
--

CREATE TABLE `ud_usergroup` (
                             `ug_id` int(10) UNSIGNED NOT NULL,
                             `ug_groupslug` varchar(80) COLLATE utf8_bin NOT NULL DEFAULT '',
                             `ug_userid` int(11) UNSIGNED NOT NULL DEFAULT 0,
                             `ug_updated` datetime NOT NULL,
                             `ug_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `ud_usergroup`
--

INSERT INTO `ud_usergroup` (`ug_id`, `ug_groupslug`, `ug_userid`, `ug_updated`, `ug_created`) VALUES
(1, 'administrationgroup', 1, '2020-12-10 18:11:38', '2020-12-10 18:11:38'),
(2, 'author', 2, '2020-12-10 18:11:54', '2020-12-10 18:11:54');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `articles`
--
ALTER TABLE `articles`
    ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ud_blockedip`
--
ALTER TABLE `ud_blockedip`
    ADD PRIMARY KEY (`ip_id`);

--
-- Indici per le tabelle `ud_deactivateduser`
--
ALTER TABLE `ud_deactivateduser`
    ADD PRIMARY KEY (`du_id`);

--
-- Indici per le tabelle `requests`
--
ALTER TABLE `requests`
    ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ud_securitylog`
--
ALTER TABLE `ud_securitylog`
    ADD PRIMARY KEY (`sl_id`);

--
-- Indici per le tabelle `ud_users`
--
ALTER TABLE `ud_users`
    ADD PRIMARY KEY (`usr_id`);

--
-- Indici per le tabelle `ud_usergroup`
--
ALTER TABLE `ud_usergroup`
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
-- AUTO_INCREMENT per la tabella `ud_blockedip`
--
ALTER TABLE `ud_blockedip`
    MODIFY `ip_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ud_deactivateduser`
--
ALTER TABLE `ud_deactivateduser`
    MODIFY `du_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `requests`
--
ALTER TABLE `requests`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `ud_securitylog`
--
ALTER TABLE `ud_securitylog`
    MODIFY `sl_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ud_users`
--
ALTER TABLE `ud_users`
    MODIFY `usr_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `ud_usergroup`
--
ALTER TABLE `ud_usergroup`
    MODIFY `ug_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
