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
  after insert on kandydaci
  for each row
  begin
    insert into logkandydaci (IdKandydata) value (new.NrRejestracyjny);
	  insert into wynikimatur (IdKandydata) values (new.NrRejestracyjny);
	  insert into preferencjekandydata (IdKandydata) value (new.NrRejestracyjny);
	  insert into wskaznik (IdKandydata) value (new.NrRejestracyjny);
  end;
DELIMITER ;

DELIMITER $$
drop trigger if exists NewPracownik;
create trigger NewPracownik
    after insert on pracownicy
    for each row
    begin
        set foreign_key_checks = 0;
        insert into pracownicylogi (IdPracownika) values (new.IdPracownika);
        set foreign_key_checks = 1;
    end ;
DELIMITER ;

/*
#kurde, tak się zastanawiam, bo jest tutaj problem, że nie można za bardzo w triggerze edytować tabeli, dla której został wywołany
delimiter $$
drop trigger if exists CheckStudent;
create trigger CheckStudent
  after insert on kandydaci
  for each row
  begin
		if length(new.PESEL) != 11 or new.Nazwisko is null or new.Imie is null then
			delete from kandydaci where NrRejestracyjny = new.NrRejestracyjny;
		end if ;
  end $$
delimiter ;
*/

DELIMITER $$
drop trigger if exists DeleteStudent;
create trigger DeleteStudent
  before delete On kandydaci
  for each row
  BEGIN
    set foreign_key_checks = 0;
		delete from preferencjekandydata where IdKandydata = old.NrRejestracyjny;
		delete from wynikimatur where IdKandydata = old.NrRejestracyjny;
    delete from logkandydaci where IdKandydata = old.NrRejestracyjny;
    delete from wskaznik where IdKandydata = old.NrRejestracyjny;
    set foreign_key_checks = 1;
	end;
DELIMITER ;

DELIMITER $$
drop trigger if exists DeletePracownik;
create trigger DeletePracownik
    before delete on pracownicy
    for each row
    begin
        set foreign_key_checks = 0;
        delete from pracownicylogi where IdPracownika = old.IdPracownika;
        set foreign_key_checks = 1;
    end ;
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
    end $$
DELIMITER ;
#tylko tutaj, jeśli ktoś wpisze i zatwierdzi coś poniżej 30 procent
# a potem mu się "przypomni", że jednak zdał, to trzeba będzie ręcznie mu przywrócić odpowiedni status


drop trigger if exists passSecureKandydat;
DELIMITER $$
CREATE TRIGGER passSecureKandydat
   before update ON logkandydaci
   FOR EACH ROW
   BEGIN
       #UPDATE logkandydaci
       SET new.securePass = COMPRESS(AES_ENCRYPT(new.Haslo, 27)), new.Haslo=null;
       #WHERE IdKandydata = new.IdKandydata;
   end ;
DELIMITER ;


drop trigger if exists passSecurePracownik;
DELIMITER $$
CREATE TRIGGER passSecurePracownik
   before INSERT ON pracownicylogi
   FOR EACH ROW
   BEGIN
       #UPDATE pracownicylogi
       SET new.securePass = COMPRESS(AES_ENCRYPT(new.Haslo, 27)), new.Haslo=null;
       #WHERE IdPracownika = new.IdPracownika;
   end ;
DELIMITER ;

drop trigger if exists UpdateWskazniki;
set foreign_key_checks =0;

