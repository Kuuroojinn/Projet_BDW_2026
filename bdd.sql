-- Destruction / creation du schema pour pgweb
-- /!\ ATTENTION à sauvegarder si un autre schéma s'appelle projet
DROP SCHEMA IF EXISTS projet CASCADE;
CREATE SCHEMA projet;
SET SEARCH_PATH TO projet;

-- Destruction des tables (si en dehors de pgweb)
DROP TABLE IF EXISTS OEUVRES;
DROP TABLE IF EXISTS FILMS;
DROP TABLE IF EXISTS LIVRES;
DROP TABLE IF EXISTS SERIES;
DROP TABLE IF EXISTS SPECTACLE;
DROP TABLE IF EXISTS CATEGORIES;
DROP TABLE IF EXISTS APPARTIENT_CAT;
DROP TABLE IF EXISTS UTILISATEURS;
DROP TABLE IF EXISTS STATUT;
DROP TABLE IF EXISTS EVAL;
DROP TABLE IF EXISTS CONTRIBUTEUR;
DROP TABLE IF EXISTS CONTRIBUE;

-- Creation des tables
CREATE TABLE oeuvres (
	PRIMARY KEY (idO),
	idO INTEGER NOT NULL,
	titreOeuvre VARCHAR(255),
	anneeOeuvre SMALLINT,
	descriptionOeuvre VARCHAR(255)
);

CREATE TABLE films (
	idO INTEGER NOT NULL,
	dureeFilm INTERVAL,
	langueFilm VARCHAR(32)
);

CREATE TABLE livres (
	idO INTEGER NOT NULL,
	nb_pagesLivre SMALLINT,
	editionLivre VARCHAR(32),
	anneeLivre SMALLINT
);

CREATE TABLE series (
	idO INTEGER NOT NULL,
	nb_saisonsSerie SMALLINT,
	duree_moyenneSerie INTERVAL
);

CREATE TABLE spectacle (
	idO INTEGER NOT NULL,
	nomSpec VARCHAR(255),
	adresseSpec VARCHAR(255),
	dureeSpec INTERVAL
);

CREATE TABLE categories (
	PRIMARY KEY (idCat),
	idCat INTEGER NOT NULL,
	nomCat VARCHAR(255)
);

CREATE TABLE APPARTIENT_CAT (
	idO INTEGER NOT NULL,
	idCat INTEGER NOT NULL
);

CREATE TABLE utilisateurs (
	PRIMARY KEY (idU),
	idU INTEGER NOT NULL,
	nomU VARCHAR(255),
	prenomU VARCHAR(255),
	emailU VARCHAR(255)
);

CREATE TABLE statut (
	idU INTEGER NOT NULL,
	idO INTEGER NOT NULL,
	statut VARCHAR(255)
);

CREATE TABLE eval (
	PRIMARY KEY (idE),
	idE INTEGER NOT NULL,
	idU INTEGER NOT NULL,
	idO INTEGER NOT NULL,
	note SMALLINT,
	commentaire VARCHAR(255)
);

CREATE TABLE contributeur (
	PRIMARY KEY (idContrib),
	idContrib INTEGER NOT NULL,
	nomContrib VARCHAR(255),
	prenomContrib VARCHAR(255),
	naissanceContrib DATE
);

CREATE TABLE contribue (
	idContrib INTEGER NOT NULL,
	idO INTEGER NOT NULL,
	role VARCHAR(255)
);


-- Ajout des cles etrangeres / primaires
ALTER TABLE films ADD FOREIGN KEY (idO) REFERENCES oeuvres (idO);
ALTER TABLE films ADD PRIMARY KEY (idO);

ALTER TABLE livres ADD FOREIGN KEY (idO) REFERENCES oeuvres (idO);
ALTER TABLE livres ADD PRIMARY KEY (idO);

ALTER TABLE series ADD FOREIGN KEY (idO) REFERENCES oeuvres (idO);
ALTER TABLE series ADD PRIMARY KEY (idO);

ALTER TABLE spectacle ADD FOREIGN KEY (idO) REFERENCES oeuvres (idO);
ALTER TABLE spectacle ADD PRIMARY KEY (idO);

ALTER TABLE appartient_cat ADD FOREIGN KEY (idO) REFERENCES oeuvres (idO);
ALTER TABLE appartient_cat ADD FOREIGN KEY (idCat) REFERENCES categories (idCat);
ALTER TABLE appartient_cat ADD PRIMARY KEY (idO,idCat);

ALTER TABLE statut ADD FOREIGN KEY (idU) REFERENCES utilisateurs (idU);
ALTER TABLE statut ADD FOREIGN KEY (idO) REFERENCES oeuvres (idO);
ALTER TABLE statut ADD PRIMARY KEY (idU, idO);

ALTER TABLE eval ADD FOREIGN KEY (idO) REFERENCES oeuvres (idO);
ALTER TABLE eval ADD FOREIGN KEY (idU) REFERENCES utilisateurs (idU);

ALTER TABLE contribue ADD FOREIGN KEY (idContrib) REFERENCES contributeur (idContrib);
ALTER TABLE contribue ADD FOREIGN KEY (idO) REFERENCES oeuvres (idO);
ALTER TABLE contribue ADD PRIMARY KEY (idContrib, idO, role);


-- Insertion de données à fin de test
INSERT INTO oeuvres VALUES(1,'Shrek',2001,'film ?');
INSERT INTO films VALUES (1, '1 hour 30 minutes','Anglais');
INSERT INTO oeuvres VALUES(2, 'Tomie',1987,'Manga');
INSERT INTO livres VALUES (2,752,'Mangetsu',2021);
INSERT INTO oeuvres VALUES (3,'The Office',2005,'');
INSERT INTO series VALUES (3,8,'20 minutes');
INSERT INTO oeuvres VALUES (4, 'Concert de Nirvana',1992,'');
INSERT INTO spectacle VALUES(4, 'Nevermind European Tour', '211 avenue Jean Jaurès 75019 Paris', '1 hour 20 minutes');
INSERT INTO categories VALUES (1,'Horreur');
INSERT INTO appartient_cat VALUES (2,1);
INSERT INTO utilisateurs VALUES (1, 'Jean','Bon','jeanbon@beurre.com');
INSERT INTO statut VALUES (1,2,'en cours');
INSERT INTO eval VALUES (1,1,1,20,'Super film');
INSERT INTO contributeur VALUES (1, 'Chabat','Alain','1958-11-24');
INSERT INTO contribue VALUES (1,1,'Voix de Shrek');
