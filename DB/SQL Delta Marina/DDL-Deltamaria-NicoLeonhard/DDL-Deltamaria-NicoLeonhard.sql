create database if not exists db_deltamaria;

create table if not exists t_lieferant (

lieferantenNR integer,
firmennamen varchar(255),
ansprechperson varchar(255),
Tel integer,
str varchar(255),
strNR integer,
ort varchar(255),
Plz integer,
primary key (lieferantenNR) );

create table if not exists t_ersatzteil (

ersatzteilNR integer,
bezeichnung varchar(255),
Zustand varchar(255),
primary key(ersatzteilNR) );

create table if not exists t_jachttyp (
typNr	integer,
bezeichnung varchar(255),
primary key ( typNR ) );

create table if not exists t_jacht (
jachtbezeichnung varchar(255),
zustand	varchar(255),
name	varchar(255),
kennNr	integer,
primary key (jachtbezeichnung) );

create table if not exists t_serviceangebot (
ServiceNr integer,
T�tigkeit varchar(255),	
Kosten double,
primary key (ServiceNr) );

create table if not exists t_kunde (
kundenNR integer,
name	 varchar(255),	
Vorname	 varchar(255),	
Tel	 integer,	
Str	 varchar(255),	
StrNr    integer,	
Ort      varchar(255),	
Plz      integer,	
primary key (kundenNR) );

create table if not exists t_rechnung (
rechnungNR integer,
Preis	decimal(10,2),
Datum	Date,
primary key (rechnungNR) );


create table if not exists t_bestellung (
ersatzteilNR	integer,
lieferantenNR	integer,
anzahl		integer,
kosten		decimal(10,2),
datumBestel	date,
ankunftsDatum	date,
primary key (ersatzteilNR,lieferantenNR),
foreign key (ersatzteilNR) references t_ersatzteil (ersatzteilNR),
foreign key (lieferantenNR) references t_lieferant (lieferantenNR) );

create table if not exists t_auftrag (
auftragNR	integer,	
rechnungNR	integer,
serviceNR	integer,
kundenNR	integer,
jachtbezeichnung varchar(255),
primary key(auftragNR),
foreign key(rechnungNR) references t_rechnung(rechnungNR),
foreign key(serviceNR) references t_serviceangebot(ServiceNr),
foreign key(kundenNR) references  t_kunde(kundenNR),
foreign key(jachtbezeichnung) references t_jacht(jachtbezeichnung) );
