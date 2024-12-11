CREATE TABLE membre (
    id INT AUTO_INCREMENT,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    email VARCHAR(50),
    date_adhesion DATE,  
    role VARCHAR (50),
    PRIMARY KEY (id)
);
 -- insert le table de  membre
INSERT INTO membre (nom, prenom, email, date_adhesion, role) VALUES
('Dupont', 'Pierre', 'pierre.dupont@example.com', '2024-01-15', 'Président'),
('Martin', 'Sophie', 'sophie.martin@example.com', '2023-11-10', 'Vice-président'),
('Lefevre', 'Marc', 'marc.lefevre@example.com', '2022-05-20', 'Trésorier'),
('Durand', 'Claire', 'claire.durand@example.com', '2024-02-25', 'Secrétaire'),
('Bertrand', 'Lucas', 'lucas.bertrand@example.com', '2023-08-10', 'Membre actif'),
('Dufresne', 'Nina', 'nina.dufresne@example.com', '2023-09-15', 'Membre actif'),
('Thomas', 'Julien', 'julien.thomas@example.com', '2024-03-01', 'Membre actif'),
('Deschamps', 'Chloé', 'chloe.deschamps@example.com', '2022-06-30', 'Membre actif'),
('Robert', 'Antoine', 'antoine.robert@example.com', '2024-01-10', 'Membre actif'),
('Faure', 'Marie', 'marie.faure@example.com', '2023-12-05', 'Membre actif');


CREATE TABLE sponsor (
    id INT AUTO_INCREMENT,
    nom VARCHAR(50),
    email VARCHAR(50),
    montant  DECIMAL(10, 2),
    listevenement VARCHAR (100),
    PRIMARY KEY (id)
);
 -- insert le table de  sponsor 
INSERT INTO sponsor (nom, email, montant, listevenement) VALUES
('Sponsor A', 'contact@sponsorA.com', 5000.00, 'Evénement1, Evénement2'),
('Sponsor B', 'contact@sponsorB.com', 3500.00, 'Evénement2, Evénement3'),
('Sponsor C', 'contact@sponsorC.com', 7500.00, 'Evénement1, Evénement4'),
('Sponsor D', 'contact@sponsorD.com', 1200.00, 'Evénement5'),
('Sponsor E', 'contact@sponsorE.com', 2500.00, 'Evénement6'),
('Sponsor F', 'contact@sponsorF.com', 4500.00, 'Evénement2, Evénement5'),
('Sponsor G', 'contact@sponsorG.com', 3000.00, 'Evénement3'),
('Sponsor H', 'contact@sponsorH.com', 6200.00, 'Evénement1, Evénement3'),
('Sponsor I', 'contact@sponsorI.com', 4100.00, 'Evénement4'),
('Sponsor J', 'contact@sponsorJ.com', 6000.00, 'Evénement6');


    CREATE TABLE participer (
        id INT AUTO_INCREMENT, 
        nom VARCHAR(50),
        prenom VARCHAR(50),
        email VARCHAR(50),
        statut VARCHAR (100),
        PRIMARY KEY (id)
    );
    -- insert le table de  participer
 
 INSERT INTO participer (nom, prenom, email, statut) VALUES
('Durand', 'Pierre', 'pierre.durand@example.com', 'étudiant actif'),
('Martin', 'Sophie', 'sophie.martin@example.com', 'diplômé'),
('Lefevre', 'Marc', 'marc.lefevre@example.com', 'invité'),
('Bertrand', 'Lucas', 'lucas.bertrand@example.com', 'étudiant actif'),
('Faure', 'Marie', 'marie.faure@example.com', 'invité'),
('Dufresne', 'Nina', 'nina.dufresne@example.com', 'étudiant actif'),
('Robert', 'Antoine', 'antoine.robert@example.com', 'diplômé'),
('Deschamps', 'Chloé', 'chloe.deschamps@example.com', 'étudiant actif'),
('Thomas', 'Julien', 'julien.thomas@example.com'    , 'invité'),
('Lemoine', 'Emma', 'emma.lemoine@example.com', 'étudiant actif');


CREATE TABLE evenement (
    id INT AUTO_INCREMENT,
    budget DECIMAL(10, 2),
    description VARCHAR(345),
    date_evenement DATE,
    lieu VARCHAR(50),
    PRIMARY KEY (id)
);

 -- insert le table de  evenement
INSERT INTO evenement (budget, description, date_evenement, lieu) VALUES
(5000.00, 'Concert de musique avec des artistes locaux', '2024-02-15', 'Salle des Fêtes'),
(12000.50, 'Conférence sur l\'innovation technologique', '2024-03-05', 'Centre de Conférences'),
(8000.00, 'Soirée de networking pour les étudiants', '2024-04-10', 'Université XYZ'),
(1500.75, 'Atelier sur le développement durable', '2024-05-20', 'Salle polyvalente'),
(3000.00, 'Exposition d\'art étudiant', '2024-06-12', 'Musée de la Ville'),
(6000.00, 'Festival de courts-métrages', '2024-07-25', 'Cinéma Le Rex'),
(7000.00, 'Séminaire sur la gestion de projet', '2024-08-05', 'Hôtel de Ville'),
(4500.25, 'Tournoi sportif inter-écoles', '2024-09-30', 'Stade Municipal'),
(10000.00, 'Gala de charité pour la solidarité internationale', '2024-10-15', 'Salle des Congrès');






CREATE TABLE sponsore (
    _id_sponsor INT,
    id_evenement INT,
    PRIMARY KEY (_id_sponsor, id_evenement),
    FOREIGN KEY (_id_sponsor) REFERENCES sponsor(id), 
    FOREIGN KEY (id_evenement) REFERENCES evenement(id)  
);

CREATE TABLE organise (
    id_membre INT,
    id_evenement INT,
    PRIMARY KEY (id_membre, id_evenement),
    FOREIGN KEY (id_membre) REFERENCES membre(id), 
    FOREIGN KEY (id_evenement) REFERENCES evenement(id)
);

CREATE TABLE inscrit (
    id_evenement INT,
    id_participant INT,  
    PRIMARY KEY (id_evenement, id_participant), 
    FOREIGN KEY (id_evenement) REFERENCES evenement(id),
    FOREIGN KEY (id_participant) REFERENCES participer(id) 
);