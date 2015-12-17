-- ============================================================
--    creation des donnees
-- ============================================================


-- ============================================================
--    personnes
-- ============================================================

insert into Personne values (1,'blabla@blabla','Dallago','David','0630507354');
insert into Personne values (2,'blabla@blabla','Champion','Marine','0612775908');
insert into Personne values (3,'blabla@blabla','Valli','Tomas','0664547681');
insert into Personne values (4,'blabla@blabla','Vandenberghe','Benjamin','0631457698');

-- ============================================================
--    departement
-- ============================================================

insert into Departement values('Informatique');
insert into Departement values('Matmeca');
insert into Departement values('Electronique');
insert into Departement values('Telecommunications');


-- ======================================================================
-- entreprises
-- ======================================================================

insert into Entreprise values(1,'Logica','www.logica.fr','0512345678',10000,'PME','Aquitaine');
insert into Entreprise values(2,'Thalès','www.thalès.fr','0578986578',100000,'PME','Ile_de_france');

-- ======================================================================
-- adresses
-- ======================================================================

insert into Adresse values(1,'Toulouse','Logica',12,31000,1);
insert into Adresse values(2,'Lyon','David et Benjamin',12,65000,null);
insert into Adresse values(3,'Lyon','Marine',12,65000,null);
insert into Adresse values(4,'Paris','Thales',13,92000,2);



-- ============================================================
--    stages
-- ============================================================

insert into Stage values(1,'1A','blob',1245,'faire ca','01-JAN-89','30-MAY-89',1,1,'Informatique',3);
insert into Stage values(2,'2A','blab',1600,'faire ci','25-JAN-89','28-SEP-89',2,4,'Matmeca',3);
insert into Stage values(3,'2A','blab',1600,'faire ce','25-JAN-89','28-SEP-89',2,4,'Matmeca',3);
insert into Stage values(4,'2A','bleb',1600,'faire ce','25-JAN-89','28-SEP-89',2,4,'Matmeca',3);



-- ============================================================
--    eleves
-- ============================================================
insert into Eleve values (1,'1A',1,1,2,'Informatique');
insert into Eleve values (2,'2A',2,2,3,'Matmeca');
insert into Eleve values (3,'2A',4,3,2,'Matmeca');



