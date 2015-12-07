-- ======================================================================
-- Consultation
-- ======================================================================

-- Entreprise --

-- Par localité géographique
select *
from Entreprise E
where E.Numero_adresse = 'HAUTE-GARONNE'; 

-- Par taille
select *
from Entreprise E
order by E.Nombre_salaries desc;


-- Contacts --

-- Par nom
select *
from Personne P
order by P.Nom_personne asc;

-- Sélection des personnes qui ne sont pas des professeurs 
select distinct P.Numero_personne, P.Mail, P.Nom_personne, P.Prenom_personne, P.Telephone_personne
from Eleve E, Personne P, Est_contact Ei, Est_employe Es
where P.Numero_personne = E.Numero_personne
or P.Numero_personne = Ei.Numero_personne
or P.Numero_personne = Es.Numero_personne;	


--Selection des professeurs
select P.Numero_personne as Numero_professeur, P.Mail as Mail, P.Nom_personne as Nom_personne, P.Prenom_personne as Prenom_personne, P.Telephone_personne as Telephone_personne from Personne P
except
select distinct P.Numero_personne as Numero_professeur, P.Mail, P.Nom_personne, P.Prenom_personne, P.Telephone_personne
from Eleve E, Personne P, Est_contact Ei, Est_employe Es
where P.Numero_personne = E.Numero_personne
or P.Numero_personne = Ei.Numero_personne
or P.Numero_personne = Es.Numero_personne;

-- Stage, Eleves, leur departement et leur tuteurs
select S.Numero_stage,E.Annee,P1.Nom_personne as Nom_eleve, P2.Nom_personne as Tuteur
from Eleve E,Personne P1,Stage S, Personne P2
where E.Numero_Personne = P1.Numero_Personne
and S.Numero_stage = E.Numero_stage
and S.Numero_professeur = P2.Numero_personne;


-- ======================================================================
-- Statistiques
-- ======================================================================

-- Duree moyenne des stages par filieres
select S.Nom_departement,avg(S.Date_fin - S.Date_debut) as Duree_moyenne_du_stage
from Stage S
group by S.Nom_departement;

-- Nombre d'offre proposées par anneé***
select S.Annee,count(S.Numero_stage) as nombre_offres
from Stage S
where S.Numero_stage!=-1
group by S.Annee;
      

-- Nombre d'offres pourvues par annee
select E.Annee,count(E.Numero_stage) as offres_pourvues
from Eleve E, Stage S
where E.Numero_Stage = S.Numero_Stage
and E.Annee!=-1
group by E.Annee;

-- Classement des départements par nombre de stages
select S.Nom_departement, count(S.Numero_stage) as offres_pourvues
from Stage S
group by S.Nom_departement
order by offres_pourvues desc;

--Classement des meilleurs fournisseurs de stages
select E.Nom_entreprise,count(*) as offres_pourvues
from Entreprise E, Stage S
where E.Numero_Entreprise = S.Numero_entreprise
group by E.Nom_entreprise
order by offres_pourvues desc;

-- Classement des offres de stages par ordre alphabetiques et par région
select S.Sujet, E.Numero_adresse 
from Stage S, Entreprise E
where E.Numero_entreprise = S.Numero_entreprise
order by S.Sujet asc, E.Numero_adresse asc;