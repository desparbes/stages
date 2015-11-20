create table ELEVE
(
    NUMERO_ELEVE                   NUMBER(3)              not null,
    NOM_ELEVE                      CHAR(20)               not null,
    PRENOM_ELEVE                   CHAR(20)                       ,
    ADRESSE_ELEVE		   CHAR(50)			  ,
    MAIL_ELEVE			   CHAR(50)			  ,
    TELEPHONE_ELEVE		   CHAR(20)			  ,
    ANNEE_ETUDES		   NUMBER(1) 			  ,     
    DEPARTEMENT			   CHAR(3)			  ,
    constraint pk_eleve primary key (NUMERO_ELEVE)
);

create table STAGE
(
    NUMERO_STAGE                   NUMBER(3)              not null,
    SUJET			   CHAR(50)               not null,
    LIEU_STAGE                     CHAR(50)                       ,
    DATE_DEBUT                     DATE				  ,
    DATE_FIN                       DATE    			  ,
    INDEMNITE			   NUMBER(4)			  ,
    DOMAINE			   CHAR(20)			  ,
    ANNEE_MINIMUM_ACCEPTEE	   NUMBER(1)			  ,
    constraint pk_stage primary key (NUMERO_STAGE)
);

create table ENTREPRISE
(
    NUMERO_ENTREPRISE                   NUMBER(3)              not null,
    NOM_ENTREPRISE                      CHAR(20)               not null,
    ADRESSE_ENTREPRISE                  CHAR(50)                       ,
    CODE_POSTAL_ENTREPRISE             	NUMBER(5)                      ,
    VILLE_ENTREPRISE			CHAR(20)		       ,
    TELEPHONE_ENTREPRISE		CHAR(20)		       ,
    MAIL_ENTREPRISE			CHAR(50)		       ,
    NOMBRE_SALARIES			NUMBER(5)		       ,
    TYPE_ENTREPRISE			CHAR(20)		       ,
    GROUPE_ENTREPRISE			CHAR(20)		       ,
    constraint pk_entreprise primary key (NUMERO_ENTREPRISE)
);

create table SECTEUR
(
    NOM_SECTEUR				CHAR(20)		not null,
    constraint pk_secteur primary key (NOM_SECTEUR)
);

create table TUTEUR
(
    NUMERO_TUTEUR			NUMBER(3)              not null,
    NOM_TUTEUR                      	CHAR(20)               not null,
    PRENOM_TUTEUR                   	CHAR(20)                       ,
    constraint pk_tuteur primary key (NUMERO_TUTEUR)
);

create table SALARIE
(
    NUMERO_SALARIE			NUMBER(3)              not null,
    NOM_SALARIE                      	CHAR(20)               not null,
    PRENOM_SALARIE                   	CHAR(20)                       ,
    FONCTION_SALARIE                 	CHAR(20)                       ,
    MAIL_SALARIE		     	CHAR(50)		       ,
    TELEPHONE_SALARIE		     	CHAR(20)		       ,
    constraint pk_salarie primary key (NUMERO_SALARIE)
);

create table EST_CONTACT
(
    NUMERO_SALARIE			NUMBER(3)		not null,
    NUMERO_STAGE			NUMBER(3)		not null,
    constraint pk_est_contact primary key (NUMERO_SALARIE, NUMERO_STAGE)
);

create table EST_RESPONSABLE
(
    NUMERO_SALARIE			NUMBER(3)		not null,
    NUMERO_STAGE			NUMBER(3)		not null,
    constraint pk_est_responsable primary key (NUMERO_SALARIE, NUMERO_STAGE)
);

create table EMPLOYER
(
    NUMERO_ENTREPRISE			NUMBER(3)		not null,
    NUMERO_SALARIE			NUMBER(3)		not null,
    constraint pk_employer primary key (NUMERO_ENTREPRISE, NUMERO_SALARIE)
);

create table PARTICIPE
(
    NUMERO_ENTREPRISE			NUMBER(3)		not null,
    NOM_SECTEUR				CHAR(20)		not null,
    constraint pk_avoir primary key (NUMERO_ENTREPRISE, NOM_SECTEUR)
);

create table AFFECTER
(
    NUMERO_STAGE			NUMBER(3)		not null,
    NUMERO_ELEVE			NUMBER(3)		not null,
    NUMERO_TUTEUR			NUMBER(3)		not null,
    constraint pk_affecter primary key (NUMERO_STAGE, NUMERO_ELEVE, NUMERO_TUTEUR)
);

alter table EST_CONTACT
    add constraint fk1_est_contact foreign key (NUMERO_SALARIE)
       references SALARIE (NUMERO_SALARIE);

alter table EST_CONTACT
    add constraint fk2_est_contact foreign key (NUMERO_STAGE)
       references STAGE (NUMERO_STAGE);

alter table EST_RESPONSABLE
    add constraint fk1_est_responsable foreign key (NUMERO_SALARIE)
       references SALARIE (NUMERO_SALARIE);

alter table EST_RESPONSABLE
    add constraint fk2_est_responsable foreign key (NUMERO_STAGE)
       references STAGE (NUMERO_STAGE);

alter table EMPLOYER
    add constraint fk1_employer foreign key (NUMERO_ENTREPRISE)
       references ENTREPRISE (NUMERO_ENTREPRISE);

alter table EMPLOYER
    add constraint fk2_employer foreign key (NUMERO_SALARIE)
       references SALARIE (NUMERO_SALARIE);

alter table PARTICIPE
    add constraint fk1_participe foreign key (NUMERO_ENTREPRISE)
       references ENTREPRISE (NUMERO_ENTREPRISE);

alter table PARTICIPE
    add constraint fk2_participe foreign key (NOM_SECTEUR)
       references SECTEUR (NOM_SECTEUR);

alter table AFFECTER
    add constraint fk1_affecter foreign key (NUMERO_STAGE)
       references STAGE (NUMERO_STAGE);

alter table AFFECTER
    add constraint fk2_affecter foreign key (NUMERO_ELEVE)
       references ELEVE (NUMERO_ELEVE);

alter table AFFECTER
    add constraint fk3_affecter foreign key (NUMERO_TUTEUR)
       references TUTEUR (NUMERO_TUTEUR);

