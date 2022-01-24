-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 24 Sty 2022, 20:40
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `students_datebase`
--

DELIMITER $$
--
-- Procedury
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `FillMatury` ()  BEGIN
	DECLARE i INT DEFAULT 1;
	WHILE i<401 DO
            BEGIN
                DECLARE pp INT DEFAULT 0;
                DECLARE mp INT DEFAULT 0;
                DECLARE mr INT DEFAULT 0;
                DECLARE jp INT DEFAULT 0;
                DECLARE jr INT DEFAULT 0;
                DECLARE f INT DEFAULT 0;
                DECLARE c INT DEFAULT 0;
                DECLARE b INT DEFAULT 0;
                DECLARE g INT DEFAULT 0;
                DECLARE inf INT DEFAULT 0;
                DECLARE n INT DEFAULT 1;
                SET n = RAND()*12 + 0;
                BEGIN
                    IF n=0 THEN
                    SET pp = RAND()*29 + 0;
                ELSE
                    SET pp = RAND()*(100-30) + 30;
                end if;
                    end;

                    SET n = RAND()*12 + 0;
                BEGIN
                    IF n=0 THEN
                    SET mp = RAND()*29 + 0;
                ELSE
                    SET mp = RAND()*(100-30) + 30;
                end if;
                    end;

                    SET n = RAND()*12 + 0;
                BEGIN
                    IF n=0 THEN
                    SET jp = RAND()*29 + 0;
                ELSE
                    SET jp = RAND()*(100-30) + 30;
                end if;
                    end;

                    SET n = RAND()*1 + 0;
                BEGIN
                    IF n=1 THEN
                    SET mr = RAND()*100 + 0;
          	  end if;
                    end;
                    SET n = RAND()*1 + 0;
                BEGIN
                    IF n=1 THEN
                    SET jr = RAND()*100 + 0;
                end if;
                    end;
                    SET n = RAND()*1 + 0;
                BEGIN
                    IF n=1 THEN
                    SET f = RAND()*100 + 0;
                end if;
                    end;
                SET n = RAND()*1 + 0;
                BEGIN
                    IF n=1 THEN
                    SET c = RAND()*100 + 0;
                end if;
                    end;
                    SET n = RAND()*1 + 0;
                BEGIN
                    IF n=1 THEN
                    SET b = RAND()*100 + 0;
                end if;
                    end;
                    SET n = RAND()*1 + 0;
                BEGIN
                    IF n=1 THEN
                    SET g = RAND()*100 + 0;
                end if;
                    end;
                    SET n = RAND()*1 + 0;
                BEGIN
                    IF n=1 THEN
                    SET inf = RAND()*100 + 0;
                end if;
                    end;
                BEGIN
                INSERT INTO students_datebase.wynikimatur
                VALUES (i, pp, mp, mr, jp, jr, f, c, b, inf, g, 0);

                SET i = i+1;

                end;
                end;
end while;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `FillPreferencje` ()  BEGIN
	DECLARE i INT DEFAULT 1;
	set foreign_key_checks = 0;
	WHILE i<401 DO
            BEGIN
                DECLARE p1 INT DEFAULT NULL;
                DECLARE p2 INT DEFAULT NULL;
                DECLARE p3 INT DEFAULT NULL;
                DECLARE p4 INT DEFAULT NULL;
                DECLARE p5 INT DEFAULT NULL;
                DECLARE p6 INT DEFAULT NULL;
                DECLARE n INT DEFAULT 1;
                SET n = RAND()*6 + 1;
                BEGIN
                    IF n=1 THEN
                    SET p1 = RAND()*62 + 1;
                ELSEIF n=2 THEN
                    SET p1 = RAND()*62 + 1;
                    SET p2 = RAND()*62 + 1;
                ELSEIF n=3 THEN
                    SET p1 = RAND()*62 + 1;
                    SET p2 = RAND()*62 + 1;
                    SET p3 = RAND()*62 + 1;
                ELSEIF n=4 THEN
                    SET p1 = RAND()*62 + 1;
                    SET p2 = RAND()*62 + 1;
   	             SET p3 = RAND()*62 + 1;
                    SET p4 = RAND()*62 + 1;
                ELSEIF n=5 THEN
                    SET p1 = RAND()*62 + 1;
                    SET p2 = RAND()*62 + 1;
                    SET p3 = RAND()*62 + 1;
       	         SET p4 = RAND()*62 + 1;
                    SET p5 = RAND()*62 + 1;
                ELSE
                    SET p1 = RAND()*62 + 1;
                    SET p2 = RAND()*62 + 1;
                    SET p3 = RAND()*62 + 1;
                    SET p4 = RAND()*62 + 1;
                    SET p5 = RAND()*62 + 1;
                    SET p6 = RAND()*62 + 1;
                end if;

                INSERT INTO students_datebase.preferencjekandydata
                VALUES (i, p1, p2, p3, p4, p5, p6);

                SET i = i+1;

                end;
        	end;
end while;
	set foreign_key_checks = 1;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `boolwskaznikikierunki`
--

