-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 17 mars 2022 à 14:31
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `localisation`
--
CREATE DATABASE IF NOT EXISTS `localisation` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `localisation`;

-- --------------------------------------------------------

--
-- Structure de la table `continent`
--

CREATE TABLE `continent` (
  `id_continent` int(5) NOT NULL,
  `nom_continent` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `continent`
--

INSERT INTO `continent` (`id_continent`, `nom_continent`) VALUES
(1, 'Europe'),
(2, 'Afrique'),
(3, 'Asie');

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `id_pays` int(5) NOT NULL,
  `nom_pays` varchar(255) NOT NULL,
  `continent_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`id_pays`, `nom_pays`, `continent_id`) VALUES
(1, 'France', 1),
(2, 'Espagne', 1),
(3, 'Italie', 1),
(4, 'Sénégal', 2),
(5, 'Algérie', 2),
(6, 'Maroc', 2),
(7, 'Thaïlande', 3),
(8, 'Chine', 3),
(9, 'Cambodge', 3);

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `id_ville` int(5) NOT NULL,
  `nom_ville` varchar(255) NOT NULL,
  `pays_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`id_ville`, `nom_ville`, `pays_id`) VALUES
(6, 'Paris', 1),
(7, 'Marseille', 1),
(8, 'Lyon', 1),
(9, 'Toulouse', 1),
(10, 'Montpellier', 1),
(11, 'Alger', 5),
(12, 'Blida', 5),
(13, 'Oran', 5),
(14, 'Constantine', 5),
(15, 'Annaba', 5),
(16, 'Phnom Penh', 9),
(17, 'Sihanoukville', 9),
(18, 'Battambang', 9),
(19, 'Kampot', 9),
(20, 'Angkor', 9),
(21, 'Pékin', 8),
(22, 'Wuhan', 8),
(23, 'Shanghaï', 8),
(24, 'Canton', 8),
(25, 'Shenzhen', 8),
(26, 'Madrid', 2),
(27, 'Barcelone', 2),
(28, 'Séville', 2),
(29, 'Grenade', 2),
(30, 'Cordoue', 2),
(31, 'Rome', 3),
(32, 'Venise', 3),
(33, 'Florence', 3),
(34, 'Naples', 3),
(35, 'Milan', 3),
(36, 'Marrakech', 6),
(37, 'Fès', 6),
(38, 'Rabat', 6),
(39, 'Agadir', 6),
(40, 'Tanger', 6),
(41, 'Dakar', 4),
(42, 'Saint-Louis', 4),
(43, 'Kaolack', 4),
(44, 'Ziguinchor', 4),
(45, 'Tambacounda', 4),
(46, 'Bangkok', 7),
(47, 'Nonthaburi', 7),
(48, 'Samut Prakan', 7),
(49, 'Chiang Mai', 7),
(50, 'Phuket', 7);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `continent`
--
ALTER TABLE `continent`
  ADD PRIMARY KEY (`id_continent`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id_pays`),
  ADD KEY `continent_id` (`continent_id`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`id_ville`),
  ADD KEY `pays_id` (`pays_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `continent`
--
ALTER TABLE `continent`
  MODIFY `id_continent` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `pays`
--
ALTER TABLE `pays`
  MODIFY `id_pays` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `ville`
--
ALTER TABLE `ville`
  MODIFY `id_ville` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `pays`
--
ALTER TABLE `pays`
  ADD CONSTRAINT `pays_ibfk_1` FOREIGN KEY (`continent_id`) REFERENCES `continent` (`id_continent`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ville`
--
ALTER TABLE `ville`
  ADD CONSTRAINT `ville_ibfk_1` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id_pays`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
