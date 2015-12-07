SELECT DISTINCT NOM_SALARIE AS NOM, PRENOM_SALARIE AS PRENOM, MAIL_SALARIE AS MAIL, TELEPHONE_SALARIE AS TELEPHONE
FROM SALARIE s, EST_CONTACT c
WHERE s.NUMERO_SALARIE = c.NUMERO_SALARIE;
