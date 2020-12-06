SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `blockedip` (
  `ip_id` int UNSIGNED NOT NULL,
  `ip_ipaddress` varchar(20) NOT NULL,
  `ip_failed_attepts` int UNSIGNED NOT NULL DEFAULT '0',
  `ip_time_to_remove` datetime NOT NULL,
  `ip_updated` datetime NOT NULL,
  `ip_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `blockedip`
--
ALTER TABLE `blockedip`
  ADD PRIMARY KEY (`ip_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `blockedip`
--
ALTER TABLE `blockedip`
  MODIFY `ip_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Struttura della tabella `deactivateduser`
--

CREATE TABLE `deactivateduser` (
                                   `du_id` int UNSIGNED NOT NULL,
                                   `du_username` varchar(255) NOT NULL,
                                   `du_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `deactivateduser`
--
ALTER TABLE `deactivateduser`
    ADD PRIMARY KEY (`du_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `deactivateduser`
--
ALTER TABLE `deactivateduser`
    MODIFY `du_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Struttura della tabella `securitylog`
--

CREATE TABLE `securitylog` (
                               `sl_id` int UNSIGNED NOT NULL,
                               `sl_ipaddress` varchar(20) NOT NULL DEFAULT '',
                               `sl_username` varchar(255) NOT NULL,
                               `sl_password` varchar(255) NOT NULL,
                               `sl_description` varchar(255) NOT NULL,
                               `sl_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `securitylog`
--
ALTER TABLE `securitylog`
    ADD PRIMARY KEY (`sl_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `securitylog`
--
ALTER TABLE `securitylog`
    MODIFY `sl_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Struttura della tabella `usergroup`
--

CREATE TABLE `usergroup` (
                             `ug_id` int UNSIGNED NOT NULL,
                             `ug_groupslug` varchar(80) NOT NULL DEFAULT '',
                             `ug_userid` int UNSIGNED NOT NULL,
                             `ug_updated` datetime NOT NULL,
                             `ug_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `usergroup`
--

INSERT INTO `usergroup` (`ug_id`, `ug_groupslug`, `ug_userid`, `ug_updated`, `ug_created`) VALUES
(1, 'administrationgroup', 1, '2020-10-25 17:39:04', '2020-10-25 17:39:04'),
(2, 'centralheadofficegroup', 1, '2020-10-25 17:39:56', '2020-10-25 17:39:56'),
(3, 'centralheadofficegroup', 79, '2020-10-25 17:40:26', '2020-10-25 17:40:26'),
(4, 'centralheadofficegroup', 80, '2020-10-25 17:40:26', '2020-10-25 17:40:26'),
(5, 'riskmanagergroup', 2, '2020-10-25 17:41:15', '2020-10-25 17:41:15'),
(6, 'operatorgroup', 3, '2020-10-25 17:41:15', '2020-10-25 17:41:15');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `usergroup`
--
ALTER TABLE `usergroup`
    ADD PRIMARY KEY (`ug_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `usergroup`
--
ALTER TABLE `usergroup`
    MODIFY `ug_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

COMMIT;


