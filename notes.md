OEUVRES(<u>id0</u>, titre, anne, desc, est_film, est_livre)

FILMS(<u>#idO</u>, duree, langue)
LIVRES(<u>#idO</u>, nb_page, edition, annee)
SERIES(<u>#idO</u>, nb_saison, duree_moyenne)
SPECTACLE(<u>#idO</u>, nom, adresse, duree)
CATEGORIES(<u>idC</u>,nomC)
APPARTIENT_CAT(<u>#idO,#idC</u>)

UTILISATEURS(<u>idU</u>, nom, prenom, email)
STATUT(<u>#idU,#idO</u>, statut)
EVAL(<u>idE</u>, #idU, #idO, note, com)
CONTRIBUTEUR(<u>idContributeur</u>,nom, prenom,naissance)
CONTRIBUE(<u>#idContributeur,#idO,role</u>)
