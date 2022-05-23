-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Mar 15 Janvier 2020 à 14:56
-- Version du serveur: 5.5.8
-- Version de PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";   


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `gsb-cr`
--
DROP DATABASE IF EXISTS `gsb-cr`;
CREATE DATABASE IF NOT EXISTS `gsb-cr`;
USE `gsb-cr`;
-- --------------------------------------------------------

--
-- Structure de la table `activitecompl`
--

CREATE TABLE IF NOT EXISTS `activitecompl` (
  `acNum` int(11) NOT NULL AUTO_INCREMENT,
  `acDate` datetime DEFAULT NULL,
  `acLieu` varchar(25) DEFAULT NULL,
  `acTheme` varchar(10) DEFAULT NULL,
  `acMotif` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`acNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `activitecompl`
--


-- --------------------------------------------------------

--
-- Structure de la table `composant`
--

CREATE TABLE IF NOT EXISTS `composant` (
  `cmpCode` varchar(4) NOT NULL,
  `cmpLibelle` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`cmpCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `composant`
--


-- --------------------------------------------------------

--
-- Structure de la table `constituer`
--

CREATE TABLE IF NOT EXISTS `constituer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmpCode` varchar(4) NOT NULL,
  `medDepotlegal` varchar(10) NOT NULL,
  `cstQte` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_{C117FEE7-AA81-4F86-B5FE-F201F9F80B0D}` (`medDepotlegal`),
  KEY `FK_{71FD2D72-0D6A-43C1-963B-3633406D704D}` (`cmpCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `constituer`
--


-- --------------------------------------------------------

--
-- Structure de la table `dosage`
--

CREATE TABLE IF NOT EXISTS `dosage` (
  `dosCode` varchar(10) NOT NULL,
  `dosQuantite` varchar(10) DEFAULT NULL,
  `dosUnite` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`dosCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `dosage`
--


-- --------------------------------------------------------

--
-- Structure de la table `famille`
--

CREATE TABLE IF NOT EXISTS `famille` (
  `famCode` varchar(3) NOT NULL,
  `famLibelle` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`famCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `famille`
--

INSERT INTO `famille` (`famCode`, `famLibelle`) VALUES
('AA', 'Antalgiques en association'),
('AAA', 'Antalgiques antipyrétiques en association'),
('AAC', 'Antidépresseur d''action centrale'),
('AAH', 'Antivertigineux antihistaminique H1'),
('ABA', 'Antibiotique antituberculeux'),
('ABC', 'Antibiotique antiacnéique local'),
('ABP', 'Antibiotique de la famille des béta-lactamines (pénicilline A)'),
('AFC', 'Antibiotique de la famille des cyclines'),
('AFM', 'Antibiotique de la famille des macrolides'),
('AH', 'Antihistaminique H1 local'),
('AIM', 'Antidépresseur imipraminique (tricyclique)'),
('AIN', 'Antidépresseur inhibiteur sélectif de la recapture de la sérotonine'),
('ALO', 'Antibiotique local (ORL)'),
('ANS', 'Antidépresseur IMAO non sélectif'),
('AO', 'Antibiotique ophtalmique'),
('AP', 'Antipsychotique normothymique'),
('AUM', 'Antibiotique urinaire minute'),
('CRT', 'Corticoïde, antibiotique et antifongique à  usage local'),
('HYP', 'Hypnotique antihistaminique'),
('PSA', 'Psychostimulant, antiasthénique');

-- --------------------------------------------------------

--
-- Structure de la table `formuler`
--

CREATE TABLE IF NOT EXISTS `formuler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `preCode` varchar(2) NOT NULL,
  `medDepotlegal` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_{1FA0425F-A30D-420E-9142-AB9EEA79ABAF}` (`medDepotlegal`),
  KEY `FK_{35254FCA-17C5-4BED-ACE9-7A61C0B36749}` (`preCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `formuler`
--


-- --------------------------------------------------------

--
-- Structure de la table `interagir`
--

CREATE TABLE IF NOT EXISTS `interagir` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medMeddepotlegal` varchar(10) NOT NULL,
  `medDepotlegal` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_{C1208A3D-F928-4436-AACF-376DDC7DA8F9}` (`medDepotlegal`),
  KEY `FK_{F32A801A-44C2-4AEB-8A0E-51396C6F3020}` (`medMeddepotlegal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `interagir`
--


-- --------------------------------------------------------

--
-- Structure de la table `inviter`
--

CREATE TABLE IF NOT EXISTS `inviter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acNum` int(11) NOT NULL,
  `praNum` int(11) NOT NULL,
  `specialisteon` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_{DEB1742C-B963-41D9-9F12-F7F65DC9FC18}` (`praNum`),
  KEY `FK_{194BCE92-A8C4-4683-91C2-7B1CC0E48F1B}` (`acNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `inviter`
--


-- --------------------------------------------------------

--
-- Structure de la table `labo`
--

CREATE TABLE IF NOT EXISTS `labo` (
  `labCode` varchar(2) NOT NULL,
  `labNom` varchar(10) DEFAULT NULL,
  `labChefvente` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`labCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `labo`
--

INSERT INTO `labo` (`labCode`, `labNom`, `labChefvente`) VALUES
('BC', 'Bichat', 'Suzanne Terminus'),
('GY', 'Gyverny', 'Marcel MacDouglas'),
('SW', 'Swiss Kane', 'Alain Poutre');

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

CREATE TABLE IF NOT EXISTS `medicament` (
  `medDepotlegal` varchar(10) NOT NULL,
  `medNomcommercial` varchar(25) DEFAULT NULL,
  `famCode` varchar(3) NOT NULL,
  `medComposition` varchar(255) DEFAULT NULL,
  `medEffets` varchar(255) DEFAULT NULL,
  `medContreindic` varchar(255) DEFAULT NULL,
  `medPrixechantillon` float DEFAULT NULL,
  PRIMARY KEY (`medDepotlegal`),
  KEY `FK_{413a5d7485a845e7b320df5e9396baed}` (`famCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `medicament`
--

INSERT INTO `medicament` (`medDepotlegal`, `medNomcommercial`, `famCode`, `medComposition`, `medEffets`, `medContreindic`, `medPrixechantillon`) VALUES
('3MYC7', 'TRIMYCINE', 'CRT', 'Triamcinolone (acétonide) + Néomycine + Nystatine', 'Ce médicament est un corticoïde à  activité forte ou très forte associé à  un antibiotique et un antifongique, utilisé en application locale dans certaines atteintes cutanées surinfectées.', 'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants, d''infections de la peau ou de parasitisme non traités, d''acné. Ne pas appliquer sur une plaie, ni sous un pansement occlusif.', NULL),
('ADIMOL9', 'ADIMOL', 'ABP', 'Amoxicilline + Acide clavulanique', 'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', 'Ce médicament est contre-indiqué en cas d''allergie aux pénicillines ou aux céphalosporines.', NULL),
('AMOPIL7', 'AMOPIL', 'ABP', 'Amoxicilline', 'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', 'Ce médicament est contre-indiqué en cas d''allergie aux pénicillines. Il doit être administré avec prudence en cas d''allergie aux céphalosporines.', NULL),
('AMOX45', 'AMOXAR', 'ABP', 'Amoxicilline', 'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', 'La prise de ce médicament peut rendre positifs les tests de dépistage du dopage.', NULL),
('AMOXIG12', 'AMOXI Gé', 'ABP', 'Amoxicilline', 'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', 'Ce médicament est contre-indiqué en cas d''allergie aux pénicillines. Il doit être administré avec prudence en cas d''allergie aux céphalosporines.', NULL),
('APATOUX22', 'APATOUX Vitamine C', 'ALO', 'Tyrothricine + Tétracaïne + Acide ascorbique (Vitamine C)', 'Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.', 'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants, en cas de phénylcétonurie et chez l''enfant de moins de 6 ans.', NULL),
('BACTIG10', 'BACTIGEL', 'ABC', 'Erythromycine', 'Ce médicament est utilisé en application locale pour traiter l''acné et les infections cutanées bactériennes associées.', 'Ce médicament est contre-indiqué en cas d''allergie aux antibiotiques de la famille des macrolides ou des lincosanides.', NULL),
('BACTIV13', 'BACTIVIL', 'AFM', 'Erythromycine', 'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.', 'Ce médicament est contre-indiqué en cas d''allergie aux macrolides (dont le chef de file est l''érythromycine).', NULL),
('BITALV', 'BIVALIC', 'AAA', 'Dextropropoxyphène + Paracétamol', 'Ce médicament est utilisé pour traiter les douleurs d''intensité modérée ou intense.', 'Ce médicament est contre-indiqué en cas d''allergie aux médicaments de cette famille, d''insuffisance hépatique ou d''insuffisance rénale.', NULL),
('CARTION6', 'CARTION', 'AAA', 'Acide acétylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Paracétamol', 'Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.', 'Ce médicament est contre-indiqué en cas de troubles de la coagulation (tendances aux hémorragies), d''ulcère gastroduodénal, maladies graves du foie.', NULL),
('CLAZER6', 'CLAZER', 'AFM', 'Clarithromycine', 'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques. Il est également utilisé dans le traitement de l''ulcère gastro-duodénal, en association avec d''autres médicaments.', 'Ce médicament est contre-indiqué en cas d''allergie aux macrolides (dont le chef de file est l''érythromycine).', NULL),
('DEPRIL9', 'DEPRAMIL', 'AIM', 'Clomipramine', 'Ce médicament est utilisé pour traiter les épisodes dépressifs sévères, certaines douleurs rebelles, les troubles obsessionnels compulsifs et certaines énurésies chez l''enfant.', 'Ce médicament est contre-indiqué en cas de glaucome ou d''adénome de la prostate, d''infarctus récent, ou si vous avez reà§u un traitement par IMAO durant les 2 semaines précédentes ou en cas d''allergie aux antidépresseurs imipraminiques.', NULL),
('DIMIRTAM6', 'DIMIRTAM', 'AAC', 'Mirtazapine', 'Ce médicament est utilisé pour traiter les épisodes dépressifs sévères.', 'La prise de ce produit est contre-indiquée en cas de d''allergie à  l''un des constituants.', NULL),
('DOLRIL7', 'DOLORIL', 'AAA', 'Acide acétylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Paracétamol', 'Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.', 'Ce médicament est contre-indiqué en cas d''allergie au paracétamol ou aux salicylates.', NULL),
('DORNOM8', 'NORMADOR', 'HYP', 'Doxylamine', 'Ce médicament est utilisé pour traiter l''insomnie chez l''adulte.', 'Ce médicament est contre-indiqué en cas de glaucome, de certains troubles urinaires (rétention urinaire) et chez l''enfant de moins de 15 ans.', NULL),
('EQUILARX6', 'EQUILAR', 'AAH', 'Méclozine', 'Ce médicament est utilisé pour traiter les vertiges et pour prévenir le mal des transports.', 'Ce médicament ne doit pas être utilisé en cas d''allergie au produit, en cas de glaucome ou de rétention urinaire.', NULL),
('EVILR7', 'EVEILLOR', 'PSA', 'Adrafinil', 'Ce médicament est utilisé pour traiter les troubles de la vigilance et certains symptomes neurologiques chez le sujet agé.', 'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants.', NULL),
('INSXT5', 'INSECTIL', 'AH', 'Diphénydramine', 'Ce médicament est utilisé en application locale sur les piqûres d''insecte et l''urticaire.', 'Ce médicament est contre-indiqué en cas d''allergie aux antihistaminiques.', NULL),
('JOVAI8', 'JOVENIL', 'AFM', 'Josamycine', 'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.', 'Ce médicament est contre-indiqué en cas d''allergie aux macrolides (dont le chef de file est l''érythromycine).', NULL),
('LIDOXY23', 'LIDOXYTRACINE', 'AFC', 'Oxytétracycline +Lidocaïne', 'Ce médicament est utilisé en injection intramusculaire pour traiter certaines infections spécifiques.', 'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants. Il ne doit pas être associé aux rétinoïdes.', NULL),
('LITHOR12', 'LITHORINE', 'AP', 'Lithium', 'Ce médicament est indiqué dans la prévention des psychoses maniaco-dépressives ou pour traiter les états maniaques.', 'Ce médicament ne doit pas être utilisé si vous êtes allergique au lithium. Avant de prendre ce traitement, signalez à  votre médecin traitant si vous souffrez d''insuffisance rénale, ou si vous avez un régime sans sel.', NULL),
('PARMOL16', 'PARMOCODEINE', 'AA', 'Codéine + Paracétamol', 'Ce médicament est utilisé pour le traitement des douleurs lorsque des antalgiques simples ne sont pas assez efficaces.', 'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants, chez l''enfant de moins de 15 Kg, en cas d''insuffisance hépatique ou respiratoire, d''asthme, de phénylcétonurie et chez la femme qui allaite.', NULL),
('PHYSOI8', 'PHYSICOR', 'PSA', 'Sulbutiamine', 'Ce médicament est utilisé pour traiter les baisses d''activité physique ou psychique, souvent dans un contexte de dépression.', 'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants.', NULL),
('PIRIZ8', 'PIRIZAN', 'ABA', 'Pyrazinamide', 'Ce médicament est utilisé, en association à  d''autres antibiotiques, pour traiter la tuberculose.', 'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants, d''insuffisance rénale ou hépatique, d''hyperuricémie ou de porphyrie.', NULL),
('POMDI20', 'POMADINE', 'AO', 'Bacitracine', 'Ce médicament est utilisé pour traiter les infections oculaires de la surface de l''oeil.', 'Ce médicament est contre-indiqué en cas d''allergie aux antibiotiques appliqués localement.', NULL),
('TROXT21', 'TROXADET', 'AIN', 'Paroxétine', 'Ce médicament est utilisé pour traiter la dépression et les troubles obsessionnels compulsifs. Il peut également être utilisé en prévention des crises de panique avec ou sans agoraphobie.', 'Ce médicament est contre-indiqué en cas d''allergie au produit.', NULL),
('TXISOL22', 'TOUXISOL Vitamine C', 'ALO', 'Tyrothricine + Acide ascorbique (Vitamine C)', 'Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.', 'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants et chez l''enfant de moins de 6 ans.', NULL),
('URIEG6', 'URIREGUL', 'AUM', 'Fosfomycine trométamol', 'Ce médicament est utilisé pour traiter les infections urinaires simples chez la femme de moins de 65 ans.', 'La prise de ce médicament est contre-indiquée en cas d''allergie à  l''un des constituants et d''insuffisance rénale.', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `offrir`
--

CREATE TABLE IF NOT EXISTS `offrir` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visMatricule` varchar(10) NOT NULL,
  `rapNum` int(11) NOT NULL,
  `medDepotlegal` varchar(10) NOT NULL,
  `offQte` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_{212870AC-D285-4251-9654-14A416149517}` (`medDepotlegal`),
  KEY `FK_{3A261F4F-9FED-418E-8FEE-E91583119C7E}` (`visMatricule`,`rapNum`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `offrir`
--

INSERT INTO `offrir` (`id`, `visMatricule`, `rapNum`, `medDepotlegal`, `offQte`) VALUES
(1, 'a17', 4, '3MYC7', 3),
(2, 'a17', 4, 'AMOX45', 12);

-- --------------------------------------------------------

--
-- Structure de la table `posseder`
--

CREATE TABLE IF NOT EXISTS `posseder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `speCode` varchar(5) NOT NULL,
  `praNum` int(11) NOT NULL,
  `posDiplome` varchar(10) DEFAULT NULL,
  `posCoefprescription` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_{99960067-C04E-44F3-95AF-6F4F392F6347}` (`praNum`),
  KEY `FK_{6F32033E-99CD-4486-8CE2-84644754DE3F}` (`speCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `posseder`
--


-- --------------------------------------------------------

--
-- Structure de la table `praticien`
--

CREATE TABLE IF NOT EXISTS `praticien` (
  `praNum` int(11) NOT NULL,
  `praNom` varchar(25) DEFAULT NULL,
  `praPrenom` varchar(30) DEFAULT NULL,
  `praAdresse` varchar(50) DEFAULT NULL,
  `praCp` varchar(5) DEFAULT NULL,
  `praVille` varchar(25) DEFAULT NULL,
  `praCoefnotoriete` float DEFAULT NULL,
  `typCode` varchar(3) NOT NULL,
  PRIMARY KEY (`praNum`),
  KEY `FK_{1dd782ab506c441b9e6d7263fd1c1eaf}` (`typCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `praticien`
--

INSERT INTO `praticien` (`praNum`, `praNom`, `praPrenom`, `praAdresse`, `praCp`, `praVille`, `praCoefnotoriete`, `typCode`) VALUES
(1, 'Notini', 'Alain', '114 r Authie', '85000', 'LA ROCHE SUR YON', 290.03, 'MH'),
(2, 'Gosselin', 'Albert', '13 r Devon', '41000', 'BLOIS', 307.49, 'MV'),
(3, 'Delahaye', 'André', '36 av 6 Juin', '25000', 'BESANCON', 185.79, 'PS'),
(4, 'Leroux', 'André', '47 av Robert Schuman', '60000', 'BEAUVAIS', 172.04, 'PH'),
(5, 'Desmoulins', 'Anne', '31 r St Jean', '30000', 'NIMES', 94.75, 'PO'),
(6, 'Mouel', 'Anne', '27 r Auvergne', '80000', 'AMIENS', 45.2, 'MH'),
(7, 'Desgranges-Lentz', 'Antoine', '1 r Albert de Mun', '29000', 'MORLAIX', 20.07, 'MV'),
(8, 'Marcouiller', 'Arnaud', '31 r St Jean', '68000', 'MULHOUSE', 396.52, 'PS'),
(9, 'Dupuy', 'Benoit', '9 r Demolombe', '34000', 'MONTPELLIER', 395.66, 'PH'),
(10, 'Lerat', 'Bernard', '31 r St Jean', '59000', 'LILLE', 257.79, 'PO'),
(11, 'Marçais-Lefebvre', 'Bertrand', '86Bis r Basse', '67000', 'STRASBOURG', 450.96, 'MH'),
(12, 'Boscher', 'Bruno', '94 r Falaise', '10000', 'TROYES', 356.14, 'MV'),
(13, 'Morel', 'Catherine', '21 r Chateaubriand', '75000', 'PARIS', 379.57, 'PS'),
(14, 'Guivarch', 'Chantal', '4 av Gén Laperrine', '45000', 'ORLEANS', 114.56, 'PH'),
(15, 'Bessin-Grosdoit', 'Christophe', '92 r Falaise', '6000', 'NICE', 222.06, 'PO'),
(16, 'Rossa', 'Claire', '14 av Thiès', '6000', 'NICE', 529.78, 'MH'),
(17, 'Cauchy', 'Denis', '5 av Ste Thérèse', '11000', 'NARBONNE', 458.82, 'MV'),
(18, 'Gaffé', 'Dominique', '9 av 1ère Armée Française', '35000', 'RENNES', 213.4, 'PS'),
(19, 'Guenon', 'Dominique', '98 bd Mar Lyautey', '44000', 'NANTES', 175.89, 'PH'),
(20, 'Prévot', 'Dominique', '29 r Lucien Nelle', '87000', 'LIMOGES', 151.36, 'PO'),
(21, 'Houchard', 'Eliane', '9 r Demolombe', '49100', 'ANGERS', 436.96, 'MH'),
(22, 'Desmons', 'Elisabeth', '51 r Bernières', '29000', 'QUIMPER', 281.17, 'MV'),
(23, 'Flament', 'Elisabeth', '11 r Pasteur', '35000', 'RENNES', 315.6, 'PS'),
(24, 'Goussard', 'Emmanuel', '9 r Demolombe', '41000', 'BLOIS', 40.72, 'PH'),
(25, 'Desprez', 'Eric', '9 r Vaucelles', '33000', 'BORDEAUX', 406.85, 'PO'),
(26, 'Coste', 'Evelyne', '29 r Lucien Nelle', '19000', 'TULLE', 441.87, 'MH'),
(27, 'Lefebvre', 'Frédéric', '2 pl Wurzburg', '55000', 'VERDUN', 573.63, 'MV'),
(28, 'Lemée', 'Frédéric', '29 av 6 Juin', '56000', 'VANNES', 326.4, 'PS'),
(29, 'Martin', 'Frédéric', 'Bât A 90 r Bayeux', '70000', 'VESOUL', 506.06, 'PH'),
(30, 'Marie', 'Frédérique', '172 r Caponière', '70000', 'VESOUL', 313.31, 'PO'),
(31, 'Rosenstech', 'Geneviève', '27 r Auvergne', '75000', 'PARIS', 366.82, 'MH'),
(32, 'Pontavice', 'Ghislaine', '8 r Gaillon', '86000', 'POITIERS', 265.58, 'MV'),
(33, 'Leveneur-Mosquet', 'Guillaume', '47 av Robert Schuman', '64000', 'PAU', 184.97, 'PS'),
(34, 'Blanchais', 'Guy', '30 r Authie', '8000', 'SEDAN', 502.48, 'PH'),
(35, 'Leveneur', 'Hugues', '7 pl St Gilles', '62000', 'ARRAS', 7.39, 'PO'),
(36, 'Mosquet', 'Isabelle', '22 r Jules Verne', '76000', 'ROUEN', 77.1, 'MH'),
(37, 'Giraudon', 'Jean-Christophe', '1 r Albert de Mun', '38100', 'VIENNE', 92.62, 'MV'),
(38, 'Marie', 'Jean-Claude', '26 r Hérouville', '69000', 'LYON', 120.1, 'PS'),
(39, 'Maury', 'Jean-François', '5 r Pierre Girard', '71000', 'CHALON SUR SAONE', 13.73, 'PH'),
(40, 'Dennel', 'Jean-Louis', '7 pl St Gilles', '28000', 'CHARTRES', 550.69, 'PO'),
(41, 'Ain', 'Jean-Pierre', '4 résid Olympia', '2000', 'LAON', 5.59, 'MH'),
(42, 'Chemery', 'Jean-Pierre', '51 pl Ancienne Boucherie', '14000', 'CAEN', 396.58, 'MV'),
(43, 'Comoz', 'Jean-Pierre', '35 r Auguste Lechesne', '18000', 'BOURGES', 340.35, 'PS'),
(44, 'Desfaudais', 'Jean-Pierre', '7 pl St Gilles', '29000', 'BREST', 71.76, 'PH'),
(45, 'Phan', 'JérÃ´me', '9 r Clos Caillet', '79000', 'NIORT', 451.61, 'PO'),
(46, 'Riou', 'Line', '43 bd Gén Vanier', '77000', 'MARNE LA VALLEE', 193.25, 'MH'),
(47, 'Chubilleau', 'Louis', '46 r Eglise', '17000', 'SAINTES', 202.07, 'MV'),
(48, 'Lebrun', 'Lucette', '178 r Auge', '54000', 'NANCY', 410.41, 'PS'),
(49, 'Goessens', 'Marc', '6 av 6 Juin', '39000', 'DOLE', 548.57, 'PH'),
(50, 'Laforge', 'Marc', '5 résid Prairie', '50000', 'SAINT LO', 265.05, 'PO'),
(51, 'Millereau', 'Marc', '36 av 6 Juin', '72000', 'LA FERTE BERNARD', 430.42, 'MH'),
(52, 'Dauverne', 'Marie-Christine', '69 av Charlemagne', '21000', 'DIJON', 281.05, 'MV'),
(53, 'Vittorio', 'Myriam', '3 pl Champlain', '94000', 'BOISSY SAINT LEGER', 356.23, 'PS'),
(54, 'Lapasset', 'Nhieu', '31 av 6 Juin', '52000', 'CHAUMONT', 107, 'PH'),
(55, 'Plantet-Besnier', 'Nicole', '10 av 1ère Armée Française', '86000', 'CHATELLEREAULT', 369.94, 'PO'),
(56, 'Chubilleau', 'Pascal', '3 r Hastings', '15000', 'AURRILLAC', 290.75, 'MH'),
(57, 'Robert', 'Pascal', '31 r St Jean', '93000', 'BOBIGNY', 162.41, 'MV'),
(58, 'Jean', 'Pascale', '114 r Authie', '49100', 'SAUMUR', 375.52, 'PS'),
(59, 'Chanteloube', 'Patrice', '14 av Thiès', '13000', 'MARSEILLE', 478.01, 'PH'),
(60, 'Lecuirot', 'Patrice', 'résid St Pères 55 r Pigacière', '54000', 'NANCY', 239.66, 'PO'),
(61, 'Gandon', 'Patrick', '47 av Robert Schuman', '37000', 'TOURS', 599.06, 'MH'),
(62, 'Mirouf', 'Patrick', '22 r Puits Picard', '74000', 'ANNECY', 458.42, 'MV'),
(63, 'Boireaux', 'Philippe', '14 av Thiès', '10000', 'CHALON EN CHAMPAGNE', 454.48, 'PS'),
(64, 'Cendrier', 'Philippe', '7 pl St Gilles', '12000', 'RODEZ', 164.16, 'PH'),
(65, 'Duhamel', 'Philippe', '114 r Authie', '34000', 'MONTPELLIER', 98.62, 'PO'),
(66, 'Grigy', 'Philippe', '15 r Mélingue', '44000', 'CLISSON', 285.1, 'MH'),
(67, 'Linard', 'Philippe', '1 r Albert de Mun', '81000', 'ALBI', 486.3, 'MV'),
(68, 'Lozier', 'Philippe', '8 r Gaillon', '31000', 'TOULOUSE', 48.4, 'PS'),
(69, 'Dechâtre', 'Pierre', '63 av Thiès', '23000', 'MONTLUCON', 253.75, 'PH'),
(70, 'Goessens', 'Pierre', '22 r Jean Romain', '40000', 'MONT DE MARSAN', 426.19, 'PO'),
(71, 'Leménager', 'Pierre', '39 av 6 Juin', '57000', 'METZ', 118.7, 'MH'),
(72, 'Née', 'Pierre', '39 av 6 Juin', '82000', 'MONTAUBAN', 72.54, 'MV'),
(73, 'Guyot', 'Pierre-Laurent', '43 bd Gén Vanier', '48000', 'MENDE', 352.31, 'PS'),
(74, 'Chauchard', 'Roger', '9 r Vaucelles', '13000', 'MARSEILLE', 552.19, 'PH'),
(75, 'Mabire', 'Roland', '11 r Boutiques', '67000', 'STRASBOURG', 422.39, 'PO'),
(76, 'Leroy', 'Soazig', '45 r Boutiques', '61000', 'ALENCON', 570.67, 'MH'),
(77, 'Guyot', 'Stéphane', '26 r Hérouville', '46000', 'FIGEAC', 28.85, 'MV'),
(78, 'Delposen', 'Sylvain', '39 av 6 Juin', '27000', 'DREUX', 292.01, 'PS'),
(79, 'Rault', 'Sylvie', '15 bd Richemond', '2000', 'SOISSON', 526.6, 'PH'),
(80, 'Renouf', 'Sylvie', '98 bd Mar Lyautey', '88000', 'EPINAL', 425.24, 'PO'),
(81, 'Alliet-Grach', 'Thierry', '14 av Thiès', '7000', 'PRIVAS', 451.31, 'MH'),
(82, 'Bayard', 'Thierry', '92 r Falaise', '42000', 'SAINT ETIENNE', 271.71, 'MV'),
(83, 'Gauchet', 'Thierry', '7 r Desmoueux', '38100', 'GRENOBLE', 406.1, 'PS'),
(84, 'Bobichon', 'Tristan', '219 r Caponière', '9000', 'FOIX', 218.36, 'PH'),
(85, 'Duchemin-Laniel', 'Véronique', '130 r St Jean', '33000', 'LIBOURNE', 265.61, 'PO'),
(86, 'Laurent', 'Younès', '34 r Demolombe', '53000', 'MAYENNE', 496.1, 'MH');

-- --------------------------------------------------------

--
-- Structure de la table `prescrire`
--

CREATE TABLE IF NOT EXISTS `prescrire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medDepotlegal` varchar(10) NOT NULL,
  `tinCode` varchar(5) NOT NULL,
  `dosCode` varchar(10) NOT NULL,
  `prePosologie` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_{2551EBD9-3594-4572-9B70-C3ADA46DC4AE}` (`tinCode`),
  KEY `FK_{C90A61AD-D8EF-48C0-8F11-39ADCC0CB9E6}` (`dosCode`),
  KEY `FK_{02233D94-7C64-4199-B94D-8E272446F5A6}` (`medDepotlegal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `prescrire`
--


-- --------------------------------------------------------

--
-- Structure de la table `presentation`
--

CREATE TABLE IF NOT EXISTS `presentation` (
  `preCode` varchar(2) NOT NULL,
  `preLibelle` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`preCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `presentation`
--


-- --------------------------------------------------------

--
-- Structure de la table `rapportvisite`
--

CREATE TABLE IF NOT EXISTS `rapportvisite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visMatricule` varchar(10) NOT NULL,
  `rapNum` int(11) NOT NULL,
  `praNum` int(11) NOT NULL,
  `rapDate` datetime DEFAULT NULL,
  `rapBilan` varchar(255) DEFAULT NULL,
  `rapMotif` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_{8ee7b4b5e5094735b4df9ef80ac6fa90}` (`praNum`),
  KEY `FK_{c0c347fc964646199e2a572232ab4654}` (`visMatricule`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `rapportvisite`
--

INSERT INTO `rapportvisite` (`id`, `visMatricule`, `rapNum`, `praNum`, `rapDate`, `rapBilan`, `rapMotif`) VALUES
(1, 'a131', 3, 23, '2002-04-18 00:00:00', 'Médecin curieux, à recontacer en décembre pour réunion', 'Actualisation annuelle'),
(2, 'a131', 7, 41, '2003-03-23 00:00:00', 'RAS\r\nChangement de tel : 05 89 89 89 89', 'Rapport Annuel'),
(3, 'a17', 4, 4, '2003-05-21 00:00:00', 'Changement de direction, redéfinition de la politique médicamenteuse, recours au générique', 'Baisse activité');

-- --------------------------------------------------------

--
-- Structure de la table `realiser`
--

CREATE TABLE IF NOT EXISTS `realiser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acNum` int(11) NOT NULL,
  `visMatricule` varchar(10) NOT NULL,
  `reaMttfrais` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_{E097CD3C-C67D-41B2-9249-8689FD140E16}` (`visMatricule`),
  KEY `FK_{D1B87024-4384-43BC-9EC9-870194D4BD7B}` (`acNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `realiser`
--


-- --------------------------------------------------------

--
-- Structure de la table `region`
--

CREATE TABLE IF NOT EXISTS `region` (
  `regCode` varchar(2) NOT NULL,
  `secCode` varchar(1) NOT NULL,
  `regNom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`regCode`),
  KEY `FK_{2a8a348f6d52456bb96a7b966468977e}` (`secCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `region`
--

INSERT INTO `region` (`regCode`, `secCode`, `regNom`) VALUES
('AL', 'E', 'Alsace Lorraine'),
('AQ', 'S', 'Aquitaine'),
('AU', 'P', 'Auvergne'),
('BG', 'O', 'Bretagne'),
('BN', 'O', 'Basse Normandie'),
('BO', 'E', 'Bourgogne'),
('CA', 'N', 'Champagne Ardennes'),
('CE', 'P', 'Centre'),
('FC', 'E', 'Franche Comté'),
('HN', 'N', 'Haute Normandie'),
('IF', 'P', 'Ile de France'),
('LG', 'S', 'Languedoc'),
('LI', 'P', 'Limousin'),
('MP', 'S', 'Midi Pyrénée'),
('NP', 'N', 'Nord Pas de Calais'),
('PA', 'S', 'Provence Alpes Cote d''Azur'),
('PC', 'O', 'Poitou Charente'),
('PI', 'N', 'Picardie'),
('PL', 'O', 'Pays de Loire'),
('RA', 'E', 'Rhone Alpes'),
('RO', 'S', 'Roussilon'),
('VD', 'O', 'Vendée');

-- --------------------------------------------------------

--
-- Structure de la table `secteur`
--

CREATE TABLE IF NOT EXISTS `secteur` (
  `secCode` varchar(1) NOT NULL,
  `secLibelle` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`secCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `secteur`
--

INSERT INTO `secteur` (`secCode`, `secLibelle`) VALUES
('E', 'Est'),
('N', 'Nord'),
('O', 'Ouest'),
('P', 'Paris centre'),
('S', 'Sud');

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

CREATE TABLE IF NOT EXISTS `specialite` (
  `speCode` varchar(5) NOT NULL,
  `speLibelle` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`speCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `specialite`
--

INSERT INTO `specialite` (`speCode`, `speLibelle`) VALUES
('ACP', 'anatomie et cytologie pathologiques'),
('AMV', 'angéiologie, médecine vasculaire'),
('ARC', 'anesthésiologie et réanimation chirurgicale'),
('BM', 'biologie médicale'),
('CAC', 'cardiologie et affections cardio-vasculaires'),
('CCT', 'chirurgie cardio-vasculaire et thoracique'),
('CG', 'chirurgie générale'),
('CMF', 'chirurgie maxillo-faciale'),
('COM', 'cancérologie, oncologie médicale'),
('COT', 'chirurgie orthopédique et traumatologie'),
('CPR', 'chirurgie plastique reconstructrice et esthétique'),
('CU', 'chirurgie urologique'),
('CV', 'chirurgie vasculaire'),
('DN', 'diabétologie-nutrition, nutrition'),
('DV', 'dermatologie et vénéréologie'),
('EM', 'endocrinologie et métabolismes'),
('ETD', 'évaluation et traitement de la douleur'),
('GEH', 'gastro-entérologie et hépatologie (appareil digestif)'),
('GMO', 'gynécologie médicale, obstétrique'),
('GO', 'gynécologie-obstétrique'),
('HEM', 'maladies du sang (hématologie)'),
('MBS', 'médecine et biologie du sport'),
('MDT', 'médecine du travail'),
('MMO', 'médecine manuelle - ostéopathie'),
('MN', 'médecine nucléaire'),
('MPR', 'médecine physique et de réadaptation'),
('MTR', 'médecine tropicale, pathologie infectieuse et tropicale'),
('NEP', 'néphrologie'),
('NRC', 'neurochirurgie'),
('NRL', 'neurologie'),
('ODM', 'orthopédie dento maxillo-faciale'),
('OPH', 'ophtalmologie'),
('ORL', 'oto-rhino-laryngologie'),
('PEA', 'psychiatrie de l''enfant et de l''adolescent'),
('PME', 'pédiatrie maladies des enfants'),
('PNM', 'pneumologie'),
('PSC', 'psychiatrie'),
('RAD', 'radiologie (radiodiagnostic et imagerie médicale)'),
('RDT', 'radiothérapie (oncologie option radiothérapie)'),
('RGM', 'reproduction et gynécologie médicale'),
('RHU', 'rhumatologie'),
('STO', 'stomatologie'),
('SXL', 'sexologie'),
('TXA', 'toxicomanie et alcoologie');

-- --------------------------------------------------------

--
-- Structure de la table `travailler`
--

CREATE TABLE IF NOT EXISTS `travailler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visMatricule` varchar(10) NOT NULL,
  `jJMMAA` datetime NOT NULL,
  `regCode` varchar(2) NOT NULL,
  `traRole` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_{a35e8696cf024ba8bd16753cd7e91075}` (`visMatricule`),
  KEY `FK_{4019f059649a477cb52b8191ca9e7ad2}` (`regCode`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=85 ;

--
-- Contenu de la table `travailler`
--

INSERT INTO `travailler` (`id`, `visMatricule`, `jJMMAA`, `regCode`, `traRole`) VALUES
(1, 'p49', '1977-10-03 00:00:00', 'CE', 'Visiteur'),
(2, 'k53', '1983-03-23 00:00:00', 'CA', 'Visiteur'),
(3, 'r24', '1984-07-29 00:00:00', 'BN', 'Visiteur'),
(4, 'g53', '1985-10-02 00:00:00', 'BG', 'Visiteur'),
(5, 'a55', '1987-07-17 00:00:00', 'MP', 'Visiteur'),
(6, 'm35', '1987-10-06 00:00:00', 'MP', 'Visiteur'),
(7, 'e39', '1988-04-26 00:00:00', 'IF', 'Visiteur'),
(8, 'c14', '1989-02-01 00:00:00', 'PA', 'Visiteur'),
(9, 'e22', '1989-03-24 00:00:00', 'AL', 'Visiteur'),
(10, 'p7', '1990-03-01 00:00:00', 'RO', 'Visiteur'),
(11, 'r58', '1990-06-30 00:00:00', 'BG', 'Visiteur'),
(12, 'm45', '1990-10-13 00:00:00', 'AL', 'Visiteur'),
(13, 'e5', '1990-11-27 00:00:00', 'MP', 'Visiteur'),
(14, 't60', '1991-03-29 00:00:00', 'CE', 'Visiteur'),
(15, 'c54', '1991-04-09 00:00:00', 'AL', 'Visiteur'),
(16, 'p8', '1991-06-23 00:00:00', 'BO', 'Visiteur'),
(17, 'a17', '1991-08-26 00:00:00', 'RA', 'Visiteur'),
(18, 'e52', '1991-10-31 00:00:00', 'HN', 'Visiteur'),
(19, 'd13', '1991-12-05 00:00:00', 'PL', 'Visiteur'),
(20, 'k53', '1992-04-03 00:00:00', 'AL', 'Délégué'),
(21, 'c3', '1992-05-05 00:00:00', 'CA', 'Visiteur'),
(22, 'n58', '1992-08-30 00:00:00', 'CE', 'Visiteur'),
(23, 's21', '1992-09-25 00:00:00', 'LI', 'Visiteur'),
(24, 'h40', '1992-11-01 00:00:00', 'CA', 'Visiteur'),
(25, 'a131', '1992-12-11 00:00:00', 'BN', 'Visiteur'),
(26, 'p40', '1992-12-14 00:00:00', 'BN', 'Délégué'),
(27, 'j50', '1992-12-16 00:00:00', 'NP', 'Visiteur'),
(28, 'p32', '1992-12-24 00:00:00', 'IF', 'Visiteur'),
(29, 'h13', '1993-05-08 00:00:00', 'LI', 'Visiteur'),
(30, 'e24', '1993-05-17 00:00:00', 'AL', 'Délégué'),
(31, 'f21', '1993-06-08 00:00:00', 'RA', 'Visiteur'),
(32, 'h35', '1993-08-26 00:00:00', 'AU', 'Visiteur'),
(33, 'b34', '1993-12-06 00:00:00', 'CE', 'Délégué'),
(34, 'f4', '1994-05-03 00:00:00', 'MP', 'Visiteur'),
(35, 'b25', '1994-07-03 00:00:00', 'PL', 'Visiteur'),
(36, 't55', '1994-11-29 00:00:00', 'MP', 'Visiteur'),
(37, 'p42', '1994-12-12 00:00:00', 'PI', 'Visiteur'),
(38, 'n59', '1994-12-19 00:00:00', 'PI', 'Visiteur'),
(39, 'o26', '1995-01-05 00:00:00', 'LG', 'Visiteur'),
(40, 'l14', '1995-02-02 00:00:00', 'PL', 'Visiteur'),
(41, 't43', '1995-03-09 00:00:00', 'BO', 'Visiteur'),
(42, 'a55', '1995-05-19 00:00:00', 'RO', 'Visiteur'),
(43, 'l23', '1995-06-05 00:00:00', 'PC', 'Visiteur'),
(44, 'b59', '1995-10-21 00:00:00', 'RA', 'Visiteur'),
(45, 's10', '1995-11-14 00:00:00', 'FC', 'Visiteur'),
(46, 'e5', '1995-11-27 00:00:00', 'MP', 'Délégué'),
(47, 'g7', '1996-01-13 00:00:00', 'LI', 'Visiteur'),
(48, 'g19', '1996-01-18 00:00:00', 'IF', 'Visiteur'),
(49, 'e49', '1996-02-19 00:00:00', 'MP', 'Visiteur'),
(50, 'l56', '1996-02-27 00:00:00', 'FC', 'Visiteur'),
(51, 'n42', '1996-03-06 00:00:00', 'HN', 'Visiteur'),
(52, 'b13', '1996-03-11 00:00:00', 'AL', 'Visiteur'),
(53, 'a131', '1996-05-27 00:00:00', 'BG', 'Visiteur'),
(54, 'k4', '1996-11-21 00:00:00', 'LG', 'Visiteur'),
(55, 'l46', '1997-01-24 00:00:00', 'PL', 'Visiteur'),
(56, 'c14', '1997-02-01 00:00:00', 'PA', 'Délégué'),
(57, 'f39', '1997-02-15 00:00:00', 'RA', 'Visiteur'),
(58, 'b16', '1997-03-21 00:00:00', 'BG', 'Visiteur'),
(59, 'p6', '1997-03-30 00:00:00', 'AQ', 'Visiteur'),
(60, 't47', '1997-08-29 00:00:00', 'PI', 'Visiteur'),
(61, 'q17', '1997-09-06 00:00:00', 'BN', 'Visiteur'),
(62, 'a17', '1997-09-19 00:00:00', 'RA', 'Délégué'),
(63, 'b4', '1997-09-25 00:00:00', 'AQ', 'Visiteur'),
(64, 'd51', '1997-11-18 00:00:00', 'FC', 'Délégué'),
(65, 'b50', '1998-01-18 00:00:00', 'PA', 'Visiteur'),
(66, 'j45', '1998-02-25 00:00:00', 'CA', 'Responsable'),
(67, 'h30', '1998-04-26 00:00:00', 'IF', 'Visiteur'),
(68, 'r24', '1998-05-25 00:00:00', 'BN', 'Responsable'),
(69, 'j8', '1998-06-18 00:00:00', 'IF', 'Responsable'),
(70, 'p41', '1998-07-27 00:00:00', 'PC', 'Visiteur'),
(71, 'a93', '1999-01-02 00:00:00', 'PC', 'Visiteur'),
(72, 'b19', '1999-01-31 00:00:00', 'PL', 'Visiteur'),
(73, 'g30', '1999-03-27 00:00:00', 'PI', 'Délégué'),
(74, 'm45', '1999-04-08 00:00:00', 'AL', 'Délégué'),
(75, 'b34', '1999-06-18 00:00:00', 'CE', 'Responsable'),
(76, 'p40', '1999-07-17 00:00:00', 'BN', 'Responsable'),
(77, 'a55', '1999-08-21 00:00:00', 'RO', 'Délégué'),
(78, 'b25', '2000-01-01 00:00:00', 'PL', 'Délégué'),
(79, 'e24', '2000-02-29 00:00:00', 'AL', 'Responsable'),
(80, 'b28', '2000-08-02 00:00:00', 'LG', 'Visiteur'),
(81, 'g30', '2000-10-31 00:00:00', 'PI', 'Responsable'),
(82, 'e5', '2000-11-27 00:00:00', 'AQ', 'Responsable'),
(83, 'c14', '2001-03-03 00:00:00', 'PA', 'Responsable'),
(84, 'd51', '2002-03-20 00:00:00', 'FC', 'Responsable');

-- --------------------------------------------------------

--
-- Structure de la table `typeindividu`
--

CREATE TABLE IF NOT EXISTS `typeindividu` (
  `tinCode` varchar(5) NOT NULL,
  `tinLibelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tinCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `typeindividu`
--


-- --------------------------------------------------------

--
-- Structure de la table `typepraticien`
--

CREATE TABLE IF NOT EXISTS `typepraticien` (
  `typCode` varchar(3) NOT NULL,
  `typLibelle` varchar(25) DEFAULT NULL,
  `typLieu` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`typCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `typepraticien`
--

INSERT INTO `typepraticien` (`typCode`, `typLibelle`, `typLieu`) VALUES
('MH', 'Médecin Hospitalier', 'Hopital ou clinique'),
('MV', 'Médecine de Ville', 'Cabinet'),
('PH', 'Pharmacien Hospitalier', 'Hopital ou clinique'),
('PO', 'Pharmacien Officine', 'Pharmacie'),
('PS', 'Personnel de santé', 'Centre paramédical');

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

CREATE TABLE IF NOT EXISTS `visiteur` (
  `visMatricule` varchar(10) NOT NULL,
  `visNom` varchar(25) DEFAULT NULL,
  `visPrenom` varchar(50) DEFAULT NULL,
  `visAdresse` varchar(50) DEFAULT NULL,
  `visCp` varchar(5) DEFAULT NULL,
  `visVille` varchar(30) DEFAULT NULL,
  `visDateembauche` datetime DEFAULT NULL,
  `secCode` varchar(1) DEFAULT NULL,
  `labCode` varchar(2) NOT NULL,
  PRIMARY KEY (`visMatricule`),
  KEY `FK_{8d9c46f626434448b5559e5c85169ba4}` (`labCode`),
  KEY `FK_{e2a4ea82136a4528a19a094497a7bbe0}` (`secCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `visiteur`
--

INSERT INTO `visiteur` (`visMatricule`, `visNom`, `visPrenom`, `visAdresse`, `visCp`, `visVille`, `visDateembauche`, `secCode`, `labCode`) VALUES
('a131', 'Villechalane', 'Louis', '8 cours Lafontaine', '29000', 'BREST', '1992-12-11 00:00:00', NULL, 'SW'),
('a17', 'Andre', 'David', '1 r Aimon de Chissée', '38100', 'GRENOBLE', '1991-08-26 00:00:00', NULL, 'GY'),
('a55', 'Bedos', 'Christian', '1 r Bénédictins', '65000', 'TARBES', '1987-07-17 00:00:00', NULL, 'GY'),
('a93', 'Tusseau', 'Louis', '22 r Renou', '86000', 'POITIERS', '1999-01-02 00:00:00', NULL, 'SW'),
('b13', 'Bentot', 'Pascal', '11 av 6 Juin', '67000', 'STRASBOURG', '1996-03-11 00:00:00', NULL, 'GY'),
('b16', 'Bioret', 'Luc', '1 r Linne', '35000', 'RENNES', '1997-03-21 00:00:00', NULL, 'SW'),
('b19', 'Bunisset', 'Francis', '10 r Nicolas Chorier', '85000', 'LA ROCHE SUR YON', '1999-01-31 00:00:00', NULL, 'GY'),
('b25', 'Bunisset', 'Denise', '1 r Lionne', '49100', 'ANGERS', '1994-07-03 00:00:00', NULL, 'SW'),
('b28', 'Cacheux', 'Bernard', '114 r Authie', '34000', 'MONTPELLIER', '2000-08-02 00:00:00', NULL, 'GY'),
('b34', 'Cadic', 'Eric', '123 r Caponière', '41000', 'BLOIS', '1993-12-06 00:00:00', 'P', 'SW'),
('b4', 'Charoze', 'Catherine', '100 pl Géants', '33000', 'BORDEAUX', '1997-09-25 00:00:00', NULL, 'SW'),
('b50', 'Clepkens', 'Christophe', '12 r Fédérico Garcia Lorca', '13000', 'MARSEILLE', '1998-01-18 00:00:00', NULL, 'SW'),
('b59', 'Cottin', 'Vincenne', '36 sq Capucins', '5000', 'GAP', '1995-10-21 00:00:00', NULL, 'GY'),
('c14', 'Daburon', 'François', '13 r Champs Elysées', '6000', 'NICE', '1989-02-01 00:00:00', 'S', 'SW'),
('c3', 'De', 'Philippe', '13 r Charles Peguy', '10000', 'TROYES', '1992-05-05 00:00:00', NULL, 'SW'),
('c54', 'Debelle', 'Michel', '181 r Caponière', '88000', 'EPINAL', '1991-04-09 00:00:00', NULL, 'SW'),
('d13', 'Debelle', 'Jeanne', '134 r Stalingrad', '44000', 'NANTES', '1991-12-05 00:00:00', NULL, 'SW'),
('d51', 'Debroise', 'Michel', '2 av 6 Juin', '70000', 'VESOUL', '1997-11-18 00:00:00', 'E', 'GY'),
('e22', 'Desmarquest', 'Nathalie', '14 r Fédérico Garcia Lorca', '54000', 'NANCY', '1989-03-24 00:00:00', NULL, 'GY'),
('e24', 'Desnost', 'Pierre', '16 r Barral de Montferrat', '55000', 'VERDUN', '1993-05-17 00:00:00', 'E', 'SW'),
('e39', 'Dudouit', 'Frédéric', '18 quai Xavier Jouvin', '75000', 'PARIS', '1988-04-26 00:00:00', NULL, 'GY'),
('e49', 'Duncombe', 'Claude', '19 av Alsace Lorraine', '9000', 'FOIX', '1996-02-19 00:00:00', NULL, 'GY'),
('e5', 'Enault-Pascreau', 'Céline', '25B r Stalingrad', '40000', 'MONT DE MARSAN', '1990-11-27 00:00:00', 'S', 'GY'),
('e52', 'Eynde', 'Valérie', '3 r Henri Moissan', '76000', 'ROUEN', '1991-10-31 00:00:00', NULL, 'GY'),
('f21', 'Finck', 'Jacques', 'rte Montreuil Bellay', '74000', 'ANNECY', '1993-06-08 00:00:00', NULL, 'SW'),
('f39', 'Frémont', 'Fernande', '4 r Jean Giono', '69000', 'LYON', '1997-02-15 00:00:00', NULL, 'GY'),
('f4', 'Gest', 'Alain', '30 r Authie', '46000', 'FIGEAC', '1994-05-03 00:00:00', NULL, 'GY'),
('g19', 'Gheysen', 'Galassus', '32 bd Mar Foch', '75000', 'PARIS', '1996-01-18 00:00:00', NULL, 'SW'),
('g30', 'Girard', 'Yvon', '31 av 6 Juin', '80000', 'AMIENS', '1999-03-27 00:00:00', 'N', 'GY'),
('g53', 'Gombert', 'Luc', '32 r Emile Gueymard', '56000', 'VANNES', '1985-10-02 00:00:00', NULL, 'GY'),
('g7', 'Guindon', 'Caroline', '40 r Mar Montgomery', '87000', 'LIMOGES', '1996-01-13 00:00:00', NULL, 'GY'),
('h13', 'Guindon', 'François', '44 r Picotière', '19000', 'TULLE', '1993-05-08 00:00:00', NULL, 'SW'),
('h30', 'Igigabel', 'Guy', '33 gal Arlequin', '94000', 'CRETEIL', '1998-04-26 00:00:00', NULL, 'SW'),
('h35', 'Jourdren', 'Pierre', '34 av Jean Perrot', '15000', 'AURRILLAC', '1993-08-26 00:00:00', NULL, 'GY'),
('h40', 'Juttard', 'Pierre-Raoul', '34 cours Jean Jaurès', '8000', 'SEDAN', '1992-11-01 00:00:00', NULL, 'GY'),
('j45', 'Labouré-Morel', 'Saout', '38 cours Berriat', '52000', 'CHAUMONT', '1998-02-25 00:00:00', 'N', 'SW'),
('j50', 'Landré', 'Philippe', '4 av Gén Laperrine', '59000', 'LILLE', '1992-12-16 00:00:00', NULL, 'GY'),
('j8', 'Langeard', 'Hugues', '39 av Jean Perrot', '93000', 'BAGNOLET', '1998-06-18 00:00:00', 'P', 'GY'),
('k4', 'Lanne', 'Bernard', '4 r Bayeux', '30000', 'NIMES', '1996-11-21 00:00:00', NULL, 'SW'),
('k53', 'Le', 'Noël', '4 av Beauvert', '68000', 'MULHOUSE', '1983-03-23 00:00:00', NULL, 'SW'),
('l14', 'Le', 'Jean', '39 r Raspail', '53000', 'LAVAL', '1995-02-02 00:00:00', NULL, 'SW'),
('l23', 'Leclercq', 'Servane', '11 r Quinconce', '18000', 'BOURGES', '1995-06-05 00:00:00', NULL, 'SW'),
('l46', 'Lecornu', 'Jean-Bernard', '4 bd Mar Foch', '72000', 'LA FERTE BERNARD', '1997-01-24 00:00:00', NULL, 'GY'),
('l56', 'Lecornu', 'Ludovic', '4 r Abel Servien', '25000', 'BESANCON', '1996-02-27 00:00:00', NULL, 'SW'),
('m35', 'Lejard', 'Agnès', '4 r Anthoard', '82000', 'MONTAUBAN', '1987-10-06 00:00:00', NULL, 'SW'),
('m45', 'Lesaulnier', 'Pascal', '47 r Thiers', '57000', 'METZ', '1990-10-13 00:00:00', NULL, 'SW'),
('n42', 'Letessier', 'Stéphane', '5 chem Capuche', '27000', 'EVREUX', '1996-03-06 00:00:00', NULL, 'GY'),
('n58', 'Loirat', 'Didier', 'Les Pêchers cité Bourg la Croix', '45000', 'ORLEANS', '1992-08-30 00:00:00', NULL, 'GY'),
('n59', 'Maffezzoli', 'Thibaud', '5 r Chateaubriand', '2000', 'LAON', '1994-12-19 00:00:00', NULL, 'SW'),
('o26', 'Mancini', 'Anne', '5 r D''Agier', '48000', 'MENDE', '1995-01-05 00:00:00', NULL, 'GY'),
('p32', 'Marcouiller', 'Gérard', '7 pl St Gilles', '91000', 'ISSY LES MOULINEAUX', '1992-12-24 00:00:00', NULL, 'GY'),
('p40', 'Michel', 'Jean-Claude', '5 r Gabriel Péri', '61000', 'FLERS', '1992-12-14 00:00:00', 'O', 'SW'),
('p41', 'Montecot', 'Françoise', '6 r Paul Valéry', '17000', 'SAINTES', '1998-07-27 00:00:00', NULL, 'GY'),
('p42', 'Notini', 'Veronique', '5 r Lieut Chabal', '60000', 'BEAUVAIS', '1994-12-12 00:00:00', NULL, 'SW'),
('p49', 'Onfroy', 'Den', '5 r Sidonie Jacolin', '37000', 'TOURS', '1977-10-03 00:00:00', NULL, 'GY'),
('p6', 'Pascreau', 'Charles', '57 bd Mar Foch', '64000', 'PAU', '1997-03-30 00:00:00', NULL, 'SW'),
('p7', 'Pernot', 'Claude-Noël', '6 r Alexandre 1 de Yougoslavie', '11000', 'NARBONNE', '1990-03-01 00:00:00', NULL, 'SW'),
('p8', 'Perrier', 'Maître', '6 r Aubert Dubayet', '71000', 'CHALON SUR SAONE', '1991-06-23 00:00:00', NULL, 'GY'),
('q17', 'Petit', 'Jean-Louis', '7 r Ernest Renan', '50000', 'SAINT LO', '1997-09-06 00:00:00', NULL, 'GY'),
('r24', 'Piquery', 'Patrick', '9 r Vaucelles', '14000', 'CAEN', '1984-07-29 00:00:00', 'O', 'GY'),
('r58', 'Quiquandon', 'Joël', '7 r Ernest Renan', '29000', 'QUIMPER', '1990-06-30 00:00:00', NULL, 'GY'),
('s10', 'Retailleau', 'Josselin', '88Bis r Saumuroise', '39000', 'DOLE', '1995-11-14 00:00:00', NULL, 'SW'),
('s21', 'Retailleau', 'Pascal', '32 bd Ayrault', '23000', 'MONTLUCON', '1992-09-25 00:00:00', NULL, 'SW'),
('t43', 'Souron', 'Maryse', '7B r Gay Lussac', '21000', 'DIJON', '1995-03-09 00:00:00', NULL, 'SW'),
('t47', 'Tiphagne', 'Patrick', '7B r Gay Lussac', '62000', 'ARRAS', '1997-08-29 00:00:00', NULL, 'SW'),
('t55', 'Tréhet', 'Alain', '7D chem Barral', '12000', 'RODEZ', '1994-11-29 00:00:00', NULL, 'SW'),
('t60', 'Tusseau', 'Josselin', '63 r Bon Repos', '28000', 'CHARTRES', '1991-03-29 00:00:00', NULL, 'GY'),
('zzz', 'swiss', 'bourdin', NULL, NULL, NULL, '2003-06-18 00:00:00', NULL, 'BC');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `constituer`
--
ALTER TABLE `constituer`
  ADD CONSTRAINT `FK_{C117FEE7-AA81-4F86-B5FE-F201F9F80B0D}` FOREIGN KEY (`medDepotlegal`) REFERENCES `medicament` (`medDepotlegal`),
  ADD CONSTRAINT `FK_{71FD2D72-0D6A-43C1-963B-3633406D704D}` FOREIGN KEY (`cmpCode`) REFERENCES `composant` (`cmpCode`);

--
-- Contraintes pour la table `formuler`
--
ALTER TABLE `formuler`
  ADD CONSTRAINT `FK_{35254FCA-17C5-4BED-ACE9-7A61C0B36749}` FOREIGN KEY (`preCode`) REFERENCES `presentation` (`preCode`),
  ADD CONSTRAINT `FK_{1FA0425F-A30D-420E-9142-AB9EEA79ABAF}` FOREIGN KEY (`medDepotlegal`) REFERENCES `medicament` (`medDepotlegal`);

--
-- Contraintes pour la table `interagir`
--
ALTER TABLE `interagir`
  ADD CONSTRAINT `FK_{F32A801A-44C2-4AEB-8A0E-51396C6F3020}` FOREIGN KEY (`medMeddepotlegal`) REFERENCES `medicament` (`medDepotlegal`),
  ADD CONSTRAINT `FK_{C1208A3D-F928-4436-AACF-376DDC7DA8F9}` FOREIGN KEY (`medDepotlegal`) REFERENCES `medicament` (`medDepotlegal`);

--
-- Contraintes pour la table `inviter`
--
ALTER TABLE `inviter`
  ADD CONSTRAINT `FK_{DEB1742C-B963-41D9-9F12-F7F65DC9FC18}` FOREIGN KEY (`praNum`) REFERENCES `praticien` (`praNum`),
  ADD CONSTRAINT `FK_{194BCE92-A8C4-4683-91C2-7B1CC0E48F1B}` FOREIGN KEY (`acNum`) REFERENCES `activitecompl` (`acNum`);

--
-- Contraintes pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD CONSTRAINT `FK_{413a5d7485a845e7b320df5e9396baed}` FOREIGN KEY (`famCode`) REFERENCES `famille` (`famCode`);

--
-- Contraintes pour la table `offrir`
--
ALTER TABLE `offrir`
  ADD CONSTRAINT `offrir_ibfk_2` FOREIGN KEY (`medDepotlegal`) REFERENCES `medicament` (`medDepotlegal`),
  ADD CONSTRAINT `offrir_ibfk_1` FOREIGN KEY (`visMatricule`) REFERENCES `visiteur` (`visMatricule`);

--
-- Contraintes pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD CONSTRAINT `FK_{99960067-C04E-44F3-95AF-6F4F392F6347}` FOREIGN KEY (`praNum`) REFERENCES `praticien` (`praNum`),
  ADD CONSTRAINT `FK_{6F32033E-99CD-4486-8CE2-84644754DE3F}` FOREIGN KEY (`speCode`) REFERENCES `specialite` (`speCode`);

--
-- Contraintes pour la table `praticien`
--
ALTER TABLE `praticien`
  ADD CONSTRAINT `FK_{1dd782ab506c441b9e6d7263fd1c1eaf}` FOREIGN KEY (`typCode`) REFERENCES `typepraticien` (`typCode`);

--
-- Contraintes pour la table `prescrire`
--
ALTER TABLE `prescrire`
  ADD CONSTRAINT `FK_{C90A61AD-D8EF-48C0-8F11-39ADCC0CB9E6}` FOREIGN KEY (`dosCode`) REFERENCES `dosage` (`dosCode`),
  ADD CONSTRAINT `FK_{02233D94-7C64-4199-B94D-8E272446F5A6}` FOREIGN KEY (`medDepotlegal`) REFERENCES `medicament` (`medDepotlegal`),
  ADD CONSTRAINT `FK_{2551EBD9-3594-4572-9B70-C3ADA46DC4AE}` FOREIGN KEY (`tinCode`) REFERENCES `typeindividu` (`tinCode`);

--
-- Contraintes pour la table `rapportvisite`
--
ALTER TABLE `rapportvisite`
  ADD CONSTRAINT `FK_{c0c347fc964646199e2a572232ab4654}` FOREIGN KEY (`visMatricule`) REFERENCES `visiteur` (`visMatricule`),
  ADD CONSTRAINT `FK_{8ee7b4b5e5094735b4df9ef80ac6fa90}` FOREIGN KEY (`praNum`) REFERENCES `praticien` (`praNum`);

--
-- Contraintes pour la table `realiser`
--
ALTER TABLE `realiser`
  ADD CONSTRAINT `FK_{E097CD3C-C67D-41B2-9249-8689FD140E16}` FOREIGN KEY (`visMatricule`) REFERENCES `visiteur` (`visMatricule`),
  ADD CONSTRAINT `FK_{D1B87024-4384-43BC-9EC9-870194D4BD7B}` FOREIGN KEY (`acNum`) REFERENCES `activitecompl` (`acNum`);

--
-- Contraintes pour la table `region`
--
ALTER TABLE `region`
  ADD CONSTRAINT `FK_{2a8a348f6d52456bb96a7b966468977e}` FOREIGN KEY (`secCode`) REFERENCES `secteur` (`secCode`);

--
-- Contraintes pour la table `travailler`
--
ALTER TABLE `travailler`
  ADD CONSTRAINT `FK_{a35e8696cf024ba8bd16753cd7e91075}` FOREIGN KEY (`visMatricule`) REFERENCES `visiteur` (`visMatricule`),
  ADD CONSTRAINT `FK_{4019f059649a477cb52b8191ca9e7ad2}` FOREIGN KEY (`regCode`) REFERENCES `region` (`regCode`);

--
-- Contraintes pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD CONSTRAINT `FK_{e2a4ea82136a4528a19a094497a7bbe0}` FOREIGN KEY (`secCode`) REFERENCES `secteur` (`secCode`),
  ADD CONSTRAINT `FK_{8d9c46f626434448b5559e5c85169ba4}` FOREIGN KEY (`labCode`) REFERENCES `labo` (`labCode`);
