# Projet_BDW_2026

Premiere idée de schéma relationnel :

OEUVRES(<ins>id0</ins>, titre, anne, desc, est_film, est_livre)

FILMS(<ins>#idO</ins>, duree, langue)

LIVRES(<ins>#idO</ins>, nb_page, edition, annee)

SERIES(<ins>#idO</ins>, nb_saison, duree_moyenne)

SPECTACLE(<ins>#idO</ins>, nom, adresse, duree)

CATEGORIES(<ins>idC</ins>,nomC)

APPARTIENT_CAT(<ins>#idO,#idC</ins>)

UTILISATEURS(<ins>idU</ins>, nom, prenom, email)

STATUT(<ins>#idU,#idO</ins>, statut)

EVAL(<ins>idE</ins>, #idU, #idO, note, com)

CONTRIBUTEUR(<ins>idContributeur</ins>,nom, prenom,naissance)

CONTRIBUE(<ins>#idContributeur,#idO,role</ins>)