DELIMITER $$
CREATE TRIGGER UpdateWskazniki
AFTER UPDATE ON wynikimatur
FOR EACH ROW
BEGIN
          DECLARE i INT DEFAULT 1;
        	DECLARE Id INT DEFAULT 1;
        	DECLARE mp DOUBLE DEFAULT 0;
        	DECLARE pp DOUBLE DEFAULT 0;
        	DECLARE jp DOUBLE DEFAULT 0;
        	DECLARE mr DOUBLE DEFAULT 0;
        	DECLARE jr DOUBLE DEFAULT 0;
        	DECLARE fiz DOUBLE DEFAULT 0;
        	DECLARE inf DOUBLE DEFAULT 0;
        	DECLARE biol DOUBLE DEFAULT 0;
  	      DECLARE chem DOUBLE DEFAULT 0;
        	DECLARE geo DOUBLE DEFAULT 0;
        	DECLARE m DOUBLE DEFAULT 0;
        	DECLARE p DOUBLE DEFAULT 0;
        	DECLARE jo DOUBLE DEFAULT 0;
        	DECLARE pd DOUBLE DEFAULT 0;
        	DECLARE e INT DEFAULT 0;
        	DECLARE w1 DOUBLE DEFAULT 0;
        	DECLARE w3 DOUBLE DEFAULT NULL;
        	DECLARE w2 DOUBLE DEFAULT NULL;
        	DECLARE w4 DOUBLE DEFAULT NULL;
        	DECLARE w5 DOUBLE DEFAULT NULL;
            DECLARE w6 DOUBLE DEFAULT NULL;
        	DECLARE n INT DEFAULT 1;
        	SET i = new.IdKandydata;
        	SET mp = (SELECT MatematykaPodstawa FROM wynikimatur WHERE IdKandydata=i);
        	SET mr = (SELECT MatematykaRozszerzenie FROM wynikimatur WHERE IdKandydata=i);
        	SET jp = (SELECT JezykObcyNowozytnyPodstawa FROM wynikimatur WHERE IdKandydata=i);
        	SET jr = (SELECT JezykObcyNowozytnyRozszerzenie FROM wynikimatur WHERE IdKandydata=i);
        	SET pp = (SELECT PolskiPodstawa FROM wynikimatur WHERE IdKandydata=i);
        	SET fiz = (SELECT FizykaRozszerzenie FROM wynikimatur WHERE IdKandydata=i);
        	SET inf = (SELECT InformatykaRozszerzenie FROM wynikimatur WHERE IdKandydata=i);
        	SET biol = (SELECT BiologiaRozszezrenie FROM wynikimatur WHERE IdKandydata=i);
        	SET chem = (SELECT ChemiaRozszezrenie FROM wynikimatur WHERE IdKandydata=i);
        	SET geo = (SELECT GeografiaRozszerzenie FROM wynikimatur WHERE IdKandydata=i);
        	#SET m = max(mp, mp+mr*1.5, mr*2,5);
        	IF mp>mr*2.5 THEN
            	SET m = mp;
        	ELSE
            	SET m = mr*2.5;
        	end if ;
        	IF m<mp+mr*1.5 THEN
            	SET m = mp + mr*1.5;
        	end if ;
        	#SET jo = max(jp*0.1, 0.1*(jp+jr*1.5), jr*0.25);
        	IF jp>jr*2.5 THEN
            	SET jo = jp;
        	ELSE
            	SET jo = jr*2.5;
        	end if ;
        	IF jo<jp+jr*1.5 THEN
       	     SET jo = jp + jr*1.5;
        	end if ;
        	SET jo = jo*0.1;
        	SET p = 0.1*pp;
        	SET fiz = 2.5*fiz;
        	SET chem = 2.5*chem;
        	SET biol = 2.5*biol;
        	SET geo = 2.5*geo;
        	SET inf = 2.5*inf;
        	WHILE n<7 DO
            	IF n=1 THEN
                	BEGIN
                   	SET Id = (SELECT Preferencja1 FROM preferencjekandydata WHERE IdKandydata=i);
                   	IF(Id IS NOT NULL) THEN
                       	IF(Id = 4 OR Id=5 OR Id=6 OR Id=7 OR Id=8) THEN #Dla W3 całego
                            	#SET pd = max(fiz, chem);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
       	                     ELSE
                              	SET pd = chem;
                           	end if ;
                        	ELSEIF (Id = 9 OR Id = 10 OR Id = 11 OR Id = 11 OR Id = 12 OR Id = 13 OR Id = 14 OR Id = 15 OR Id = 16 OR Id = 27 OR Id = 28 OR Id = 29 OR Id = 58 OR Id = 60) THEN #Dla W4, W8 i ITE na ZOD'ach
                           	#SET pd = max(fiz, inf);
                           	IF fiz>inf THEN
                               	SET pd = fiz;
             	               ELSE
                               	SET pd = inf;
                           	end if ;
                        	ELSEIF (Id = 23 OR Id = 54) THEN #dla GiG
                           	#SET pd = max(fiz, chem, geo);
           	                IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<geo THEN
                               	SET pd = geo;
                               	end if;
                            ELSEIF chem>geo THEN
                               	SET pd = chem;
                            ELSE
                              	 SET pd = geo;
                           	end if ;
                        	ELSEIF (Id = 22 OR Id = 24) THEN #dla GiK i GIT
                           	#SET pd = max(fiz, geo, inf);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<inf THEN
                               	SET pd = inf;
                               	end if;
                            ELSEIF geo>inf THEN
                               	SET pd = geo;
                            ELSE
                               	SET pd = inf;
                	           end if ;
                        	ELSEIF (Id = 26 OR Id = 42) THEN #dla TOS i IB
                           	#SET pd = max(fiz, chem, biol);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<biol then
                               	SET pd = biol;
                               	end if;
                            ELSEIF chem>biol THEN
                               	SET pd = chem;
                            ELSE
                               	SET pd = biol;
                           	end if ;
                      	  ELSEIF (Id = 1) THEN #dla ARC
                           	SET pd = fiz;
                           	SET e = RAND()*660 + 1;
                        	ELSE
                           	SET pd = fiz;
                       	end if ;
      	                 SET w1 = p + m + pd + e + jo;
                    	ELSE
                       	SET w1 = NULL;
                   	end if;
                	end ;
            	ELSEIF n=2 THEN
                	BEGIN
                   	SET Id = (SELECT Preferencja1 FROM preferencjekandydata WHERE IdKandydata=i);
                   	IF(Id IS NOT NULL) THEN
                       	IF(Id = 4 OR Id=5 OR Id=6 OR Id=7 OR Id=8) THEN #Dla W3 całego
                            	#SET pd = max(fiz, chem);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
       	                     ELSE
                              	SET pd = chem;
                           	end if ;
                        	ELSEIF (Id = 9 OR Id = 10 OR Id = 11 OR Id = 11 OR Id = 12 OR Id = 13 OR Id = 14 OR Id = 15 OR Id = 16 OR Id = 27 OR Id = 28 OR Id = 29 OR Id = 58 OR Id = 60) THEN #Dla W4, W8 i ITE na ZOD'ach
                           	#SET pd = max(fiz, inf);
                           	IF fiz>inf THEN
                               	SET pd = fiz;
             	               ELSE
                               	SET pd = inf;
                           	end if ;
                        	ELSEIF (Id = 23 OR Id = 54) THEN #dla GiG
                           	#SET pd = max(fiz, chem, geo);
           	                IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<geo THEN
                               	SET pd = geo;
                               	end if;
                            ELSEIF chem>geo THEN
                               	SET pd = chem;
                            ELSE
                              	 SET pd = geo;
                           	end if ;
                        	ELSEIF (Id = 22 OR Id = 24) THEN #dla GiK i GIT
                           	#SET pd = max(fiz, geo, inf);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<inf THEN
                               	SET pd = inf;
                               	end if;
                            ELSEIF geo>inf THEN
                               	SET pd = geo;
                            ELSE
                               	SET pd = inf;
                	           end if ;
                        	ELSEIF (Id = 26 OR Id = 42) THEN #dla TOS i IB
                           	#SET pd = max(fiz, chem, biol);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<biol then
                               	SET pd = biol;
                               	end if;
                            ELSEIF chem>biol THEN
                               	SET pd = chem;
                            ELSE
                               	SET pd = biol;
                           	end if ;
                      	  ELSEIF (Id = 1) THEN #dla ARC
                           	SET pd = fiz;
                           	SET e = RAND()*660 + 1;
                        	ELSE
                           	SET pd = fiz;
                       	end if ;
      	                 SET w2 = p + m + pd + e + jo;
                    	ELSE
                       	SET w2 = NULL;
                   	end if;
                	end ;
            	ELSEIF n=3 THEN
                	BEGIN
                   	SET Id = (SELECT Preferencja1 FROM preferencjekandydata WHERE IdKandydata=i);
                   	IF(Id IS NOT NULL) THEN
                       	IF(Id = 4 OR Id=5 OR Id=6 OR Id=7 OR Id=8) THEN #Dla W3 całego
                            	#SET pd = max(fiz, chem);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
       	                     ELSE
                              	SET pd = chem;
                           	end if ;
                        	ELSEIF (Id = 9 OR Id = 10 OR Id = 11 OR Id = 11 OR Id = 12 OR Id = 13 OR Id = 14 OR Id = 15 OR Id = 16 OR Id = 27 OR Id = 28 OR Id = 29 OR Id = 58 OR Id = 60) THEN #Dla W4, W8 i ITE na ZOD'ach
                           	#SET pd = max(fiz, inf);
                           	IF fiz>inf THEN
                               	SET pd = fiz;
             	               ELSE
                               	SET pd = inf;
                           	end if ;
                        	ELSEIF (Id = 23 OR Id = 54) THEN #dla GiG
                           	#SET pd = max(fiz, chem, geo);
           	                IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<geo THEN
                               	SET pd = geo;
                               	end if;
                            ELSEIF chem>geo THEN
                               	SET pd = chem;
                            ELSE
                              	 SET pd = geo;
                           	end if ;
                        	ELSEIF (Id = 22 OR Id = 24) THEN #dla GiK i GIT
                           	#SET pd = max(fiz, geo, inf);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<inf THEN
                               	SET pd = inf;
                               	end if;
                            ELSEIF geo>inf THEN
                               	SET pd = geo;
                            ELSE
                               	SET pd = inf;
                	           end if ;
                        	ELSEIF (Id = 26 OR Id = 42) THEN #dla TOS i IB
                           	#SET pd = max(fiz, chem, biol);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<biol then
                               	SET pd = biol;
                               	end if;
                            ELSEIF chem>biol THEN
                               	SET pd = chem;
                            ELSE
                               	SET pd = biol;
                           	end if ;
                      	  ELSEIF (Id = 1) THEN #dla ARC
                           	SET pd = fiz;
                           	SET e = RAND()*660 + 1;
                        	ELSE
                           	SET pd = fiz;
                       	end if ;
      	                 SET w3 = p + m + pd + e + jo;
                    	ELSE
                       	SET w3 = NULL;
                   	end if;
                	end ;
            	ELSEIF n=4 THEN
                	BEGIN
                   	SET Id = (SELECT Preferencja1 FROM preferencjekandydata WHERE IdKandydata=i);
                   	IF(Id IS NOT NULL) THEN
                       	IF(Id = 4 OR Id=5 OR Id=6 OR Id=7 OR Id=8) THEN #Dla W3 całego
                            	#SET pd = max(fiz, chem);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
       	                     ELSE
                              	SET pd = chem;
                           	end if ;
                        	ELSEIF (Id = 9 OR Id = 10 OR Id = 11 OR Id = 11 OR Id = 12 OR Id = 13 OR Id = 14 OR Id = 15 OR Id = 16 OR Id = 27 OR Id = 28 OR Id = 29 OR Id = 58 OR Id = 60) THEN #Dla W4, W8 i ITE na ZOD'ach
                           	#SET pd = max(fiz, inf);
                           	IF fiz>inf THEN
                               	SET pd = fiz;
             	               ELSE
                               	SET pd = inf;
                           	end if ;
                        	ELSEIF (Id = 23 OR Id = 54) THEN #dla GiG
                           	#SET pd = max(fiz, chem, geo);
           	                IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<geo THEN
                               	SET pd = geo;
                               	end if;
                            ELSEIF chem>geo THEN
                               	SET pd = chem;
                            ELSE
                              	 SET pd = geo;
                           	end if ;
                        	ELSEIF (Id = 22 OR Id = 24) THEN #dla GiK i GIT
                           	#SET pd = max(fiz, geo, inf);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<inf THEN
                               	SET pd = inf;
                               	end if;
                            ELSEIF geo>inf THEN
                               	SET pd = geo;
                            ELSE
                               	SET pd = inf;
                	           end if ;
                        	ELSEIF (Id = 26 OR Id = 42) THEN #dla TOS i IB
                           	#SET pd = max(fiz, chem, biol);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<biol then
                               	SET pd = biol;
                               	end if;
                            ELSEIF chem>biol THEN
                               	SET pd = chem;
                            ELSE
                               	SET pd = biol;
                           	end if ;
                      	  ELSEIF (Id = 1) THEN #dla ARC
                           	SET pd = fiz;
                           	SET e = RAND()*660 + 1;
                        	ELSE
                           	SET pd = fiz;
                       	end if ;
      	                 SET w4 = p + m + pd + e + jo;
                    	ELSE
                       	SET w4 = NULL;
                   	end if;
                	end ;
            	ELSEIF n=5 THEN
                	BEGIN
                   	SET Id = (SELECT Preferencja1 FROM preferencjekandydata WHERE IdKandydata=i);
                   	IF(Id IS NOT NULL) THEN
                       	IF(Id = 4 OR Id=5 OR Id=6 OR Id=7 OR Id=8) THEN #Dla W3 całego
                            	#SET pd = max(fiz, chem);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
       	                     ELSE
                              	SET pd = chem;
                           	end if ;
                        	ELSEIF (Id = 9 OR Id = 10 OR Id = 11 OR Id = 11 OR Id = 12 OR Id = 13 OR Id = 14 OR Id = 15 OR Id = 16 OR Id = 27 OR Id = 28 OR Id = 29 OR Id = 58 OR Id = 60) THEN #Dla W4, W8 i ITE na ZOD'ach
                           	#SET pd = max(fiz, inf);
                           	IF fiz>inf THEN
                               	SET pd = fiz;
             	               ELSE
                               	SET pd = inf;
                           	end if ;
                        	ELSEIF (Id = 23 OR Id = 54) THEN #dla GiG
                           	#SET pd = max(fiz, chem, geo);
           	                IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<geo THEN
                               	SET pd = geo;
                               	end if;
                            ELSEIF chem>geo THEN
                               	SET pd = chem;
                            ELSE
                              	 SET pd = geo;
                           	end if ;
                        	ELSEIF (Id = 22 OR Id = 24) THEN #dla GiK i GIT
                           	#SET pd = max(fiz, geo, inf);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<inf THEN
                               	SET pd = inf;
                               	end if;
                            ELSEIF geo>inf THEN
                               	SET pd = geo;
                            ELSE
                               	SET pd = inf;
                	           end if ;
                        	ELSEIF (Id = 26 OR Id = 42) THEN #dla TOS i IB
                           	#SET pd = max(fiz, chem, biol);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<biol then
                               	SET pd = biol;
                               	end if;
                            ELSEIF chem>biol THEN
                               	SET pd = chem;
                            ELSE
                               	SET pd = biol;
                           	end if ;
                      	  ELSEIF (Id = 1) THEN #dla ARC
                           	SET pd = fiz;
                           	SET e = RAND()*660 + 1;
                        	ELSE
                           	SET pd = fiz;
                       	end if ;
      	                 SET w5 = p + m + pd + e + jo;
                    	ELSE
                       	SET w5 = NULL;
                   	end if;
                	end ;
            	ELSEIF n=6 THEN
                	BEGIN
                   	SET Id = (SELECT Preferencja1 FROM preferencjekandydata WHERE IdKandydata=i);
                   	IF(Id IS NOT NULL) THEN
                       	IF(Id = 4 OR Id=5 OR Id=6 OR Id=7 OR Id=8) THEN #Dla W3 całego
                            	#SET pd = max(fiz, chem);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
       	                     ELSE
                              	SET pd = chem;
                           	end if ;
                        	ELSEIF (Id = 9 OR Id = 10 OR Id = 11 OR Id = 11 OR Id = 12 OR Id = 13 OR Id = 14 OR Id = 15 OR Id = 16 OR Id = 27 OR Id = 28 OR Id = 29 OR Id = 58 OR Id = 60) THEN #Dla W4, W8 i ITE na ZOD'ach
                           	#SET pd = max(fiz, inf);
                           	IF fiz>inf THEN
                               	SET pd = fiz;
             	               ELSE
                               	SET pd = inf;
                           	end if ;
                        	ELSEIF (Id = 23 OR Id = 54) THEN #dla GiG
                           	#SET pd = max(fiz, chem, geo);
           	                IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<geo THEN
                               	SET pd = geo;
                               	end if;
                            ELSEIF chem>geo THEN
                               	SET pd = chem;
                            ELSE
                              	 SET pd = geo;
                           	end if ;
                        	ELSEIF (Id = 22 OR Id = 24) THEN #dla GiK i GIT
                           	#SET pd = max(fiz, geo, inf);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<inf THEN
                               	SET pd = inf;
                               	end if;
                            ELSEIF geo>inf THEN
                               	SET pd = geo;
                            ELSE
                               	SET pd = inf;
                	           end if ;
                        	ELSEIF (Id = 26 OR Id = 42) THEN #dla TOS i IB
                           	#SET pd = max(fiz, chem, biol);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<biol then
                               	SET pd = biol;
                               	end if;
                            ELSEIF chem>biol THEN
                               	SET pd = chem;
                            ELSE
                               	SET pd = biol;
                           	end if ;
                      	  ELSEIF (Id = 1) THEN #dla ARC
                           	SET pd = fiz;
                           	SET e = RAND()*660 + 1;
                        	ELSE
                           	SET pd = fiz;
                       	end if ;
      	                 SET w6 = p + m + pd + e + jo;
                    	ELSE
                       	SET w6 = NULL;
                   	end if;
                	end ;
            	end if ;
	SET n = n+1;
            	end while ;
        	BEGIN
           	update wskaznik set WskaznikPref1 = w1,
           	                    WskaznikPref2 = w2,
           	                    WskaznikPref3 = w3,
           	                    WskaznikPref4 = w4,
           	                    WskaznikPref5 = w5,
           	                    WskaznikPref6 = w6
           	                where IdKandydata = i;
            	SET i = i+1;
        	end ;
        end ;

