create table Kandydaci
(
             	NrRejestracyjny int,
             	Imie varchar(30) not null,
             	Nazwisko varchar(30) not null,
             	PESEL char(11) not null,
             	Status enum('Zlozono dokumenty', 'Przyjety', 'Oczekuje na oplate', 'Odrzucony', 'Nieprzyjety', 'Wniesiono oplate', 'Zakwalifikowany do przyjecia') default 'Oczekuje na oplate' not null,
             	Ewidencja int default null,
             	CzyOlimpijczyk boolean default false not null,
             	FOREIGN KEY (Ewidencja) REFERENCES pracownicy(IdPracownika)
);

create unique index Kandydaci_NrRejestracyjny_uindex
             	on Kandydaci (NrRejestracyjny);

create unique index Kandydaci_PESEL_uindex
             	on Kandydaci (PESEL);

alter table Kandydaci
             	add constraint Kandydaci_pk
                              	primary key (NrRejestracyjny);

alter table Kandydaci modify NrRejestracyjny int auto_increment;

create table Pracownicy
(
             	IdPracownika int,
             	Imie varchar(30) not null,
             	Nazwisko varchar(30) not null,
             	Jednostka varchar(30) null
);

create unique index Pracownicy_IdPracownika_uindex
             	on Pracownicy (IdPracownika);

alter table Pracownicy
             	add constraint Pracownicy_pk
                              	primary key (IdPracownika);

alter table Pracownicy modify IdPracownika int auto_increment;


create table Kierunki
(
             	IdKierunku int,
             	NazwaWydziału varchar(60) not null,
             	NazwaKierunku varchar(60) not null,
             	LimitMiejsc int not null,
             	KodWydzialu varchar(3) not null,
             	KodKierunku varchar(10) not null,
             	primary key (IdKierunku)
);

create unique index Kierunki_IdKierunku_uindex
             	on Kierunki (IdKierunku);

alter table Kierunki modify IdKierunku int auto_increment;

create table WynikiMatur
(
             	IdKandydata int not null,
             	PolskiPodstawa int not null default 0,
             	MatematykaPodstawa int not null default 0,
             	MatematykaRozszerzenie int null default 0,
             	JezykObcyNowozytnyPodstawa int not null default 0,
             	JezykObcyNowozytnyRozszerzenie int null default 0,
             	FizykaRozszerzenie int null default 0,
             	ChemiaRozszezrenie int null default 0,
             	BiologiaRozszezrenie int null default 0,
             	InformatykaRozszerzenie int null default 0,
             	GeografiaRozszerzenie int null default 0,
             	EgzaminZRysunku int null default 0,
             	check ( PolskiPodstawa>=0 ),
             	check ( PolskiPodstawa <= 100 ),
             	check ( MatematykaPodstawa>=0),
             	check ( MatematykaPodstawa<=100 ),
             	check ( MatematykaRozszerzenie>=0 ),
             	check ( MatematykaRozszerzenie<=100 ),
             	check ( JezykObcyNowozytnyPodstawa>=0 ),
             	check ( JezykObcyNowozytnyPodstawa<=100 ),
             	check ( JezykObcyNowozytnyRozszerzenie>=0 ),
             	check ( JezykObcyNowozytnyRozszerzenie<=100 ),
             	check ( FizykaRozszerzenie>=0 ),
             	check ( FizykaRozszerzenie<=100 ),
             	check ( ChemiaRozszezrenie>=0 ),
             	check ( ChemiaRozszezrenie<=100 ),
             	check ( BiologiaRozszezrenie>=0 ),
             	check ( BiologiaRozszezrenie<=100 ),
             	check ( InformatykaRozszerzenie>=0 ),
             	check ( InformatykaRozszerzenie<=100 ),
             	check ( GeografiaRozszerzenie>=0 ),
             	check ( GeografiaRozszerzenie<=100 ),
             	check ( EgzaminZRysunku>=0 ),
             	check ( EgzaminZRysunku < 661 ),
             	primary key (IdKandydata),
FOREIGN KEY (IdKandydata) REFERENCES kandydaci(NrRejestracyjny)
);

create unique index WynikiMatur_IdKandydata_uindex
             	on WynikiMatur (IdKandydata);

create table BoolWskaznikiKierunki
(
             	IdKierunku int not null,
             	CzyPolskiPodstawa boolean default 0 not null,
             	CzyMatematykaPodstawa boolean default 0 not null,
             	CzyMatematykaRozszerzenie boolean not null,
             	CzyJezykPodstawa boolean not null,
             	CzyJezykRozszerzenie boolean not null,
             	CzyFizyka boolean not null,
             	CzyChemia boolean not null,
             	CzyBiologia boolean not null,
             	CzyInformatyka boolean not null,
             	CzyGeografia boolean not null,
             	CzyEgzamin boolean not null,
							primary key (IdKierunku)
)
comment 'Tabela do liczenia wskaźników, pokazujaca jakie przedmioty sa brane pod uwagę na danym kierunku';

create unique index BoolWskaznikiKierunki_IdKierunku_uindex
             	on BoolWskaznikiKierunki (IdKierunku);

create table PreferencjeKandydata
(
             	IdKandydata int not null,
             	Preferencja1 int null,
             	Preferencja2 int null,
             	Preferencja3 int null,
             	Preferencja4 int null,
             	Preferencja5 int null,
             	Preferencja6 int null,
FOREIGN KEY (IdKandydata) REFERENCES kandydaci(NrRejestracyjny),
foreign key (Preferencja1) references Kierunki(idkierunku),
foreign key (Preferencja2) references Kierunki(IdKierunku),
foreign key (Preferencja3) references Kierunki(IdKierunku),
foreign key (Preferencja4) references Kierunki(IdKierunku),
foreign key (Preferencja5) references Kierunki(IdKierunku),
foreign key (Preferencja6) references Kierunki(IdKierunku),
primary key (IdKandydata)
);

create unique index PreferencjeKandydata_IdKandydata_uindex
             	on PreferencjeKandydata (IdKandydata);

create table Wskaznik
(
             	IdKandydata int not null,
             	WskaznikPref1 float  null,
             	WskaznikPref2 float null,
             	WskaznikPref3 float null,
             	WskaznikPref4 float null,
             	WskaznikPref5 float null,
             	WskaznikPref6 float null,
             	primary key (IdKandydata)
);

create unique index Wskaznik_IdKandydata_uindex
             	on Wskaznik (IdKandydata);

alter table wskaznik
  add constraint `wskaznikfk_1` foreign key (`IdKandydata`) references `kandydaci`(`NrRejestracyjny`);


ALTER TABLE boolwskaznikikierunki
ADD constraint `boolwskaznikikierunkifk1` FOREIGN KEY (IdKierunku) REFERENCES kierunki(IdKierunku);

ALTER TABLE kierunki
ADD constraint `kierunkifk1` FOREIGN KEY (IdKierunku) REFERENCES boolwskaznikikierunki(IdKierunku);
