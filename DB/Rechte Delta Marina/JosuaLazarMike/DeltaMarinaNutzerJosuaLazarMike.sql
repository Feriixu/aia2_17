Buchhaltung HarryProfit 
Service, MaulendeMürte
Vetrieb, DealingDumbledore

create user HarryProfit identified by 'FetusDeletus';
create user MaulendeMürte identified by 'REEEEE';
create user DealingDumbledore identified by 'AccioKokaino';

grant select on rechnung to HarryProfit;
grant select on kunde to HarryProfit;
grant select on auftrag to HarryProfit;

grant select on Rechnung to MaulendeMürte;
grant select on Kunde to MaulendeMürte;

grant select on Rechnung to DealingDumbledore;
grant select on Kunde to DealingDumbledore;


grant Update, insert , delete on Serviceangebot to MaulendeMürte;

grant all PRIVILEGES on Lieferant to DealingDumbledore; 
grant all PRIVILEGES on Bestellung to DealingDumbledore;
grant all PRIVILEGES on Auftrag to DealingDumbledore;
grant all PRIVILEGES on Ersatzteil to DealingDumbledore;

grant Select, Delete, Update, Insert on Auftrag to HarryProfit;
grant Select, Delete, Update, Insert on Bestellung to HarryProfit;
grant Select, Delete, Update, Insert on Rechnung to HarryProfit;