DELIMITER ;

drop trigger if exists UpdateWskazniki2;
set foreign_key_checks =0;
DELIMITER $$
CREATE TRIGGER UpdateWskazniki2
AFTER UPDATE ON preferencjekandydata
FOR EACH ROW
BEGIN
          DECLARE i INT DEFAULT 1;
        	DECLARE Id INT DEFAULT 1;
        	DECLARE mp DOUBLE DEFAULT 0;
        	DECLARE pp DOUBLE DEFAULT 0;
        	DECLARE jp DOUBLE DEFAULT 0;
        	DECLARE mr DOUBLE DEFAULT 0;
        	DECLARE jr DOUBLE DEFAULT 0;
        	DECLARE fiz DOUBLE DEFAULT 0;
        	DECLARE inf DOUBLE DEFAULT 0;
        	DECLARE biol DOUBLE DEFAULT 0;
  	      DECLARE chem DOUBLE DEFAULT 0;
        	DECLARE geo DOUBLE DEFAULT 0;
        	DECLARE m DOUBLE DEFAULT 0;
        	DECLARE p DOUBLE DEFAULT 0;
        	DECLARE jo DOUBLE DEFAULT 0;
        	DECLARE pd DOUBLE DEFAULT 0;
        	DECLARE e INT DEFAULT 0;
        	DECLARE w1 DOUBLE DEFAULT 0;
        	DECLARE w3 DOUBLE DEFAULT NULL;
        	DECLARE w2 DOUBLE DEFAULT NULL;
        	DECLARE w4 DOUBLE DEFAULT NULL;
        	DECLARE w5 DOUBLE DEFAULT NULL;
            DECLARE w6 DOUBLE DEFAULT NULL;
        	DECLARE n INT DEFAULT 1;
        	SET i = new.IdKandydata;
        	SET mp = (SELECT MatematykaPodstawa FROM wynikimatur WHERE IdKandydata=i);
        	SET mr = (SELECT MatematykaRozszerzenie FROM wynikimatur WHERE IdKandydata=i);
        	SET jp = (SELECT JezykObcyNowozytnyPodstawa FROM wynikimatur WHERE IdKandydata=i);
        	SET jr = (SELECT JezykObcyNowozytnyRozszerzenie FROM wynikimatur WHERE IdKandydata=i);
        	SET pp = (SELECT PolskiPodstawa FROM wynikimatur WHERE IdKandydata=i);
        	SET fiz = (SELECT FizykaRozszerzenie FROM wynikimatur WHERE IdKandydata=i);
        	SET inf = (SELECT InformatykaRozszerzenie FROM wynikimatur WHERE IdKandydata=i);
        	SET biol = (SELECT BiologiaRozszezrenie FROM wynikimatur WHERE IdKandydata=i);
        	SET chem = (SELECT ChemiaRozszezrenie FROM wynikimatur WHERE IdKandydata=i);
        	SET geo = (SELECT GeografiaRozszerzenie FROM wynikimatur WHERE IdKandydata=i);
        	#SET m = max(mp, mp+mr*1.5, mr*2,5);
        	IF mp>mr*2.5 THEN
            	SET m = mp;
        	ELSE
            	SET m = mr*2.5;
        	end if ;
        	IF m<mp+mr*1.5 THEN
            	SET m = mp + mr*1.5;
        	end if ;
        	#SET jo = max(jp*0.1, 0.1*(jp+jr*1.5), jr*0.25);
        	IF jp>jr*2.5 THEN
            	SET jo = jp;
        	ELSE
            	SET jo = jr*2.5;
        	end if ;
        	IF jo<jp+jr*1.5 THEN
       	     SET jo = jp + jr*1.5;
        	end if ;
        	SET jo = jo*0.1;
        	SET p = 0.1*pp;
        	SET fiz = 2.5*fiz;
        	SET chem = 2.5*chem;
        	SET biol = 2.5*biol;
        	SET geo = 2.5*geo;
        	SET inf = 2.5*inf;
        	WHILE n<7 DO
            	IF n=1 THEN
                	BEGIN
                   	SET Id = (SELECT Preferencja1 FROM preferencjekandydata WHERE IdKandydata=i);
                   	IF(Id IS NOT NULL) THEN
                       	IF(Id = 4 OR Id=5 OR Id=6 OR Id=7 OR Id=8) THEN #Dla W3 całego
                            	#SET pd = max(fiz, chem);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
       	                     ELSE
                              	SET pd = chem;
                           	end if ;
                        	ELSEIF (Id = 9 OR Id = 10 OR Id = 11 OR Id = 11 OR Id = 12 OR Id = 13 OR Id = 14 OR Id = 15 OR Id = 16 OR Id = 27 OR Id = 28 OR Id = 29 OR Id = 58 OR Id = 60) THEN #Dla W4, W8 i ITE na ZOD'ach
                           	#SET pd = max(fiz, inf);
                           	IF fiz>inf THEN
                               	SET pd = fiz;
             	               ELSE
                               	SET pd = inf;
                           	end if ;
                        	ELSEIF (Id = 23 OR Id = 54) THEN #dla GiG
                           	#SET pd = max(fiz, chem, geo);
           	                IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<geo THEN
                               	SET pd = geo;
                               	end if;
                            ELSEIF chem>geo THEN
                               	SET pd = chem;
                            ELSE
                              	 SET pd = geo;
                           	end if ;
                        	ELSEIF (Id = 22 OR Id = 24) THEN #dla GiK i GIT
                           	#SET pd = max(fiz, geo, inf);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<inf THEN
                               	SET pd = inf;
                               	end if;
                            ELSEIF geo>inf THEN
                               	SET pd = geo;
                            ELSE
                               	SET pd = inf;
                	           end if ;
                        	ELSEIF (Id = 26 OR Id = 42) THEN #dla TOS i IB
                           	#SET pd = max(fiz, chem, biol);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<biol then
                               	SET pd = biol;
                               	end if;
                            ELSEIF chem>biol THEN
                               	SET pd = chem;
                            ELSE
                               	SET pd = biol;
                           	end if ;
                      	  ELSEIF (Id = 1) THEN #dla ARC
                           	SET pd = fiz;
                           	SET e = RAND()*660 + 1;
                        	ELSE
                           	SET pd = fiz;
                       	end if ;
      	                 SET w1 = p + m + pd + e + jo;
                    	ELSE
                       	SET w1 = NULL;
                   	end if;
                	end ;
            	ELSEIF n=2 THEN
                	BEGIN
                   	SET Id = (SELECT Preferencja1 FROM preferencjekandydata WHERE IdKandydata=i);
                   	IF(Id IS NOT NULL) THEN
                       	IF(Id = 4 OR Id=5 OR Id=6 OR Id=7 OR Id=8) THEN #Dla W3 całego
                            	#SET pd = max(fiz, chem);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
       	                     ELSE
                              	SET pd = chem;
                           	end if ;
                        	ELSEIF (Id = 9 OR Id = 10 OR Id = 11 OR Id = 11 OR Id = 12 OR Id = 13 OR Id = 14 OR Id = 15 OR Id = 16 OR Id = 27 OR Id = 28 OR Id = 29 OR Id = 58 OR Id = 60) THEN #Dla W4, W8 i ITE na ZOD'ach
                           	#SET pd = max(fiz, inf);
                           	IF fiz>inf THEN
                               	SET pd = fiz;
             	               ELSE
                               	SET pd = inf;
                           	end if ;
                        	ELSEIF (Id = 23 OR Id = 54) THEN #dla GiG
                           	#SET pd = max(fiz, chem, geo);
           	                IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<geo THEN
                               	SET pd = geo;
                               	end if;
                            ELSEIF chem>geo THEN
                               	SET pd = chem;
                            ELSE
                              	 SET pd = geo;
                           	end if ;
                        	ELSEIF (Id = 22 OR Id = 24) THEN #dla GiK i GIT
                           	#SET pd = max(fiz, geo, inf);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<inf THEN
                               	SET pd = inf;
                               	end if;
                            ELSEIF geo>inf THEN
                               	SET pd = geo;
                            ELSE
                               	SET pd = inf;
                	           end if ;
                        	ELSEIF (Id = 26 OR Id = 42) THEN #dla TOS i IB
                           	#SET pd = max(fiz, chem, biol);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<biol then
                               	SET pd = biol;
                               	end if;
                            ELSEIF chem>biol THEN
                               	SET pd = chem;
                            ELSE
                               	SET pd = biol;
                           	end if ;
                      	  ELSEIF (Id = 1) THEN #dla ARC
                           	SET pd = fiz;
                           	SET e = RAND()*660 + 1;
                        	ELSE
                           	SET pd = fiz;
                       	end if ;
      	                 SET w2 = p + m + pd + e + jo;
                    	ELSE
                       	SET w2 = NULL;
                   	end if;
                	end ;
            	ELSEIF n=3 THEN
                	BEGIN
                   	SET Id = (SELECT Preferencja1 FROM preferencjekandydata WHERE IdKandydata=i);
                   	IF(Id IS NOT NULL) THEN
                       	IF(Id = 4 OR Id=5 OR Id=6 OR Id=7 OR Id=8) THEN #Dla W3 całego
                            	#SET pd = max(fiz, chem);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
       	                     ELSE
                              	SET pd = chem;
                           	end if ;
                        	ELSEIF (Id = 9 OR Id = 10 OR Id = 11 OR Id = 11 OR Id = 12 OR Id = 13 OR Id = 14 OR Id = 15 OR Id = 16 OR Id = 27 OR Id = 28 OR Id = 29 OR Id = 58 OR Id = 60) THEN #Dla W4, W8 i ITE na ZOD'ach
                           	#SET pd = max(fiz, inf);
                           	IF fiz>inf THEN
                               	SET pd = fiz;
             	               ELSE
                               	SET pd = inf;
                           	end if ;
                        	ELSEIF (Id = 23 OR Id = 54) THEN #dla GiG
                           	#SET pd = max(fiz, chem, geo);
           	                IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<geo THEN
                               	SET pd = geo;
                               	end if;
                            ELSEIF chem>geo THEN
                               	SET pd = chem;
                            ELSE
                              	 SET pd = geo;
                           	end if ;
                        	ELSEIF (Id = 22 OR Id = 24) THEN #dla GiK i GIT
                           	#SET pd = max(fiz, geo, inf);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<inf THEN
                               	SET pd = inf;
                               	end if;
                            ELSEIF geo>inf THEN
                               	SET pd = geo;
                            ELSE
                               	SET pd = inf;
                	           end if ;
                        	ELSEIF (Id = 26 OR Id = 42) THEN #dla TOS i IB
                           	#SET pd = max(fiz, chem, biol);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<biol then
                               	SET pd = biol;
                               	end if;
                            ELSEIF chem>biol THEN
                               	SET pd = chem;
                            ELSE
                               	SET pd = biol;
                           	end if ;
                      	  ELSEIF (Id = 1) THEN #dla ARC
                           	SET pd = fiz;
                           	SET e = RAND()*660 + 1;
                        	ELSE
                           	SET pd = fiz;
                       	end if ;
      	                 SET w3 = p + m + pd + e + jo;
                    	ELSE
                       	SET w3 = NULL;
                   	end if;
                	end ;
            	ELSEIF n=4 THEN
                	BEGIN
                   	SET Id = (SELECT Preferencja1 FROM preferencjekandydata WHERE IdKandydata=i);
                   	IF(Id IS NOT NULL) THEN
                       	IF(Id = 4 OR Id=5 OR Id=6 OR Id=7 OR Id=8) THEN #Dla W3 całego
                            	#SET pd = max(fiz, chem);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
       	                     ELSE
                              	SET pd = chem;
                           	end if ;
                        	ELSEIF (Id = 9 OR Id = 10 OR Id = 11 OR Id = 11 OR Id = 12 OR Id = 13 OR Id = 14 OR Id = 15 OR Id = 16 OR Id = 27 OR Id = 28 OR Id = 29 OR Id = 58 OR Id = 60) THEN #Dla W4, W8 i ITE na ZOD'ach
                           	#SET pd = max(fiz, inf);
                           	IF fiz>inf THEN
                               	SET pd = fiz;
             	               ELSE
                               	SET pd = inf;
                           	end if ;
                        	ELSEIF (Id = 23 OR Id = 54) THEN #dla GiG
                           	#SET pd = max(fiz, chem, geo);
           	                IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<geo THEN
                               	SET pd = geo;
                               	end if;
                            ELSEIF chem>geo THEN
                               	SET pd = chem;
                            ELSE
                              	 SET pd = geo;
                           	end if ;
                        	ELSEIF (Id = 22 OR Id = 24) THEN #dla GiK i GIT
                           	#SET pd = max(fiz, geo, inf);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<inf THEN
                               	SET pd = inf;
                               	end if;
                            ELSEIF geo>inf THEN
                               	SET pd = geo;
                            ELSE
                               	SET pd = inf;
                	           end if ;
                        	ELSEIF (Id = 26 OR Id = 42) THEN #dla TOS i IB
                           	#SET pd = max(fiz, chem, biol);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<biol then
                               	SET pd = biol;
                               	end if;
                            ELSEIF chem>biol THEN
                               	SET pd = chem;
                            ELSE
                               	SET pd = biol;
                           	end if ;
                      	  ELSEIF (Id = 1) THEN #dla ARC
                           	SET pd = fiz;
                           	SET e = RAND()*660 + 1;
                        	ELSE
                           	SET pd = fiz;
                       	end if ;
      	                 SET w4 = p + m + pd + e + jo;
                    	ELSE
                       	SET w4 = NULL;
                   	end if;
                	end ;
            	ELSEIF n=5 THEN
                	BEGIN
                   	SET Id = (SELECT Preferencja1 FROM preferencjekandydata WHERE IdKandydata=i);
                   	IF(Id IS NOT NULL) THEN
                       	IF(Id = 4 OR Id=5 OR Id=6 OR Id=7 OR Id=8) THEN #Dla W3 całego
                            	#SET pd = max(fiz, chem);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
       	                     ELSE
                              	SET pd = chem;
                           	end if ;
                        	ELSEIF (Id = 9 OR Id = 10 OR Id = 11 OR Id = 11 OR Id = 12 OR Id = 13 OR Id = 14 OR Id = 15 OR Id = 16 OR Id = 27 OR Id = 28 OR Id = 29 OR Id = 58 OR Id = 60) THEN #Dla W4, W8 i ITE na ZOD'ach
                           	#SET pd = max(fiz, inf);
                           	IF fiz>inf THEN
                               	SET pd = fiz;
             	               ELSE
                               	SET pd = inf;
                           	end if ;
                        	ELSEIF (Id = 23 OR Id = 54) THEN #dla GiG
                           	#SET pd = max(fiz, chem, geo);
           	                IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<geo THEN
                               	SET pd = geo;
                               	end if;
                            ELSEIF chem>geo THEN
                               	SET pd = chem;
                            ELSE
                              	 SET pd = geo;
                           	end if ;
                        	ELSEIF (Id = 22 OR Id = 24) THEN #dla GiK i GIT
                           	#SET pd = max(fiz, geo, inf);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<inf THEN
                               	SET pd = inf;
                               	end if;
                            ELSEIF geo>inf THEN
                               	SET pd = geo;
                            ELSE
                               	SET pd = inf;
                	           end if ;
                        	ELSEIF (Id = 26 OR Id = 42) THEN #dla TOS i IB
                           	#SET pd = max(fiz, chem, biol);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<biol then
                               	SET pd = biol;
                               	end if;
                            ELSEIF chem>biol THEN
                               	SET pd = chem;
                            ELSE
                               	SET pd = biol;
                           	end if ;
                      	  ELSEIF (Id = 1) THEN #dla ARC
                           	SET pd = fiz;
                           	SET e = RAND()*660 + 1;
                        	ELSE
                           	SET pd = fiz;
                       	end if ;
      	                 SET w5 = p + m + pd + e + jo;
                    	ELSE
                       	SET w5 = NULL;
                   	end if;
                	end ;
            	ELSEIF n=6 THEN
                	BEGIN
                   	SET Id = (SELECT Preferencja1 FROM preferencjekandydata WHERE IdKandydata=i);
                   	IF(Id IS NOT NULL) THEN
                       	IF(Id = 4 OR Id=5 OR Id=6 OR Id=7 OR Id=8) THEN #Dla W3 całego
                            	#SET pd = max(fiz, chem);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
       	                     ELSE
                              	SET pd = chem;
                           	end if ;
                        	ELSEIF (Id = 9 OR Id = 10 OR Id = 11 OR Id = 11 OR Id = 12 OR Id = 13 OR Id = 14 OR Id = 15 OR Id = 16 OR Id = 27 OR Id = 28 OR Id = 29 OR Id = 58 OR Id = 60) THEN #Dla W4, W8 i ITE na ZOD'ach
                           	#SET pd = max(fiz, inf);
                           	IF fiz>inf THEN
                               	SET pd = fiz;
             	               ELSE
                               	SET pd = inf;
                           	end if ;
                        	ELSEIF (Id = 23 OR Id = 54) THEN #dla GiG
                           	#SET pd = max(fiz, chem, geo);
           	                IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<geo THEN
                               	SET pd = geo;
                               	end if;
                            ELSEIF chem>geo THEN
                               	SET pd = chem;
                            ELSE
                              	 SET pd = geo;
                           	end if ;
                        	ELSEIF (Id = 22 OR Id = 24) THEN #dla GiK i GIT
                           	#SET pd = max(fiz, geo, inf);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<inf THEN
                               	SET pd = inf;
                               	end if;
                            ELSEIF geo>inf THEN
                               	SET pd = geo;
                            ELSE
                               	SET pd = inf;
                	           end if ;
                        	ELSEIF (Id = 26 OR Id = 42) THEN #dla TOS i IB
                           	#SET pd = max(fiz, chem, biol);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                               	IF pd<biol then
                               	SET pd = biol;
                               	end if;
                            ELSEIF chem>biol THEN
                               	SET pd = chem;
                            ELSE
                               	SET pd = biol;
                           	end if ;
                      	  ELSEIF (Id = 1) THEN #dla ARC
                           	SET pd = fiz;
                           	SET e = RAND()*660 + 1;
                        	ELSE
                           	SET pd = fiz;
                       	end if ;
      	                 SET w6 = p + m + pd + e + jo;
                    	ELSE
                       	SET w6 = NULL;
                   	end if;
                	end ;
            	end if ;
	SET n = n+1;
            	end while ;
        	BEGIN
           	update wskaznik set WskaznikPref1 = w1,
           	                    WskaznikPref2 = w2,
           	                    WskaznikPref3 = w3,
           	                    WskaznikPref4 = w4,
           	                    WskaznikPref5 = w5,
           	                    WskaznikPref6 = w6
           	                where IdKandydata = i;
            	SET i = i+1;
        	end ;
        end ;

DELIMITER ;
