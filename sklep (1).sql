

CREATE TABLE `dostawcy` (
  `id` int(11) NOT NULL,
  `imie` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `numer_telefonu` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

CREATE TABLE `koszyk` (
  `id` int(11) NOT NULL,
  `uzytkownicy_id` int(11) NOT NULL,
  `cena_calkowita` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

CREATE TABLE `magazyny` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

CREATE TABLE `produkty` (
  `id` int(11) NOT NULL,
  `sprzedawca_id` int(11) NOT NULL,
  `nazwa` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `opis` text COLLATE utf8_polish_ci DEFAULT NULL,
  `ilosc` int(11) NOT NULL,
  `cena` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

INSERT INTO `produkty` (`id`, `sprzedawca_id`, `nazwa`, `opis`, `ilosc`, `cena`) VALUES
(1, 1, 'Mandarynka', 'Mandarynki pochodzą z Chin, skąd na początku XIX wieku zostały sprowadzone do Europy. Główni producenci: Hiszpania, Maroko, Turcja. Uprawia się je również w Abchazji i Gruzji, w południowej Francji, Japonii, Indochinach.\r\n\r\n            Mandarynka to owoc wiecznie zielonej rośliny. Jasna skórka pomarańczy ma bogaty cytrusowy zapach. Wewnątrz płód dzieli się na plastry.s krzyżuje się je z wieloma owocami cytrusowymi, tworząc ciekawe hybrydy. To prawda, że ​​rzadko można je znaleźć w sklepie – hybryda z pomarańczą – tangor, z grejpfrutem – mineolą i innymi.', 123, '42.00');

CREATE TABLE `produkty_w_koszyku` (
  `id` int(11) NOT NULL,
  `koszyk_id` int(11) NOT NULL,
  `produkty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

CREATE TABLE `produkty_w_magazynie` (
  `id` int(11) NOT NULL,
  `magazyny_id` int(11) NOT NULL,
  `produkty_id` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

CREATE TABLE `uzytkownicy` (
  `id` int(11) NOT NULL,
  `imie` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `haslo` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `numer_telefonu` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `sprzedawca` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

INSERT INTO `uzytkownicy` (`id`, `imie`, `nazwisko`, `email`, `haslo`, `numer_telefonu`, `adres`, `sprzedawca`) VALUES
(1, 'i', 'n', 'nnn@mail.com', 'haslo', NULL, NULL, NULL);

CREATE TABLE `zamowienia` (
  `id` int(11) NOT NULL,
  `uzytkownicy_id` int(11) NOT NULL,
  `cena_calkowita` decimal(10,2) NOT NULL,
  `dostawcy_id` int(11) NOT NULL,
  `zrealizowane` smallint(6) DEFAULT NULL,
  `odwolane` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

CREATE TABLE `zamowione_produkty` (
  `id` int(11) NOT NULL,
  `zamowienia_id` int(11) NOT NULL,
  `produkty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

ALTER TABLE `dostawcy`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `koszyk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uzytkownicy_id` (`uzytkownicy_id`);

ALTER TABLE `magazyny`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `produkty`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `produkty_w_koszyku`
  ADD PRIMARY KEY (`id`),
  ADD KEY `koszyk_id` (`koszyk_id`),
  ADD KEY `produkty_id` (`produkty_id`);

ALTER TABLE `produkty_w_magazynie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `magazyny_id` (`magazyny_id`),
  ADD KEY `produkty_id` (`produkty_id`);

ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dostawcy_id` (`dostawcy_id`),
  ADD KEY `uzytkownicy_id` (`uzytkownicy_id`);

ALTER TABLE `zamowione_produkty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produkty_id` (`produkty_id`),
  ADD KEY `zamowienia_id` (`zamowienia_id`);


ALTER TABLE `dostawcy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `koszyk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `magazyny`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `produkty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `produkty_w_koszyku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `produkty_w_magazynie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `uzytkownicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `zamowienia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `zamowione_produkty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `koszyk`
  ADD CONSTRAINT `koszyk_ibfk_1` FOREIGN KEY (`uzytkownicy_id`) REFERENCES `uzytkownicy` (`id`);


ALTER TABLE `produkty_w_koszyku`
  ADD CONSTRAINT `produkty_w_koszyku_ibfk_1` FOREIGN KEY (`koszyk_id`) REFERENCES `koszyk` (`id`),
  ADD CONSTRAINT `produkty_w_koszyku_ibfk_2` FOREIGN KEY (`produkty_id`) REFERENCES `produkty` (`id`);

ALTER TABLE `produkty_w_magazynie`
  ADD CONSTRAINT `produkty_w_magazynie_ibfk_1` FOREIGN KEY (`magazyny_id`) REFERENCES `magazyny` (`id`),
  ADD CONSTRAINT `produkty_w_magazynie_ibfk_2` FOREIGN KEY (`produkty_id`) REFERENCES `produkty` (`id`);

ALTER TABLE `zamowienia`
  ADD CONSTRAINT `zamowienia_ibfk_1` FOREIGN KEY (`dostawcy_id`) REFERENCES `dostawcy` (`id`),
  ADD CONSTRAINT `zamowienia_ibfk_2` FOREIGN KEY (`uzytkownicy_id`) REFERENCES `uzytkownicy` (`id`);

ALTER TABLE `zamowione_produkty`
  ADD CONSTRAINT `zamowione_produkty_ibfk_1` FOREIGN KEY (`produkty_id`) REFERENCES `produkty` (`id`),
  ADD CONSTRAINT `zamowione_produkty_ibfk_2` FOREIGN KEY (`zamowienia_id`) REFERENCES `zamowienia` (`id`);
COMMIT;
