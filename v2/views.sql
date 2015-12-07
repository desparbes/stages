--=============================================================
-- DROP
--===========================================================
drop view Nom_Entreprises;
drop view Info_Stage;
drop view Duree_Stage_Moy;
drop view Nb_Offres_Prop;
drop view Nb_Offres_Pourv;
drop view Classe_Dep;
drop view Classe_Fournisseur;
drop view if exists Classe_Offres;
-- ============================================================
--                         Views
-- ============================================================

create view Nom_Entreprises as select * from Entreprise;

drop view if exists Professeurs;
create view Professeurs as
       select P.Numero_personne as Numero_professeur, P.Mail as Mail, P.Nom_personne as Nom_personne, P.Prenom_personne as Prenom_personne, P.Telephone_personne as Telephone_personne from Personne P
       except
       select distinct P.Numero_personne as Numero_professeur, P.Mail, P.Nom_personne, P.Prenom_personne, P.Telephone_personne
       from Eleve E, Personne P, Est_contact Ei, Est_employe Es
       where P.Numero_personne = E.Numero_personne
       or P.Numero_personne = Ei.Numero_personne
       or P.Numero_personne = Es.Numero_personne; 
       

create view Info_Stage as 
       select S.Numero_stage,E.Annee,P1.Nom_personne as Nom_eleve, P2.Nom_personne as Tuteur	
       from Eleve E,Personne P1,Stage S, Personne P2
       where E.Numero_Personne = P1.Numero_Personne
       and S.Numero_stage = E.Numero_stage
       and S.Numero_professeur = P2.Numero_personne
       and S.Numero_stage != -1;


create view Duree_Stage_Moy as 
       select S.Nom_departement,avg(S.Date_fin - S.Date_debut) as Duree_moyenne_du_stage
       from Stage S
       where S.Numero_stage!=-1
       group by S.Nom_departement;


create view Nb_Offres_Prop as 
       select S.Annee,count(S.Numero_stage) as nombre_offres
       from Stage S
       where S.Numero_stage!=-1
       group by S.Annee;


create view Nb_Offres_Pourv as 
       select E.Annee,count(E.Numero_stage) as offres_pourvues
       from Eleve E, Stage S
       where E.Numero_Stage = S.Numero_Stage
       and S.Numero_stage!=-1
       group by E.Annee;


create view Classe_Dep as
       select S.Nom_departement, count(S.Numero_stage) as offres_pourvues
       from Stage S
       where S.Numero_stage!=-1
       group by S.Nom_departement
       order by offres_pourvues desc;


create view Classe_Fournisseur as 
       select E.Nom_entreprise,count(*) as offres_pourvues
       from Entreprise E, Stage S
       where E.Numero_Entreprise = S.Numero_entreprise
       and S.Numero_stage!=-1
       group by E.Nom_entreprise
       order by offres_pourvues desc;


create view Classe_Offres as 
       select S.Sujet, E.Numero_adresse 
       from Stage S, Entreprise E
       where E.Numero_entreprise = S.Numero_entreprise
       and S.Numero_stage!=-1
       order by S.Sujet asc, E.Numero_adresse asc;
