DELIMITER $$
drop procedure if exists  FillPreferencje;
set foreign_key_checks = 0;
CREATE PROCEDURE FillPreferencje()
BEGIN
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
end $$
DELIMITER ;

CALL FillPreferencje();

DELIMITER $$
drop procedure if exists FillMatury;
set foreign_key_checks = 0;
CREATE PROCEDURE FillMatury()
BEGIN
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
end $$
DELIMITER ;

CALL FillMatury();


