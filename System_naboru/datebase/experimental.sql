DELIMITER $$
drop procedure if exists FillWskazniki;
set foreign_key_checks = 0;
CREATE PROCEDURE FillWskazniki()
BEGIN
	DECLARE i INT DEFAULT 1;
	WHILE i<(select count(*) from kandydaci) DO
    	BEGIN
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
        	IF m<m+mr*1.5 THEN
            	SET m = m + mr*1.5;
        	end if ;
        	#SET jo = max(jp*0.1, 0.1*(jp+jr*1.5), jr*0.25);
        	IF jp>jr*2.5 THEN
            	SET jo = jp;
        	ELSE
            	SET jo = jr*2.5;
        	end if ;
        	IF jo<jo+jr*1.5 THEN
       	     SET jo = jo + jr*1.5;
        	end if ;
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
                       	IF(Id = 4 OR Id=5 OR Id=6 OR Id=7 OR Id=8) THEN #Dla W3 ca??ego
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
                            	ELSEIF chem>geo THEN
                               	SET pd = chem;
                            	ELSE
                              	 SET pd = geo;
                           	end if ;
                        	ELSEIF (Id = 22 OR Id = 24) THEN #dla GiK i GIT
                           	#SET pd = max(fiz, geo, inf);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                            	ELSEIF geo>inf THEN
                               	SET pd = geo;
                            	ELSE
                               	SET pd = inf;
                	           end if ;
                        	ELSEIF (Id = 26 OR Id = 42) THEN #dla TOS i IB
                           	#SET pd = max(fiz, chem, biol);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
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
                   	SET Id = (SELECT Preferencja2 FROM preferencjekandydata WHERE IdKandydata=i);
                   	IF(Id IS NOT NULL) THEN
                       	IF(Id = 4 OR Id=5 OR Id=6 OR Id=7 OR Id=8) THEN #Dla W3 ca??ego
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
 	                           ELSEIF chem>geo THEN
                               	SET pd = chem;
                            	ELSE
                               	SET pd = geo;
                           	end if ;
                        	ELSEIF (Id = 22 OR Id = 24) THEN #dla GiK i GIT
                           	#SET pd = max(fiz, geo, inf);
                           	IF fiz>chem THEN
                           	    SET pd = fiz;
                            	ELSEIF geo>inf THEN
                               	SET pd = geo;
                            	ELSE
                               	SET pd = inf;
                           	end if ;
       	                 ELSEIF (Id = 26 OR Id = 42) THEN #dla TOS i IB
                           	#SET pd = max(fiz, chem, biol);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
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
        	           SET Id = (SELECT Preferencja3 FROM preferencjekandydata WHERE IdKandydata=i);
                   	IF(Id IS NOT NULL) THEN
                       	IF(Id = 4 OR Id=5 OR Id=6 OR Id=7 OR Id=8) THEN #Dla W3 ca??ego
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
                            	ELSEIF chem>geo THEN
                               	SET pd = chem;
                            	ELSE
                               	SET pd = geo;
                           	end if ;
                       	 ELSEIF (Id = 22 OR Id = 24) THEN #dla GiK i GIT
                           	#SET pd = max(fiz, geo, inf);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                            	ELSEIF geo>inf THEN
                               	SET pd = geo;
                            	ELSE
                               	SET pd = inf;
                           	end if ;
                        	ELSEIF (Id = 26 OR Id = 42) THEN #dla TOS i IB
                               #SET pd = max(fiz, chem, biol);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
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
                   	SET Id = (SELECT Preferencja4 FROM preferencjekandydata WHERE IdKandydata=i);
                   	IF(Id IS NOT NULL) THEN
                       	IF(Id = 4 OR Id=5 OR Id=6 OR Id=7 OR Id=8) THEN #Dla W3 ca??ego
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
                            	ELSEIF chem>geo THEN
                               	SET pd = chem;
                            	ELSE
                               	SET pd = geo;
                           	end if ;
                        	ELSEIF (Id = 22 OR Id = 24) THEN #dla GiK i GIT
                           	#SET pd = max(fiz, geo, inf);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                            	ELSEIF geo>inf THEN
                               	SET pd = geo;
                            	ELSE
    	                           SET pd = inf;
                           	end if ;
                        	ELSEIF (Id = 26 OR Id = 42) THEN #dla TOS i IB
                           	#SET pd = max(fiz, chem, biol);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
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
                   	SET Id = (SELECT Preferencja5 FROM preferencjekandydata WHERE IdKandydata=i);
                   	IF(Id IS NOT NULL) THEN
      	                 IF(Id = 4 OR Id=5 OR Id=6 OR Id=7 OR Id=8) THEN #Dla W3 ca??ego
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
                            	ELSEIF chem>geo THEN
                               	SET pd = chem;
                            	ELSE
                               	SET pd = geo;
                           	end if ;
                        	ELSEIF (Id = 22 OR Id = 24) THEN #dla GiK i GIT
                           	#SET pd = max(fiz, geo, inf);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                            	ELSEIF geo>inf THEN
                               	SET pd = geo;
                            	ELSE
    	                           SET pd = inf;
                           	end if ;
                        	ELSEIF (Id = 26 OR Id = 42) THEN #dla TOS i IB
                           	#SET pd = max(fiz, chem, biol);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
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
                   	SET Id = (SELECT Preferencja6 FROM preferencjekandydata WHERE IdKandydata=i);
                   	IF(Id IS NOT NULL) THEN
       	                IF(Id = 4 OR Id=5 OR Id=6 OR Id=7 OR Id=8) THEN #Dla W3 ca??ego
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
                            	ELSEIF chem>geo THEN
                               	SET pd = chem;
                            	ELSE
                               	SET pd = geo;
                           	end if ;
                        	ELSEIF (Id = 22 OR Id = 24) THEN #dla GiK i GIT
                           	#SET pd = max(fiz, geo, inf);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
                            	ELSEIF geo>inf THEN
                               	SET pd = geo;
                            	ELSE
    	                           SET pd = inf;
                           	end if ;
                        	ELSEIF (Id = 26 OR Id = 42) THEN #dla TOS i IB
                           	#SET pd = max(fiz, chem, biol);
                           	IF fiz>chem THEN
                               	SET pd = fiz;
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
            	set n = n+1;
            	end while ;
        	BEGIN
           	INSERT INTO wskaznik
                	VALUES (i, w1, w2, w3, w4, w5, w6);
            	SET i = i+1;
        	end ;
        end ;
    	end while;
end ;
DELIMITER ;

call FillWskazniki();

