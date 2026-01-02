CREATE DATABASE blogs;
USE blogs;
CREATE TABLE utilisateur (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(120) NOT NULL,
    email VARCHAR(200) NOT NULL UNIQUE,
    password VARCHAR(300) NOT NULL
);
CREATE TABLE categorie (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(55) NOT NULL
);
CREATE TABLE article (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(55) NOT NULL,
    contenu TEXT,
    date_pub DATE,
    statut ENUM('publié','brouillon'),
    id_utilisateur INT,
    id_categorie INT,
    FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id),
    FOREIGN KEY (id_categorie) REFERENCES categorie(id)
);
CREATE TABLE commentaire (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contenu TEXT,
    date_commentaire DATE,
    id_utilisateur INT,
    id_article INT,
    FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id),
    FOREIGN KEY (id_article) REFERENCES article(id)
);
INSERT INTO utilisateur (nom, email, password) VALUES
('Sara El Amrani', 'sara@example.com', 'password123'),
('Youssef Bakkali', 'youssef@example.com', 'secret456'),
('Imane Khoury', 'imane@example.com', 'pass789');
INSERT INTO categorie (nom) VALUES
('skincare'),
('Lifestyle'),
('healthy');
INSERT INTO article (titre, contenu, date_pub, statut, id_utilisateur, id_categorie) VALUES
('Routine matinale pour une peau éclatante en 5 minutes', 'Nettoyer la peau, Hydratation rapide, Protection solaire…', '2025-12-05', 'publié', 1, 1),
('BMW ', 'BMW est l’une des marques automobiles les plus prestigieuses au monde, connue pour ses moteurs puissants...', '2025-12-01', 'publié', 2, 2),
('“Mes astuces pour gérer le stress au quotidien', 'Découvre des astuces simples pour réduire le stress chaque jour : respiration, mini-méditations et petites routines qui améliorent ton humeur et ton bien-être....', '2025-11-11', 'publié', 3, 3);
INSERT INTO commentaire (contenu, date_commentaire, id_utilisateur, id_article) VALUES
('Super article, très utile!', '2025-12-02', 2, 2),
('Merci pour les conseils!', '2025-12-06', 1, 1),
('Merçi bcp.', '2025-12-11', 2, 3);