-- =====================================================================
--   Nom de la base   :  STAGE                              
--   Nom de SGBD      :  ORACLE Version 7.0                    
--   Date de creation :                      
-- =====================================================================

-- =====================================================================
--   	TABLE = ENTREPRISE
-- =====================================================================
create table ENTREPRISE
(
    NUMERO_ENTREPRISE NUMBER(3) not null,
    NOM_ENTREPRISE CHAR(20) not null,
    ADRESSE_ENTREPRISE CHAR(50),
    CODE_POSTAL_ENTREPRISE NUMBER(5),
    VILLE_ENTREPRISE CHAR(20),
    TELEPHONE_ENTREPRISE CHAR(20),
    SITE_WEB_ENTREPRISE CHAR(50),
    NOMBRE_SALARIES NUMBER(5),
    TYPE_ENTREPRISE CHAR(20),
    GROUPE_ENTREPRISE CHAR(20),
    constraint pk_entreprise primary key (NUMERO_ENTREPRISE)
);

-- =====================================================================
--   	TABLE = SECTEUR
-- =====================================================================
create table SECTEUR
(
    NOM_SECTEUR CHAR(20) not null,
    constraint pk_secteur primary key (NOM_SECTEUR)
);

-- =====================================================================
--   	TABLE = PARTICIPE
-- =====================================================================
create table PARTICIPE
(
    NUMERO_ENTREPRISE NUMBER(3) not null,
    NOM_SECTEUR	CHAR(20) not null,
    constraint pk_avoir primary key (NUMERO_ENTREPRISE, NOM_SECTEUR)
);

-- =====================================================================
--   	TABLE = SALARIE
-- =====================================================================
create table SALARIE
(
    NUMERO_SALARIE NUMBER(3) not null,
    NOM_SALARIE CHAR(20) not null,
    PRENOM_SALARIE CHAR(20),
    FONCTION_SALARIE CHAR(20),
    MAIL_SALARIE CHAR(50),
    TELEPHONE_SALARIE CHAR(20),	
    NUMERO_ENTREPRISE NUMBER(3) not null,       
    constraint pk_salarie primary key (NUMERO_SALARIE)
);

-- =====================================================================
--   	TABLE = STAGE
-- =====================================================================
create table STAGE
(
    NUMERO_STAGE NUMBER(3) not null,
    SUJET CHAR(50) not null,
    LIEU_STAGE CHAR(50),
    DATE_DEBUT DATE,
    DATE_FIN DATE,
    INDEMNITE NUMBER(4),
    DOMAINE CHAR(20),
    ANNEE_MINIMUM_ACCEPTEE NUMBER(1),
    NUMERO_SALARIE NUMBER(3) not null,
    constraint pk_stage primary key (NUMERO_STAGE)   
);

-- =====================================================================
--   	TABLE = TUTEUR
-- =====================================================================
create table TUTEUR
(
    NUMERO_TUTEUR NUMBER(3) not null,
    NOM_TUTEUR CHAR(20) not null,
    PRENOM_TUTEUR CHAR(20),
    constraint pk_tuteur primary key (NUMERO_TUTEUR)
);

-- =====================================================================
--   	TABLE = EST_CONTACT
-- =====================================================================
create table EST_CONTACT
(
    NUMERO_SALARIE NUMBER(3) not null,
    NUMERO_STAGE NUMBER(3) not null,
    constraint pk_est_contact primary key (NUMERO_SALARIE, NUMERO_STAGE)
);


-- =====================================================================
--   	TABLE = ELEVE
-- =====================================================================
create table ELEVE
(
    NUMERO_ELEVE NUMBER(3) not null,
    NOM_ELEVE CHAR(20) not null,
    PRENOM_ELEVE CHAR(20),
    ADRESSE_ELEVE CHAR(50),
    MAIL_ELEVE CHAR(50),
    TELEPHONE_ELEVE CHAR(20),
    ANNEE_ETUDES NUMBER(1),     
    DEPARTEMENT CHAR(3),
    NUMERO_STAGE NUMBER(3) not null,
    NUMERO_TUTEUR NUMBER(3) not null,
    constraint pk_eleve primary key (NUMERO_ELEVE)
);


-- =====================================================================
--   	TABLE = AFFECTER
-- =====================================================================
create table AFFECTER
(
    NUMERO_STAGE NUMBER(3) not null,
    NUMERO_ELEVE NUMBER(3) not null,
    NUMERO_TUTEUR NUMBER(3) not null,
    constraint pk_affecter primary key (NUMERO_STAGE, NUMERO_ELEVE, NUMERO_TUTEUR)
);


commit;
-- =====================================================================
--   	contraintes:
-- =====================================================================

--==============  ELEVE  ===============================================
alter table ELEVE
	add constraint fk1_eleve foreign key (NUMERO_STAGE)
		references STAGE (NUMERO_STAGE);

alter table ELEVE
	add constraint fk2_eleve foreign key (NUMERO_TUTEUR)
		references TUTEUR (NUMERO_TUTEUR);
--===============  STAGE  ==============================================
		
alter table STAGE
	add constraint fk_stage foreign key (NUMERO_SALARIE)
		references SALARIE (NUMERO_SALARIE);
--=============== EST_CONTACT ==========================================
	
alter table EST_CONTACT
    add constraint fk1_est_contact foreign key (NUMERO_SALARIE)
       references SALARIE (NUMERO_SALARIE);

alter table EST_CONTACT
    add constraint fk2_est_contact foreign key (NUMERO_STAGE)
       references STAGE (NUMERO_STAGE);
--==================  PARTICIPE  =======================================

alter table PARTICIPE
    add constraint fk1_participe foreign key (NUMERO_ENTREPRISE)
       references ENTREPRISE (NUMERO_ENTREPRISE);

alter table PARTICIPE
    add constraint fk2_participe foreign key (NOM_SECTEUR)
       references SECTEUR (NOM_SECTEUR);
--===================  AFFECTER  =======================================

alter table AFFECTER
    add constraint fk1_affecter foreign key (NUMERO_STAGE)
       references STAGE (NUMERO_STAGE);

alter table AFFECTER
    add constraint fk2_affecter foreign key (NUMERO_ELEVE)
       references ELEVE (NUMERO_ELEVE);

alter table AFFECTER
    add constraint fk3_affecter foreign key (NUMERO_TUTEUR)
       references TUTEUR (NUMERO_TUTEUR);

commit;
