/*
DELIMITER $$
drop trigger if exists NewStudentToPreferencje;
CREATE TRIGGER NewStudentToPreferencje
    BEFORE INSERT ON kandydaci
    FOR EACH ROW
    BEGIN
        IF new.NrRejestracyjny NOT IN (SELECT preferencjekandydata.IdKandydata from preferencjekandydata) THEN
            INSERT INTO preferencjekandydata (IdKandydata) VALUES (new.NrRejestracyjny);
        end if ;
    end ;
DELIMITER ;

DELIMITER $$
drop trigger if exists NewStudentToMatury;
CREATE TRIGGER NewStudentToMatury
    BEFORE INSERT ON kandydaci
    FOR EACH ROW
    BEGIN
        IF new.NrRejestracyjny NOT IN (SELECT IdKandydata from wynikimatur) THEN
            INSERT INTO wynikimatur (IdKandydata) VALUES (new.NrRejestracyjny);
        end if ;
    end ;
DELIMITER ;
*/
delimiter $$
drop trigger if exists NewStudent;
create trigger NewStudent
  before insert on kandydaci
  for each row
  begin
	  insert into wynikimatur (IdKandydata) values (new.NrRejestracyjny);
	  insert into preferencjekandydata (IdKandydata) value (new.NrRejestracyjny);
  end;
DELIMITER ;

DELIMITER $$
drop trigger if exists DeleteStudent;
create trigger DeleteStudent
  before delete On kandydaci
  for each row
  BEGIN
    set foreign_key_checks = 0;
		delete from preferencjekandydata where IdKandydata = old.NrRejestracyjny;
		delete from wynikimatur where IdKandydata = old.NrRejestracyjny;
    set foreign_key_checks = 1;
	end;
DELIMITER ;

delimiter $$
drop trigger if exists  CzyZdanaMatura;
CREATE TRIGGER CzyZdanaMatura
    BEFORE update ON wynikimatur
    FOR EACH ROW
    BEGIN
        IF new.PolskiPodstawa<30 or new.MatematykaPodstawa<30 or new.JezykObcyNowozytnyPodstawa<30 THEN
            UPDATE kandydaci
            SET status = 'odrzucony'
            WHERE NrRejestracyjny = new.IdKandydata;
        end if ;
    end ;
DELIMITER ;
#tylko tutaj, jeśli ktoś wpisze i zatwierdzi coś poniżej 30 procent
# a potem mu się "przypomni", że jednak zdał, to trzeba będzie ręcznie mu przywrócić odpowiedni status