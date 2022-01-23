-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 23 Sty 2022, 20:39
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
                DECLARE mr INT DEFAULT NULL;
                DECLARE jp INT DEFAULT 0;
                DECLARE jr INT DEFAULT NULL;
                DECLARE f INT DEFAULT NULL;
                DECLARE c INT DEFAULT NULL;
                DECLARE b INT DEFAULT NULL;
                DECLARE g INT DEFAULT NULL;
                DECLARE inf INT DEFAULT NULL;
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
(1, 'Kornelia', 'Lis', '98032891767', 'Oczekuje na oplate', 0, 0),
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
  `Preferencja1` int(11) NOT NULL,
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
(1, 27, 48, 32, 17, NULL, NULL),
(2, 6, 7, 16, 58, 55, 38),
(3, 11, 42, 49, NULL, NULL, NULL),
(4, 15, 24, 14, 57, 59, 58),
(5, 18, 62, 4, 19, 21, 46),
(6, 4, 21, 28, 16, 57, NULL),
(7, 9, 21, 16, 18, 38, 12),
(8, 7, 6, NULL, NULL, NULL, NULL),
(9, 19, 8, NULL, NULL, NULL, NULL),
(10, 22, 31, 24, 29, 10, NULL),
(11, 21, 35, 49, NULL, NULL, NULL),
(12, 61, 4, 20, NULL, NULL, NULL),
(13, 17, 62, 10, 48, NULL, NULL),
(14, 28, 12, 35, NULL, NULL, NULL),
(15, 31, 46, NULL, NULL, NULL, NULL),
(16, 46, 5, NULL, NULL, NULL, NULL),
(17, 38, 34, NULL, NULL, NULL, NULL),
(18, 36, 22, 61, 55, 28, 35),
(19, 29, 63, 41, NULL, NULL, NULL),
(20, 17, 36, NULL, NULL, NULL, NULL),
(21, 32, NULL, NULL, NULL, NULL, NULL),
(22, 34, 28, 37, NULL, NULL, NULL),
(23, 12, 9, 7, 9, NULL, NULL),
(24, 28, 7, 12, NULL, NULL, NULL),
(25, 24, 9, 31, 6, NULL, NULL),
(26, 33, 44, 57, 30, 39, 40),
(27, 59, 35, 59, NULL, NULL, NULL),
(28, 19, NULL, NULL, NULL, NULL, NULL),
(29, 12, 42, 48, NULL, NULL, NULL),
(30, 46, 14, 55, 48, 11, 33),
(31, 63, 42, NULL, NULL, NULL, NULL),
(32, 30, 29, 53, NULL, NULL, NULL),
(33, 57, 52, 28, 43, 7, 28),
(34, 7, 53, 59, 11, 62, 27),
(35, 29, 52, NULL, NULL, NULL, NULL),
(36, 31, 5, 54, 7, 56, 9),
(37, 42, NULL, NULL, NULL, NULL, NULL),
(38, 28, 19, 11, NULL, NULL, NULL),
(39, 5, 39, 55, 32, 58, 7),
(40, 12, 53, 40, 41, 22, NULL),
(41, 41, 3, 14, 63, 22, NULL),
(42, 33, 30, 51, 40, 43, NULL),
(43, 45, 57, 23, 7, NULL, NULL),
(44, 47, 30, 10, NULL, NULL, NULL),
(45, 4, 21, 33, NULL, NULL, NULL),
(46, 36, 57, 55, 41, 40, NULL),
(47, 60, 20, NULL, NULL, NULL, NULL),
(48, 13, 9, 6, 63, 47, NULL),
(49, 17, 14, 20, 55, 30, NULL),
(50, 3, 7, 27, 51, 50, NULL),
(51, 9, 10, 23, 22, NULL, NULL),
(52, 5, 30, 10, 20, 8, NULL),
(53, 49, 4, 55, 14, 29, NULL),
(54, 56, 31, 46, 13, 48, NULL),
(55, 1, 17, 17, NULL, NULL, NULL),
(56, 53, 39, 36, 62, NULL, NULL),
(57, 12, 13, NULL, NULL, NULL, NULL),
(58, 50, 33, 14, 32, NULL, NULL),
(59, 52, 33, 8, 3, 49, 52),
(60, 34, 15, 36, 8, 56, 8),
(61, 4, 38, 54, 31, 55, 57),
(62, 50, 17, 56, 43, 45, 36),
(63, 32, 39, 37, 5, 37, NULL),
(64, 42, 20, 34, 45, 63, NULL),
(65, 12, 24, 24, 44, 23, 45),
(66, 11, 30, 54, 52, NULL, NULL),
(67, 31, 41, 48, 53, 58, NULL),
(68, 52, 48, NULL, NULL, NULL, NULL),
(69, 23, 48, 49, NULL, NULL, NULL),
(70, 29, 37, 37, 12, NULL, NULL),
(71, 7, 7, NULL, NULL, NULL, NULL),
(72, 47, 6, NULL, NULL, NULL, NULL),
(73, 40, 40, NULL, NULL, NULL, NULL),
(74, 17, 40, NULL, NULL, NULL, NULL),
(75, 3, 62, 54, NULL, NULL, NULL),
(76, 61, 59, 50, NULL, NULL, NULL),
(77, 26, 32, NULL, NULL, NULL, NULL),
(78, 10, 47, 18, NULL, NULL, NULL),
(79, 54, 57, NULL, NULL, NULL, NULL),
(80, 61, 2, 13, 58, 3, 25),
(81, 2, 37, 55, 39, 30, 30),
(82, 21, 49, 57, 15, 25, 17),
(83, 53, 52, NULL, NULL, NULL, NULL),
(84, 35, 60, 8, 45, 14, NULL),
(85, 60, 2, 14, 62, 19, 34),
(86, 25, 32, 24, 22, 36, 51),
(87, 23, 43, 24, NULL, NULL, NULL),
(88, 55, 60, 9, 52, 47, 13),
(89, 23, 27, 4, 59, 35, 60),
(90, 49, 33, NULL, NULL, NULL, NULL),
(91, 32, 57, NULL, NULL, NULL, NULL),
(92, 20, NULL, NULL, NULL, NULL, NULL),
(93, 40, 39, 14, 14, NULL, NULL),
(94, 35, 28, 34, 23, NULL, NULL),
(95, 57, 58, NULL, NULL, NULL, NULL),
(96, 38, 25, 12, 43, 56, 24),
(97, 5, 40, NULL, NULL, NULL, NULL),
(98, 58, 45, 49, 48, 29, 62),
(99, 54, 36, 20, 53, NULL, NULL),
(100, 48, 4, 60, NULL, NULL, NULL),
(101, 22, 49, 53, 53, 47, NULL),
(102, 30, 60, NULL, NULL, NULL, NULL),
(103, 60, 40, 21, NULL, NULL, NULL),
(104, 46, 25, 48, 41, 58, NULL),
(105, 34, 45, 57, 28, 31, NULL),
(106, 5, 2, NULL, NULL, NULL, NULL),
(107, 23, 9, 37, 35, 60, 8),
(108, 19, 18, 34, 51, 27, NULL),
(109, 8, 33, 19, 57, 39, NULL),
(110, 56, 26, 22, NULL, NULL, NULL),
(111, 34, 10, 7, 6, NULL, NULL),
(112, 15, 54, NULL, NULL, NULL, NULL),
(113, 29, 30, 62, 33, 38, NULL),
(114, 21, 25, 61, 42, NULL, NULL),
(115, 62, 46, 43, NULL, NULL, NULL),
(116, 9, 58, NULL, NULL, NULL, NULL),
(117, 32, 48, 17, NULL, NULL, NULL),
(118, 23, NULL, NULL, NULL, NULL, NULL),
(119, 26, 61, 37, 3, 27, NULL),
(120, 46, 41, 2, 10, 46, 11),
(121, 47, 47, 31, 14, 40, NULL),
(122, 36, 24, 10, 41, NULL, NULL),
(123, 54, 63, 27, 8, 21, 16),
(124, 40, 20, 41, NULL, NULL, NULL),
(125, 32, 43, 55, NULL, NULL, NULL),
(126, 57, 39, 24, NULL, NULL, NULL),
(127, 50, 4, 54, 10, 11, 22),
(128, 2, 28, NULL, NULL, NULL, NULL),
(129, 36, 21, NULL, NULL, NULL, NULL),
(130, 25, 24, 40, 6, 32, 18),
(131, 32, 59, 9, 53, 53, 41),
(132, 37, 49, 9, 23, 23, NULL),
(133, 30, 14, 40, 35, 52, NULL),
(134, 63, 32, 34, 8, NULL, NULL),
(135, 43, NULL, NULL, NULL, NULL, NULL),
(136, 57, 21, 56, NULL, NULL, NULL),
(137, 53, 42, 50, 61, NULL, NULL),
(138, 27, 45, 20, 27, NULL, NULL),
(139, 34, 13, NULL, NULL, NULL, NULL),
(140, 20, 23, 57, NULL, NULL, NULL),
(141, 39, 41, 25, 2, NULL, NULL),
(142, 36, 5, 40, 58, 45, 50),
(143, 51, 32, 8, 6, 3, 61),
(144, 37, 50, 15, 49, 13, NULL),
(145, 42, 25, 57, 25, 14, NULL),
(146, 61, 5, 26, 51, 55, 56),
(147, 35, 14, 26, 24, 40, 3),
(148, 30, 25, 34, NULL, NULL, NULL),
(149, 49, 30, 2, 45, NULL, NULL),
(150, 8, 16, 57, 47, NULL, NULL),
(151, 56, NULL, NULL, NULL, NULL, NULL),
(152, 10, 42, 53, NULL, NULL, NULL),
(153, 45, 50, NULL, NULL, NULL, NULL),
(154, 51, 33, 10, 12, 30, 49),
(155, 11, 18, 60, 56, NULL, NULL),
(156, 18, 40, 22, 51, 62, NULL),
(157, 43, 51, 62, 32, NULL, NULL),
(158, 27, 22, 29, 16, 52, NULL),
(159, 43, 8, 35, 23, NULL, NULL),
(160, 39, 44, NULL, NULL, NULL, NULL),
(161, 56, 40, 32, 40, 40, NULL),
(162, 32, 43, 53, NULL, NULL, NULL),
(163, 30, 49, NULL, NULL, NULL, NULL),
(164, 53, 57, 62, 15, NULL, NULL),
(165, 7, 5, NULL, NULL, NULL, NULL),
(166, 44, 35, 44, 51, 58, 12),
(167, 10, 19, NULL, NULL, NULL, NULL),
(168, 24, NULL, NULL, NULL, NULL, NULL),
(169, 27, 1, 47, 46, 25, NULL),
(170, 40, 55, 32, 54, 49, 20),
(171, 19, 44, NULL, NULL, NULL, NULL),
(172, 55, 38, 22, 58, 38, NULL),
(173, 11, 17, NULL, NULL, NULL, NULL),
(174, 20, 8, 38, 43, 38, 60),
(175, 52, 21, 11, 50, 32, 11),
(176, 52, 22, 17, NULL, NULL, NULL),
(177, 27, 25, NULL, NULL, NULL, NULL),
(178, 7, 36, 34, 59, 5, NULL),
(179, 34, 2, 32, 29, NULL, NULL),
(180, 17, 11, 2, 38, 60, NULL),
(181, 3, 15, 3, 30, 14, 45),
(182, 18, 47, 55, 8, 60, 29),
(183, 42, 5, 21, NULL, NULL, NULL),
(184, 16, 56, 43, 47, NULL, NULL),
(185, 17, 12, 10, 12, 29, NULL),
(186, 12, 48, 17, 5, 31, NULL),
(187, 59, 53, 26, NULL, NULL, NULL),
(188, 19, 59, 53, 25, NULL, NULL),
(189, 49, 45, 17, NULL, NULL, NULL),
(190, 59, 16, NULL, NULL, NULL, NULL),
(191, 24, 36, 48, 5, NULL, NULL),
(192, 60, NULL, NULL, NULL, NULL, NULL),
(193, 43, 17, 18, 39, 14, NULL),
(194, 38, 17, 29, NULL, NULL, NULL),
(195, 17, 43, 42, 15, NULL, NULL),
(196, 17, 47, NULL, NULL, NULL, NULL),
(197, 32, 44, 57, 31, 44, 62),
(198, 21, 6, 25, 46, 29, 7),
(199, 24, 27, NULL, NULL, NULL, NULL),
(200, 51, NULL, NULL, NULL, NULL, NULL),
(201, 43, NULL, NULL, NULL, NULL, NULL),
(202, 42, 18, 24, NULL, NULL, NULL),
(203, 4, NULL, NULL, NULL, NULL, NULL),
(204, 32, 9, NULL, NULL, NULL, NULL),
(205, 15, 47, NULL, NULL, NULL, NULL),
(206, 2, NULL, NULL, NULL, NULL, NULL),
(207, 42, 30, 25, 31, 19, 2),
(208, 61, 13, NULL, NULL, NULL, NULL),
(209, 59, 21, NULL, NULL, NULL, NULL),
(210, 16, 42, 38, 1, 15, 9),
(211, 35, 49, 15, 50, 19, 4),
(212, 51, 56, 61, NULL, NULL, NULL),
(213, 7, 57, NULL, NULL, NULL, NULL),
(214, 20, 60, NULL, NULL, NULL, NULL),
(215, 17, 53, 26, 31, 14, 40),
(216, 47, 8, 22, 22, NULL, NULL),
(217, 29, 12, 33, 5, 51, NULL),
(218, 38, 36, 5, 38, 49, 6),
(219, 18, 3, NULL, NULL, NULL, NULL),
(220, 50, 53, 51, NULL, NULL, NULL),
(221, 11, 17, 51, 16, NULL, NULL),
(222, 25, 31, 14, 41, 38, 1),
(223, 14, 22, NULL, NULL, NULL, NULL),
(224, 23, NULL, NULL, NULL, NULL, NULL),
(225, 41, 39, 9, 49, NULL, NULL),
(226, 21, 3, 12, 48, NULL, NULL),
(227, 18, 27, 19, NULL, NULL, NULL),
(228, 4, 46, NULL, NULL, NULL, NULL),
(229, 7, 7, 13, 44, NULL, NULL),
(230, 13, 29, 39, 49, 63, 42),
(231, 42, 22, 45, NULL, NULL, NULL),
(232, 25, 28, 63, 44, NULL, NULL),
(233, 11, 32, 2, 37, NULL, NULL),
(234, 40, 31, 35, 18, 46, 51),
(235, 62, 17, 21, 55, 26, 26),
(236, 51, 39, 40, 21, 44, 35),
(237, 37, 61, 8, 43, 63, NULL),
(238, 55, 30, 43, 62, 56, 33),
(239, 60, 4, 25, 51, 55, 57),
(240, 62, 7, 35, 28, 35, 29),
(241, 41, 26, 6, 14, 52, NULL),
(242, 52, 49, 23, 29, NULL, NULL),
(243, 48, 9, NULL, NULL, NULL, NULL),
(244, 28, 6, 8, NULL, NULL, NULL),
(245, 20, 33, 43, NULL, NULL, NULL),
(246, 8, 8, 14, 43, 49, 51),
(247, 23, 30, 21, 13, 62, 23),
(248, 56, 7, 52, 50, 30, 63),
(249, 59, 59, 52, 22, 16, NULL),
(250, 10, 12, NULL, NULL, NULL, NULL),
(251, 54, 54, 45, 63, NULL, NULL),
(252, 10, 16, 49, 10, 25, 33),
(253, 26, 54, 5, NULL, NULL, NULL),
(254, 38, 43, 40, 8, 43, 5),
(255, 17, 25, 11, NULL, NULL, NULL),
(256, 48, 52, 52, 43, 59, NULL),
(257, 28, 15, 52, 29, 48, NULL),
(258, 5, 56, 18, 45, NULL, NULL),
(259, 25, 53, 2, 36, 51, NULL),
(260, 6, 31, 12, NULL, NULL, NULL),
(261, 50, 34, 19, 53, NULL, NULL),
(262, 11, 50, 29, NULL, NULL, NULL),
(263, 17, 32, 47, 14, 53, 36),
(264, 47, 53, 1, NULL, NULL, NULL),
(265, 29, 51, 42, 57, NULL, NULL),
(266, 2, 27, 5, 5, NULL, NULL),
(267, 21, 23, NULL, NULL, NULL, NULL),
(268, 45, 17, 14, 16, 40, NULL),
(269, 1, 55, 25, NULL, NULL, NULL),
(270, 16, 25, 14, NULL, NULL, NULL),
(271, 59, 58, 49, 11, 28, 46),
(272, 32, 33, 4, NULL, NULL, NULL),
(273, 23, 43, 22, 43, 23, NULL),
(274, 37, 48, 62, 44, 32, NULL),
(275, 35, 32, 57, NULL, NULL, NULL),
(276, 11, 56, 60, 9, 48, 27),
(277, 45, 13, 52, 35, 16, 39),
(278, 38, 11, 2, NULL, NULL, NULL),
(279, 59, 54, 33, 61, 20, NULL),
(280, 15, 16, 36, 6, 44, NULL),
(281, 4, 35, NULL, NULL, NULL, NULL),
(282, 35, 53, 33, 5, 51, NULL),
(283, 44, 1, 60, 46, 48, 39),
(284, 4, 57, 25, 13, 53, 37),
(285, 21, 24, 58, NULL, NULL, NULL),
(286, 27, 53, 56, 60, NULL, NULL),
(287, 40, 52, NULL, NULL, NULL, NULL),
(288, 45, 55, NULL, NULL, NULL, NULL),
(289, 29, 38, NULL, NULL, NULL, NULL),
(290, 34, 41, 41, 21, 39, NULL),
(291, 56, 61, NULL, NULL, NULL, NULL),
(292, 11, 10, NULL, NULL, NULL, NULL),
(293, 49, 12, NULL, NULL, NULL, NULL),
(294, 14, 27, 31, 9, NULL, NULL),
(295, 39, 30, NULL, NULL, NULL, NULL),
(296, 4, 49, 47, 24, NULL, NULL),
(297, 4, 22, 33, 39, 33, NULL),
(298, 7, 17, 5, 31, 18, NULL),
(299, 42, 41, 15, 13, 18, 51),
(300, 48, 4, NULL, NULL, NULL, NULL),
(301, 44, 38, 57, 47, 1, 49),
(302, 57, 2, 22, 43, 22, 42),
(303, 37, 58, 57, NULL, NULL, NULL),
(304, 1, 50, 61, 28, 18, NULL),
(305, 43, 4, NULL, NULL, NULL, NULL),
(306, 60, 8, NULL, NULL, NULL, NULL),
(307, 7, 29, 61, 32, 39, NULL),
(308, 54, 42, 45, 39, NULL, NULL),
(309, 46, 57, 22, 63, 59, 46),
(310, 51, 39, 42, 30, 25, 31),
(311, 56, 42, 41, NULL, NULL, NULL),
(312, 16, 33, NULL, NULL, NULL, NULL),
(313, 49, 16, 56, 45, 58, 30),
(314, 31, 41, 52, 10, NULL, NULL),
(315, 5, 25, 50, NULL, NULL, NULL),
(316, 23, 34, 40, 35, 54, NULL),
(317, 30, 34, 16, 38, 20, NULL),
(318, 43, 14, 4, 39, 58, NULL),
(319, 54, 9, 4, 57, 21, NULL),
(320, 43, 38, 59, 56, 39, 26),
(321, 52, 31, NULL, NULL, NULL, NULL),
(322, 17, 28, 28, 53, 57, 63),
(323, 24, 2, 2, NULL, NULL, NULL),
(324, 60, 50, 6, 3, 57, 28),
(325, 6, 61, 37, 4, NULL, NULL),
(326, 6, 4, 4, 4, NULL, NULL),
(327, 28, 54, NULL, NULL, NULL, NULL),
(328, 9, 55, 58, 61, 7, 39),
(329, 53, 1, 33, 34, 11, NULL),
(330, 30, 49, NULL, NULL, NULL, NULL),
(331, 59, 20, 45, 42, NULL, NULL),
(332, 55, 54, NULL, NULL, NULL, NULL),
(333, 38, 6, 39, 54, 27, NULL),
(334, 29, 41, 54, 21, NULL, NULL),
(335, 20, NULL, NULL, NULL, NULL, NULL),
(336, 62, 49, 59, NULL, NULL, NULL),
(337, 3, 2, 62, NULL, NULL, NULL),
(338, 35, 1, 26, 2, 56, 24),
(339, 52, 34, NULL, NULL, NULL, NULL),
(340, 36, 7, NULL, NULL, NULL, NULL),
(341, 44, 8, 28, 54, 59, 10),
(342, 18, 35, 56, 49, 16, 54),
(343, 22, 61, 51, 10, 21, NULL),
(344, 47, 19, NULL, NULL, NULL, NULL),
(345, 14, 27, NULL, NULL, NULL, NULL),
(346, 11, 21, 11, 50, NULL, NULL),
(347, 11, 18, 57, 41, NULL, NULL),
(348, 56, 47, 4, 3, NULL, NULL),
(349, 52, 13, 30, 49, 28, 57),
(350, 20, 57, NULL, NULL, NULL, NULL),
(351, 24, 2, 60, 46, 49, NULL),
(352, 16, 5, 36, 40, 28, NULL),
(353, 23, 48, 47, NULL, NULL, NULL),
(354, 50, 49, 31, NULL, NULL, NULL),
(355, 5, 2, NULL, NULL, NULL, NULL),
(356, 16, 41, 30, 29, 53, 51),
(357, 21, 61, 55, 28, NULL, NULL),
(358, 30, 43, 62, 55, NULL, NULL),
(359, 36, 34, 61, 14, NULL, NULL),
(360, 16, 45, NULL, NULL, NULL, NULL),
(361, 59, 17, 31, 42, 52, 10),
(362, 47, 63, NULL, NULL, NULL, NULL),
(363, 50, 44, 8, 30, 2, 42),
(364, 30, 29, 56, NULL, NULL, NULL),
(365, 38, NULL, NULL, NULL, NULL, NULL),
(366, 15, 46, 61, 42, 27, 9),
(367, 23, 46, 35, NULL, NULL, NULL),
(368, 24, 3, 4, 11, 42, NULL),
(369, 1, 41, 12, 61, 20, 42),
(370, 57, 24, 8, NULL, NULL, NULL),
(371, 9, 10, 22, 18, NULL, NULL),
(372, 4, 7, 22, NULL, NULL, NULL),
(373, 10, 29, 49, 35, NULL, NULL),
(374, 29, 62, 38, 2, NULL, NULL),
(375, 17, 34, 55, NULL, NULL, NULL),
(376, 9, 24, 33, 27, 37, NULL),
(377, 32, 37, 24, 7, 26, NULL),
(378, 19, 23, 59, 38, 11, NULL),
(379, 46, NULL, NULL, NULL, NULL, NULL),
(380, 11, 27, 39, 51, NULL, NULL),
(381, 38, 23, NULL, NULL, NULL, NULL),
(382, 54, 23, 14, 60, 11, 60),
(383, 36, 60, 4, NULL, NULL, NULL),
(384, 54, 6, 52, NULL, NULL, NULL),
(385, 50, 26, 42, 8, 38, 38),
(386, 26, 20, NULL, NULL, NULL, NULL),
(387, 34, 50, 22, NULL, NULL, NULL),
(388, 38, 2, 18, NULL, NULL, NULL),
(389, 58, 37, 8, NULL, NULL, NULL),
(390, 47, 19, 12, 3, 41, 10),
(391, 23, 33, 33, 63, 29, 19),
(392, 43, 6, NULL, NULL, NULL, NULL),
(393, 30, 19, 4, NULL, NULL, NULL),
(394, 43, 21, 38, NULL, NULL, NULL),
(395, 18, NULL, NULL, NULL, NULL, NULL),
(396, 44, 34, 40, NULL, NULL, NULL),
(397, 41, 47, 50, 44, NULL, NULL),
(398, 37, 32, NULL, NULL, NULL, NULL),
(399, 22, 25, 59, 30, 37, 31),
(400, 2, 1, 60, 47, 53, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wskaznik`
--

CREATE TABLE `wskaznik` (
  `IdKandydata` int(11) NOT NULL,
  `WskaznikPref1` float NOT NULL DEFAULT 0,
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
  `PolskiPodstawa` int(11) NOT NULL,
  `MatematykaPodstawa` int(11) NOT NULL,
  `MatematykaRozszerzenie` int(11) DEFAULT NULL,
  `JezykObcyNowozytnyPodstawa` int(11) NOT NULL,
  `JezykObcyNowozytnyRozszerzenie` int(11) DEFAULT NULL,
  `FizykaRozszerzenie` int(11) DEFAULT NULL,
  `ChemiaRozszezrenie` int(11) DEFAULT NULL,
  `BiologiaRozszezrenie` int(11) DEFAULT NULL,
  `InformatykaRozszerzenie` int(11) DEFAULT NULL,
  `GeografiaRozszerzenie` int(11) DEFAULT NULL,
  `EgzaminZRysunku` int(11) DEFAULT NULL
) ;

--
-- Zrzut danych tabeli `wynikimatur`
--

INSERT INTO `wynikimatur` (`IdKandydata`, `PolskiPodstawa`, `MatematykaPodstawa`, `MatematykaRozszerzenie`, `JezykObcyNowozytnyPodstawa`, `JezykObcyNowozytnyRozszerzenie`, `FizykaRozszerzenie`, `ChemiaRozszezrenie`, `BiologiaRozszezrenie`, `InformatykaRozszerzenie`, `GeografiaRozszerzenie`, `EgzaminZRysunku`) VALUES
(1, 94, 34, 89, 28, NULL, NULL, NULL, 83, NULL, 39, 0),
(2, 30, 38, 10, 38, 98, NULL, 36, 2, NULL, 4, 0),
(3, 51, 55, 68, 45, NULL, NULL, NULL, 3, 25, NULL, 0),
(4, 9, 71, 56, 55, NULL, NULL, NULL, NULL, NULL, 60, 0),
(5, 43, 83, NULL, 84, 28, 94, NULL, NULL, NULL, NULL, 0),
(6, 62, 20, NULL, 36, NULL, 22, NULL, 40, 97, NULL, 0),
(7, 86, 54, 86, 52, NULL, 61, NULL, 86, NULL, 41, 0),
(8, 28, 91, NULL, 95, 92, NULL, 38, 69, 48, 72, 0),
(9, 74, 78, NULL, 50, NULL, 93, 48, 87, 16, 26, 0),
(10, 73, 49, NULL, 81, NULL, 88, 10, 7, 57, 43, 0),
(11, 100, 84, NULL, 81, 76, NULL, 19, NULL, NULL, 95, 0),
(12, 72, 31, 42, 91, NULL, NULL, 45, 58, NULL, 1, 0),
(13, 50, 78, 54, 51, NULL, 73, 59, NULL, 99, 99, 0),
(14, 91, 84, NULL, 76, NULL, NULL, 16, NULL, NULL, NULL, 0),
(15, 91, 75, NULL, 68, NULL, NULL, 1, NULL, NULL, 4, 0),
(16, 36, 65, NULL, 73, NULL, NULL, 59, NULL, 78, 71, 0),
(17, 68, 49, NULL, 52, 19, NULL, 81, 65, NULL, NULL, 0),
(18, 93, 44, 9, 85, 60, 58, 62, NULL, NULL, NULL, 0),
(19, 38, 69, NULL, 69, 6, 96, 70, 60, 26, 19, 0),
(20, 48, 71, NULL, 80, NULL, 76, NULL, 27, NULL, 61, 0),
(21, 39, 57, NULL, 34, 31, NULL, NULL, 2, NULL, 60, 0),
(22, 97, 71, 85, 67, NULL, NULL, NULL, NULL, 97, NULL, 0),
(23, 67, 39, NULL, 92, NULL, 11, NULL, 90, NULL, 26, 0),
(24, 58, 71, NULL, 74, 16, NULL, 5, 73, NULL, 48, 0),
(25, 50, 68, NULL, 74, NULL, NULL, NULL, 87, 73, 40, 0),
(26, 47, 35, 94, 47, NULL, 17, 23, 89, NULL, 87, 0),
(27, 73, 89, 57, 56, NULL, 47, 44, 18, NULL, NULL, 0),
(28, 42, 71, 38, 69, NULL, NULL, 34, 61, 14, NULL, 0),
(29, 39, 45, NULL, 91, 56, NULL, 43, 50, NULL, 62, 0),
(30, 66, 80, NULL, 2, 32, 84, NULL, NULL, NULL, NULL, 0),
(31, 88, 89, 47, 60, 12, NULL, NULL, NULL, NULL, NULL, 0),
(32, 87, 41, 97, 72, NULL, NULL, 60, 85, 16, NULL, 0),
(33, 83, 93, 80, 48, NULL, 44, 8, NULL, NULL, 6, 0),
(34, 78, 59, 81, 91, NULL, NULL, NULL, 78, NULL, NULL, 0),
(35, 36, 45, 95, 52, NULL, NULL, 17, 96, 12, NULL, 0),
(36, 53, 46, NULL, 47, 46, NULL, NULL, NULL, 45, 15, 0),
(37, 47, 60, 92, 33, NULL, NULL, 17, 12, NULL, 78, 0),
(38, 98, 93, 21, 49, NULL, 8, 37, 33, NULL, 97, 0),
(39, 39, 76, NULL, 59, NULL, NULL, NULL, 50, 64, NULL, 0),
(40, 31, 64, 46, 33, 31, NULL, 57, 83, 19, NULL, 0),
(41, 58, 26, NULL, 48, 49, NULL, 33, 96, NULL, NULL, 0),
(42, 48, 32, NULL, 56, 76, NULL, 53, 7, NULL, NULL, 0),
(43, 21, 50, 36, 96, NULL, NULL, 46, 49, 93, 18, 0),
(44, 38, 84, 52, 83, 92, 87, 30, 89, NULL, NULL, 0),
(45, 96, 30, 85, 74, 57, 12, 16, 94, 22, 35, 0),
(46, 96, 36, NULL, 99, NULL, NULL, 21, NULL, 63, 17, 0),
(47, 69, 88, 47, 89, NULL, NULL, 17, 16, NULL, 45, 0),
(48, 71, 72, 96, 39, 9, NULL, NULL, NULL, 24, NULL, 0),
(49, 54, 54, NULL, 60, NULL, 49, NULL, NULL, 6, 71, 0),
(50, 82, 77, 17, 93, 10, 33, NULL, NULL, NULL, NULL, 0),
(51, 92, 89, NULL, 98, 27, 87, NULL, NULL, NULL, 36, 0),
(52, 72, 75, NULL, 86, NULL, 88, 29, 66, 77, 99, 0),
(53, 82, 39, NULL, 83, NULL, 46, NULL, 62, 98, 82, 0),
(54, 43, 82, 55, 64, 7, NULL, NULL, 8, 2, NULL, 0),
(55, 76, 51, 25, 78, 57, 70, 5, 64, NULL, 78, 0),
(56, 76, 94, NULL, 65, NULL, NULL, 52, NULL, 43, NULL, 0),
(57, 51, 98, NULL, 72, 92, NULL, 14, 24, NULL, NULL, 0),
(58, 30, 80, 50, 59, NULL, 45, 1, NULL, 86, NULL, 0),
(59, 63, 38, NULL, 36, 42, NULL, NULL, 38, 67, NULL, 0),
(60, 94, 58, 73, 50, NULL, NULL, NULL, NULL, 0, 90, 0),
(61, 93, 98, 37, 60, NULL, NULL, 53, 67, NULL, NULL, 0),
(62, 78, 84, NULL, 70, 91, NULL, 87, NULL, 79, 30, 0),
(63, 48, 78, 39, 87, NULL, NULL, 40, 62, NULL, 16, 0),
(64, 30, 77, 22, 86, 1, NULL, NULL, NULL, 79, NULL, 0),
(65, 38, 42, NULL, 50, 73, NULL, 92, 95, 35, NULL, 0),
(66, 67, 97, NULL, 51, NULL, 55, 31, NULL, 1, 30, 0),
(67, 61, 60, NULL, 34, NULL, 93, 66, 11, 39, 18, 0),
(68, 91, 38, NULL, 58, NULL, NULL, 68, NULL, 62, NULL, 0),
(69, 69, 41, NULL, 90, 53, 5, NULL, NULL, 31, 29, 0),
(70, 6, 12, NULL, 40, 78, NULL, 36, 17, NULL, 97, 0),
(71, 79, 94, NULL, 32, NULL, 99, NULL, NULL, NULL, NULL, 0),
(72, 66, 17, 13, 49, 95, 95, NULL, NULL, NULL, 32, 0),
(73, 39, 59, NULL, 79, 32, 91, 47, NULL, 86, 57, 0),
(74, 39, 78, 48, 91, 18, NULL, NULL, NULL, NULL, NULL, 0),
(75, 28, 73, 74, 39, 92, NULL, 6, 93, NULL, 11, 0),
(76, 81, 43, NULL, 33, 73, 5, NULL, NULL, 100, NULL, 0),
(77, 73, 72, NULL, 32, 30, 86, 53, 44, NULL, 53, 0),
(78, 91, 53, 8, 52, 70, 53, NULL, 91, 54, NULL, 0),
(79, 89, 100, NULL, 61, NULL, 11, NULL, 96, 61, NULL, 0),
(80, 57, 79, 21, 27, NULL, 28, 12, 79, 83, NULL, 0),
(81, 86, 90, NULL, 37, NULL, 83, NULL, 58, NULL, NULL, 0),
(82, 53, 33, NULL, 99, NULL, 7, NULL, NULL, NULL, 71, 0),
(83, 93, 55, 85, 74, 43, NULL, 85, NULL, 31, 61, 0),
(84, 58, 25, NULL, 73, NULL, NULL, 99, 12, NULL, NULL, 0),
(85, 55, 82, NULL, 26, NULL, NULL, NULL, 41, NULL, NULL, 0),
(86, 83, 98, NULL, 64, 95, 1, NULL, 75, NULL, 98, 0),
(87, 40, 70, 4, 64, NULL, NULL, NULL, 12, 58, NULL, 0),
(88, 88, 17, NULL, 68, NULL, 55, 30, 82, 76, 85, 0),
(89, 87, 66, 85, 73, 76, 84, 6, NULL, 48, 30, 0),
(90, 54, 53, NULL, 44, 20, 21, NULL, NULL, 17, 32, 0),
(91, 53, 84, NULL, 72, NULL, NULL, NULL, NULL, 81, NULL, 0),
(92, 36, 58, NULL, 26, 83, NULL, 5, 17, 23, 67, 0),
(93, 60, 35, NULL, 55, NULL, NULL, NULL, NULL, 73, 69, 0),
(94, 85, 49, 75, 34, NULL, 34, 92, 36, 95, NULL, 0),
(95, 32, 98, NULL, 42, 4, 79, NULL, 73, NULL, 0, 0),
(96, 47, 70, 35, 80, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(97, 84, 52, NULL, 37, 1, NULL, NULL, NULL, NULL, NULL, 0),
(98, 68, 91, NULL, 90, NULL, NULL, 37, NULL, 24, NULL, 0),
(99, 90, 38, 50, 54, 40, 21, 34, 52, 87, NULL, 0),
(100, 44, 95, NULL, 98, 31, 30, 100, NULL, NULL, NULL, 0),
(101, 77, 95, NULL, 79, NULL, NULL, 46, 21, 82, NULL, 0),
(102, 35, 35, 48, 71, NULL, 89, 81, NULL, NULL, NULL, 0),
(103, 86, 44, 99, 74, NULL, NULL, NULL, NULL, NULL, 61, 0),
(104, 81, 91, 91, 92, NULL, NULL, 9, 27, NULL, 30, 0),
(105, 75, 79, NULL, 63, 42, 74, 27, NULL, NULL, 81, 0),
(106, 40, 60, 42, 90, NULL, NULL, NULL, 18, NULL, NULL, 0),
(107, 38, 94, 16, 54, NULL, 87, 8, 62, NULL, 9, 0),
(108, 65, 82, NULL, 72, 22, NULL, 81, 89, NULL, 57, 0),
(109, 99, 30, NULL, 47, 82, NULL, NULL, 16, 35, NULL, 0),
(110, 47, 62, NULL, 63, 80, NULL, 43, 94, 76, 96, 0),
(111, 82, 55, NULL, 34, 87, NULL, NULL, NULL, NULL, NULL, 0),
(112, 83, 69, 76, 81, NULL, 28, 5, 44, 50, NULL, 0),
(113, 49, 80, NULL, 35, NULL, NULL, NULL, 56, 33, NULL, 0),
(114, 88, 92, NULL, 59, 40, NULL, 87, NULL, NULL, 77, 0),
(115, 87, 56, NULL, 71, 62, NULL, 60, 57, NULL, NULL, 0),
(116, 69, 99, NULL, 76, 30, 94, 17, NULL, NULL, 72, 0),
(117, 88, 82, 100, 77, 95, 100, NULL, NULL, 68, NULL, 0),
(118, 45, 98, 49, 68, 39, NULL, 11, 13, NULL, 39, 0),
(119, 38, 74, NULL, 100, NULL, 68, 68, NULL, 84, 60, 0),
(120, 64, 79, NULL, 34, 26, NULL, 28, 77, NULL, NULL, 0),
(121, 78, 92, NULL, 68, NULL, NULL, NULL, 2, NULL, NULL, 0),
(122, 95, 52, 65, 69, 36, 100, 76, NULL, 9, NULL, 0),
(123, 91, 82, NULL, 56, NULL, NULL, NULL, 81, 45, NULL, 0),
(124, 38, 43, NULL, 61, 0, 76, NULL, NULL, 24, NULL, 0),
(125, 69, 52, NULL, 97, NULL, 87, 50, 73, 21, 36, 0),
(126, 90, 13, 16, 94, NULL, 25, NULL, NULL, NULL, NULL, 0),
(127, 47, 77, 57, 69, 80, NULL, NULL, 60, NULL, 97, 0),
(128, 91, 85, 96, 100, 18, NULL, 51, NULL, NULL, 21, 0),
(129, 52, 87, NULL, 19, NULL, NULL, NULL, NULL, 49, 85, 0),
(130, 76, 36, NULL, 85, NULL, 54, NULL, NULL, 52, NULL, 0),
(131, 45, 66, 85, 83, 31, NULL, NULL, 48, 51, NULL, 0),
(132, 45, 63, NULL, 39, NULL, 63, NULL, NULL, NULL, NULL, 0),
(133, 47, 65, NULL, 47, NULL, 16, NULL, NULL, 85, 59, 0),
(134, 97, 56, 67, 67, 99, 72, 74, 70, 32, NULL, 0),
(135, 31, 58, 16, 59, NULL, NULL, NULL, NULL, NULL, 97, 0),
(136, 88, 46, NULL, 83, NULL, NULL, NULL, NULL, NULL, 25, 0),
(137, 82, 66, NULL, 32, 96, NULL, 84, 8, NULL, 2, 0),
(138, 32, 43, NULL, 51, NULL, 29, NULL, NULL, NULL, NULL, 0),
(139, 27, 32, 78, 100, 92, 36, 50, 23, NULL, 99, 0),
(140, 85, 30, NULL, 92, 43, 51, 73, 35, 13, 12, 0),
(141, 60, 96, NULL, 35, 9, 54, NULL, NULL, NULL, NULL, 0),
(142, 84, 46, NULL, 69, NULL, NULL, NULL, 1, NULL, NULL, 0),
(143, 74, 81, 50, 38, 57, NULL, NULL, 59, 79, NULL, 0),
(144, 89, 31, NULL, 79, NULL, 16, NULL, 88, NULL, 20, 0),
(145, 68, 45, NULL, 50, NULL, NULL, NULL, 77, NULL, 71, 0),
(146, 62, 50, 98, 65, NULL, NULL, 36, 21, 39, NULL, 0),
(147, 80, 46, NULL, 89, 53, NULL, 60, NULL, 24, NULL, 0),
(148, 55, 79, NULL, 100, 61, NULL, 36, 19, NULL, NULL, 0),
(149, 71, 68, NULL, 37, NULL, NULL, 88, 78, 67, 82, 0),
(150, 58, 63, 70, 59, NULL, 43, NULL, 14, 66, NULL, 0),
(151, 52, 95, NULL, 98, NULL, 65, 69, 28, NULL, NULL, 0),
(152, 67, 40, 82, 31, 51, NULL, NULL, 3, 69, NULL, 0),
(153, 62, 71, 93, 31, 53, NULL, 43, 65, NULL, NULL, 0),
(154, 72, 96, NULL, 60, 91, 87, NULL, NULL, 78, NULL, 0),
(155, 46, 55, 41, 88, NULL, NULL, NULL, NULL, 51, 59, 0),
(156, 60, 59, 25, 100, 81, 5, 64, 79, NULL, NULL, 0),
(157, 61, 50, NULL, 68, 81, NULL, NULL, NULL, NULL, NULL, 0),
(158, 83, 69, 90, 92, 15, 70, 87, NULL, 71, NULL, 0),
(159, 85, 65, NULL, 60, 62, 10, NULL, NULL, 20, 95, 0),
(160, 45, 54, 78, 62, 61, NULL, NULL, NULL, 86, 97, 0),
(161, 75, 70, 68, 37, NULL, NULL, NULL, 82, NULL, NULL, 0),
(162, 71, 41, 28, 92, NULL, NULL, 62, 44, 37, 70, 0),
(163, 86, 92, NULL, 68, NULL, NULL, NULL, 95, NULL, 65, 0),
(164, 33, 82, NULL, 81, NULL, NULL, NULL, 66, 34, 59, 0),
(165, 42, 46, 57, 84, 82, 43, NULL, 16, NULL, NULL, 0),
(166, 48, 73, 18, 47, NULL, NULL, NULL, NULL, 26, 45, 0),
(167, 96, 73, NULL, 40, NULL, 39, NULL, 38, 40, 78, 0),
(168, 77, 30, NULL, 36, NULL, NULL, 50, NULL, NULL, NULL, 0),
(169, 35, 73, 2, 32, 18, 30, 2, NULL, 40, 34, 0),
(170, 69, 95, NULL, 84, NULL, NULL, NULL, NULL, NULL, 82, 0),
(171, 90, 65, 92, 83, 61, NULL, NULL, NULL, NULL, NULL, 0),
(172, 76, 68, NULL, 53, NULL, 88, 98, NULL, 33, 54, 0),
(173, 63, 95, NULL, 58, NULL, 67, NULL, NULL, 52, NULL, 0),
(174, 51, 41, 87, 53, NULL, 82, NULL, NULL, 97, NULL, 0),
(175, 59, 35, 49, 82, 56, 24, NULL, 86, 40, 17, 0),
(176, 34, 65, 65, 34, 71, 65, NULL, 37, 10, NULL, 0),
(177, 60, 40, 52, 84, 88, 14, NULL, 5, NULL, NULL, 0),
(178, 32, 51, 25, 59, 96, NULL, NULL, 6, 59, NULL, 0),
(179, 87, 34, 99, 80, NULL, NULL, 39, 52, NULL, NULL, 0),
(180, 69, 68, 34, 49, NULL, NULL, 43, 48, NULL, 15, 0),
(181, 32, 95, 65, 60, NULL, NULL, 82, 47, NULL, 62, 0),
(182, 98, 94, NULL, 65, NULL, NULL, NULL, NULL, 67, NULL, 0),
(183, 49, 33, 0, 57, NULL, 54, 20, NULL, NULL, 0, 0),
(184, 36, 69, NULL, 76, NULL, NULL, NULL, 81, 12, NULL, 0),
(185, 75, 49, 92, 57, NULL, NULL, 95, 86, 78, NULL, 0),
(186, 62, 70, NULL, 92, 38, NULL, NULL, NULL, 13, 27, 0),
(187, 34, 31, 50, 84, 59, NULL, 91, 93, NULL, NULL, 0),
(188, 94, 56, NULL, 85, 66, NULL, 56, 53, NULL, 5, 0),
(189, 94, 78, 83, 85, NULL, 50, 44, NULL, NULL, 76, 0),
(190, 77, 70, NULL, 92, 84, 94, 37, 51, NULL, 33, 0),
(191, 46, 61, NULL, 58, NULL, NULL, 79, NULL, 7, 11, 0),
(192, 56, 55, NULL, 64, 90, 66, NULL, NULL, NULL, 40, 0),
(193, 42, 78, NULL, 62, 66, NULL, 26, NULL, NULL, NULL, 0),
(194, 70, 75, 23, 92, NULL, NULL, 8, NULL, NULL, NULL, 0),
(195, 54, 41, NULL, 96, 22, 93, NULL, 0, NULL, NULL, 0),
(196, 10, 73, NULL, 68, 49, NULL, 85, NULL, 83, NULL, 0),
(197, 61, 33, NULL, 88, NULL, NULL, 31, 53, NULL, 22, 0),
(198, 40, 86, 53, 33, 73, NULL, NULL, NULL, 18, NULL, 0),
(199, 87, 85, NULL, 72, NULL, NULL, NULL, NULL, 36, 4, 0),
(200, 63, 85, 72, 77, NULL, 38, 82, 26, NULL, NULL, 0),
(201, 82, 27, NULL, 48, NULL, 89, 93, 67, 8, 37, 0),
(202, 40, 33, 0, 68, NULL, NULL, 37, NULL, 94, 74, 0),
(203, 39, 38, 58, 36, NULL, NULL, NULL, 72, NULL, 12, 0),
(204, 34, 74, 43, 63, 89, 94, 82, NULL, NULL, NULL, 0),
(205, 50, 40, 41, 40, NULL, NULL, NULL, 53, 68, 45, 0),
(206, 29, 72, 78, 64, 54, 27, NULL, NULL, NULL, NULL, 0),
(207, 90, 54, 70, 81, 71, 21, NULL, 59, NULL, NULL, 0),
(208, 85, 39, 93, 56, NULL, NULL, 73, 38, 55, NULL, 0),
(209, 34, 48, NULL, 45, 29, NULL, NULL, NULL, 47, NULL, 0),
(210, 34, 84, 8, 49, NULL, NULL, 7, NULL, NULL, 36, 0),
(211, 45, 90, NULL, 66, 36, NULL, NULL, NULL, 80, 72, 0),
(212, 86, 98, NULL, 45, NULL, NULL, 54, 45, 32, NULL, 0),
(213, 54, 69, 47, 76, NULL, 81, NULL, 97, 87, 98, 0),
(214, 82, 40, 29, 40, 31, 29, 69, 50, NULL, 30, 0),
(215, 36, 25, NULL, 91, 97, 22, 58, 4, 72, NULL, 0),
(216, 72, 31, 87, 96, 93, NULL, 21, NULL, 86, 27, 0),
(217, 31, 66, NULL, 83, 60, NULL, 57, NULL, NULL, 30, 0),
(218, 94, 32, 54, 47, NULL, NULL, 54, 14, 97, NULL, 0),
(219, 94, 79, NULL, 2, 26, NULL, NULL, NULL, NULL, 16, 0),
(220, 99, 61, 51, 21, 19, NULL, NULL, 64, NULL, 1, 0),
(221, 85, 45, 84, 92, NULL, NULL, 21, NULL, 48, 49, 0),
(222, 19, 89, NULL, 51, 36, 39, NULL, NULL, 23, 51, 0),
(223, 83, 47, NULL, 85, 61, 72, NULL, NULL, 98, NULL, 0),
(224, 45, 48, 1, 35, NULL, NULL, 67, 66, NULL, NULL, 0),
(225, 40, 30, 53, 80, NULL, 60, NULL, NULL, NULL, NULL, 0),
(226, 46, 41, 9, 32, 47, 8, NULL, NULL, NULL, NULL, 0),
(227, 59, 42, NULL, 71, 87, 18, 55, 94, NULL, 86, 0),
(228, 69, 46, NULL, 48, 90, 83, 76, 91, NULL, NULL, 0),
(229, 31, 52, NULL, 89, NULL, NULL, 90, 69, 15, 7, 0),
(230, 46, 96, 100, 91, 10, NULL, 55, 97, 34, NULL, 0),
(231, 79, 50, 26, 37, 16, NULL, 58, 51, 66, 54, 0),
(232, 77, 88, 99, 83, NULL, NULL, 13, NULL, 80, NULL, 0),
(233, 64, 37, 62, 61, NULL, 18, 39, 74, NULL, 67, 0),
(234, 31, 73, NULL, 61, 4, 85, NULL, 44, NULL, 24, 0),
(235, 64, 38, NULL, 81, 4, 15, 55, NULL, NULL, NULL, 0),
(236, 76, 50, 82, 57, NULL, NULL, 91, 70, 24, 8, 0),
(237, 85, 92, NULL, 82, NULL, NULL, 78, NULL, 52, NULL, 0),
(238, 46, 83, 79, 47, NULL, 69, NULL, NULL, 84, 32, 0),
(239, 43, 86, 52, 73, 23, NULL, 89, NULL, NULL, NULL, 0),
(240, 94, 97, 51, 30, NULL, 82, NULL, NULL, NULL, 100, 0),
(241, 46, 71, NULL, 98, NULL, NULL, 60, NULL, NULL, 3, 0),
(242, 61, 94, NULL, 47, 81, 15, NULL, 94, NULL, NULL, 0),
(243, 51, 91, NULL, 91, 22, NULL, 16, 38, NULL, 81, 0),
(244, 36, 98, 46, 75, NULL, 73, 60, NULL, NULL, 79, 0),
(245, 76, 67, 55, 38, NULL, NULL, NULL, 63, NULL, NULL, 0),
(246, 98, 52, NULL, 2, 58, 37, NULL, 44, NULL, 42, 0),
(247, 89, 96, 97, 58, 88, 91, NULL, NULL, 97, NULL, 0),
(248, 53, 56, 84, 46, NULL, 31, 46, NULL, NULL, 2, 0),
(249, 49, 53, 72, 84, NULL, 93, 23, NULL, NULL, NULL, 0),
(250, 33, 88, 56, 56, NULL, NULL, NULL, NULL, 85, 17, 0),
(251, 66, 47, 69, 96, NULL, 8, 50, 82, NULL, 12, 0),
(252, 95, 57, NULL, 31, 55, 31, 89, NULL, NULL, NULL, 0),
(253, 37, 38, NULL, 50, NULL, NULL, NULL, 42, NULL, 36, 0),
(254, 91, 64, NULL, 52, 73, 91, NULL, 28, NULL, NULL, 0),
(255, 88, 85, NULL, 60, NULL, NULL, 74, 98, 51, NULL, 0),
(256, 53, 79, 75, 60, 46, NULL, 39, NULL, NULL, NULL, 0),
(257, 48, 86, 16, 86, 86, NULL, 51, 14, NULL, 3, 0),
(258, 40, 56, 39, 80, NULL, 67, 90, NULL, NULL, NULL, 0),
(259, 37, 50, 31, 66, 16, NULL, NULL, NULL, 79, 74, 0),
(260, 53, 45, NULL, 43, 80, NULL, 90, 64, NULL, NULL, 0),
(261, 51, 46, 92, 78, NULL, NULL, 11, NULL, 29, 10, 0),
(262, 74, 58, NULL, 93, NULL, NULL, 27, 91, NULL, 88, 0),
(263, 55, 68, NULL, 100, NULL, 47, 72, NULL, 40, NULL, 0),
(264, 59, 53, NULL, 70, 39, NULL, NULL, NULL, 23, 43, 0),
(265, 68, 52, NULL, 93, NULL, 21, NULL, NULL, 77, NULL, 0),
(266, 51, 91, 58, 87, 81, NULL, NULL, 56, 21, 28, 0),
(267, 68, 15, 34, 85, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(268, 99, 81, NULL, 91, NULL, NULL, NULL, 9, NULL, 8, 0),
(269, 73, 31, 59, 88, NULL, 96, 92, NULL, NULL, 95, 0),
(270, 43, 79, 30, 69, NULL, 33, NULL, NULL, NULL, NULL, 0),
(271, 81, 64, 73, 74, NULL, NULL, 30, 40, 78, NULL, 0),
(272, 49, 41, NULL, 65, NULL, 44, 99, NULL, NULL, 13, 0),
(273, 63, 94, NULL, 44, 19, 99, NULL, NULL, NULL, NULL, 0),
(274, 86, 70, 74, 74, 38, NULL, 89, NULL, NULL, NULL, 0),
(275, 79, 38, NULL, 84, 83, NULL, NULL, NULL, NULL, NULL, 0),
(276, 90, 39, NULL, 91, NULL, NULL, NULL, 77, 54, NULL, 0),
(277, 47, 84, 54, 54, 25, 90, 90, 93, 84, NULL, 0),
(278, 67, 12, 12, 59, 49, 17, 87, NULL, NULL, 81, 0),
(279, 57, 65, NULL, 94, 17, NULL, NULL, 62, 12, NULL, 0),
(280, 88, 84, 88, 37, 81, NULL, 73, 14, NULL, NULL, 0),
(281, 79, 51, NULL, 56, NULL, NULL, 21, 10, NULL, NULL, 0),
(282, 64, 69, NULL, 51, 96, NULL, 85, NULL, 14, NULL, 0),
(283, 58, 52, NULL, 48, NULL, NULL, NULL, 19, NULL, NULL, 0),
(284, 81, 82, NULL, 79, 21, NULL, 67, 27, 0, 18, 0),
(285, 61, 56, 80, 38, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(286, 37, 58, 31, 74, NULL, NULL, NULL, NULL, 51, NULL, 0),
(287, 43, 92, 19, 45, NULL, 32, 63, 3, 74, NULL, 0),
(288, 45, 13, 14, 90, NULL, 18, NULL, 96, NULL, 57, 0),
(289, 92, 60, 47, 50, 47, 57, 62, 71, NULL, 84, 0),
(290, 76, 44, NULL, 100, NULL, NULL, 22, NULL, NULL, 28, 0),
(291, 85, 37, NULL, 77, 26, NULL, NULL, 67, NULL, NULL, 0),
(292, 40, 52, NULL, 75, NULL, 88, NULL, 66, NULL, 54, 0),
(293, 52, 35, 44, 75, NULL, 44, NULL, 18, NULL, 77, 0),
(294, 7, 65, 11, 47, 96, 27, 39, NULL, NULL, 60, 0),
(295, 82, 56, NULL, 64, 52, NULL, 77, 67, 7, NULL, 0),
(296, 31, 73, 30, 74, 99, NULL, NULL, NULL, NULL, 20, 0),
(297, 95, 12, 18, 67, 74, 52, NULL, NULL, NULL, 19, 0),
(298, 73, 99, 23, 53, NULL, NULL, 3, NULL, 70, NULL, 0),
(299, 59, 71, NULL, 52, 5, NULL, 32, NULL, NULL, NULL, 0),
(300, 33, 52, 78, 69, 71, NULL, 43, NULL, 10, 89, 0),
(301, 95, 75, 87, 88, NULL, NULL, 74, 78, NULL, NULL, 0),
(302, 95, 86, 50, 84, 62, 33, 68, NULL, 16, 10, 0),
(303, 40, 56, NULL, 80, NULL, NULL, 25, NULL, NULL, 88, 0),
(304, 80, 92, NULL, 59, 29, 53, 48, 35, NULL, NULL, 0),
(305, 47, 42, 92, 94, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(306, 76, 37, NULL, 87, 47, 46, 56, 52, 6, NULL, 0),
(307, 53, 79, NULL, 59, 8, NULL, NULL, NULL, 55, NULL, 0),
(308, 33, 88, NULL, 61, 52, 38, 64, 67, 24, 7, 0),
(309, 98, 57, NULL, 68, 45, 75, 30, 87, 13, NULL, 0),
(310, 65, 60, NULL, 77, 76, NULL, 49, 27, NULL, 79, 0),
(311, 58, 39, 64, 96, 72, NULL, 37, NULL, 89, NULL, 0),
(312, 51, 70, NULL, 50, NULL, 2, NULL, 42, 42, NULL, 0),
(313, 78, 54, 65, 51, 61, 70, NULL, 55, 2, 31, 0),
(314, 73, 58, NULL, 41, NULL, 1, NULL, NULL, 16, 14, 0),
(315, 88, 42, NULL, 82, 19, NULL, NULL, NULL, 63, NULL, 0),
(316, 91, 96, 89, 94, 68, NULL, 26, 48, 45, NULL, 0),
(317, 19, 67, 39, 97, NULL, 51, 48, 56, 38, 23, 0),
(318, 44, 46, NULL, 81, 62, 93, 14, 27, 91, NULL, 0),
(319, 30, 95, NULL, 81, NULL, NULL, 88, 99, 2, NULL, 0),
(320, 44, 82, NULL, 39, 54, NULL, NULL, NULL, 0, 71, 0),
(321, 78, 28, NULL, 97, 20, NULL, 55, NULL, NULL, NULL, 0),
(322, 32, 36, NULL, 62, 70, 63, 62, 15, 22, 29, 0),
(323, 74, 88, NULL, 40, NULL, NULL, 26, 43, 51, NULL, 0),
(324, 19, 80, 77, 79, 45, NULL, 40, 33, 10, NULL, 0),
(325, 69, 89, 15, 33, NULL, NULL, 63, NULL, NULL, NULL, 0),
(326, 87, 91, 42, 49, NULL, 33, 84, NULL, NULL, NULL, 0),
(327, 33, 59, 10, 59, 19, NULL, 57, 62, 85, 65, 0),
(328, 43, 92, 47, 35, 19, NULL, NULL, NULL, NULL, 59, 0),
(329, 73, 98, 35, 34, NULL, NULL, NULL, NULL, 73, NULL, 0),
(330, 74, 58, 11, 91, 24, NULL, 77, NULL, NULL, NULL, 0),
(331, 75, 30, 67, 51, 5, NULL, 38, NULL, 40, 24, 0),
(332, 59, 43, NULL, 82, NULL, 35, 95, 83, NULL, NULL, 0),
(333, 97, 73, 2, 98, NULL, 86, NULL, NULL, NULL, NULL, 0),
(334, 95, 79, NULL, 98, NULL, NULL, 95, 42, NULL, 36, 0),
(335, 12, 41, NULL, 42, 57, NULL, NULL, 20, 95, NULL, 0),
(336, 77, 39, 88, 60, 98, NULL, 6, 33, 68, NULL, 0),
(337, 65, 55, NULL, 41, 31, 54, 37, NULL, 92, NULL, 0),
(338, 31, 89, NULL, 96, NULL, 73, 36, NULL, 24, NULL, 0),
(339, 60, 38, 79, 44, 13, 43, NULL, NULL, NULL, 41, 0),
(340, 42, 100, 68, 58, 34, 28, NULL, NULL, NULL, NULL, 0),
(341, 87, 62, NULL, 50, NULL, NULL, NULL, NULL, 53, NULL, 0),
(342, 54, 85, 84, 77, 82, 4, 45, NULL, 51, NULL, 0),
(343, 31, 68, NULL, 45, NULL, NULL, 61, NULL, NULL, NULL, 0),
(344, 90, 95, 4, 94, 46, 34, NULL, NULL, NULL, 51, 0),
(345, 86, 92, 48, 83, NULL, NULL, 61, NULL, 95, NULL, 0),
(346, 54, 37, 21, 22, 23, NULL, 20, NULL, NULL, NULL, 0),
(347, 82, 76, NULL, 82, NULL, 91, 54, 3, NULL, 66, 0),
(348, 97, 4, NULL, 53, 45, NULL, NULL, 9, 93, 25, 0),
(349, 12, 62, 6, 31, NULL, NULL, NULL, 25, NULL, 19, 0),
(350, 61, 22, 8, 44, 75, 48, 41, NULL, 80, NULL, 0),
(351, 18, 66, 11, 44, 30, NULL, 70, NULL, 85, NULL, 0),
(352, 51, 96, 77, 10, NULL, 90, NULL, NULL, 59, NULL, 0),
(353, 84, 45, NULL, 49, NULL, 79, 57, NULL, 13, 75, 0),
(354, 22, 62, NULL, 73, NULL, NULL, 49, 88, 97, 42, 0),
(355, 80, 82, 50, 82, 80, NULL, 81, NULL, 5, 95, 0),
(356, 53, 81, 85, 90, NULL, NULL, NULL, NULL, 71, 6, 0),
(357, 89, 79, 60, 77, 21, 54, 46, 87, NULL, 35, 0),
(358, 78, 84, 20, 67, NULL, 62, NULL, NULL, NULL, NULL, 0),
(359, 45, 59, NULL, 89, NULL, NULL, 26, 56, 64, 25, 0),
(360, 96, 8, NULL, 60, 24, NULL, NULL, 3, 84, NULL, 0),
(361, 92, 43, NULL, 80, 87, 98, NULL, 68, 15, 49, 0),
(362, 57, 39, 33, 87, 91, 43, NULL, 71, 56, 31, 0),
(363, 93, 39, NULL, 55, NULL, NULL, NULL, 33, 60, 92, 0),
(364, 32, 42, 15, 99, NULL, NULL, NULL, 89, 50, 71, 0),
(365, 35, 94, 65, 81, 83, NULL, 22, NULL, NULL, 40, 0),
(366, 40, 97, NULL, 32, 13, NULL, 39, NULL, 30, 48, 0),
(367, 58, 86, 19, 68, 80, 41, NULL, 31, 39, 48, 0),
(368, 32, 42, NULL, 93, 56, 10, NULL, 95, NULL, 86, 0),
(369, 68, 33, 41, 92, 94, 4, 36, NULL, 83, NULL, 0),
(370, 97, 79, 65, 85, 32, NULL, NULL, NULL, 25, NULL, 0),
(371, 68, 96, 12, 40, NULL, NULL, 99, NULL, NULL, 52, 0),
(372, 45, 92, 9, 93, 70, 55, 14, NULL, NULL, 45, 0),
(373, 67, 78, 91, 45, 36, NULL, 32, 88, NULL, 86, 0),
(374, 59, 31, NULL, 72, NULL, 52, NULL, 19, 48, 17, 0),
(375, 78, 85, 21, 86, 75, NULL, NULL, 20, 20, 11, 0),
(376, 92, 35, 68, 61, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(377, 53, 51, NULL, 86, NULL, 26, NULL, 31, 33, 53, 0),
(378, 62, 72, 57, 52, NULL, NULL, 6, NULL, NULL, NULL, 0),
(379, 46, 48, 97, 83, 74, 21, NULL, NULL, 36, NULL, 0),
(380, 51, 70, 30, 39, NULL, 2, NULL, 19, 72, NULL, 0),
(381, 66, 52, NULL, 47, 27, NULL, 48, NULL, 29, NULL, 0),
(382, 41, 63, NULL, 57, NULL, NULL, 74, 35, 6, 85, 0),
(383, 59, 56, 79, 60, 18, NULL, NULL, NULL, 22, 77, 0),
(384, 55, 80, 55, 48, 20, 87, NULL, 4, 2, 28, 0),
(385, 92, 70, 88, 85, 71, 48, 77, 24, 52, NULL, 0),
(386, 81, 40, 51, 48, 44, NULL, 87, 62, NULL, 99, 0),
(387, 71, 91, NULL, 48, NULL, 48, 74, 74, NULL, NULL, 0),
(388, 85, 59, 18, 77, NULL, NULL, 94, 78, NULL, NULL, 0),
(389, 40, 52, NULL, 82, NULL, NULL, 93, 85, 64, NULL, 0),
(390, 93, 45, 49, 35, NULL, 11, 26, 98, NULL, NULL, 0),
(391, 47, 78, NULL, 95, 35, NULL, NULL, 12, NULL, 87, 0),
(392, 49, 59, NULL, 57, NULL, 2, 96, 1, 44, NULL, 0),
(393, 47, 70, 16, 75, 17, NULL, 86, 78, NULL, NULL, 0),
(394, 85, 68, 97, 40, 12, NULL, 0, 54, NULL, NULL, 0),
(395, 90, 67, NULL, 51, 58, NULL, 42, 14, 21, NULL, 0),
(396, 65, 66, NULL, 44, NULL, 15, NULL, NULL, NULL, 34, 0),
(397, 94, 94, NULL, 36, NULL, NULL, 39, NULL, 67, 46, 0),
(398, 71, 34, 15, 92, NULL, NULL, 63, 92, 52, 89, 0),
(399, 99, 37, NULL, 26, 62, NULL, NULL, 84, 73, NULL, 0),
(400, 83, 22, 85, 92, 16, NULL, NULL, NULL, 48, NULL, 0);

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
  ADD CONSTRAINT `boolwskaznikikierunki_ibfk_2` FOREIGN KEY (`IdKierunku`) REFERENCES `kierunki` (`IdKierunku`);

--
-- Ograniczenia dla tabeli `kandydaci`
--
ALTER TABLE `kandydaci`
  ADD CONSTRAINT `kandydaci_ibfk_1` FOREIGN KEY (`Ewidencja`) REFERENCES `pracownicy` (`IdPracownika`);

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
-- Ograniczenia dla tabeli `wynikimatur`
--
ALTER TABLE `wynikimatur`
  ADD CONSTRAINT `wynikimatur_ibfk_1` FOREIGN KEY (`IdKandydata`) REFERENCES `kandydaci` (`NrRejestracyjny`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
