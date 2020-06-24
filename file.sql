create DATABASE BP;
use bp;
create table profil(
    id int NOT NULL AUTO_INCREMENT primary key,
    libelle VARCHAR(30)
);

CREATE TABLE employee(
       id int not null AUTO_INCREMENT PRIMARY KEY,
       nom VARCHAR(30),
       prenom VARCHAR(50),
       cni VARCHAR(20),
       telephone VARCHAR(15),
       adresse VARCHAR(50),
       profession VARCHAR(50),
       email VARCHAR(75),
       login VARCHAR(30),
       password VARCHAR(20)
);

CREATE TABLE statut(
       id int not null AUTO_INCREMENT PRIMARY KEY,
       dateStatut DATE,
       dateFin DATE,
       idProfil int,
       idEmployee int,
       FOREIGN KEY(idProfil) REFERENCES profil(id),
       FOREIGN KEY(idEmployee) REFERENCES employee(id)
);

CREATE TABLE agence(
       id int not null AUTO_INCREMENT PRIMARY KEY,
       nom varchar(50),
       region varchar(50)
);

CREATE TABLE affectation(
       id int not null AUTO_INCREMENT PRIMARY KEY,
       dateAffectation DATE,
       dateFin DATE,
       idAgence int,
       idEmployee int,
       FOREIGN KEY(idEmployee) REFERENCES employee(id),
       FOREIGN KEY(idAgence) REFERENCES agence(id)
);


CREATE TABLE clientMoral(
       id int not null AUTO_INCREMENT PRIMARY KEY,
       raisonSocial varchar(50),
       adresse varchar(75),
       nom varchar(75),
       numero varchar(25),
       telephone varchar(15),
       email VARCHAR(75),
       login VARCHAR(30),
       password VARCHAR(20)
);



CREATE TABLE typeClient(
       id int not null AUTO_INCREMENT PRIMARY KEY,
       libelle varchar(50)
);


CREATE TABLE clientPhysique(
       id int not null AUTO_INCREMENT PRIMARY KEY,
       nom varchar(30),
       prenom varchar(30),
       nci VARCHAR(20),
       telephone varchar(15),
       adresse varchar(50),
       salaire decimal(15,2),
       profession varchar(50),
       email VARCHAR(75),
       login VARCHAR(30),
       password VARCHAR(15),
       idTypeClient int,
       idClientMoral int,
       FOREIGN KEY(idTypeClient) REFERENCES typeClient(id),
       FOREIGN KEY(idClientMoral) REFERENCES clientMoral(id)
);


CREATE TABLE typeCompte(
    id int not null AUTO_INCREMENT PRIMARY KEY,
    libelle varchar(50)
);

CREATE TABLE typeFrais(
    id int not null AUTO_INCREMENT PRIMARY KEY,
    libelle varchar(50)
);


CREATE TABLE typeTransaction(
    id int not null AUTO_INCREMENT PRIMARY KEY,
    libelle varchar(50)
);



CREATE TABLE compte(
    id int not null AUTO_INCREMENT PRIMARY KEY,
    numero varchar(30),
    clerib VARCHAR(55) DEFAULT NULL,
    solde decimal(15, 2),
    etat varchar(30),
    dateDeboc Date,
    dateCreat Date,
    dateFermetureTemp DATE,
    dateReouverture DATE,
    idClientPhysique int,
    idClientMoral int,
    idTypeCompte int,
    FOREIGN KEY(idClientPhysique) REFERENCES clientPhysique(id),
    FOREIGN KEY(idClientMoral) REFERENCES clientMoral(id),
    FOREIGN KEY(idTypeCompte) REFERENCES typeClient(id)
);


CREATE TABLE fraisbancaire
(
       id int not null AUTO_INCREMENT PRIMARY KEY,
       montant decimal (15, 2),
       dateFrais Date,
       idCompte int,
       idTypeFrais int,
       FOREIGN KEY  (idCompte) REFERENCES compte (id),
       FOREIGN KEY (idTypeFrais) REFERENCES typeFrais (id)
);

CREATE TABLE transaction
(
       id INT AUTO_INCREMENT,
       montantTrans DOUBLE,
       idTypeTransaction INT,
       dateTransaction VARCHAR (15),
       idEmployee INT,
       PRIMARY KEY (id),
       FOREIGN KEY (idTypeTransaction) REFERENCES typeTransaction (id),
       FOREIGN KEY (idEmployee) REFERENCES employee (id)
);


create table compttransaction
(
       idCompte int,
       idTransaction int,
       primary key (idCompte,idTransaction),
       foreign key (idCompte) references compte (id),
       foreign key (idTransaction) references transaction (id)
);
