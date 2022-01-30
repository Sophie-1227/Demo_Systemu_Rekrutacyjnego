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
insert into kandydaci (Imie, Nazwisko, PESEL, Status, CzyOlimpijczyk) values ('Chłopa', 'Porąbało', 21333247, 'Oczekuje na oplate', 0);
insert into logkandydaci values (401, 'chlop', 'przyjazn_to_magia', 0x30);
delete from kandydaci where NrRejestracyjny = 404;
delete from logkandydaci where IdKandydata = 404;
SELECT * FROM pracownicylogi WHERE pracownicylogi.Login = 'EdytaPotockaDDR';
select * FROM pracownicylogi WHERE IdPracownika = 29;
SELECT * FROM pracownicylogi WHERE pracownicylogi.IdPracownika = 4;
SELECT * FROM pracownicylogi WHERE pracownicylogi.Login Like 'KlaraMazurekW4\n';
select * from kierunki where NazwaKierunku = 'Architektura';
set foreign_key_checks = 0;
insert into pracownicylogi value (30, 'dupaBlada', 'rozkurwiator3000', 0x30);
insert into pracownicylogi values (31, 'dupaBlada2', 'rozkurwiator3000', 0x30);
delete from pracownicylogi where IdPracownika = 30 or IdPracownika = 31;
delete from logkandydaci where IdKandydata = 0;
delete from wynikimatur where IdKandydata = 0;
delete from kandydaci where NrRejestracyjny = 406;
delete from preferencjekandydata where IdKandydata = 0;
delete from logkandydaci where IdKandydata = 0;

show grants for Worker@localhost;

SELECT * FROM pracownicylogi WHERE Login = 'dupaBlada' and AES_DECRYPT(UNCOMPRESS(PracownicyLogi.securePass), 27) = 'rozkurwiator3000';
SELECT * FROM logkandydaci WHERE Login = 'chlop' and AES_DECRYPT(UNCOMPRESS(securePass), 27) = 'przyjazn_to_magia';
SELECT * FROM logkandydaci WHERE Login = 'chlop' and AES_DECRYPT(UNCOMPRESS(securePass), 27) = 'przyjazn_to_magia';

delete from kandydaci where NrRejestracyjny > 400;
delete from logkandydaci where IdKandydata > 400;

update logkandydaci set Login='PinkiePie', Haslo='JohhnyWalker' where IdKandydata = (select NrRejestracyjny from kandydaci k where k.PESEL = '1220612774') ;

insert into kandydaci (Imie, Nazwisko, PESEL, Status, CzyOlimpijczyk) values ('Imię', 'Nazwisko', 'PESEL', 'Oczekuje na oplate', 0);
insert into logkandydaci (IdKandydata) value (415);
