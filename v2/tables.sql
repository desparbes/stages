
-- ======================================================================

-- Nom de la base : STAGE
-- Nom de la SGBD : Oracle
-- Date de creation :
-- =====================================================================
drop table Adresse cascade constraints;
drop table Appartient cascade constraints;
drop table Departement cascade constraints;
drop table Eleve cascade constraints;
drop table Entreprise cascade constraints;
drop table Est_contact cascade constraints;
drop table Est_employe cascade constraints;
drop table Personne cascade constraints;
drop table Secteur cascade constraints;
drop table Stage cascade constraints;
-- ======================================================================
-- Table ENTREPRISE
-- ======================================================================
create table Entreprise 
(
    Numero_entreprise          NUMBER(6)                        ,
    Nom_entreprise             CHAR(20)                         ,
    Site_web                        CHAR(20)                         ,
    Telephone                  CHAR(10)                         ,
    Nombre_salaries            NUMBER(6)                        ,
    Type_                      CHAR(5)                          ,
    Numero_adresse                     CHAR(20)                         ,
    PRIMARY KEY ( Numero_entreprise  )
) ;
-- ======================================================================
-- Table ELEVE
-- ======================================================================
create table Eleve 
(
	Numero_eleve                     NUMBER(6)                         ,
    Annee                            CHAR(2)                           ,
    Numero_personne                  NUMBER(6)   not null              ,
    Numero_stage                     NUMBER(6)   default -1            ,
    Numero_adresse                   NUMBER(6)   default -1 not null   ,
    Nom_departement                  CHAR(20)    default -1 not null  ,
    primary key (Numero_eleve) 
) ;
-- ======================================================================
-- Table PERSONNE
-- ======================================================================
create table Personne 
(
	Numero_personne          NUMBER(6)                 ,
    Mail                     CHAR(20)                  ,
    Nom_personne             CHAR(20)                  ,
    Prenom_personne          CHAR(20)                  ,
    Telephone_personne       CHAR(10)                  ,
    primary key (Numero_personne) 
) ;
-- ======================================================================
-- Table STAGE
-- ======================================================================
create table Stage 
(
	Numero_stage               NUMBER(6)                               ,
    Annee                      CHAR(2)                                 ,
    Groupe                     CHAR(20)                                ,
    Indemnites                 NUMBER(4)                               ,
    Sujet                      CHAR(20)                                ,
    Date_debut                 DATE                                    ,
    Date_fin                   DATE                                    ,
    Numero_entreprise          NUMBER(6)   default -1 not null         ,
    Numero_adresse             NUMBER(6)   default -1 not null         ,
    Nom_departement            CHAR(20)    default -1 not null         ,
    Numero_professeur          NUMBER(6)   default -1                  ,
    primary key (Numero_stage) 
);

-- ======================================================================
-- Table SECTEUR
-- ======================================================================
create table Secteur 
(
	Nom_secteur          CHAR(20)                              ,
    primary key (Nom_secteur) 
);
-- ======================================================================
-- Table ADRESSE
-- ======================================================================
create table Adresse
(
	Numero_adresse       NUMBER(6)       not null 					,
    VILLE                CHAR(20)                                   ,
    Rue                  CHAR(20)									,
    Numero               NUMBER(3)									,
    Code_postal          NUMBER(5)									,
    Numero_entreprise    NUMBER(6) 		 default -1					,
    primary key (Numero_adresse) 
);
-- ======================================================================
-- Table DEPARTEMENT
-- ======================================================================
create table Departement 
(
	Nom_departement 		CHAR(20)      not null        ,
    primary key (Nom_departement) 
);
-- ======================================================================
-- Table Est_employe
-- ======================================================================
create table Est_employe 
(
	Numero_entreprise 			NUMBER(6) default -1 not null		,
    Numero_personne 			NUMBER(6) default -1 not null		,
    Fonction 					CHAR(20)							,
    primary key (Numero_entreprise,Numero_personne) 
);
-- ======================================================================
-- Table APPARTIENT
-- ======================================================================
create table Appartient 
(
    Nom_secteur 			CHAR(20) 	default -1 not null,
    Numero_entreprise 		NUMBER(6) 	default -1 not null,
    primary key (Nom_secteur, Numero_entreprise) 
);

-- ======================================================================
-- Table Est_contact
-- ======================================================================
create table Est_contact 
(
	Numero_stage 		NUMBER(6) 		default -1 not null	,
    Numero_personne 	NUMBER(6) 		default -1 not null	,
    primary key (Numero_stage, Numero_personne) 
);
--=================== CONTRAINTES ======================================
-- ============ ELEVE ===============================
alter table ELEVE
	add foreign key(Numero_personne) 
		references Personne ( Numero_personne ) on delete cascade ;
alter table ELEVE
    add foreign key(Numero_stage) 
		references Stage(Numero_stage) on delete set null ;
alter table ELEVE
      add foreign key(Numero_adresse) 
		references Adresse(Numero_adresse) on delete set null ;
alter table ELEVE
       add foreign key(Nom_departement)
        references Departement ( Nom_departement ) on delete set null ;

--=================== STAGE =============================================
alter table STAGE
	add foreign key(Numero_entreprise) 
		references Entreprise ( Numero_entreprise ) on delete cascade ;
alter table STAGE
     add foreign key(Numero_adresse) 
		references Adresse(Numero_adresse) on delete set null ;
alter table STAGE
      add foreign key (Nom_departement) 
		references Departement(Nom_departement) on delete set null ;
alter table STAGE
       add foreign key (Numero_professeur) 
		references Personne(Numero_personne) on delete set null ;	   

--===================== ADRESSE ========================================
alter table Adresse
	add foreign key(Numero_entreprise) 
		references Entreprise(Numero_entreprise) on delete set null ;


-- ================= ETRE SALARIE ====================================

alter table Est_employe
	add foreign key(Numero_entreprise) 
		references Entreprise(Numero_entreprise) on delete cascade ;
alter table Est_employe
     add foreign key(Numero_personne) 
		references Personne(Numero_personne) on delete cascade ;
		
-- ================== APPARTIENT ====================================
 
alter table Appartient
	add foreign key(Nom_secteur) 
		references Secteur(Nom_secteur) on delete cascade ;

alter table Appartient	
     add foreign key(Numero_entreprise) 
		references Entreprise(Numero_entreprise) on delete cascade ;
		
-- ================ Est_contact ============================

alter table Est_contact
	 add foreign key(Numero_stage) 
		references Stage(Numero_stage) on delete set null ;
alter table Est_contact		
      add foreign key(Numero_personne) 
		references Personne(Numero_personne) on delete cascade ;
