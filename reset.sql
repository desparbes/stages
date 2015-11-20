delete from ELEVE;
delete from STAGE;
delete from ENTREPRISE;
delete from SECTEUR;
delete from TUTEUR;
delete from SALARIE;
delete from EST_CONTACT;
delete from EST_RESPONSABLE;
delete from EMPLOYER;
delete from PARTICIPE;
delete from AFFECTER;

drop table ELEVE cascade constraints;
drop table STAGE cascade constraints;
drop table ENTREPRISE cascade constraints;
drop table SECTEUR cascade constraints;
drop table TUTEUR cascade constraints;
drop table SALARIE cascade constraints;
drop table EST_CONTACT cascade constraints;
drop table EST_RESPONSABLE cascade constraints;
drop table EMPLOYER cascade constraints;
drop table PARTICIPE cascade constraints;
drop table AFFECTER cascade constraints;

