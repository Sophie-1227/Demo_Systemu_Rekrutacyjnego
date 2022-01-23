DELIMITER $$
CREATE TRIGGER NewStudentToPreferencje
    BEFORE INSERT ON kandydaci
    FOR EACH ROW
    BEGIN
        IF new.NrRejestracyjny NOT IN (SELECT preferencjekandydata.IdKandydata from preferencjekandydata) THEN
            INSERT INTO preferencjekandydata (IdKandydata) VALUES (new.NrRejestracyjny);
        end if ;
    end ;
DELIMITER $$

DELIMITER $$
CREATE TRIGGER NewStudentToMatury
    BEFORE INSERT ON kandydaci
    FOR EACH ROW
    BEGIN
        IF new.NrRejestracyjny NOT IN (SELECT IdKandydata from wynikimatur) THEN
            INSERT INTO wynikimatur (IdKandydata) VALUES (new.NrRejestracyjny);
        end if ;
    end ;
DELIMITER $$

DELIMITER $$
CREATE TRIGGER CzyZadanaMatura
    BEFORE INSERT ON wynikimatur
    FOR EACH ROW
    BEGIN
        IF new.PolskiPodstawa<30 THEN
            UPDATE kandydaci
            SET status = 'odrzucony'
            WHERE NrRejestracyjny = new.IdKandydata;
        ELSEIF new.MatematykaPodstawa<30 THEN
            UPDATE kandydaci
            SET status = 'odrzucony'
            WHERE NrRejestracyjny = new.IdKandydata;
        ELSEIF new.JezykObcyNowozytnyPodstawa<30 THEN
            UPDATE kandydaci
            SET status = 'odrzucony'
            WHERE NrRejestracyjny = new.IdKandydata;
        end if ;
    end ;
DELIMITER $$