CREATE TABLE `boolwskaznikikierunki` (
  `IdKierunku` int(11) NOT NULL,
  `CzyPolskiPodstawa` tinyint(1) NOT NULL DEFAULT 0,
  `CzyMatematykaPodstawa` tinyint(1) NOT NULL DEFAULT 0,
  `CzyMatematykaRozszerzenie` tinyint(1) NOT NULL,
  `CzyJezykPodstawa` tinyint(1) NOT NULL,
  `CzyJezykRozszerzenie` tinyint(1) NOT NULL,
  `CzyFizyka` tinyint(1) NOT NULL,
  `CzyChemia` tinyint(1) NOT NULL,
  `CzyBiologia` tinyint(1) NOT NULL,
  `CzyInformatyka` tinyint(1) NOT NULL,
  `CzyGeografia` tinyint(1) NOT NULL,
  `CzyEgzamin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabela do liczenia wskaźników, pokazujaca jakie przedmioty sa brane pod uwagę na danym kierunku';

--
-- Zrzut danych tabeli `boolwskaznikikierunki`
--

INSERT INTO `boolwskaznikikierunki` (`IdKierunku`, `CzyPolskiPodstawa`, `CzyMatematykaPodstawa`, `CzyMatematykaRozszerzenie`, `CzyJezykPodstawa`, `CzyJezykRozszerzenie`, `CzyFizyka`, `CzyChemia`, `CzyBiologia`, `CzyInformatyka`, `CzyGeografia`, `CzyEgzamin`) VALUES
(1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1),
(2, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(3, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(4, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0),
(5, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0),
(6, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0),
(7, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0),
(8, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0),
(9, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0),
(10, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0),
(11, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0),
(12, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0),
(13, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0),
(14, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0),
(15, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0),
(16, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0),
(17, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(18, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(19, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(20, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(21, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(22, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0),
(23, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0),
(24, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0),
(25, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(26, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0),
(27, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0),
(28, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0),
(29, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0),
(30, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(31, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(32, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(33, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(34, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(35, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(36, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(37, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(38, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(39, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(40, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(41, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(42, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0),
(43, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(44, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(45, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(46, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(47, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(48, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(49, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(50, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(51, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(52, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(53, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(54, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0),
(55, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(56, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(57, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(58, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0),
(59, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(60, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0),
(61, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(62, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kandydaci`
--

CREATE TABLE `kandydaci` (
  `NrRejestracyjny` int(11) NOT NULL,
  `Imie` varchar(30) NOT NULL,
  `Nazwisko` varchar(30) NOT NULL,
  `PESEL` char(11) NOT NULL,
  `Status` enum('Zlozono dokumenty','Przyjety','Oczekuje na oplate','Odrzucony','Nieprzyjety','Wniesiono oplate','Zakwalifikowany do przyjecia') NOT NULL DEFAULT 'Oczekuje na oplate',
  `Ewidencja` int(11) DEFAULT NULL,
  `CzyOlimpijczyk` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `kandydaci`
--

INSERT INTO `kandydaci` (`NrRejestracyjny`, `Imie`, `Nazwisko`, `PESEL`, `Status`, `Ewidencja`, `CzyOlimpijczyk`) VALUES
(1, 'Joanna', 'Kraśko', '1270847214', 'Oczekuje na oplate', 0, 1),
(2, 'Żaneta', 'Krupa', '1290856849', 'Oczekuje na oplate', 0, 0),
(3, 'Antonina', 'Kaczmarczyk', '99123018564', 'Oczekuje na oplate', 0, 0),
(4, 'Anastazja', 'Przybylska', '99070364646', 'Oczekuje na oplate', 0, 0),
(5, 'Andżelika', 'Ostrowska', '99042085685', 'Oczekuje na oplate', 0, 0),
(6, 'Dominika', 'Jankowska', '3231112766', 'Oczekuje na oplate', 0, 0),
(7, 'Alice', 'Lis', '96012726881', 'Oczekuje na oplate', 0, 0),
(8, 'Dagmara', 'Głowacka', '3292749288', 'Oczekuje na oplate', 0, 0),
(9, 'Katarzyna', 'Górecka', '99090239548', 'Oczekuje na oplate', 0, 0),
(10, 'Anatolia', 'Kowalczyk', '3302331641', 'Oczekuje na oplate', 0, 0),
(11, 'Amalia', 'Chmielewska', '96021079882', 'Oczekuje na oplate', 0, 0),
(12, 'Bogda', 'Andrzejewska', '98031871441', 'Oczekuje na oplate', 0, 0),
(13, 'Paulina', 'Stępień', '251751166', 'Oczekuje na oplate', 0, 0),
(14, 'Diana', 'Głowacka', '2302716986', 'Oczekuje na oplate', 0, 0),
(15, 'Wanda', 'Zakrzewska', '96092672562', 'Oczekuje na oplate', 0, 0),
(16, 'Andżelika', 'Sokołowska', '97012176584', 'Oczekuje na oplate', 0, 0),
(17, 'Aisha', 'Jakubowska', '211744865', 'Oczekuje na oplate', 0, 0),
(18, 'Marysia', 'Woźniak', '2211413561', 'Oczekuje na oplate', 0, 0),
(19, 'Milena', 'Dąbrowska', '98062388622', 'Oczekuje na oplate', 0, 1),
(20, 'Anatolia', 'Czarnecka', '98031163328', 'Oczekuje na oplate', 0, 0),
(21, 'Bogumiła', 'Andrzejewska', '3211311743', 'Oczekuje na oplate', 0, 0),
(22, 'Julita', 'Mróz', '97040225641', 'Oczekuje na oplate', 0, 0),
(23, 'Zofia', 'Sikora', '99090194643', 'Oczekuje na oplate', 0, 0),
(24, 'Alisa', 'Szymańska', '2252954562', 'Oczekuje na oplate', 0, 0),
(25, 'Bogna', 'Kołodziej', '98031466469', 'Oczekuje na oplate', 0, 0),
(26, 'Natalia', 'Szewczyk', '230172887', 'Oczekuje na oplate', 0, 0),
(27, 'Beata', 'Jaworska', '96081857664', 'Oczekuje na oplate', 0, 0),
(28, 'Malwina', 'Mazurek', '3311328241', 'Oczekuje na oplate', 0, 0),
(29, 'Magdalena', 'Szczepańska', '97011934822', 'Oczekuje na oplate', 0, 0),
(30, 'Kamila', 'Witkowska', '3301659487', 'Oczekuje na oplate', 0, 0),
(31, 'Edyta', 'Sikora', '96072333742', 'Oczekuje na oplate', 0, 0),
(32, 'Amalia', 'Kowalczyk', '96090214645', 'Oczekuje na oplate', 0, 0),
(33, 'Otylia', 'Zawadzka', '97041272741', 'Oczekuje na oplate', 0, 0),
(34, 'Florentyna', 'Michalak', '98112477463', 'Oczekuje na oplate', 0, 0),
(35, 'Krystyna', 'Szczepańska', '2230434486', 'Oczekuje na oplate', 0, 0),
(36, 'Aniela', 'Krupa', '96100933568', 'Oczekuje na oplate', 0, 0),
(37, 'Paulina', 'Krajewska', '99050855821', 'Oczekuje na oplate', 0, 0),
(38, 'Żaneta', 'Sawicka', '97123174844', 'Oczekuje na oplate', 0, 0),
(39, 'Karolina', 'Górecka', '98040444326', 'Oczekuje na oplate', 0, 0),
(40, 'Jagoda', 'Woźniak', '2281297487', 'Oczekuje na oplate', 0, 0),
(41, 'Stefania', 'Zawadzka', '1222018622', 'Oczekuje na oplate', 0, 0),
(42, 'Amalia', 'Stępień', '2240326984', 'Oczekuje na oplate', 0, 0),
(43, 'Helena', 'Woźniak', '1250437743', 'Oczekuje na oplate', 0, 0),
(44, 'Oktawia', 'Wojciechowska', '97030126682', 'Oczekuje na oplate', 0, 0),
(45, 'Paula', 'Krajewska', '99020633284', 'Oczekuje na oplate', 0, 0),
(46, 'Aisha', 'Kamińska', '96111697286', 'Oczekuje na oplate', 0, 0),
(47, 'Łucja', 'Włodarczyk', '1240932667', 'Oczekuje na oplate', 0, 0),
(48, 'Malwina', 'Pawlak', '2262788685', 'Oczekuje na oplate', 0, 0),
(49, 'Matylda', 'Gajewska', '96070979966', 'Oczekuje na oplate', 0, 0),
(50, 'Krystyna', 'Sikora', '212818767', 'Oczekuje na oplate', 0, 0),
(51, 'Marlena', 'Przybylska', '98022597389', 'Oczekuje na oplate', 0, 0),
(52, 'Adrianna', 'Rutkowska', '97060182382', 'Oczekuje na oplate', 0, 0),
(53, 'Marysia', 'Michalak', '221364727', 'Oczekuje na oplate', 0, 0),
(54, 'Wiktoria', 'Kwiatkowska', '1231364367', 'Oczekuje na oplate', 0, 0),
(55, 'Jolanta', 'Chmielewska', '96110114629', 'Oczekuje na oplate', 0, 0),
(56, 'Anna', 'Wysocka', '3301914429', 'Oczekuje na oplate', 0, 0),
(57, 'Ilona', 'Jakubowska', '1283141725', 'Oczekuje na oplate', 0, 0),
(58, 'Natasza', 'Brzezińska', '2320763586', 'Oczekuje na oplate', 0, 0),
(59, 'Zuza', 'Wasilewska', '1231584763', 'Oczekuje na oplate', 0, 1),
(60, 'Czesława', 'Kucharska', '2280488244', 'Oczekuje na oplate', 0, 0),
(61, 'Agata', 'Kowalczyk', '96060242465', 'Oczekuje na oplate', 0, 0),
(62, 'Maria', 'Kubiak', '2232018989', 'Oczekuje na oplate', 0, 0),
(63, 'Wiktoria', 'Gajewska', '3321271267', 'Oczekuje na oplate', 0, 1),
(64, 'Jola', 'Kowalska', '2220655325', 'Oczekuje na oplate', 0, 0),
(65, 'Wiktoria', 'Sikora', '99061356827', 'Oczekuje na oplate', 0, 0),
(66, 'Elena', 'Błaszczyk', '99083076945', 'Oczekuje na oplate', 0, 0),
(67, 'Jolanta', 'Lis', '99121528885', 'Oczekuje na oplate', 0, 0),
(68, 'Felicja', 'Witkowska', '96092489988', 'Oczekuje na oplate', 0, 0),
(69, 'Agnieszka', 'Baran', '2220724629', 'Oczekuje na oplate', 0, 0),
(70, 'Malwina', 'Wysocka', '252362246', 'Oczekuje na oplate', 0, 0),
(71, 'Franciszka', 'Kaźmierczak', '99062714165', 'Oczekuje na oplate', 0, 0),
(72, 'Pamela', 'Jankowska', '98040464629', 'Oczekuje na oplate', 0, 0),
(73, 'Honorata', 'Piotrowska', '98082625846', 'Oczekuje na oplate', 0, 0),
(74, 'Lila', 'Ziółkowska', '1310682227', 'Oczekuje na oplate', 0, 0),
(75, 'Angelika', 'Wasilewska', '97022426468', 'Oczekuje na oplate', 0, 0),
(76, 'Helena', 'Tomaszewska', '99100132968', 'Oczekuje na oplate', 0, 0),
(77, 'Wioletta', 'Pietrzak', '97051173463', 'Oczekuje na oplate', 0, 0),
(78, 'Bogda', 'Malinowska', '98060881387', 'Oczekuje na oplate', 0, 0),
(79, 'Eliza', 'Szymańska', '96100786562', 'Oczekuje na oplate', 0, 0),
(80, 'Ida', 'Jaworska', '98102352389', 'Oczekuje na oplate', 0, 0),
(81, 'Wanda', 'Czerwińska', '321192921', 'Oczekuje na oplate', 0, 0),
(82, 'Malwina', 'Krawczyk', '98061469465', 'Oczekuje na oplate', 0, 0),
(83, 'Beata', 'Wójcik', '2260666347', 'Oczekuje na oplate', 0, 0),
(84, 'Wioletta', 'Wróblewska', '3212394268', 'Oczekuje na oplate', 0, 0),
(85, 'Anastazja', 'Walczak', '98041298221', 'Oczekuje na oplate', 0, 0),
(86, 'Andżelika', 'Głowacka', '3220547928', 'Oczekuje na oplate', 0, 0),
(87, 'Aneta', 'Woźniak', '97082922687', 'Oczekuje na oplate', 0, 0),
(88, 'Zuza', 'Kozłowska', '96071498743', 'Oczekuje na oplate', 0, 0),
(89, 'Izyda', 'Sawicka', '98041362841', 'Oczekuje na oplate', 0, 0),
(90, 'Iza', 'Laskowska', '3232514864', 'Oczekuje na oplate', 0, 0),
(91, 'Ilona', 'Rutkowska', '3270799641', 'Oczekuje na oplate', 0, 0),
(92, 'Patrycja', 'Czerwińska', '96112044568', 'Oczekuje na oplate', 0, 0),
(93, 'Adriana', 'Kozłowska', '3281176466', 'Oczekuje na oplate', 0, 1),
(94, 'Helena', 'Krupa', '2322277227', 'Oczekuje na oplate', 0, 0),
(95, 'Patrycja', 'Szymczak', '231735162', 'Oczekuje na oplate', 0, 0),
(96, 'Asia', 'Adamska', '97012535169', 'Oczekuje na oplate', 0, 0),
(97, 'Daniela', 'Czarnecka', '99110186685', 'Oczekuje na oplate', 0, 0),
(98, 'Róża', 'Wójcik', '1310765924', 'Oczekuje na oplate', 0, 1),
(99, 'Daria', 'Wiśniewska', '1290285128', 'Oczekuje na oplate', 0, 0),
(100, 'Adrianna', 'Stępień', '98011319161', 'Oczekuje na oplate', 0, 0),
(101, 'Kornelia', 'Szulc', '3210996523', 'Oczekuje na oplate', 0, 0),
(102, 'Emilia', 'Maciejewska', '98102685962', 'Oczekuje na oplate', 0, 0),
(103, 'Hortensja', 'Lewandowska', '97092687529', 'Oczekuje na oplate', 0, 0),
(104, 'Aneta', 'Maciejewska', '96041796787', 'Oczekuje na oplate', 0, 0),
(105, 'Lidia', 'Szymczak', '221997844', 'Oczekuje na oplate', 0, 0),
(106, 'Czesława', 'Sawicka', '1211165843', 'Oczekuje na oplate', 0, 0),
(107, 'Magda', 'Dąbrowska', '2233056148', 'Oczekuje na oplate', 0, 0),
(108, 'Norbert', 'Piotrowski', '2291477776', 'Oczekuje na oplate', 0, 0),
(109, 'Remigiusz', 'Urbańska', '96092687812', 'Oczekuje na oplate', 0, 0),
(110, 'Franciszek', 'Krajewska', '252083211', 'Oczekuje na oplate', 0, 0),
(111, 'Diego', 'Malinowski', '99061956133', 'Oczekuje na oplate', 0, 0),
(112, 'Emil', 'Sadowska', '96122323211', 'Oczekuje na oplate', 0, 0),
(113, 'Maksymilian', 'Przybylski', '292738931', 'Oczekuje na oplate', 0, 0),
(114, 'Artur', 'Duda', '98103047372', 'Oczekuje na oplate', 0, 0),
(115, 'Paweł', 'Mazur', '2300963533', 'Oczekuje na oplate', 0, 0),
(116, 'Antoni', 'Bąk', '98101684894', 'Oczekuje na oplate', 0, 0),
(117, 'Jacek', 'Kaźmierczak', '3281054195', 'Oczekuje na oplate', 0, 0),
(118, 'Błażej', 'Lis', '1271369175', 'Oczekuje na oplate', 0, 0),
(119, 'Klaudiusz', 'Sawicki', '1272988218', 'Oczekuje na oplate', 0, 0),
(120, 'Igor', 'Czerwiński', '99070244537', 'Oczekuje na oplate', 0, 0),
(121, 'Robert', 'Czarnecki', '1260931453', 'Oczekuje na oplate', 0, 0),
(122, 'Kornel', 'Rutkowski', '2312149451', 'Oczekuje na oplate', 0, 0),
(123, 'Daniel', 'Kalinowski', '1310849158', 'Oczekuje na oplate', 0, 0),
(124, 'Daniel', 'Szewczyk', '240214834', 'Oczekuje na oplate', 0, 0),
(125, 'Henryk', 'Chmielewski', '99112338295', 'Oczekuje na oplate', 0, 0),
(126, 'Anatol', 'Borkowski', '1253099971', 'Oczekuje na oplate', 0, 0),
(127, 'Aleksander', 'Sobczak', '2301791573', 'Oczekuje na oplate', 0, 0),
(128, 'Joachim', 'Kamiński', '98090899138', 'Oczekuje na oplate', 0, 0),
(129, 'Ludwik', 'Andrzejewski', '97062131414', 'Oczekuje na oplate', 0, 0),
(130, 'Patryk', 'Kamiński', '1280177792', 'Oczekuje na oplate', 0, 0),
(131, 'Milan', 'Mazurek', '3221042118', 'Oczekuje na oplate', 0, 0),
(132, 'Julian', 'Malinowski', '2300133699', 'Oczekuje na oplate', 0, 0),
(133, 'Mariusz', 'Lewandowski', '222481511', 'Oczekuje na oplate', 0, 0),
(134, 'Aleksander', 'Górski', '96102266873', 'Oczekuje na oplate', 0, 0),
(135, 'Leonardo', 'Marciniak', '99101625252', 'Oczekuje na oplate', 0, 0),
(136, 'Ernest', 'Michalak', '97052963359', 'Oczekuje na oplate', 0, 0),
(137, 'Adrian', 'Błaszczyk', '99102638677', 'Oczekuje na oplate', 0, 0),
(138, 'Bruno', 'Zieliński', '3231213214', 'Oczekuje na oplate', 0, 0),
(139, 'Cyprian', 'Górski', '3232144612', 'Oczekuje na oplate', 0, 0),
(140, 'Leonardo', 'Szczepański', '96050629173', 'Oczekuje na oplate', 0, 0),
(141, 'Alex', 'Urbańska', '1301017258', 'Oczekuje na oplate', 0, 1),
(142, 'Gustaw', 'Brzeziński', '2292498413', 'Oczekuje na oplate', 0, 0),
(143, 'Konrad', 'Borkowski', '96062584635', 'Oczekuje na oplate', 0, 0),
(144, 'Jarosław', 'Baran', '97081519936', 'Oczekuje na oplate', 0, 0),
(145, 'Dariusz', 'Zieliński', '99052348459', 'Oczekuje na oplate', 0, 0),
(146, 'Konrad', 'Urbańska', '1280648355', 'Oczekuje na oplate', 0, 0),
(147, 'Józef', 'Sokołowski', '2320384776', 'Oczekuje na oplate', 0, 0),
(148, 'Konstanty', 'Jasiński', '3291938975', 'Oczekuje na oplate', 0, 0),
(149, 'Krystian', 'Borkowski', '1232612933', 'Oczekuje na oplate', 0, 0),
(150, 'Konrad', 'Sobczak', '97102482395', 'Oczekuje na oplate', 0, 0),
(151, 'Łukasz', 'Wasilewska', '99042135595', 'Oczekuje na oplate', 0, 1),
(152, 'Alojzy', 'Kamiński', '322044531', 'Oczekuje na oplate', 0, 0),
(153, 'Mateusz', 'Pawlak', '99052637272', 'Oczekuje na oplate', 0, 0),
(154, 'Mieszko', 'Głowacka', '3210236113', 'Oczekuje na oplate', 0, 0),
(155, 'Edward', 'Czerwiński', '98112473872', 'Oczekuje na oplate', 0, 0),
(156, 'Daniel', 'Włodarczyk', '282972374', 'Oczekuje na oplate', 0, 0),
(157, 'Fryderyk', 'Czerwiński', '97090717398', 'Oczekuje na oplate', 0, 0),
(158, 'Juliusz', 'Wróblewski', '250889697', 'Oczekuje na oplate', 0, 0),
(159, 'Alex', 'Wiśniewski', '97010352436', 'Oczekuje na oplate', 0, 0),
(160, 'Alfred', 'Gajewska', '1262143238', 'Oczekuje na oplate', 0, 0),
(161, 'Błażej', 'Górski', '2221551859', 'Oczekuje na oplate', 0, 0),
(162, 'Oskar', 'Kowalski', '98060922677', 'Oczekuje na oplate', 0, 0),
(163, 'Gabriel', 'Michalak', '3272969873', 'Oczekuje na oplate', 0, 0),
(164, 'Franciszek', 'Błaszczyk', '2281577215', 'Oczekuje na oplate', 0, 0),
(165, 'Mirosław', 'Mazurek', '99093014472', 'Oczekuje na oplate', 0, 0),
(166, 'Alan', 'Kaźmierczak', '211763839', 'Oczekuje na oplate', 0, 0),
(167, 'Grzegorz', 'Andrzejewski', '1292456832', 'Oczekuje na oplate', 0, 0),
(168, 'Anastazy', 'Piotrowski', '96122852238', 'Oczekuje na oplate', 0, 0),
(169, 'Dobromił', 'Czerwiński', '99122184736', 'Oczekuje na oplate', 0, 0),
(170, 'Filip', 'Wojciechowski', '1323191918', 'Oczekuje na oplate', 0, 0),
(171, 'Olaf', 'Urbańska', '2252367719', 'Oczekuje na oplate', 0, 0),
(172, 'Grzegorz', 'Walczak', '300636112', 'Oczekuje na oplate', 0, 0),
(173, 'Fabian', 'Laskowska', '1251472817', 'Oczekuje na oplate', 0, 0),
(174, 'Kazimierz', 'Górecki', '2292855591', 'Oczekuje na oplate', 0, 0),
(175, 'Jacek', 'Stępień', '3240855939', 'Oczekuje na oplate', 0, 0),
(176, 'Ryszard', 'Kucharski', '1211594672', 'Oczekuje na oplate', 0, 0),
(177, 'Juliusz', 'Nowak', '241121454', 'Oczekuje na oplate', 0, 0),
(178, 'Rafał', 'Czerwiński', '242236595', 'Oczekuje na oplate', 0, 0),
(179, 'Amir', 'Przybylski', '99090795851', 'Oczekuje na oplate', 0, 0),
(180, 'Igor', 'Lewandowski', '3241035738', 'Oczekuje na oplate', 0, 0),
(181, 'Arkadiusz', 'Bąk', '96091092994', 'Oczekuje na oplate', 0, 0),
(182, 'Artur', 'Kalinowski', '97030877892', 'Oczekuje na oplate', 0, 0),
(183, 'Bruno', 'Adamska', '292558773', 'Oczekuje na oplate', 0, 0),
(184, 'Bronisław', 'Sikorska', '97062939555', 'Oczekuje na oplate', 0, 0),
(185, 'Alex', 'Krajewska', '291867296', 'Oczekuje na oplate', 0, 0),
(186, 'Jacek', 'Wójcik', '242987576', 'Oczekuje na oplate', 0, 0),
(187, 'Konrad', 'Szulc', '99041157273', 'Oczekuje na oplate', 0, 0),
(188, 'Emanuel', 'Kowalski', '2262951492', 'Oczekuje na oplate', 0, 0),
(189, 'Dariusz', 'Wasilewska', '1312765236', 'Oczekuje na oplate', 0, 0),
(190, 'Mirosław', 'Sawicki', '99071076236', 'Oczekuje na oplate', 0, 0),
(191, 'Milan', 'Rutkowski', '98052235336', 'Oczekuje na oplate', 0, 0),
(192, 'Kewin', 'Czerwiński', '96111839895', 'Oczekuje na oplate', 0, 0),
(193, 'Miron', 'Pietrzak', '98052261973', 'Oczekuje na oplate', 0, 0),
(194, 'Joachim', 'Stępień', '98021556752', 'Oczekuje na oplate', 0, 0),
(195, 'Mirosław', 'Czarnecki', '2242987693', 'Oczekuje na oplate', 0, 0),
(196, 'Marcel', 'Gajewska', '96081361451', 'Oczekuje na oplate', 0, 0),
(197, 'Mirosław', 'Sokołowski', '99061942358', 'Oczekuje na oplate', 0, 0),
(198, 'Przemysław', 'Szewczyk', '96062667332', 'Oczekuje na oplate', 0, 0),
(199, 'Bogumił', 'Szulc', '3211458572', 'Oczekuje na oplate', 0, 0),
(200, 'Diego', 'Krajewska', '2222734415', 'Oczekuje na oplate', 0, 0),
(201, 'Michał', 'Kwiatkowski', '98032594134', 'Oczekuje na oplate', 0, 0),
(202, 'Milan', 'Szczepański', '3270451671', 'Oczekuje na oplate', 0, 0),
(203, 'Damian', 'Krajewska', '2281974197', 'Oczekuje na oplate', 0, 0),
(204, 'Gabriel', 'Ziółkowska', '97020832337', 'Oczekuje na oplate', 0, 0),
(205, 'Mikołaj', 'Szymański', '98062121432', 'Oczekuje na oplate', 0, 0),
(206, 'Gabriel', 'Sobczak', '98080387298', 'Oczekuje na oplate', 0, 0),
(207, 'Eustachy', 'Kozłowski', '2241314919', 'Oczekuje na oplate', 0, 0),
(208, 'Remigiusz', 'Mróz', '2290533358', 'Oczekuje na oplate', 0, 0),
(209, 'Alek', 'Borkowski', '290799239', 'Oczekuje na oplate', 0, 0),
(210, 'Janusz', 'Pawlak', '2220472874', 'Oczekuje na oplate', 0, 0),
(211, 'Igor', 'Mazur', '2321974774', 'Oczekuje na oplate', 0, 0),
(212, 'Kuba', 'Walczak', '3313026833', 'Oczekuje na oplate', 0, 0),
(213, 'Miłosz', 'Kucharski', '2211494511', 'Oczekuje na oplate', 0, 0),
(214, 'Adrian', 'Czerwiński', '1260843178', 'Oczekuje na oplate', 0, 0),
(215, 'Gabriel', 'Górski', '2242215738', 'Oczekuje na oplate', 0, 0),
(216, 'Daniel', 'Sokołowski', '97081874794', 'Oczekuje na oplate', 0, 0),
(217, 'Oktawian', 'Szulc', '1322931351', 'Oczekuje na oplate', 0, 0),
(218, 'Robert', 'Zawadzki', '99013058432', 'Oczekuje na oplate', 0, 0),
(219, 'Juliusz', 'Baranowski', '97060287872', 'Oczekuje na oplate', 0, 0),
(220, 'Marcin', 'Lewandowski', '2292814772', 'Oczekuje na oplate', 0, 0),
(221, 'Korneliusz', 'Zieliński', '98122653994', 'Oczekuje na oplate', 0, 0),
(222, 'Józef', 'Kamiński', '301072377', 'Oczekuje na oplate', 0, 0),
(223, 'Bronisław', 'Czarnecki', '98020559879', 'Oczekuje na oplate', 0, 0),
(224, 'Amadeusz', 'Kaźmierczak', '97061269433', 'Oczekuje na oplate', 0, 0),
(225, 'Patryk', 'Wysocki', '96061127213', 'Oczekuje na oplate', 0, 1),
(226, 'Fryderyk', 'Błaszczyk', '96102955311', 'Oczekuje na oplate', 0, 0),
(227, 'Julian', 'Zawadzki', '96050739692', 'Oczekuje na oplate', 0, 0),
(228, 'Maksymilian', 'Wasilewska', '99081984415', 'Oczekuje na oplate', 0, 0),
(229, 'Kamil', 'Wasilewska', '2321396794', 'Oczekuje na oplate', 0, 0),
(230, 'Lucjan', 'Sikorska', '96112083217', 'Oczekuje na oplate', 0, 0),
(231, 'Paweł', 'Laskowska', '2261533538', 'Oczekuje na oplate', 0, 0),
(232, 'Anastazy', 'Szymczak', '96051855652', 'Oczekuje na oplate', 0, 0),
(233, 'Martin', 'Baran', '98080357459', 'Oczekuje na oplate', 0, 0),
(234, 'Krystian', 'Górski', '97010435799', 'Oczekuje na oplate', 0, 0),
(235, 'Adrian', 'Andrzejewski', '98101199897', 'Oczekuje na oplate', 0, 0),
(236, 'Alojzy', 'Sobczak', '3272143752', 'Oczekuje na oplate', 0, 0),
(237, 'Mikołaj', 'Wójcik', '322816554', 'Oczekuje na oplate', 0, 0),
(238, 'Alfred', 'Baran', '2211099716', 'Oczekuje na oplate', 0, 0),
(239, 'Kordian', 'Kalinowski', '98022085174', 'Oczekuje na oplate', 0, 0),
(240, 'Alexander', 'Walczak', '96011741357', 'Oczekuje na oplate', 0, 0),
(241, 'Franciszek', 'Marciniak', '312688194', 'Oczekuje na oplate', 0, 0),
(242, 'Aleks', 'Baranowski', '1210738116', 'Oczekuje na oplate', 0, 0),
(243, 'Alfred', 'Błaszczyk', '98051979233', 'Oczekuje na oplate', 0, 0),
(244, 'Piotr', 'Kozłowski', '97062369354', 'Oczekuje na oplate', 0, 0),
(245, 'Dobromił', 'Brzeziński', '1232373597', 'Oczekuje na oplate', 0, 0),
(246, 'Anastazy', 'Borkowski', '1262261673', 'Oczekuje na oplate', 0, 0),
(247, 'Konstanty', 'Górecki', '99090257573', 'Oczekuje na oplate', 0, 0),
(248, 'Damian', 'Krupa', '1260521537', 'Oczekuje na oplate', 0, 0),
(249, 'Dariusz', 'Piotrowski', '96031763593', 'Oczekuje na oplate', 0, 0),
(250, 'Krzysztof', 'Pietrzak', '99081576959', 'Oczekuje na oplate', 0, 0),
(251, 'Jarosław', 'Szczepański', '290823659', 'Oczekuje na oplate', 0, 0),
(252, 'Ksawery', 'Sikorska', '1271286119', 'Oczekuje na oplate', 0, 0),
(253, 'Alexander', 'Zawadzki', '3230416335', 'Oczekuje na oplate', 0, 0),
(254, 'Ignacy', 'Stępień', '96111276533', 'Oczekuje na oplate', 0, 0),
(255, 'Kazimierz', 'Górski', '321897598', 'Oczekuje na oplate', 0, 0),
(256, 'Leonardo', 'Sadowska', '98112063796', 'Oczekuje na oplate', 0, 0),
(257, 'Jan', 'Jasiński', '97022788193', 'Oczekuje na oplate', 0, 0),
(258, 'Józef', 'Głowacka', '3290162676', 'Oczekuje na oplate', 0, 0),
(259, 'Ireneusz', 'Kucharski', '96020739774', 'Oczekuje na oplate', 0, 0),
(260, 'Antoni', 'Andrzejewski', '2252685554', 'Oczekuje na oplate', 0, 0),
(261, 'Mateusz', 'Borkowski', '96022167593', 'Oczekuje na oplate', 0, 0),
(262, 'Mieszko', 'Ostrowski', '272017377', 'Oczekuje na oplate', 0, 0),
(263, 'Julian', 'Duda', '98041684253', 'Oczekuje na oplate', 0, 0),
(264, 'Karol', 'Baranowski', '98112039496', 'Oczekuje na oplate', 0, 0),
(265, 'Alexander', 'Marciniak', '99010224276', 'Oczekuje na oplate', 0, 0),
(266, 'Gniewomir', 'Baran', '1232939234', 'Oczekuje na oplate', 0, 0),
(267, 'Leonardo', 'Mazur', '222383653', 'Oczekuje na oplate', 0, 0),
(268, 'Daniel', 'Mazur', '99111679672', 'Oczekuje na oplate', 0, 0),
(269, 'Norbert', 'Michalak', '1312417751', 'Oczekuje na oplate', 0, 0),
(270, 'Roman', 'Szymański', '98121049415', 'Oczekuje na oplate', 0, 0),
(271, 'Igor', 'Kaźmierczak', '3291259935', 'Oczekuje na oplate', 0, 0),
(272, 'Jakub', 'Gajewska', '1272416593', 'Oczekuje na oplate', 0, 0),
(273, 'Damian', 'Baranowski', '2291917858', 'Oczekuje na oplate', 0, 1),
(274, 'Grzegorz', 'Woźniak', '97060348151', 'Oczekuje na oplate', 0, 0),
(275, 'Krzysztof', 'Kowalczyk', '3220314991', 'Oczekuje na oplate', 0, 0),
(276, 'Rafał', 'Tomaszewski', '97101595733', 'Oczekuje na oplate', 0, 0),
(277, 'Grzegorz', 'Lis', '290191895', 'Oczekuje na oplate', 0, 0),
(278, 'Emil', 'Maciejewski', '312835374', 'Oczekuje na oplate', 0, 0),
(279, 'Alojzy', 'Mazurek', '96110667653', 'Oczekuje na oplate', 0, 0),
(280, 'Artur', 'Zieliński', '99112931573', 'Oczekuje na oplate', 0, 0),
(281, 'Bartosz', 'Kalinowski', '98011693375', 'Oczekuje na oplate', 0, 0),
(282, 'Janusz', 'Lis', '2292654299', 'Oczekuje na oplate', 0, 0),
(283, 'Heronim', 'Mazur', '3250125192', 'Oczekuje na oplate', 0, 0),
(284, 'Emil', 'Borkowski', '97032862236', 'Oczekuje na oplate', 0, 0),
(285, 'Jarosław', 'Kucharski', '3262041134', 'Oczekuje na oplate', 0, 0),
(286, 'Ksawery', 'Adamska', '98030483999', 'Oczekuje na oplate', 0, 0),
(287, 'Michał', 'Górski', '1312736412', 'Oczekuje na oplate', 0, 0),
(288, 'Kamil', 'Michalak', '2230547359', 'Oczekuje na oplate', 0, 0),
(289, 'Michał', 'Czerwiński', '3310236895', 'Oczekuje na oplate', 0, 0),
(290, 'Diego', 'Marciniak', '251577195', 'Oczekuje na oplate', 0, 0),
(291, 'Denis', 'Urbańska', '97051211873', 'Oczekuje na oplate', 0, 0),
(292, 'Radosław', 'Górecki', '301476652', 'Oczekuje na oplate', 0, 0),
(293, 'Kamil', 'Czerwiński', '3302917971', 'Oczekuje na oplate', 0, 0),
(294, 'Dobromił', 'Jakubowski', '1251079496', 'Oczekuje na oplate', 0, 0),
(295, 'Maksymilian', 'Ostrowski', '3312792373', 'Oczekuje na oplate', 0, 0),
(296, 'Julian', 'Stępień', '96010847511', 'Oczekuje na oplate', 0, 0),
(297, 'Mikołaj', 'Jasiński', '98010145996', 'Oczekuje na oplate', 0, 0),
(298, 'Remigiusz', 'Przybylski', '2250143632', 'Oczekuje na oplate', 0, 0),
(299, 'Marian', 'Stępień', '2241852594', 'Oczekuje na oplate', 0, 0),
(300, 'Jerzy', 'Pawlak', '96082672431', 'Oczekuje na oplate', 0, 0),
(301, 'Maurycy', 'Kwiatkowski', '98091771792', 'Oczekuje na oplate', 0, 0),
(302, 'Artur', 'Laskowska', '3220219272', 'Oczekuje na oplate', 0, 0),
(303, 'Emanuel', 'Mróz', '97040579191', 'Oczekuje na oplate', 0, 0),
(304, 'Kajetan', 'Sobczak', '99092531754', 'Oczekuje na oplate', 0, 0),
(305, 'Mikołaj', 'Sadowska', '96020621653', 'Oczekuje na oplate', 0, 0),
(306, 'Klaudiusz', 'Kołodziej', '282188995', 'Oczekuje na oplate', 0, 0),
(307, 'Łukasz', 'Szczepański', '3232835879', 'Oczekuje na oplate', 0, 0),
(308, 'Mieszko', 'Dąbrowski', '322396898', 'Oczekuje na oplate', 0, 0),
(309, 'Mieszko', 'Wysocki', '96033064555', 'Oczekuje na oplate', 0, 0),
(310, 'Marcel', 'Brzeziński', '3210541891', 'Oczekuje na oplate', 0, 0),
(311, 'Kazimierz', 'Szulc', '99110328515', 'Oczekuje na oplate', 0, 0),
(312, 'Eugeniusz', 'Kowalczyk', '1230238311', 'Oczekuje na oplate', 0, 0),
(313, 'Kryspin', 'Lis', '213155254', 'Oczekuje na oplate', 0, 0),
(314, 'Albert', 'Krajewska', '311296518', 'Oczekuje na oplate', 0, 0),
(315, 'Piotr', 'Szczepański', '97061812211', 'Oczekuje na oplate', 0, 0),
(316, 'Marek', 'Michalak', '2242377575', 'Oczekuje na oplate', 0, 0),
(317, 'Damian', 'Zakrzewska', '2221343137', 'Oczekuje na oplate', 0, 0),
(318, 'Jakub', 'Brzeziński', '98072286594', 'Oczekuje na oplate', 0, 0),
(319, 'Heronim', 'Czarnecki', '97032251292', 'Oczekuje na oplate', 0, 0),
(320, 'Dobromił', 'Lewandowski', '97042992516', 'Oczekuje na oplate', 0, 0),
(321, 'Marcel', 'Górecki', '99072159673', 'Oczekuje na oplate', 0, 0),
(322, 'Florian', 'Piotrowski', '2252391279', 'Oczekuje na oplate', 0, 0),
(323, 'Przemysław', 'Szymański', '98080667835', 'Oczekuje na oplate', 0, 0),
(324, 'Olgierd', 'Michalak', '221615274', 'Oczekuje na oplate', 0, 0),
(325, 'Gniewomir', 'Andrzejewski', '99042459992', 'Oczekuje na oplate', 0, 0),
(326, 'Czesław', 'Andrzejewski', '3230117731', 'Oczekuje na oplate', 0, 0),
(327, 'Albert', 'Adamska', '96020176313', 'Oczekuje na oplate', 0, 0),
(328, 'Juliusz', 'Maciejewski', '98061889995', 'Oczekuje na oplate', 0, 0),
(329, 'Mirosław', 'Stępień', '2232976193', 'Oczekuje na oplate', 0, 0),
(330, 'Karol', 'Szymański', '1311257774', 'Oczekuje na oplate', 0, 0),
(331, 'Dobromił', 'Krupa', '98062465538', 'Oczekuje na oplate', 0, 0),
(332, 'Gracjan', 'Kwiatkowski', '99061637731', 'Oczekuje na oplate', 0, 0),
(333, 'Mariusz', 'Ziółkowska', '97042432513', 'Oczekuje na oplate', 0, 0),
(334, 'Radosław', 'Sobczak', '98010772239', 'Oczekuje na oplate', 0, 0),
(335, 'Fabian', 'Kubiak', '97110432478', 'Oczekuje na oplate', 0, 0),
(336, 'Marian', 'Zawadzki', '98062749735', 'Oczekuje na oplate', 0, 0),
(337, 'Emil', 'Witkowski', '99062486334', 'Oczekuje na oplate', 0, 0),
(338, 'Mirosław', 'Jankowski', '2231797791', 'Oczekuje na oplate', 0, 0),
(339, 'Konrad', 'Walczak', '98011197374', 'Oczekuje na oplate', 0, 0),
(340, 'Konrad', 'Szymański', '1251892996', 'Oczekuje na oplate', 0, 0),
(341, 'Olaf', 'Kołodziej', '1301782659', 'Oczekuje na oplate', 0, 0),
(342, 'Juliusz', 'Lis', '96082977178', 'Oczekuje na oplate', 0, 0),
(343, 'Dobromił', 'Krawczyk', '3271356111', 'Oczekuje na oplate', 0, 0),
(344, 'Błażej', 'Borkowski', '300284995', 'Oczekuje na oplate', 0, 0),
(345, 'Bronisław', 'Bąk', '99071496995', 'Oczekuje na oplate', 0, 0),
(346, 'Amir', 'Brzeziński', '1231929973', 'Oczekuje na oplate', 0, 0),
(347, 'Kewin', 'Ziółkowska', '2253136639', 'Oczekuje na oplate', 0, 0),
(348, 'Roman', 'Górecki', '1271714951', 'Oczekuje na oplate', 0, 0),
(349, 'Milan', 'Przybylski', '96111817873', 'Oczekuje na oplate', 0, 0),
(350, 'Artur', 'Michalak', '231338136', 'Oczekuje na oplate', 0, 0),
(351, 'Julian', 'Wojciechowski', '98072831855', 'Oczekuje na oplate', 0, 0),
(352, 'Maciej', 'Górski', '3281241216', 'Oczekuje na oplate', 0, 0),
(353, 'Piotr', 'Górecki', '2241624838', 'Oczekuje na oplate', 0, 0),
(354, 'Marian', 'Kołodziej', '98040868997', 'Oczekuje na oplate', 0, 0),
(355, 'Gracjan', 'Górski', '283194238', 'Oczekuje na oplate', 0, 0),
(356, 'Maurycy', 'Witkowski', '241139837', 'Oczekuje na oplate', 0, 0),
(357, 'Leonardo', 'Laskowska', '98061978615', 'Oczekuje na oplate', 0, 0),
(358, 'Jerzy', 'Mazurek', '3273121937', 'Oczekuje na oplate', 0, 0),
(359, 'Błażej', 'Włodarczyk', '1310751798', 'Oczekuje na oplate', 0, 0),
(360, 'Alek', 'Ziółkowska', '281674314', 'Oczekuje na oplate', 0, 0),
(361, 'Kryspin', 'Kowalczyk', '97011294913', 'Oczekuje na oplate', 0, 0),
(362, 'Eustachy', 'Cieślak', '1230494418', 'Oczekuje na oplate', 0, 0),
(363, 'Ryszard', 'Krupa', '3232758598', 'Oczekuje na oplate', 0, 0),
(364, 'Robert', 'Sawicki', '99051038456', 'Oczekuje na oplate', 0, 0),
(365, 'Błażej', 'Marciniak', '99090211636', 'Oczekuje na oplate', 0, 0),
(366, 'Fryderyk', 'Kowalski', '1301753514', 'Oczekuje na oplate', 0, 0),
(367, 'Krzysztof', 'Czerwiński', '98012346432', 'Oczekuje na oplate', 0, 0),
(368, 'Ryszard', 'Kowalczyk', '97102982376', 'Oczekuje na oplate', 0, 0),
(369, 'Leszek', 'Borkowski', '97030479896', 'Oczekuje na oplate', 0, 0),
(370, 'Dobromił', 'Bąk', '96082939253', 'Oczekuje na oplate', 0, 0),
(371, 'Milan', 'Duda', '1320647757', 'Oczekuje na oplate', 0, 0),
(372, 'Gniewomir', 'Baran', '96110939695', 'Oczekuje na oplate', 0, 0),
(373, 'Janusz', 'Sokołowski', '97051184634', 'Oczekuje na oplate', 0, 0),
(374, 'Adam', 'Krawczyk', '2262942414', 'Oczekuje na oplate', 0, 0),
(375, 'Milan', 'Szulc', '2322634497', 'Oczekuje na oplate', 0, 0),
(376, 'Aleksander', 'Brzeziński', '96092576453', 'Oczekuje na oplate', 0, 0),
(377, 'Piotr', 'Przybylski', '97101093835', 'Oczekuje na oplate', 0, 0),
(378, 'Marcin', 'Zawadzki', '98051752694', 'Oczekuje na oplate', 0, 0),
(379, 'Alek', 'Kamiński', '3231683718', 'Oczekuje na oplate', 0, 0),
(380, 'Janusz', 'Pietrzak', '98102299893', 'Oczekuje na oplate', 0, 0),
(381, 'Amadeusz', 'Jasiński', '96071116715', 'Oczekuje na oplate', 0, 0),
(382, 'Allan', 'Krawczyk', '97110641412', 'Oczekuje na oplate', 0, 0),
(383, 'Damian', 'Kowalski', '2231999117', 'Oczekuje na oplate', 0, 0),
(384, 'Marek', 'Duda', '97081261376', 'Oczekuje na oplate', 0, 0),
(385, 'Ireneusz', 'Wójcik', '97052429396', 'Oczekuje na oplate', 0, 0),
(386, 'Fryderyk', 'Wiśniewski', '99013071912', 'Oczekuje na oplate', 0, 0),
(387, 'Borys', 'Duda', '2302154335', 'Oczekuje na oplate', 0, 1),
(388, 'Anatol', 'Szymczak', '1292674915', 'Oczekuje na oplate', 0, 0),
(389, 'Karol', 'Lis', '2300172713', 'Oczekuje na oplate', 0, 0),
(390, 'Leszek', 'Cieślak', '96100887898', 'Oczekuje na oplate', 0, 0),
(391, 'Dawid', 'Mróz', '96031577718', 'Oczekuje na oplate', 0, 0),
(392, 'Ariel', 'Woźniak', '96091831373', 'Oczekuje na oplate', 0, 0),
(393, 'Ludwik', 'Ostrowski', '3311981534', 'Oczekuje na oplate', 0, 0),
(394, 'Mateusz', 'Zalewski', '96091158575', 'Oczekuje na oplate', 0, 0),
(395, 'Artur', 'Kowalski', '1220233797', 'Oczekuje na oplate', 0, 0),
(396, 'Kajetan', 'Nowak', '97081111978', 'Oczekuje na oplate', 0, 0),
(397, 'Konrad', 'Ziółkowska', '97122077636', 'Oczekuje na oplate', 0, 0),
(398, 'Ireneusz', 'Brzeziński', '97071937951', 'Oczekuje na oplate', 0, 0),
(399, 'Anastazy', 'Szulc', '1220612774', 'Oczekuje na oplate', 0, 0),
(400, 'Filip', 'Baranowski', '98022026276', 'Oczekuje na oplate', 0, 0);

--
-- Wyzwalacze `kandydaci`
--
DELIMITER $$
CREATE TRIGGER `DeleteStudent` BEFORE DELETE ON `kandydaci` FOR EACH ROW BEGIN
    set foreign_key_checks = 0;
		delete from preferencjekandydata where IdKandydata = old.NrRejestracyjny;
		delete from wynikimatur where IdKandydata = old.NrRejestracyjny;
    set foreign_key_checks = 1;
	end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `NewStudent` BEFORE INSERT ON `kandydaci` FOR EACH ROW begin
	  insert into wynikimatur (IdKandydata) values (new.NrRejestracyjny);
	  insert into preferencjekandydata (IdKandydata) value (new.NrRejestracyjny);
  end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kierunki`
--

CREATE TABLE `kierunki` (
  `IdKierunku` int(11) NOT NULL,
  `NazwaWydziału` varchar(60) NOT NULL,
  `NazwaKierunku` varchar(60) NOT NULL,
  `LimitMiejsc` int(11) NOT NULL,
  `KodWydzialu` varchar(3) NOT NULL,
  `KodKierunku` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `kierunki`
--

INSERT INTO `kierunki` (`IdKierunku`, `NazwaWydziału`, `NazwaKierunku`, `LimitMiejsc`, `KodWydzialu`, `KodKierunku`) VALUES
(1, 'Wydział Architektury', 'Architektura', 225, 'W1', 'ARCH\r'),
(2, 'Wydział Architektury', 'Gospodarka Przestrzenna', 75, 'W1', 'GP\r'),
(3, 'Wydział Budownictwa Lądowego i Wodnego', 'Budownictwo', 540, 'W2', 'BUD\r'),
(4, 'Wydział Chemiczny', 'Biotechnologia', 220, 'W3', 'BT\r'),
(5, 'Wydział Chemiczny', 'Chemia i Analityka Przemysłowa', 100, 'W3', 'CHA\r'),
(6, 'Wydział Chemiczny', 'Chemia i Inżynieria Materiałów', 100, 'W3', 'CIM\r'),
(7, 'Wydział Chemiczny', 'Inżynieria Chemiczna i Procesowa', 100, 'W3', 'ICH\r'),
(8, 'Wydział Chemiczny', 'Technologia Chemiczna', 150, 'W3', 'TCH\r'),
(9, 'Wydział Informatyki i Telekomunikacji', 'Cyberbezpieczeństwo', 180, 'W4', 'CBE\r'),
(10, 'Wydział Informatyki i Telekomunikacji', 'Informatyka Algorytmiczna', 80, 'W4', 'INA\r'),
(11, 'Wydział Informatyki i Telekomunikacji', 'Informatyka Stosowana', 150, 'W4', 'IST\r'),
(12, 'Wydział Informatyki i Telekomunikacji', 'Informatyka Stosowana w j.Angielskim', 30, 'W4', 'ISTAN\r'),
(13, 'Wydział Informatyki i Telekomunikacji', 'Informatyka Techniczna', 220, 'W4', 'ITE\r'),
(14, 'Wydział Informatyki i Telekomunikacji', 'Informatyczne Systemy Automatyki', 140, 'W4', 'ISA\r'),
(15, 'Wydział Informatyki i Telekomunikacji', 'Inżynieria Systemów', 90, 'W4', 'INS\r'),
(16, 'Wydział Informatyki i Telekomunikacji', 'Teleinformatyka', 120, 'W4', 'TIN\r'),
(17, 'Wydział Informatyki i Telekomunikacji', 'Telekomunikacja', 130, 'W4', 'TEL\r'),
(18, 'Wydział Elektryczny', 'Elektrotechnika', 135, 'W5', 'ETK\r'),
(19, 'Wydział Elektryczny', 'Automatyka Przemysłowa', 135, 'W5', 'APR\r'),
(20, 'Wydział Elektryczny', 'Elektromobilność', 90, 'W5', 'EMB\r'),
(21, 'Wydział Elektryczny', 'Elektromechatronika', 60, 'W5', 'EMR\r'),
(22, 'Wydział Geoinżynierii, Górnictwa i Geologii', 'Geodezja i Kartografia', 80, 'W6', 'GiK\r'),
(23, 'Wydział Geoinżynierii, Górnictwa i Geologii', 'Górnictwo i Geologia', 125, 'W6', 'GiG\r'),
(24, 'Wydział Geoinżynierii, Górnictwa i Geologii', 'Geoinformatyka', 60, 'W6', 'GIT\r'),
(25, 'Wydział Inżynierii Środowiska', 'Inżynieria Środowiska', 210, 'W7', 'ISS\r'),
(26, 'Wydział Inżynierii Środowiska', 'Technologie Ochrony Środowiska', 120, 'W7', 'TOS\r'),
(27, 'Wydział Zarządzania', 'Zarządzanie', 120, 'W8', 'ZZZ\r'),
(28, 'Wydział Zarządzania', 'Zarządzanie w j.Angielskim', 30, 'W8', 'ZZZAN\r'),
(29, 'Wydział Zarządzania', 'Inżynieria Zarządzania', 120, 'W8', 'IZ\r'),
(30, 'Wydział Mechaniczno-Energetyczny', 'Energetyka', 120, 'W9', 'ENG\r'),
(31, 'Wydział Mechaniczno-Energetyczny', 'Lotnictwo i Kosmonautyka', 90, 'W9', 'LiK\r'),
(32, 'Wydział Mechaniczno-Energetyczny', 'Mechanika i Budowa Maszyn Energetycznych', 120, 'W9', 'MBE\r'),
(33, 'Wydział Mechaniczno-Energetyczny', 'Odnawialne Źródła Energii', 120, 'W9', 'OZE\r'),
(34, 'Wydział Mechaniczny', 'Biomechanika Inżynierska', 90, 'W10', 'BMI\r'),
(35, 'Wydział Mechaniczny', 'Mechanika i Budowa Maszyn', 300, 'W10', 'MBM\r'),
(36, 'Wydział Mechaniczny', 'Mechanika i Budowa Maszyn w j.Angielskim', 20, 'W10', 'MBMAN\r'),
(37, 'Wydział Mechaniczny', 'Mechatronika', 180, 'W10', 'MTR\r'),
(38, 'Wydział Mechaniczny', 'Robotyka i Automatyzacja Procesów', 150, 'W10', 'RAP\r'),
(39, 'Wydział Mechaniczny', 'Transport', 120, 'W10', 'TRN\r'),
(40, 'Wydział Mechaniczny', 'Zarządzanie i Inżynieria Produkcji', 180, 'W10', 'ZIP\r'),
(41, 'Wydział Podstawowych Problemów Techniki', 'Fizyka Techniczna', 60, 'W11', 'FTE\r'),
(42, 'Wydział Podstawowych Problemów Techniki', 'Inżynieria Biomedyczna', 165, 'W11', 'IB\r'),
(43, 'Wydział Podstawowych Problemów Techniki', 'Inżynieria Kwantowa', 60, 'W11', 'IKW\r'),
(44, 'Wydział Podstawowych Problemów Techniki', 'Optyka', 100, 'W11', 'OPA\r'),
(45, 'Wydział Elektroniki, Fotoniki i Mikrosystemów', 'Elektronika i Telekomunikacja', 180, 'W12', 'EiT\r'),
(46, 'Wydział Elektroniki, Fotoniki i Mikrosystemów', 'Inteligentna Elektronika', 70, 'W12', 'IA\r'),
(47, 'Wydział Elektroniki, Fotoniki i Mikrosystemów', 'Inżynieria Mikrosystemów Mechatronicznych', 100, 'W12', 'IMM\r'),
(48, 'Wydział Elektroniki, Fotoniki i Mikrosystemów', '\"Inżynieria Elektroniczna i Komputerowa w j.Angielskim\"', 45, 'W12', 'EACAN\r'),
(49, 'Wydział Elektroniki, Fotoniki i Mikrosystemów', 'Automatyka i Robotyka', 165, 'W12', 'AiR\r'),
(50, 'Wydział Elektroniki, Fotoniki i Mikrosystemów', 'Elektronika', 198, 'W12', 'ELA\r'),
(51, 'Wydział Matematyki', 'Matematyka', 100, 'W13', 'MAT\r'),
(52, 'Wydział Matematyki', 'Matematyka Stosowana', 100, 'W13', 'MST\r'),
(53, 'Filia w Legnicy', 'Automatyka Przemysłowa', 45, 'W14', 'APR\r'),
(54, 'Filia w Legnicy', 'Górnictwo i Geologia', 30, 'W14', 'GiG\r'),
(55, 'Filia w Legnicy', 'Mechanika i Budowa Maszyn', 45, 'W14', 'MBM\r'),
(56, 'Filia w Legnicy', 'Odnawialne Źródła Energii', 60, 'W14', 'OZE\r'),
(57, 'Filia w Jeleniej Górze', 'Elektrotechnika', 45, 'W15', 'ETK\r'),
(58, 'Filia w Jeleniej Górze', 'Informatyka Techniczna', 60, 'W15', 'ITE\r'),
(59, 'Filia w Jeleniej Górze', 'Mechanika i Budowa Maszyn', 45, 'W15', 'MBM\r'),
(60, 'Filia w Wałbrzychu', 'Informatyka Techniczna', 60, 'W16', 'ITE\r'),
(61, 'Filia w Wałbrzychu', 'Mechanika i Budowa Maszyn', 45, 'W16', 'MBM\r'),
(62, 'Filia w Wałbrzychu', 'Zarządzanie i Inżynieria Produkcji', 45, 'W16', 'ZIP\r');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `IdPracownika` int(11) NOT NULL,
  `Imie` varchar(30) NOT NULL,
  `Nazwisko` varchar(30) NOT NULL,
  `Jednostka` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`IdPracownika`, `Imie`, `Nazwisko`, `Jednostka`) VALUES
(1, 'Ada', 'Kaźmierczak', 'W1\r'),
(2, 'Matylda', 'Wiśniewska', 'W2\r'),
(3, 'Amalia', 'Bąk', 'W3\r'),
(4, 'Klara', 'Mazurek', 'W4\r'),
(5, 'Roksana', 'Głowacka', 'W5\r'),
(6, 'Natasza', 'Chmielewska', 'W6\r'),
(7, 'Aneta', 'Ziółkowska', 'W7\r'),
(8, 'Agata', 'Rutkowska', 'W8\r'),
(9, 'Maria', 'Kozłowska', 'W8\r'),
(10, 'Weronika', 'Malinowska', 'W9\r'),
(11, 'Amalia', 'Bąk', 'DDR\r'),
(12, 'Cecylia', 'Kozłowska', 'DDR\r'),
(13, 'Marysia', 'Kowalska', 'DDR\r'),
(14, 'Julia', 'Wróblewska', 'W10\r'),
(15, 'Anna', 'Wiśniewska', 'W11\r'),
(16, 'Żaneta', 'Wysocka', 'W10\r'),
(17, 'Andrea', 'Przybylska', 'W13\r'),
(18, 'Kaja', 'Lewandowska', 'W14\r'),
(19, 'Antonina', 'Sikora', 'W15\r'),
(20, 'Dominika', 'Wysocka', 'W16\r'),
(21, 'Cecylia', 'Marciniak', 'W2\r'),
(22, 'Urszula', 'Zakrzewska', 'DDR\r'),
(23, 'Edyta', 'Potocka', 'DDR\r'),
(24, 'Jędrzej', 'Kamiński', 'W12\r'),
(25, 'Kuba', 'Gajewska', 'DDR\r'),
(26, 'Borys', 'Wasilewska', 'W3\r'),
(27, 'Janusz', 'Kaźmierczak', 'DDR\r'),
(28, 'Mirosław', 'Nowak', 'W8\r'),
(29, 'Allan', 'Górski', 'DDR\r');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `preferencjekandydata`
--

CREATE TABLE `preferencjekandydata` (
  `IdKandydata` int(11) NOT NULL,
  `Preferencja1` int(11) DEFAULT NULL,
  `Preferencja2` int(11) DEFAULT NULL,
  `Preferencja3` int(11) DEFAULT NULL,
  `Preferencja4` int(11) DEFAULT NULL,
  `Preferencja5` int(11) DEFAULT NULL,
  `Preferencja6` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `preferencjekandydata`
--

INSERT INTO `preferencjekandydata` (`IdKandydata`, `Preferencja1`, `Preferencja2`, `Preferencja3`, `Preferencja4`, `Preferencja5`, `Preferencja6`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 7, 25, 43, 14, 2, NULL),
(3, 11, 32, 1, 33, NULL, NULL),
(4, 14, 26, 25, 45, NULL, NULL),
(5, 46, 35, 34, NULL, NULL, NULL),
(6, 42, NULL, NULL, NULL, NULL, NULL),
(7, 50, 33, NULL, NULL, NULL, NULL),
(8, 18, 54, NULL, NULL, NULL, NULL),
(9, 56, 59, 2, 21, NULL, NULL),
(10, 41, 43, 28, 9, NULL, NULL),
(11, 16, 17, 37, NULL, NULL, NULL),
(12, 52, 50, NULL, NULL, NULL, NULL),
(13, 62, 34, 45, 60, NULL, NULL),
(14, 19, 35, 56, 51, 22, NULL),
(15, 29, 24, 31, NULL, NULL, NULL),
(16, 17, 17, 31, NULL, NULL, NULL),
(17, 53, 13, 29, 45, 14, NULL),
(18, 62, 8, 38, 44, 42, 17),
(19, 37, 9, 55, NULL, NULL, NULL),
(20, 22, 46, 37, 47, 63, 47),
(21, 28, 60, 28, 23, 32, NULL),
(22, 28, 2, 50, NULL, NULL, NULL),
(23, 14, 17, 45, 46, 35, 34),
(24, 38, NULL, NULL, NULL, NULL, NULL),
(25, 28, 40, 54, 23, 16, 9),
(26, 22, 54, 17, 47, 57, 20),
(27, 3, 51, 61, 26, 7, 20),
(28, 16, 33, NULL, NULL, NULL, NULL),
(29, 54, 37, 25, 12, 46, 5),
(30, 42, 50, NULL, NULL, NULL, NULL),
(31, 35, 52, 26, 38, 49, 5),
(32, 56, NULL, NULL, NULL, NULL, NULL),
(33, 12, 51, 31, NULL, NULL, NULL),
(34, 42, NULL, NULL, NULL, NULL, NULL),
(35, 15, 24, NULL, NULL, NULL, NULL),
(36, 46, 8, NULL, NULL, NULL, NULL),
(37, 35, 40, 30, NULL, NULL, NULL),
(38, 59, 17, 32, 48, NULL, NULL),
(39, 3, 23, 43, NULL, NULL, NULL),
(40, 46, 36, 39, NULL, NULL, NULL),
(41, 18, 6, 38, 48, NULL, NULL),
(42, 46, NULL, NULL, NULL, NULL, NULL),
(43, 50, 11, 28, 43, 8, NULL),
(44, 25, 18, 16, 22, NULL, NULL),
(45, 61, 52, 14, 38, 24, 4),
(46, 24, 36, NULL, NULL, NULL, NULL),
(47, 52, 62, 31, 27, 44, NULL),
(48, 53, 41, NULL, NULL, NULL, NULL),
(49, 43, 14, 62, 22, 46, NULL),
(50, 60, 57, 40, 28, 20, NULL),
(51, 10, 8, NULL, NULL, NULL, NULL),
(52, 16, 53, NULL, NULL, NULL, NULL),
(53, 57, 6, 41, 3, NULL, NULL),
(54, 7, 47, NULL, NULL, NULL, NULL),
(55, 54, 5, 45, NULL, NULL, NULL),
(56, 41, 14, 5, NULL, NULL, NULL),
(57, 13, 62, 19, 32, 41, NULL),
(58, 44, 18, 18, 36, 62, NULL),
(59, 9, 2, NULL, NULL, NULL, NULL),
(60, 33, 27, 37, 41, 31, NULL),
(61, 63, 32, 32, 1, NULL, NULL),
(62, 35, 12, 18, 52, NULL, NULL),
(63, 3, 16, 7, NULL, NULL, NULL),
(64, 41, 54, 24, 16, 7, 48),
(65, 15, 42, 37, 59, NULL, NULL),
(66, 53, 27, 37, 41, 32, 37),
(67, 16, 1, 19, NULL, NULL, NULL),
(68, 27, 47, 30, 7, NULL, NULL),
(69, 59, NULL, NULL, NULL, NULL, NULL),
(70, 8, 52, 48, 19, 16, NULL),
(71, 43, 37, 56, NULL, NULL, NULL),
(72, 36, 57, 50, 19, 6, NULL),
(73, 19, 60, 54, 27, NULL, NULL),
(74, 21, 8, 36, 32, NULL, NULL),
(75, 38, 32, 46, 8, 26, 45),
(76, 21, 49, 58, NULL, NULL, NULL),
(77, 29, 35, NULL, NULL, NULL, NULL),
(78, 11, 45, 8, NULL, NULL, NULL),
(79, 45, 22, 34, NULL, NULL, NULL),
(80, 37, 61, 10, 53, 47, NULL),
(81, 48, 13, NULL, NULL, NULL, NULL),
(82, 50, 58, 18, 35, 62, NULL),
(83, 15, 26, NULL, NULL, NULL, NULL),
(84, 34, 40, 36, NULL, NULL, NULL),
(85, 2, 15, 5, 43, 15, 3),
(86, 32, 59, 13, 10, NULL, NULL),
(87, 12, 34, NULL, NULL, NULL, NULL),
(88, 4, 56, NULL, NULL, NULL, NULL),
(89, 43, 37, 55, NULL, NULL, NULL),
(90, 29, 27, 45, 20, 28, NULL),
(91, 60, 2, 13, NULL, NULL, NULL),
(92, 4, 30, 14, 40, 32, 38),
(93, 47, 14, 53, 35, NULL, NULL),
(94, 24, 16, NULL, NULL, NULL, NULL),
(95, 50, 42, NULL, NULL, NULL, NULL),
(96, 41, 28, 16, 59, 60, 60),
(97, 33, 60, 15, 20, 51, 7),
(98, 18, 3, NULL, NULL, NULL, NULL),
(99, 38, 60, 1, NULL, NULL, NULL),
(100, 49, 25, NULL, NULL, NULL, NULL),
(101, 55, 33, 62, 25, 1, NULL),
(102, 12, 25, 26, 53, 63, 29),
(103, 59, 56, 42, NULL, NULL, NULL),
(104, 4, 28, 3, 56, 20, NULL),
(105, 28, 37, 38, 18, 34, 52),
(106, 14, 27, 31, 12, NULL, NULL),
(107, 31, 15, 42, NULL, NULL, NULL),
(108, 21, 40, 10, 56, 62, NULL),
(109, 19, 44, NULL, NULL, NULL, NULL),
(110, 1, 11, 51, 35, 21, NULL),
(111, 48, 61, 35, 54, 39, 32),
(112, 50, 62, 34, 44, 58, NULL),
(113, 36, 30, 39, 42, NULL, NULL),
(114, 21, 14, 7, 53, NULL, NULL),
(115, 13, 11, 12, 29, 44, 10),
(116, 36, 3, 29, 11, 29, NULL),
(117, 36, 31, 45, 8, 27, 49),
(118, 49, 61, 37, 60, 2, NULL),
(119, 62, 21, NULL, NULL, NULL, NULL),
(120, 29, 12, 37, 20, 53, NULL),
(121, 58, 48, 63, NULL, NULL, NULL),
(122, 37, 48, 4, 1, 54, NULL),
(123, 38, 19, NULL, NULL, NULL, NULL),
(124, 26, 5, 10, 32, 4, NULL),
(125, 34, 30, 45, 12, 49, NULL),
(126, 23, 50, 55, NULL, NULL, NULL),
(127, 21, 43, 24, 55, 14, 28),
(128, 26, 24, 41, 8, NULL, NULL),
(129, 49, 2, 46, 38, 50, NULL),
(130, 33, 4, NULL, NULL, NULL, NULL),
(131, 19, 24, 63, 55, 24, NULL),
(132, 61, 14, NULL, NULL, NULL, NULL),
(133, 60, 29, NULL, NULL, NULL, NULL),
(134, 35, 39, 25, NULL, NULL, NULL),
(135, 24, 34, NULL, NULL, NULL, NULL),
(136, 2, 35, 43, 47, NULL, NULL),
(137, 19, 22, 53, 9, 12, NULL),
(138, 59, 12, 8, 4, NULL, NULL),
(139, 10, 12, 28, 39, 50, 8),
(140, 42, 45, NULL, NULL, NULL, NULL),
(141, 46, 60, 33, 48, NULL, NULL),
(142, 59, 60, NULL, NULL, NULL, NULL),
(143, 53, 24, 23, 41, 13, 63),
(144, 5, 8, 24, NULL, NULL, NULL),
(145, 18, 59, 54, 32, NULL, NULL),
(146, 5, 39, 55, 33, 58, 8),
(147, 30, 4, 54, 9, 7, 7),
(148, 32, 3, NULL, NULL, NULL, NULL),
(149, 15, 8, 55, 3, 36, NULL),
(150, 58, 28, 26, 45, 23, NULL),
(151, 10, 52, 44, 60, 42, NULL),
(152, 34, 9, 6, 62, NULL, NULL),
(153, 23, 49, 51, 46, 16, NULL),
(154, 12, 60, 15, 18, 42, 33),
(155, 32, 41, 46, 43, 14, NULL),
(156, 31, NULL, NULL, NULL, NULL, NULL),
(157, 20, 29, 22, NULL, NULL, NULL),
(158, 45, 34, 35, NULL, NULL, NULL),
(159, 5, 55, NULL, NULL, NULL, NULL),
(160, 10, 16, NULL, NULL, NULL, NULL),
(161, 27, 40, 52, 19, 60, 57),
(162, 37, 59, 59, 55, 34, NULL),
(163, 52, 55, NULL, NULL, NULL, NULL),
(164, 45, 62, 47, 50, 43, 6),
(165, 25, 62, 47, NULL, NULL, NULL),
(166, 36, 35, 3, 32, 27, 36),
(167, 18, 39, 15, 18, 46, NULL),
(168, 53, 48, 20, 16, 19, 46),
(169, 46, 18, 11, 1, 35, 47),
(170, 1, NULL, NULL, NULL, NULL, NULL),
(171, 29, 36, 31, 48, 19, 13),
(172, 50, NULL, NULL, NULL, NULL, NULL),
(173, 19, 15, 19, 49, 61, NULL),
(174, 48, 14, 50, 21, NULL, NULL),
(175, 5, 46, NULL, NULL, NULL, NULL),
(176, 7, 9, 20, 11, NULL, NULL),
(177, 58, 62, 11, 52, 40, 42),
(178, 13, 43, 51, 1, NULL, NULL),
(179, 61, 5, 26, 54, 3, NULL),
(180, 53, 28, 42, 62, 59, NULL),
(181, 59, 26, 16, 2, 21, NULL),
(182, 55, 41, 39, 7, NULL, NULL),
(183, 10, 41, 51, 7, 6, NULL),
(184, 25, 33, NULL, NULL, NULL, NULL),
(185, 45, 11, 43, 59, NULL, NULL),
(186, 24, 60, 43, 32, 29, NULL),
(187, 27, 55, 5, 46, 26, 54),
(188, 46, NULL, NULL, NULL, NULL, NULL),
(189, 1, 46, 39, 58, NULL, NULL),
(190, 52, 62, 31, 27, 42, NULL),
(191, 20, NULL, NULL, NULL, NULL, NULL),
(192, 49, 52, 53, NULL, NULL, NULL),
(193, 2, 61, 52, 12, 28, NULL),
(194, 53, 21, 6, 29, 1, NULL),
(195, 19, 32, 40, 40, 18, NULL),
(196, 26, 46, 26, 51, NULL, NULL),
(197, 57, 56, 48, 8, 21, 18),
(198, 62, 55, 26, NULL, NULL, NULL),
(199, 57, 14, 23, 11, NULL, NULL),
(200, 14, 54, 41, 42, 25, NULL),
(201, 27, 22, 29, 17, 57, 49),
(202, 27, 43, NULL, NULL, NULL, NULL),
(203, 40, 48, NULL, NULL, NULL, NULL),
(204, 4, 42, 13, 59, 8, 47),
(205, 38, 57, 47, NULL, NULL, NULL),
(206, 38, 8, 49, 33, 18, 50),
(207, 18, 3, NULL, NULL, NULL, NULL),
(208, 23, 58, 34, NULL, NULL, NULL),
(209, 59, 60, 62, 3, 16, 9),
(210, 8, 56, 7, 52, 50, 31),
(211, 59, NULL, NULL, NULL, NULL, NULL),
(212, 16, 61, 8, NULL, NULL, NULL),
(213, 9, 36, 27, 25, 45, NULL),
(214, 41, 10, 50, NULL, NULL, NULL),
(215, 22, 5, 18, 13, NULL, NULL),
(216, 8, 10, NULL, NULL, NULL, NULL),
(217, 33, 25, 24, NULL, NULL, NULL),
(218, 35, 36, 9, 61, 28, NULL),
(219, 5, 33, 25, NULL, NULL, NULL),
(220, 53, 63, 30, NULL, NULL, NULL),
(221, 22, 40, 9, NULL, NULL, NULL),
(222, 29, 59, 22, 57, 31, 46),
(223, 50, 25, NULL, NULL, NULL, NULL),
(224, 38, 22, 57, 32, NULL, NULL),
(225, 29, 57, 11, 6, 57, 19),
(226, 58, 19, 43, 36, 49, 11),
(227, 54, 56, 54, 39, NULL, NULL),
(228, 47, 10, 32, 3, NULL, NULL),
(229, 31, 17, 55, 34, 4, NULL),
(230, 2, 13, 59, 8, 47, NULL),
(231, 45, 23, 44, NULL, NULL, NULL),
(232, 50, 51, 43, NULL, NULL, NULL),
(233, 50, 5, 60, 34, 54, 42),
(234, 54, 60, 15, 16, 36, 4),
(235, 44, 48, 47, 28, NULL, NULL),
(236, 16, 32, 50, 30, 61, 25),
(237, 11, NULL, NULL, NULL, NULL, NULL),
(238, 45, 38, 54, 32, 60, NULL),
(239, 18, 45, NULL, NULL, NULL, NULL),
(240, 36, 39, 25, 4, 6, NULL),
(241, 9, 52, 46, NULL, NULL, NULL),
(242, 36, 23, NULL, NULL, NULL, NULL),
(243, 35, 24, NULL, NULL, NULL, NULL),
(244, 55, 48, NULL, NULL, NULL, NULL),
(245, 34, 13, NULL, NULL, NULL, NULL),
(246, 8, 36, 33, NULL, NULL, NULL),
(247, 46, 5, 10, 33, 13, 24),
(248, 25, 4, 3, NULL, NULL, NULL),
(249, 11, NULL, NULL, NULL, NULL, NULL),
(250, 43, 30, 23, 22, 39, NULL),
(251, 37, 43, NULL, NULL, NULL, NULL),
(252, 3, 20, 31, 29, 53, NULL),
(253, 32, 7, 60, 32, 42, 52),
(254, 61, 37, NULL, NULL, NULL, NULL),
(255, 20, NULL, NULL, NULL, NULL, NULL),
(256, 39, 35, 56, 51, NULL, NULL),
(257, 18, 23, 60, NULL, NULL, NULL),
(258, 40, 6, 30, 8, 10, NULL),
(259, 34, 31, 50, NULL, NULL, NULL),
(260, 18, 50, 9, 20, NULL, NULL),
(261, 38, 44, NULL, NULL, NULL, NULL),
(262, 11, 56, 58, 60, 2, NULL),
(263, 57, 62, NULL, NULL, NULL, NULL),
(264, 4, 42, NULL, NULL, NULL, NULL),
(265, 43, 61, NULL, NULL, NULL, NULL),
(266, 16, 45, 52, 2, 39, 3),
(267, 29, 21, 17, NULL, NULL, NULL),
(268, 60, 45, 45, NULL, NULL, NULL),
(269, 51, 57, 7, NULL, NULL, NULL),
(270, 40, 48, 60, 28, 23, 31),
(271, 12, 57, 2, NULL, NULL, NULL),
(272, 44, 27, 63, NULL, NULL, NULL),
(273, 42, 7, 33, 21, 4, NULL),
(274, 21, 45, 36, NULL, NULL, NULL),
(275, 51, 59, 17, 30, 36, NULL),
(276, 25, 43, 17, NULL, NULL, NULL),
(277, 33, 51, 32, NULL, NULL, NULL),
(278, 47, NULL, NULL, NULL, NULL, NULL),
(279, 40, 26, 12, 40, NULL, NULL),
(280, 16, 20, 52, 15, 39, NULL),
(281, 9, 32, 6, NULL, NULL, NULL),
(282, 30, 31, 2, 42, 14, 7),
(283, 61, 18, 31, 37, 29, 32),
(284, 26, 28, NULL, NULL, NULL, NULL),
(285, 44, NULL, NULL, NULL, NULL, NULL),
(286, 7, 12, 37, 23, NULL, NULL),
(287, 23, 32, NULL, NULL, NULL, NULL),
(288, 45, 15, 61, 11, NULL, NULL),
(289, 12, 6, 53, 63, 29, 20),
(290, 45, 13, NULL, NULL, NULL, NULL),
(291, 32, 6, 57, 19, 48, 55),
(292, 47, NULL, NULL, NULL, NULL, NULL),
(293, 25, 25, 48, 41, NULL, NULL),
(294, 54, 25, 22, 36, 53, 30),
(295, 38, 36, 4, 35, 39, 28),
(296, 19, 32, 39, NULL, NULL, NULL),
(297, 6, 43, 7, 30, 6, NULL),
(298, 39, 13, 6, 52, 55, 55),
(299, 17, 61, 4, 23, 41, 10),
(300, 38, 35, 59, 3, 24, 47),
(301, 59, 47, 58, 25, 11, NULL),
(302, 46, 47, 31, 15, 41, NULL),
(303, 54, 40, 37, 1, NULL, NULL),
(304, 28, 19, 10, NULL, NULL, NULL),
(305, 54, 46, 3, 61, 48, 56),
(306, 2, 43, NULL, NULL, NULL, NULL),
(307, 35, 51, 26, NULL, NULL, NULL),
(308, 47, 58, 24, 7, 23, NULL),
(309, 26, 34, 28, 36, NULL, NULL),
(310, 58, 2, 21, 36, NULL, NULL),
(311, 47, 4, 62, 49, 57, 14),
(312, 62, 61, 57, NULL, NULL, NULL),
(313, 15, 26, 19, 15, 20, NULL),
(314, 20, 63, 5, 19, 20, 43),
(315, 4, 4, 4, NULL, NULL, NULL),
(316, 20, 18, NULL, NULL, NULL, NULL),
(317, 31, 4, 50, 51, NULL, NULL),
(318, 63, 57, 35, 2, 30, NULL),
(319, 60, 61, 61, NULL, NULL, NULL),
(320, 42, 38, 2, 19, 25, 6),
(321, 2, 19, 27, NULL, NULL, NULL),
(322, 1, 16, 15, NULL, NULL, NULL),
(323, 12, 49, 21, NULL, NULL, NULL),
(324, 35, 51, 25, NULL, NULL, NULL),
(325, 35, 6, 51, 50, NULL, NULL),
(326, 12, 23, 14, 2, NULL, NULL),
(327, 20, 9, 46, 15, NULL, NULL),
(328, 2, 16, 12, 9, 10, 24),
(329, 50, 52, 45, NULL, NULL, NULL),
(330, 20, 17, NULL, NULL, NULL, NULL),
(331, 3, 7, 27, NULL, NULL, NULL),
(332, 37, 37, 11, 5, 54, 4),
(333, 18, 22, 57, 28, 33, NULL),
(334, 42, 39, NULL, NULL, NULL, NULL),
(335, 22, NULL, NULL, NULL, NULL, NULL),
(336, 5, 30, 9, 18, 60, NULL),
(337, 61, 59, 48, 62, 41, 20),
(338, 52, 32, 63, 32, NULL, NULL),
(339, 9, 5, 58, 24, NULL, NULL),
(340, 41, 47, NULL, NULL, NULL, NULL),
(341, 49, 31, 8, 5, 3, 60),
(342, 19, 38, 6, 39, 54, NULL),
(343, 35, 30, 44, 7, NULL, NULL),
(344, 42, 7, 35, NULL, NULL, NULL),
(345, 41, 53, 19, 56, NULL, NULL),
(346, 20, 47, 50, 45, 13, NULL),
(347, 36, 22, 3, 8, 32, 12),
(348, 13, 61, 15, NULL, NULL, NULL),
(349, 38, 12, 10, NULL, NULL, NULL),
(350, 34, 7, NULL, NULL, NULL, NULL),
(351, 9, 1, 39, 3, 22, 37),
(352, 40, 34, 51, 25, 32, 24),
(353, 48, 42, 5, NULL, NULL, NULL),
(354, 17, 26, 17, NULL, NULL, NULL),
(355, 50, 37, NULL, NULL, NULL, NULL),
(356, 2, 28, 8, 16, NULL, NULL),
(357, 38, 24, 6, 21, 22, 47),
(358, 8, 38, 38, 16, 27, NULL),
(359, 31, 26, 34, NULL, NULL, NULL),
(360, 49, 27, 52, 52, NULL, NULL),
(361, 53, 12, 24, 21, 34, NULL),
(362, 42, 25, 59, 34, 54, NULL),
(363, 50, 57, 14, 18, 50, NULL),
(364, 7, 15, NULL, NULL, NULL, NULL),
(365, 35, 15, 28, 33, 16, 44),
(366, 44, 13, 54, 46, 3, 63),
(367, 25, 20, 24, 59, 36, 3),
(368, 6, 6, 14, 50, NULL, NULL),
(369, 17, 22, 55, NULL, NULL, NULL),
(370, 9, 37, 36, NULL, NULL, NULL),
(371, 38, NULL, NULL, NULL, NULL, NULL),
(372, 15, 46, 58, 28, 27, 52),
(373, 39, 39, 15, 21, 58, 42),
(374, 35, 14, 26, 26, NULL, NULL),
(375, 53, 49, 21, 19, 30, 32),
(376, 1, 45, NULL, NULL, NULL, NULL),
(377, 29, 46, 19, 19, NULL, NULL),
(378, 2, 20, 32, 39, NULL, NULL),
(379, 62, 16, 14, 22, NULL, NULL),
(380, 20, NULL, NULL, NULL, NULL, NULL),
(381, 44, 31, 24, NULL, NULL, NULL),
(382, 55, 13, 20, NULL, NULL, NULL),
(383, 57, 38, 20, 48, 52, 55),
(384, 46, 2, 58, 33, 55, 50),
(385, 16, 15, 26, NULL, NULL, NULL),
(386, 41, 6, 32, NULL, NULL, NULL),
(387, 41, 33, NULL, NULL, NULL, NULL),
(388, 58, 32, 47, 14, 54, NULL),
(389, 26, 19, 12, 6, 51, NULL),
(390, 45, 6, 16, 61, 9, 46),
(391, 10, 59, 17, NULL, NULL, NULL),
(392, 29, 58, 18, 40, NULL, NULL),
(393, 36, 59, 62, NULL, NULL, NULL),
(394, 50, 31, NULL, NULL, NULL, NULL),
(395, 50, NULL, NULL, NULL, NULL, NULL),
(396, 36, 29, 39, 42, 33, 37),
(397, 6, 19, 14, NULL, NULL, NULL),
(398, 21, 4, NULL, NULL, NULL, NULL),
(399, 12, 6, 56, NULL, NULL, NULL),
(400, 14, 32, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wskaznik`
--

CREATE TABLE `wskaznik` (
  `IdKandydata` int(11) NOT NULL,
  `WskaznikPref1` float DEFAULT NULL,
  `WskaznikPref2` float DEFAULT NULL,
  `WskaznikPref3` float DEFAULT NULL,
  `WskaznikPref4` float DEFAULT NULL,
  `WskaznikPref5` float DEFAULT NULL,
  `WskaznikPref6` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wynikimatur`
--

CREATE TABLE `wynikimatur` (
  `IdKandydata` int(11) NOT NULL,
  `PolskiPodstawa` int(11) NOT NULL DEFAULT 0,
  `MatematykaPodstawa` int(11) NOT NULL DEFAULT 0,
  `MatematykaRozszerzenie` int(11) DEFAULT 0,
  `JezykObcyNowozytnyPodstawa` int(11) NOT NULL DEFAULT 0,
  `JezykObcyNowozytnyRozszerzenie` int(11) DEFAULT 0,
  `FizykaRozszerzenie` int(11) DEFAULT 0,
  `ChemiaRozszezrenie` int(11) DEFAULT 0,
  `BiologiaRozszezrenie` int(11) DEFAULT 0,
  `InformatykaRozszerzenie` int(11) DEFAULT 0,
  `GeografiaRozszerzenie` int(11) DEFAULT 0,
  `EgzaminZRysunku` int(11) DEFAULT 0
) ;

--
-- Zrzut danych tabeli `wynikimatur`
--

INSERT INTO `wynikimatur` (`IdKandydata`, `PolskiPodstawa`, `MatematykaPodstawa`, `MatematykaRozszerzenie`, `JezykObcyNowozytnyPodstawa`, `JezykObcyNowozytnyRozszerzenie`, `FizykaRozszerzenie`, `ChemiaRozszezrenie`, `BiologiaRozszezrenie`, `InformatykaRozszerzenie`, `GeografiaRozszerzenie`, `EgzaminZRysunku`) VALUES
(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 77, 47, 0, 69, 0, 0, 0, 36, 47, 0, 0),
(3, 84, 62, 0, 82, 0, 44, 0, 93, 41, 0, 0),
(4, 94, 72, 0, 37, 17, 0, 69, 0, 0, 59, 0),
(5, 67, 57, 39, 66, 75, 74, 24, 0, 56, 36, 0),
(6, 13, 69, 0, 60, 0, 0, 46, 41, 42, 0, 0),
(7, 62, 92, 75, 84, 27, 35, 22, 10, 0, 93, 0),
(8, 45, 49, 0, 50, 48, 0, 59, 0, 32, 52, 0),
(9, 58, 75, 0, 83, 7, 0, 75, 0, 54, 10, 0),
(10, 55, 93, 0, 94, 0, 0, 0, 66, 71, 77, 0),
(11, 66, 63, 0, 50, 0, 30, 0, 0, 11, 56, 0),
(12, 99, 86, 95, 49, 0, 29, 25, 22, 0, 84, 0),
(13, 35, 43, 51, 97, 5, 34, 94, 77, 0, 0, 0),
(14, 7, 88, 51, 74, 8, 92, 0, 50, 0, 0, 0),
(15, 66, 73, 0, 39, 96, 0, 0, 0, 0, 15, 0),
(16, 85, 73, 9, 69, 0, 7, 0, 50, 0, 2, 0),
(17, 81, 82, 0, 63, 0, 0, 95, 0, 0, 29, 0),
(18, 43, 41, 20, 62, 0, 33, 0, 0, 41, 24, 0),
(19, 75, 67, 87, 51, 0, 10, 2, 49, 0, 3, 0),
(20, 86, 35, 0, 39, 75, 34, 77, 0, 2, 0, 0),
(21, 46, 100, 8, 30, 55, 0, 2, 0, 75, 87, 0),
(22, 57, 76, 12, 93, 30, 52, 18, 0, 35, 98, 0),
(23, 85, 94, 97, 38, 0, 0, 0, 73, 35, 52, 0),
(24, 98, 55, 26, 32, 0, 90, 0, 0, 90, 0, 0),
(25, 47, 62, 0, 64, 0, 5, 40, 6, 44, 58, 0),
(26, 45, 43, 9, 73, 0, 0, 0, 0, 4, 86, 0),
(27, 27, 42, 0, 96, 0, 0, 62, 33, 41, 0, 0),
(28, 58, 97, 0, 73, 23, 0, 0, 0, 17, 63, 0),
(29, 16, 95, 0, 70, 97, 3, 80, 88, 29, 0, 0),
(30, 74, 50, 62, 90, 6, 57, 0, 0, 0, 84, 0),
(31, 39, 37, 78, 88, 0, 0, 22, 0, 52, 20, 0),
(32, 37, 49, 25, 40, 0, 0, 0, 0, 53, 94, 0),
(33, 78, 42, 3, 32, 40, 20, 0, 0, 36, 0, 0),
(34, 41, 85, 66, 58, 91, 38, 0, 0, 0, 0, 0),
(35, 96, 79, 37, 84, 0, 0, 0, 74, 0, 30, 0),
(36, 44, 56, 7, 46, 0, 0, 0, 0, 96, 0, 0),
(37, 62, 93, 0, 42, 0, 0, 0, 0, 40, 0, 0),
(38, 31, 80, 0, 67, 1, 0, 77, 0, 38, 93, 0),
(39, 96, 69, 77, 99, 0, 83, 52, 0, 0, 0, 0),
(40, 86, 39, 16, 42, 49, 78, 42, 0, 0, 0, 0),
(41, 60, 60, 0, 57, 0, 0, 75, 26, 0, 20, 0),
(42, 48, 38, 44, 24, 0, 0, 0, 0, 0, 0, 0),
(43, 31, 33, 3, 79, 15, 61, 29, 91, 96, 69, 0),
(44, 99, 99, 0, 31, 0, 0, 39, 0, 0, 0, 0),
(45, 97, 73, 33, 37, 0, 0, 0, 66, 79, 0, 0),
(46, 97, 39, 0, 84, 77, 0, 0, 0, 0, 0, 0),
(47, 78, 75, 0, 37, 0, 0, 60, 21, 88, 0, 0),
(48, 49, 45, 93, 81, 0, 0, 86, 69, 40, 45, 0),
(49, 66, 49, 95, 68, 11, 47, 0, 0, 0, 16, 0),
(50, 68, 85, 23, 42, 73, 0, 30, 65, 32, 64, 0),
(51, 48, 30, 44, 80, 0, 0, 33, 0, 0, 0, 0),
(52, 92, 38, 0, 33, 57, 0, 0, 0, 38, 0, 0),
(53, 56, 80, 0, 50, 76, 0, 0, 67, 81, 4, 0),
(54, 35, 38, 68, 58, 0, 0, 77, 0, 79, 98, 0),
(55, 46, 39, 0, 53, 0, 57, 12, 17, 81, 23, 0),
(56, 52, 82, 0, 55, 0, 0, 97, 3, 98, 0, 0),
(57, 90, 63, 22, 54, 18, 0, 0, 0, 0, 83, 0),
(58, 35, 66, 0, 40, 0, 27, 33, 97, 0, 0, 0),
(59, 33, 70, 0, 14, 0, 75, 0, 89, 0, 0, 0),
(60, 52, 95, 0, 88, 0, 0, 0, 0, 0, 0, 0),
(61, 80, 92, 0, 58, 86, 17, 0, 19, 44, 0, 0),
(62, 44, 93, 97, 52, 50, 87, 94, 100, 0, 0, 0),
(63, 57, 97, 0, 78, 18, 0, 0, 58, 0, 0, 0),
(64, 53, 33, 99, 27, 0, 96, 0, 0, 91, 87, 0),
(65, 58, 67, 0, 13, 3, 0, 0, 52, 0, 0, 0),
(66, 39, 36, 66, 57, 0, 0, 0, 0, 0, 23, 0),
(67, 36, 78, 0, 45, 89, 96, 0, 0, 0, 0, 0),
(68, 56, 70, 18, 11, 0, 1, 0, 0, 23, 79, 0),
(69, 47, 76, 0, 54, 52, 72, 0, 0, 0, 0, 0),
(70, 83, 77, 44, 98, 57, 0, 17, 0, 0, 0, 0),
(71, 87, 78, 0, 70, 63, 0, 11, 0, 0, 0, 0),
(72, 99, 32, 0, 66, 0, 0, 50, 95, 0, 0, 0),
(73, 46, 36, 47, 79, 66, 0, 0, 0, 27, 0, 0),
(74, 93, 79, 0, 48, 84, 62, 0, 0, 98, 90, 0),
(75, 66, 88, 73, 38, 86, 84, 18, 0, 0, 56, 0),
(76, 91, 49, 29, 47, 0, 0, 0, 0, 0, 69, 0),
(77, 68, 47, 0, 76, 0, 95, 0, 75, 0, 0, 0),
(78, 70, 52, 15, 93, 0, 90, 0, 87, 0, 94, 0),
(79, 18, 62, 0, 39, 0, 77, 0, 69, 28, 3, 0),
(80, 30, 72, 0, 61, 52, 70, 60, 0, 96, 0, 0),
(81, 75, 76, 0, 69, 98, 0, 0, 28, 0, 36, 0),
(82, 82, 65, 82, 94, 45, 0, 0, 0, 0, 99, 0),
(83, 45, 52, 0, 94, 3, 0, 0, 0, 0, 0, 0),
(84, 81, 49, 28, 81, 0, 98, 75, 0, 84, 0, 0),
(85, 58, 34, 0, 61, 34, 0, 0, 32, 13, 89, 0),
(86, 59, 82, 54, 57, 0, 61, 82, 22, 0, 0, 0),
(87, 66, 76, 34, 94, 27, 15, 0, 0, 69, 6, 0),
(88, 68, 98, 0, 75, 9, 25, 99, 0, 0, 95, 0),
(89, 68, 92, 90, 92, 4, 0, 82, 15, 55, 52, 0),
(90, 80, 70, 0, 56, 72, 49, 0, 62, 0, 0, 0),
(91, 37, 48, 0, 97, 4, 0, 0, 0, 0, 76, 0),
(92, 91, 63, 10, 31, 78, 0, 65, 0, 0, 11, 0),
(93, 37, 64, 0, 55, 0, 0, 0, 0, 2, 0, 0),
(94, 92, 69, 97, 15, 0, 48, 0, 0, 0, 26, 0),
(95, 86, 69, 21, 60, 0, 0, 23, 90, 29, 2, 0),
(96, 50, 87, 0, 33, 0, 53, 77, 0, 43, 93, 0),
(97, 92, 85, 97, 34, 0, 0, 25, 70, 0, 0, 0),
(98, 45, 95, 0, 83, 47, 0, 91, 0, 0, 0, 0),
(99, 47, 82, 0, 87, 65, 95, 0, 0, 0, 3, 0),
(100, 70, 32, 0, 63, 45, 58, 6, 0, 36, 5, 0),
(101, 60, 99, 0, 92, 44, 0, 0, 0, 90, 0, 0),
(102, 73, 73, 0, 36, 0, 49, 29, 0, 68, 38, 0),
(103, 72, 53, 94, 85, 0, 71, 0, 0, 0, 25, 0),
(104, 35, 85, 0, 45, 87, 0, 12, 0, 1, 0, 0),
(105, 81, 80, 57, 96, 0, 0, 2, 0, 22, 0, 0),
(106, 45, 35, 6, 66, 49, 79, 0, 65, 80, 88, 0),
(107, 47, 63, 0, 91, 0, 0, 0, 79, 7, 0, 0),
(108, 91, 98, 38, 75, 0, 0, 0, 41, 74, 70, 0),
(109, 81, 48, 0, 55, 75, 0, 0, 0, 0, 64, 0),
(110, 47, 10, 0, 67, 33, 0, 0, 0, 0, 39, 0),
(111, 98, 60, 43, 53, 0, 0, 0, 22, 52, 97, 0),
(112, 38, 59, 0, 86, 43, 65, 0, 14, 0, 0, 0),
(113, 31, 74, 30, 89, 12, 61, 57, 36, 14, 0, 0),
(114, 69, 48, 46, 88, 34, 22, 24, 0, 49, 72, 0),
(115, 82, 79, 0, 73, 0, 3, 0, 0, 0, 0, 0),
(116, 91, 38, 99, 45, 0, 80, 0, 50, 55, 0, 0),
(117, 55, 86, 0, 98, 0, 20, 0, 0, 100, 17, 0),
(118, 61, 60, 0, 42, 32, 0, 0, 71, 9, 0, 0),
(119, 84, 95, 0, 81, 15, 0, 0, 12, 76, 83, 0),
(120, 90, 67, 0, 53, 0, 17, 0, 0, 0, 57, 0),
(121, 99, 86, 0, 50, 0, 48, 74, 0, 29, 94, 0),
(122, 95, 33, 13, 69, 0, 52, 41, 0, 0, 0, 0),
(123, 18, 9, 0, 56, 0, 0, 18, 0, 94, 0, 0),
(124, 71, 75, 0, 2, 0, 100, 85, 12, 21, 0, 0),
(125, 31, 53, 0, 33, 80, 80, 0, 76, 0, 68, 0),
(126, 85, 68, 42, 38, 0, 52, 0, 19, 11, 0, 0),
(127, 72, 59, 0, 66, 0, 0, 0, 0, 37, 44, 0),
(128, 32, 52, 0, 75, 0, 0, 61, 83, 0, 0, 0),
(129, 95, 31, 63, 33, 0, 7, 59, 0, 0, 49, 0),
(130, 41, 34, 52, 78, 76, 0, 93, 94, 53, 0, 0),
(131, 13, 98, 48, 5, 0, 11, 5, 0, 16, 11, 0),
(132, 97, 77, 0, 45, 0, 0, 0, 67, 0, 0, 0),
(133, 84, 63, 59, 37, 38, 86, 0, 40, 0, 0, 0),
(134, 99, 56, 83, 38, 0, 3, 24, 38, 0, 0, 0),
(135, 28, 59, 57, 35, 23, 0, 0, 26, 0, 35, 0),
(136, 97, 78, 51, 51, 8, 85, 52, 0, 31, 0, 0),
(137, 64, 61, 31, 39, 74, 35, 0, 0, 81, 94, 0),
(138, 97, 88, 72, 42, 22, 0, 29, 0, 0, 61, 0),
(139, 90, 50, 0, 87, 23, 0, 11, 0, 95, 5, 0),
(140, 73, 32, 0, 1, 46, 46, 69, 90, 0, 88, 0),
(141, 82, 75, 67, 61, 66, 0, 0, 30, 0, 42, 0),
(142, 31, 50, 31, 52, 7, 48, 46, 52, 0, 65, 0),
(143, 44, 37, 64, 98, 0, 0, 51, 81, 92, 0, 0),
(144, 99, 67, 96, 32, 0, 31, 85, 0, 0, 0, 0),
(145, 48, 73, 11, 51, 45, 0, 21, 0, 0, 14, 0),
(146, 88, 54, 0, 40, 0, 0, 58, 0, 66, 59, 0),
(147, 46, 65, 62, 56, 0, 0, 0, 0, 66, 0, 0),
(148, 89, 38, 26, 64, 0, 34, 0, 0, 0, 0, 0),
(149, 48, 67, 32, 89, 50, 0, 91, 48, 27, 0, 0),
(150, 82, 90, 70, 68, 44, 0, 48, 0, 81, 37, 0),
(151, 32, 45, 60, 91, 0, 77, 16, 0, 0, 0, 0),
(152, 78, 83, 85, 47, 100, 31, 98, 70, 0, 46, 0),
(153, 99, 35, 0, 67, 0, 29, 9, 0, 0, 0, 0),
(154, 80, 83, 43, 23, 0, 0, 0, 66, 51, 8, 0),
(155, 94, 79, 0, 2, 0, 45, 12, 24, 0, 46, 0),
(156, 77, 45, 0, 42, 0, 72, 0, 0, 0, 0, 0),
(157, 40, 21, 0, 69, 0, 0, 0, 50, 5, 35, 0),
(158, 86, 79, 0, 34, 48, 0, 9, 0, 16, 30, 0),
(159, 55, 61, 16, 45, 11, 0, 45, 0, 91, 0, 0),
(160, 72, 37, 17, 67, 0, 54, 0, 0, 0, 0, 0),
(161, 41, 83, 0, 97, 0, 0, 0, 0, 32, 0, 0),
(162, 75, 51, 0, 95, 24, 64, 0, 10, 42, 38, 0),
(163, 69, 91, 0, 59, 0, 53, 0, 0, 12, 0, 0),
(164, 21, 99, 0, 31, 40, 0, 48, 9, 0, 31, 0),
(165, 74, 100, 0, 56, 84, 0, 65, 74, 0, 0, 0),
(166, 54, 76, 99, 48, 0, 98, 0, 71, 92, 0, 0),
(167, 43, 52, 0, 7, 57, 0, 0, 0, 0, 0, 0),
(168, 34, 65, 39, 100, 49, 84, 0, 37, 0, 90, 0),
(169, 64, 19, 21, 53, 98, 0, 61, 64, 24, 63, 0),
(170, 97, 99, 65, 36, 64, 25, 0, 0, 43, 0, 0),
(171, 31, 55, 0, 83, 0, 25, 33, 96, 0, 0, 0),
(172, 65, 64, 0, 87, 0, 76, 38, 0, 75, 0, 0),
(173, 58, 82, 83, 61, 0, 5, 77, 18, 6, 0, 0),
(174, 37, 48, 0, 42, 4, 46, 27, 0, 0, 0, 0),
(175, 80, 66, 0, 40, 0, 96, 69, 50, 0, 0, 0),
(176, 39, 84, 0, 57, 0, 0, 0, 65, 90, 62, 0),
(177, 61, 50, 17, 58, 60, 92, 11, 76, 35, 48, 0),
(178, 51, 66, 24, 44, 63, 85, 41, 0, 0, 0, 0),
(179, 68, 13, 0, 49, 0, 10, 71, 62, 0, 37, 0),
(180, 43, 85, 77, 48, 0, 0, 26, 46, 39, 0, 0),
(181, 30, 69, 79, 70, 0, 54, 0, 0, 44, 0, 0),
(182, 73, 69, 21, 34, 0, 0, 28, 0, 4, 70, 0),
(183, 59, 69, 62, 95, 0, 0, 0, 26, 46, 51, 0),
(184, 39, 54, 0, 47, 43, 0, 0, 91, 99, 0, 0),
(185, 82, 38, 66, 62, 0, 0, 66, 50, 12, 45, 0),
(186, 43, 58, 43, 30, 0, 0, 0, 0, 75, 0, 0),
(187, 22, 97, 0, 46, 11, 0, 59, 42, 13, 0, 0),
(188, 73, 59, 92, 66, 84, 0, 94, 95, 81, 65, 0),
(189, 68, 37, 78, 99, 0, 9, 42, 0, 69, 0, 0),
(190, 59, 73, 82, 31, 0, 0, 21, 88, 0, 87, 0),
(191, 98, 56, 0, 53, 77, 9, 69, 0, 0, 0, 0),
(192, 81, 87, 8, 90, 0, 35, 0, 95, 28, 0, 0),
(193, 74, 65, 0, 80, 31, 87, 70, 53, 55, 0, 0),
(194, 88, 92, 66, 58, 83, 0, 28, 97, 95, 93, 0),
(195, 80, 26, 51, 88, 24, 90, 99, 78, 0, 87, 0),
(196, 58, 84, 31, 97, 0, 0, 0, 0, 76, 89, 0),
(197, 62, 24, 0, 62, 0, 0, 0, 0, 0, 0, 0),
(198, 48, 65, 26, 36, 22, 0, 33, 0, 64, 24, 0),
(199, 100, 42, 74, 53, 8, 82, 81, 0, 54, 0, 0),
(200, 93, 39, 0, 51, 44, 0, 87, 73, 0, 0, 0),
(201, 66, 88, 70, 30, 17, 0, 99, 0, 9, 0, 0),
(202, 89, 46, 0, 83, 0, 2, 52, 0, 0, 25, 0),
(203, 90, 55, 50, 40, 0, 0, 54, 43, 0, 30, 0),
(204, 88, 83, 66, 94, 34, 57, 66, 0, 0, 0, 0),
(205, 46, 34, 57, 96, 0, 0, 95, 0, 53, 0, 0),
(206, 100, 47, 27, 68, 17, 86, 73, 19, 0, 2, 0),
(207, 75, 2, 9, 51, 12, 43, 0, 0, 46, 26, 0),
(208, 61, 39, 38, 69, 0, 0, 58, 0, 0, 80, 0),
(209, 38, 71, 0, 35, 0, 0, 0, 0, 13, 0, 0),
(210, 75, 93, 99, 64, 0, 0, 23, 13, 94, 32, 0),
(211, 98, 98, 95, 77, 0, 83, 0, 0, 13, 66, 0),
(212, 70, 83, 53, 54, 2, 0, 85, 21, 0, 0, 0),
(213, 42, 31, 0, 74, 20, 0, 0, 42, 0, 0, 0),
(214, 39, 96, 20, 80, 0, 0, 0, 21, 0, 0, 0),
(215, 96, 47, 92, 38, 51, 32, 58, 0, 46, 0, 0),
(216, 67, 86, 31, 61, 88, 0, 36, 71, 0, 30, 0),
(217, 37, 33, 4, 90, 0, 78, 64, 0, 0, 0, 0),
(218, 2, 56, 98, 64, 11, 0, 0, 0, 77, 85, 0),
(219, 33, 91, 46, 35, 0, 0, 0, 97, 0, 0, 0),
(220, 10, 50, 0, 53, 70, 0, 0, 1, 50, 0, 0),
(221, 56, 79, 0, 95, 0, 81, 94, 0, 17, 95, 0),
(222, 72, 91, 82, 51, 0, 68, 55, 37, 76, 0, 0),
(223, 58, 77, 27, 46, 14, 28, 99, 0, 89, 0, 0),
(224, 79, 42, 0, 32, 0, 26, 0, 0, 0, 100, 0),
(225, 54, 99, 71, 76, 57, 0, 0, 73, 78, 0, 0),
(226, 82, 100, 27, 49, 57, 0, 0, 0, 0, 82, 0),
(227, 66, 63, 85, 64, 0, 48, 53, 0, 78, 23, 0),
(228, 88, 84, 0, 46, 0, 0, 0, 0, 81, 23, 0),
(229, 58, 56, 54, 51, 0, 0, 0, 14, 0, 0, 0),
(230, 48, 87, 14, 43, 0, 0, 0, 0, 52, 0, 0),
(231, 15, 60, 0, 47, 73, 0, 0, 0, 0, 0, 0),
(232, 17, 75, 15, 92, 0, 16, 0, 85, 0, 55, 0),
(233, 51, 94, 0, 78, 72, 0, 0, 45, 0, 33, 0),
(234, 46, 95, 85, 71, 0, 91, 88, 56, 0, 80, 0),
(235, 69, 85, 0, 98, 0, 95, 0, 22, 70, 0, 0),
(236, 85, 80, 0, 66, 0, 0, 54, 0, 90, 0, 0),
(237, 62, 70, 0, 77, 14, 78, 0, 86, 98, 0, 0),
(238, 44, 32, 51, 73, 20, 0, 0, 98, 48, 28, 0),
(239, 72, 34, 93, 76, 71, 15, 0, 0, 0, 59, 0),
(240, 96, 60, 0, 75, 0, 0, 0, 0, 0, 22, 0),
(241, 94, 36, 0, 71, 0, 0, 0, 5, 0, 0, 0),
(242, 36, 62, 52, 87, 47, 34, 14, 0, 0, 85, 0),
(243, 99, 81, 0, 97, 59, 0, 65, 26, 49, 4, 0),
(244, 99, 58, 56, 86, 0, 26, 99, 50, 34, 0, 0),
(245, 87, 53, 0, 91, 34, 0, 48, 5, 59, 0, 0),
(246, 85, 68, 0, 47, 9, 0, 75, 86, 38, 48, 0),
(247, 28, 92, 0, 38, 0, 0, 0, 0, 0, 56, 0),
(248, 71, 87, 9, 46, 0, 53, 55, 0, 77, 32, 0),
(249, 80, 78, 0, 69, 26, 92, 0, 0, 39, 0, 0),
(250, 99, 36, 30, 93, 62, 8, 0, 14, 28, 0, 0),
(251, 83, 99, 0, 84, 54, 35, 66, 0, 84, 0, 0),
(252, 90, 76, 69, 91, 0, 0, 0, 95, 63, 27, 0),
(253, 62, 30, 37, 32, 0, 37, 53, 0, 0, 28, 0),
(254, 47, 73, 0, 64, 33, 41, 0, 54, 23, 0, 0),
(255, 44, 78, 0, 41, 32, 33, 0, 0, 40, 66, 0),
(256, 76, 87, 0, 18, 62, 0, 74, 80, 6, 54, 0),
(257, 48, 64, 0, 82, 59, 0, 0, 0, 0, 0, 0),
(258, 39, 74, 0, 90, 51, 87, 3, 77, 63, 29, 0),
(259, 8, 83, 0, 83, 15, 27, 0, 87, 0, 30, 0),
(260, 92, 53, 0, 59, 11, 84, 0, 0, 9, 0, 0),
(261, 55, 33, 0, 76, 0, 0, 46, 8, 39, 37, 0),
(262, 34, 66, 0, 47, 0, 0, 0, 56, 0, 0, 0),
(263, 85, 39, 83, 63, 0, 13, 59, 97, 0, 0, 0),
(264, 31, 92, 71, 73, 0, 0, 85, 99, 0, 0, 0),
(265, 40, 87, 0, 40, 0, 0, 69, 0, 22, 0, 0),
(266, 67, 37, 27, 30, 0, 0, 0, 25, 0, 0, 0),
(267, 97, 49, 60, 56, 0, 0, 0, 87, 0, 60, 0),
(268, 79, 80, 0, 48, 0, 89, 6, 0, 23, 0, 0),
(269, 37, 80, 59, 78, 0, 0, 7, 0, 0, 0, 0),
(270, 55, 85, 0, 72, 0, 0, 0, 54, 0, 0, 0),
(271, 46, 87, 0, 72, 34, 17, 0, 0, 80, 16, 0),
(272, 20, 44, 85, 69, 8, 94, 0, 0, 0, 0, 0),
(273, 53, 57, 0, 47, 0, 0, 0, 0, 0, 28, 0),
(274, 47, 92, 39, 75, 0, 87, 33, 43, 60, 29, 0),
(275, 81, 71, 95, 68, 11, 64, 6, 34, 0, 0, 0),
(276, 79, 91, 92, 55, 21, 73, 97, 95, 35, 26, 0),
(277, 53, 43, 0, 66, 0, 0, 95, 56, 0, 0, 0),
(278, 37, 98, 92, 73, 0, 0, 70, 38, 0, 94, 0),
(279, 66, 56, 38, 55, 0, 0, 0, 36, 0, 0, 0),
(280, 10, 49, 60, 100, 0, 0, 0, 0, 0, 0, 0),
(281, 67, 86, 0, 65, 0, 0, 0, 0, 0, 0, 0),
(282, 61, 87, 0, 61, 0, 12, 0, 55, 81, 30, 0),
(283, 74, 80, 28, 99, 0, 9, 49, 55, 86, 10, 0),
(284, 63, 44, 0, 79, 0, 0, 34, 0, 81, 0, 0),
(285, 67, 93, 78, 44, 0, 19, 13, 76, 0, 0, 0),
(286, 42, 98, 0, 94, 85, 94, 24, 0, 0, 0, 0),
(287, 12, 67, 84, 62, 87, 0, 67, 1, 0, 0, 0),
(288, 46, 44, 0, 80, 74, 0, 20, 33, 0, 50, 0),
(289, 82, 54, 86, 81, 67, 8, 42, 0, 0, 0, 0),
(290, 28, 57, 0, 74, 46, 84, 0, 43, 0, 64, 0),
(291, 54, 70, 0, 72, 0, 0, 24, 0, 38, 45, 0),
(292, 43, 42, 14, 73, 0, 0, 28, 63, 0, 0, 0),
(293, 32, 51, 0, 70, 0, 55, 68, 87, 0, 0, 0),
(294, 46, 35, 78, 54, 0, 41, 76, 84, 26, 15, 0),
(295, 76, 45, 0, 37, 0, 15, 88, 34, 95, 0, 0),
(296, 39, 86, 71, 33, 2, 0, 36, 87, 0, 0, 0),
(297, 58, 37, 0, 50, 1, 0, 8, 59, 0, 0, 0),
(298, 34, 48, 0, 59, 7, 96, 0, 86, 34, 79, 0),
(299, 54, 70, 0, 81, 93, 18, 0, 39, 20, 0, 0),
(300, 74, 44, 37, 34, 41, 57, 3, 0, 41, 65, 0),
(301, 28, 67, 0, 57, 92, 86, 8, 0, 27, 100, 0),
(302, 45, 75, 0, 55, 82, 0, 12, 50, 74, 49, 0),
(303, 78, 47, 0, 65, 0, 28, 0, 0, 23, 78, 0),
(304, 55, 73, 0, 69, 0, 34, 0, 0, 10, 0, 0),
(305, 46, 52, 25, 89, 22, 0, 67, 91, 0, 15, 0),
(306, 49, 50, 0, 37, 0, 87, 34, 59, 0, 0, 0),
(307, 40, 33, 50, 66, 0, 76, 0, 62, 80, 0, 0),
(308, 52, 91, 0, 86, 0, 93, 0, 0, 0, 82, 0),
(309, 41, 44, 48, 53, 25, 0, 0, 87, 0, 22, 0),
(310, 55, 81, 0, 77, 0, 71, 25, 36, 0, 62, 0),
(311, 91, 99, 7, 85, 0, 0, 4, 0, 76, 0, 0),
(312, 63, 36, 0, 61, 91, 0, 0, 94, 35, 0, 0),
(313, 47, 58, 18, 59, 66, 3, 65, 96, 24, 52, 0),
(314, 93, 100, 11, 86, 96, 0, 0, 28, 0, 58, 0),
(315, 72, 51, 40, 41, 0, 0, 98, 0, 89, 0, 0),
(316, 87, 64, 57, 89, 0, 0, 61, 0, 85, 0, 0),
(317, 73, 99, 45, 38, 41, 0, 36, 0, 70, 0, 0),
(318, 89, 89, 0, 54, 0, 32, 83, 0, 66, 96, 0),
(319, 92, 88, 0, 92, 0, 66, 0, 0, 0, 0, 0),
(320, 0, 90, 16, 59, 0, 0, 0, 0, 0, 72, 0),
(321, 52, 49, 95, 54, 0, 68, 78, 0, 0, 62, 0),
(322, 16, 83, 0, 66, 90, 32, 10, 0, 63, 53, 0),
(323, 48, 44, 0, 64, 64, 19, 0, 95, 0, 0, 0),
(324, 93, 65, 62, 16, 0, 27, 0, 88, 0, 0, 0),
(325, 34, 42, 0, 79, 45, 1, 0, 0, 0, 0, 0),
(326, 42, 98, 0, 98, 59, 0, 0, 22, 0, 19, 0),
(327, 48, 78, 0, 88, 34, 48, 3, 0, 0, 0, 0),
(328, 66, 84, 0, 35, 0, 0, 85, 5, 92, 39, 0),
(329, 96, 67, 40, 75, 77, 4, 91, 81, 86, 33, 0),
(330, 54, 80, 64, 67, 0, 0, 0, 72, 98, 76, 0),
(331, 89, 49, 0, 67, 59, 0, 0, 0, 0, 0, 0),
(332, 75, 58, 80, 94, 0, 82, 0, 0, 35, 19, 0),
(333, 32, 47, 19, 65, 0, 0, 79, 0, 0, 11, 0),
(334, 73, 77, 30, 42, 8, 75, 51, 4, 0, 0, 0),
(335, 63, 46, 90, 100, 15, 0, 75, 0, 97, 0, 0),
(336, 46, 68, 0, 49, 0, 49, 0, 6, 19, 88, 0),
(337, 79, 72, 21, 32, 0, 7, 0, 0, 86, 0, 0),
(338, 48, 48, 29, 65, 3, 90, 0, 61, 70, 80, 0),
(339, 42, 95, 45, 40, 0, 0, 0, 0, 70, 0, 0),
(340, 33, 61, 0, 36, 43, 0, 7, 0, 0, 68, 0),
(341, 83, 69, 0, 94, 0, 0, 0, 72, 0, 0, 0),
(342, 100, 86, 0, 48, 76, 15, 0, 52, 0, 9, 0),
(343, 45, 89, 0, 33, 0, 0, 42, 61, 0, 89, 0),
(344, 32, 76, 62, 50, 0, 0, 94, 65, 32, 85, 0),
(345, 64, 52, 0, 73, 94, 0, 70, 49, 0, 0, 0),
(346, 71, 84, 2, 44, 59, 0, 0, 34, 74, 15, 0),
(347, 80, 90, 0, 87, 27, 79, 0, 60, 43, 0, 0),
(348, 75, 60, 58, 58, 50, 23, 84, 94, 7, 35, 0),
(349, 45, 58, 48, 71, 0, 94, 0, 34, 0, 53, 0),
(350, 72, 11, 0, 82, 16, 63, 60, 67, 74, 41, 0),
(351, 50, 80, 0, 32, 0, 0, 0, 0, 0, 3, 0),
(352, 14, 91, 0, 62, 65, 50, 62, 26, 0, 0, 0),
(353, 82, 81, 0, 34, 42, 58, 20, 0, 95, 18, 0),
(354, 10, 98, 0, 8, 68, 0, 0, 70, 97, 85, 0),
(355, 84, 90, 0, 14, 63, 0, 0, 0, 0, 79, 0),
(356, 73, 85, 0, 49, 0, 0, 59, 0, 58, 78, 0),
(357, 95, 65, 98, 35, 92, 62, 0, 40, 41, 0, 0),
(358, 93, 63, 11, 90, 0, 0, 59, 0, 0, 84, 0),
(359, 32, 61, 0, 36, 42, 37, 0, 0, 43, 0, 0),
(360, 72, 65, 0, 38, 25, 0, 0, 31, 0, 18, 0),
(361, 100, 94, 86, 67, 0, 11, 96, 0, 43, 0, 0),
(362, 85, 39, 0, 54, 0, 0, 0, 55, 0, 59, 0),
(363, 79, 28, 60, 86, 22, 0, 89, 0, 0, 0, 0),
(364, 99, 94, 2, 72, 0, 63, 0, 0, 0, 96, 0),
(365, 45, 88, 86, 79, 8, 83, 0, 58, 23, 0, 0),
(366, 42, 49, 0, 79, 76, 0, 70, 67, 63, 40, 0),
(367, 55, 42, 42, 96, 0, 13, 0, 70, 64, 74, 0),
(368, 72, 70, 0, 57, 0, 91, 18, 18, 35, 0, 0),
(369, 39, 46, 96, 45, 0, 0, 0, 0, 13, 25, 0),
(370, 49, 91, 0, 32, 9, 0, 0, 6, 0, 35, 0),
(371, 43, 57, 0, 67, 95, 90, 0, 33, 0, 93, 0),
(372, 63, 49, 0, 88, 0, 9, 0, 18, 0, 95, 0),
(373, 92, 60, 0, 42, 0, 0, 0, 38, 0, 0, 0),
(374, 86, 86, 0, 33, 59, 0, 0, 86, 0, 40, 0),
(375, 46, 80, 53, 67, 0, 0, 0, 0, 74, 0, 0),
(376, 60, 57, 0, 65, 0, 75, 64, 33, 47, 0, 0),
(377, 96, 79, 0, 95, 0, 0, 0, 0, 0, 0, 0),
(378, 46, 58, 0, 75, 0, 83, 76, 94, 49, 0, 0),
(379, 86, 91, 0, 48, 0, 0, 0, 58, 27, 0, 0),
(380, 77, 51, 0, 78, 0, 0, 81, 0, 0, 41, 0),
(381, 78, 83, 32, 41, 60, 59, 0, 73, 0, 0, 0),
(382, 55, 28, 0, 41, 0, 35, 42, 0, 36, 86, 0),
(383, 99, 63, 90, 38, 17, 6, 65, 81, 85, 0, 0),
(384, 61, 78, 69, 33, 72, 39, 0, 25, 67, 0, 0),
(385, 100, 98, 63, 68, 0, 0, 18, 0, 18, 0, 0),
(386, 46, 85, 0, 89, 34, 95, 0, 70, 73, 11, 0),
(387, 99, 30, 76, 51, 62, 0, 14, 29, 0, 21, 0),
(388, 37, 39, 48, 77, 0, 0, 97, 0, 24, 44, 0),
(389, 66, 65, 0, 32, 0, 73, 48, 0, 78, 0, 0),
(390, 96, 85, 71, 74, 94, 0, 0, 17, 0, 0, 0),
(391, 14, 70, 72, 52, 0, 47, 17, 0, 0, 0, 0),
(392, 80, 68, 44, 94, 6, 0, 0, 0, 4, 69, 0),
(393, 73, 59, 0, 55, 0, 47, 0, 68, 0, 45, 0),
(394, 70, 68, 11, 41, 64, 0, 0, 0, 97, 0, 0),
(395, 56, 52, 43, 83, 40, 0, 76, 0, 0, 93, 0),
(396, 69, 74, 79, 98, 0, 0, 16, 11, 4, 63, 0),
(397, 99, 49, 65, 60, 0, 96, 0, 51, 52, 85, 0),
(398, 53, 72, 25, 12, 20, 0, 25, 0, 36, 50, 0),
(399, 50, 7, 0, 82, 0, 55, 91, 29, 0, 0, 0),
(400, 34, 85, 0, 55, 68, 26, 87, 0, 0, 0, 0);

--
-- Wyzwalacze `wynikimatur`
--
DELIMITER $$
CREATE TRIGGER `CzyZdanaMatura` BEFORE UPDATE ON `wynikimatur` FOR EACH ROW BEGIN
        IF new.PolskiPodstawa<30 or new.MatematykaPodstawa<30 or new.JezykObcyNowozytnyPodstawa<30 THEN
            UPDATE kandydaci
            SET status = 'odrzucony'
            WHERE NrRejestracyjny = new.IdKandydata;
        end if ;
    end
$$
DELIMITER ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `boolwskaznikikierunki`
--
ALTER TABLE `boolwskaznikikierunki`
  ADD PRIMARY KEY (`IdKierunku`),
  ADD UNIQUE KEY `BoolWskaznikiKierunki_IdKierunku_uindex` (`IdKierunku`);

--
-- Indeksy dla tabeli `kandydaci`
--
ALTER TABLE `kandydaci`
  ADD PRIMARY KEY (`NrRejestracyjny`),
  ADD UNIQUE KEY `Kandydaci_PESEL_uindex` (`PESEL`),
  ADD UNIQUE KEY `Kandydaci_NrRejestracyjny_uindex` (`NrRejestracyjny`),
  ADD KEY `Ewidencja` (`Ewidencja`);

--
-- Indeksy dla tabeli `kierunki`
--
ALTER TABLE `kierunki`
  ADD PRIMARY KEY (`IdKierunku`),
  ADD UNIQUE KEY `Kierunki_IdKierunku_uindex` (`IdKierunku`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`IdPracownika`),
  ADD UNIQUE KEY `Pracownicy_IdPracownika_uindex` (`IdPracownika`);

--
-- Indeksy dla tabeli `preferencjekandydata`
--
ALTER TABLE `preferencjekandydata`
  ADD PRIMARY KEY (`IdKandydata`),
  ADD UNIQUE KEY `PreferencjeKandydata_IdKandydata_uindex` (`IdKandydata`),
  ADD KEY `Preferencja1` (`Preferencja1`),
  ADD KEY `Preferencja2` (`Preferencja2`),
  ADD KEY `Preferencja3` (`Preferencja3`),
  ADD KEY `Preferencja4` (`Preferencja4`),
  ADD KEY `Preferencja5` (`Preferencja5`),
  ADD KEY `Preferencja6` (`Preferencja6`);

--
-- Indeksy dla tabeli `wskaznik`
--
ALTER TABLE `wskaznik`
  ADD PRIMARY KEY (`IdKandydata`),
  ADD UNIQUE KEY `Wskaznik_IdKandydata_uindex` (`IdKandydata`);

--
-- Indeksy dla tabeli `wynikimatur`
--
ALTER TABLE `wynikimatur`
  ADD PRIMARY KEY (`IdKandydata`),
  ADD UNIQUE KEY `WynikiMatur_IdKandydata_uindex` (`IdKandydata`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `kandydaci`
--
ALTER TABLE `kandydaci`
  MODIFY `NrRejestracyjny` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=401;

--
-- AUTO_INCREMENT dla tabeli `kierunki`
--
ALTER TABLE `kierunki`
  MODIFY `IdKierunku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `IdPracownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `boolwskaznikikierunki`
--
ALTER TABLE `boolwskaznikikierunki`
  ADD CONSTRAINT `boolwskaznikikierunki_ibfk_1` FOREIGN KEY (`IdKierunku`) REFERENCES `kierunki` (`IdKierunku`),
  ADD CONSTRAINT `boolwskaznikikierunki_ibfk_2` FOREIGN KEY (`IdKierunku`) REFERENCES `kierunki` (`IdKierunku`),
  ADD CONSTRAINT `boolwskaznikikierunkifk1` FOREIGN KEY (`IdKierunku`) REFERENCES `kierunki` (`IdKierunku`);

--
-- Ograniczenia dla tabeli `kandydaci`
--
ALTER TABLE `kandydaci`
  ADD CONSTRAINT `kandydaci_ibfk_1` FOREIGN KEY (`Ewidencja`) REFERENCES `pracownicy` (`IdPracownika`);

--
-- Ograniczenia dla tabeli `kierunki`
--
ALTER TABLE `kierunki`
  ADD CONSTRAINT `kierunkifk1` FOREIGN KEY (`IdKierunku`) REFERENCES `boolwskaznikikierunki` (`IdKierunku`);

--
-- Ograniczenia dla tabeli `preferencjekandydata`
--
ALTER TABLE `preferencjekandydata`
  ADD CONSTRAINT `preferencjekandydata_ibfk_1` FOREIGN KEY (`IdKandydata`) REFERENCES `kandydaci` (`NrRejestracyjny`),
  ADD CONSTRAINT `preferencjekandydata_ibfk_2` FOREIGN KEY (`Preferencja1`) REFERENCES `kierunki` (`IdKierunku`),
  ADD CONSTRAINT `preferencjekandydata_ibfk_3` FOREIGN KEY (`Preferencja2`) REFERENCES `kierunki` (`IdKierunku`),
  ADD CONSTRAINT `preferencjekandydata_ibfk_4` FOREIGN KEY (`Preferencja3`) REFERENCES `kierunki` (`IdKierunku`),
  ADD CONSTRAINT `preferencjekandydata_ibfk_5` FOREIGN KEY (`Preferencja4`) REFERENCES `kierunki` (`IdKierunku`),
  ADD CONSTRAINT `preferencjekandydata_ibfk_6` FOREIGN KEY (`Preferencja5`) REFERENCES `kierunki` (`IdKierunku`),
  ADD CONSTRAINT `preferencjekandydata_ibfk_7` FOREIGN KEY (`Preferencja6`) REFERENCES `kierunki` (`IdKierunku`);

--
-- Ograniczenia dla tabeli `wskaznik`
--
ALTER TABLE `wskaznik`
  ADD CONSTRAINT `wskaznikfk_1` FOREIGN KEY (`IdKandydata`) REFERENCES `kandydaci` (`NrRejestracyjny`);

--
-- Ograniczenia dla tabeli `wynikimatur`
--
ALTER TABLE `wynikimatur`
  ADD CONSTRAINT `wynikimatur_ibfk_1` FOREIGN KEY (`IdKandydata`) REFERENCES `kandydaci` (`NrRejestracyjny`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
