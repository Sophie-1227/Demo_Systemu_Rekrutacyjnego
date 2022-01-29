#utworzenie odpowiednich ról
#admin będzie po prostu rootem
drop role if exists  appWorker;
drop role if exists  appCandidate;
create role appWorker;
create role appCandidate;

#appCandidate
grant select on kandydaci to appCandidate;
grant select on wskaznik to appCandidate;
grant select on wynikimatur to appCandidate;
grant select on preferencjekandydata to appCandidate;
grant select on kierunki to appCandidate;

grant insert on kandydaci to appCandidate;
grant insert on wynikimatur to appCandidate;
grant insert on preferencjekandydata to appCandidate;

grant update on preferencjekandydata to appCandidate;

#appWorker
grant select on kandydaci to appWorker;
grant select on wynikimatur to appWorker;
grant select on preferencjekandydata to appWorker;
grant select on kierunki to appWorker;
grant select on boolwskaznikikierunki to appWorker;

grant update on kandydaci to appWorker;
grant update on wynikimatur to appWorker;
grant update on preferencjekandydata to appWorker;

grant insert on kandydaci to appWorker;

#grant execute on function  to appWorker;
#doda się jak już będą takie funkcje

drop user if exists Candidate@localhost;
create user Candidate@localhost;
set password for Candidate@localhost = password('PinkiePIeIsTheBest');
alter user Candidate@localhost with
max_updates_per_hour 5;
alter user Candidate@localhost with
max_queries_per_hour 20;
grant appCandidate to Candidate@localhost;

drop user if exists Worker@localhost;
create user Worker@localhost;
set password for Worker@localhost = password('TylkoJednoWGlowieMam');
grant appWorker to Worker@localhost;

drop user if exists LogCheck@localhost;
create user LogCheck@localhost;
set password for LogCheck@localhost = password('kardynal');
grant select on pracownicylogi to LogCheck@localhost;
grant select on logkandydaci to LogCheck@localhost;
