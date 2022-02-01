SHOW ENGINE INNODB STATUS;
use students_datebase;
select * from wynikimatur;
select * from kandydaci;
select * from preferencjekandydata;

create database students_datebase;
show tables;
alter table wynikimatur drop index WynikiMatur_IdKandydata_uindex;
drop table wynikimatur;
show tables ;
drop table boolwskaznikikierunki;
drop table wskaznik;

set foreign_key_checks = 0;
drop table kierunki;
drop table wskaznik;
drop table preferencjekandydata;
drop table wynikimatur;
set foreign_key_checks = 1;
drop table pracownicylogi;

delete from kandydaci where NrRejestracyjny = 1;
insert into kandydaci values (1, 'Joanna', 'Kraśko', 01270847214, 'Oczekuje na oplate', 0, 1);
insert into logkandydaci values (401, 'chlop', 'przyjazn_to_magia', 0x30);
delete from kandydaci where NrRejestracyjny = 404;
delete from logkandydaci where IdKandydata = 404;
SELECT * FROM pracownicylogi WHERE pracownicylogi.Login = 'EdytaPotockaDDR';
select * FROM pracownicylogi WHERE IdPracownika = 29;
SELECT * FROM pracownicylogi WHERE pracownicylogi.IdPracownika = 4;
SELECT * FROM pracownicylogi WHERE pracownicylogi.Login Like 'KlaraMazurekW4\n';
select * from kierunki where NazwaKierunku = 'Architektura';
set foreign_key_checks = 0;
delete from pracownicylogi where IdPracownika = 30 or IdPracownika = 31;
delete from logkandydaci where IdKandydata = 0;
delete from wynikimatur where IdKandydata = 0;
delete from kandydaci where NrRejestracyjny = 406;
delete from preferencjekandydata where IdKandydata = 0;
delete from logkandydaci where IdKandydata = 0;

show grants for Worker@localhost;

SELECT * FROM logkandydaci WHERE Login = 'chlop' and AES_DECRYPT(UNCOMPRESS(securePass), 27) = 'przyjazn_to_magia';
SELECT * FROM logkandydaci WHERE Login = 'chlop' and AES_DECRYPT(UNCOMPRESS(securePass), 27) = 'przyjazn_to_magia';

delete from kandydaci where NrRejestracyjny > 422;
delete from logkandydaci where IdKandydata > 422;

update logkandydaci set Login='PinkiePie', Haslo='JohhnyWalker' where IdKandydata = (select NrRejestracyjny from kandydaci k where k.PESEL = '1220612774') ;

insert into kandydaci (Imie, Nazwisko, PESEL, Status, CzyOlimpijczyk) values ('Imię', 'Nazwisko', 'PESEL', 'Oczekuje na oplate', 0);
insert into logkandydaci (IdKandydata) value (415);
select IdKierunku, NazwaKierunku, KodWydzialu from kierunki;

select * from preferencjekandydata where IdKandydata = 422;
select NrRejestracyjny from kandydaci where Imie='Flutter' and Nazwisko like '%' and PESEL = '0215420102';
update preferencjekandydata set Preferencja3 = 30 where IdKandydata = 428;
select NrRejestracyjny from kandydaci where Imie like 'Grzeg%' and Nazwisko like 'W%' and PESEL like '%' and NrRejestracyjny like '%';
select * from kandydaci where Imie like 'Anna%' and Nazwisko like '%' and PESEL like '%' and NrRejestracyjny like '%';

insert into pracownicy (Imie, Nazwisko, Jednostka) value ('John', 'Wick', 'W11');
insert into pracownicylogi (IdPracownika ,Login, Haslo) value (30, 'Login', 'Password');
delete from pracownicy where IdPracownika = 29;
select * from kandydaci where Imie like 'Anna%' and Nazwisko like '%' and PESEL like '%' and NrRejestracyjny like '%';
update kandydaci set Imie = 'Czesława', Nazwisko = 'Kucharska', PESEL = '2280488244', Status = 'Oczekuje na oplate', Ewidencja = null, CzyOlimpijczyk = 0 where NrRejestracyjny = 60;

select k.NrRejestracyjny, k.Imie, k.Nazwisko, w.WskaznikPref1 from kandydaci k join wskaznik w on k.NrRejestracyjny = w.IdKandydata join preferencjekandydata p on k.NrRejestracyjny = p.IdKandydata where Preferencja1 = 2
union
select k.NrRejestracyjny, k.Imie, k.Nazwisko, w.WskaznikPref2 from kandydaci k join wskaznik w on k.NrRejestracyjny = w.IdKandydata join preferencjekandydata p on k.NrRejestracyjny = p.IdKandydata where Preferencja2 = 2
union
select k.NrRejestracyjny, k.Imie, k.Nazwisko, w.WskaznikPref3 from kandydaci k join wskaznik w on k.NrRejestracyjny = w.IdKandydata join preferencjekandydata p on k.NrRejestracyjny = p.IdKandydata where Preferencja3 = 2
union
select k.NrRejestracyjny, k.Imie, k.Nazwisko, w.WskaznikPref4 from kandydaci k join wskaznik w on k.NrRejestracyjny = w.IdKandydata join preferencjekandydata p on k.NrRejestracyjny = p.IdKandydata where Preferencja4 = 2
union
select k.NrRejestracyjny, k.Imie, k.Nazwisko, w.WskaznikPref5 from kandydaci k join wskaznik w on k.NrRejestracyjny = w.IdKandydata join preferencjekandydata p on k.NrRejestracyjny = p.IdKandydata where Preferencja5 = 2
union
select k.NrRejestracyjny, k.Imie, k.Nazwisko, w.WskaznikPref6 from kandydaci k join wskaznik w on k.NrRejestracyjny = w.IdKandydata join preferencjekandydata p on k.NrRejestracyjny = p.IdKandydata where Preferencja6 = 2
order by WskaznikPref1 desc, Nazwisko, Imie;

select * from pracownicy where Imie like '%' and Nazwisko like '%' and Jednostka like '%' and IdPracownika like '3%';