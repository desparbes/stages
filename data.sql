--==========================================================================
-- 	CLEANING
-- ========================================================================
delete from ELEVE;
delete from STAGE;
delete from ENTREPRISE;
delete from SECTEUR;
delete from TUTEUR;
delete from SALARIE;
delete from EST_CONTACT;
delete from PARTICIPE;
delete from AFFECTER;

commit;

-- =============================================================
-- 		ENTREPRISE
-- ============================================================

insert into ENTREPRISE values (1, 'ATOS'   , '1 RUE RUE'  , 33400  , 'TALENCE'  , '0505050505'  , 'ATOS@ATOS.FR'    , 50  , 'PME'   , null  ) ;
insert into ENTREPRISE values (2, 'ATOS2'  , '1 RUE RUE'  , 33400  , 'TALENCE'  , '0505050505'  , 'ATOS2@ATOS.FR'   , 50  , 'PME'   , null  ) ;
insert into ENTREPRISE values (3, 'ATOS3'  , '1 RUE RUE'  , 33400  , 'TALENCE'  , '0505050505'  , 'ATOS3@ATOS.FR'   , 50  , 'PME'   , null  ) ;
insert into ENTREPRISE values (4, 'ATOS4'  , '1 RUE RUE'  , 33400  , 'TALENCE'  , '0505050505'  , 'ATO4S@ATOS.FR'   , 50  , 'PME'   , null  ) ;

commit;

-- =============================================================
-- 		SECTEUR
-- ============================================================
insert into SECTEUR values ( 'INFORMATIQUE'    ) ;
insert into SECTEUR values ( 'PHYSIQUE'        ) ;
insert into SECTEUR values ( 'MATHS'            ) ;


-- =============================================================
-- 		PARTICIPE
-- ============================================================
insert into PARTICIPE values (  1  ,  'INFORMATIQUE'  )  ;


--- =============================================================
-- 		SALAIRE 
-- ============================================================

insert into SALARIE values ( 1 , 'FRANCOIS'  , 'CLAUDE'    , 'TECHNICIEN'      , 'CLAUDE.FRANCOIS@GMAIL.COM'     , '0101010101'   ,   1  ) ;
insert into SALARIE values ( 2 , 'GABI2'     , 'BERNARD2'  , 'COMMUNICATION'   , 'QSDKJ@GMAIL.FR'                , '321313123'    ,   2  ) ; 
insert into SALARIE values ( 3 , 'GABI3'     , 'BERNARD3'  , 'COMMUNICATION'   , 'QSDKJ@GMAIL.FR'                , '321313123'    ,   3  ) ;
insert into SALARIE values ( 4 , 'GABI4'     , 'BERNARD4'  , 'COMMUNICATION'   ,  'QSDKJ@GMAIL.FR'               , '321313123'    ,   4  ) ;
insert into SALARIE values ( 5 , 'GABI5'     , 'BERNARD5'  , 'COMMUNICATION'   , 'QSDKJ@GMAIL.FR'                , '321313123'    ,   4  ) ;

commit;

--======================================================================
--		STAGE 
--======================================================================

insert into STAGE values ( 1  , 'MODELISATION' , 'PARIS'    , '01-JUL-16' , '31-JUL-16' , 9999  ,  'PHYSIQUE'     , 2  ,  1 ) ;
insert into STAGE values ( 2  , 'RECHERCHE OP' , 'PARIS'    , '01-JUL-16' , '31-JUL-16' , 9999  ,  'MATHS'        , 2  ,  2 ) ;
insert into STAGE values ( 3  , 'MODELISATION' , 'BORDEAUX' , '01-JUL-16' , '31-JUL-16' , 9999  ,  'PHYSIQUE'     , 2  ,  3 ) ;
insert into STAGE values ( 4  , 'MODELISATION' , 'PARIS'    , '01-JUL-16' , '31-JUL-16' , 9999  ,  'INFORMATIQUE' , 2  ,  4 ) ;
insert into STAGE values ( 5  , 'MODELISATION' , 'PARIS'    , '01-JUL-16' , '31-JUL-16' , 9999  ,  'PHYSIQUE'     , 2  ,  5 ) ;

commit;

-- =============================================================
-- 		TUTEUR 
-- ============================================================
insert into TUTEUR values ( 1 , 'RENAULT'   , 'DAVID'   ) ;
insert into TUTEUR values ( 2 , 'RENAULT2'  , 'DAVID2'  ) ;
insert into TUTEUR values ( 3 , 'RENAULT3'  , 'DAVID3'  ) ;
insert into TUTEUR values ( 4 , 'RENAULT4'  , 'DAVID4'  ) ;
insert into TUTEUR values ( 5 , 'RENAULT4'  , 'DAVID4'  ) ;

commit;


-- =============================================================
-- 		EST_CONTACT
-- ============================================================
insert into EST_CONTACT values (  1  ,   1  )  ;
insert into EST_CONTACT values (  2  ,   2  )  ;
insert into EST_CONTACT values (  3  ,   3  )  ;


-- =============================================================
-- 		ELEVE 
-- ============================================================

insert into ELEVE values ( 1 , 'DUPONT'   , 'MARTIN'  , '1 RUE KELKEPART 63256 MARLY'  , 'MARTIN.DUPONT@GMAIL.COM'  , '0101010101'  , 1 , 'I' , 1 , 1  ) ;
insert into ELEVE values ( 2 , 'DUPONT2'  , 'MARTIN2' , '1 RUE KELKEPART 63256 MARLY'  , 'MARTIN.DUPONT2@GMAIL.COM' , '0101010102'  , 1 , 'I' , 2 , 2  ) ;
insert into ELEVE values ( 3 , 'DUPONT3'  , 'MARTIN3' , '1 RUE KELKEPART 63256 MARLY'  , 'MARTIN.DUPONT3@GMAIL.COM' , '0101010103'  , 1 , 'I' , 3 , 3  ) ;
insert into ELEVE values ( 4 , 'DUPONT4'  , 'MARTIN4' , '1 RUE KELKEPART 63256 MARLY'  , 'MARTIN.DUPONT4@GMAIL.COM' , '0101010104'  , 1 , 'I' , 4 , 4  ) ;
insert into ELEVE values ( 5 , 'DUPONT5'  , 'MARTIN5' , '1 RUE KELKEPART 63256 MARLY'  , 'MARTIN.DUPONT5@GMAIL.COM' , '0101010105'  , 1 , 'I' , 5 , 5  ) ;

commit;


-- =============================================================
-- 		AFFECTER 
-- ============================================================
insert into AFFECTER values (  1  ,  1  ,   1  )  ;



