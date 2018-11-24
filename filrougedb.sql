-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2018 at 10:22 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `filrougedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `adresseFact` varchar(45) DEFAULT NULL,
  `villaFact` varchar(45) DEFAULT NULL,
  `cpFact` int(11) DEFAULT NULL,
  `paysFact` varchar(45) DEFAULT NULL,
  `gestCompte` varchar(45) DEFAULT NULL,
  `telephoneG` varchar(45) DEFAULT NULL,
  `adresseLiv` varchar(45) DEFAULT NULL,
  `villeLiv` varchar(45) DEFAULT NULL,
  `cpLiv` int(11) DEFAULT NULL,
  `paysLiv` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `devis`
--

CREATE TABLE IF NOT EXISTS `devis` (
  `idDevis` int(11) NOT NULL AUTO_INCREMENT,
  `nomE` varchar(45) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `finValidite` date DEFAULT NULL,
  `adresseFac` varchar(45) DEFAULT NULL,
  `villeFact` varchar(45) DEFAULT NULL,
  `cpFact` int(11) DEFAULT NULL,
  `paysFact` varchar(45) DEFAULT NULL,
  `gestionaireC` varchar(45) DEFAULT NULL,
  `telephoneG` int(11) DEFAULT NULL,
  `adresseLiv` varchar(45) DEFAULT NULL,
  `cpLiv` int(11) DEFAULT NULL,
  `paysLiv` varchar(45) DEFAULT NULL,
  `detailDevis` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `Client_idClient` int(11) NOT NULL,
  `Projet_idProjet` int(11) NOT NULL,
  `Projet_Client_idClient` int(11) NOT NULL,
  PRIMARY KEY (`idDevis`,`Client_idClient`,`Projet_idProjet`,`Projet_Client_idClient`),
  KEY `fk_Devis_Client1_idx` (`Client_idClient`),
  KEY `fk_Devis_Projet1_idx` (`Projet_idProjet`,`Projet_Client_idClient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `devisexterne`
--

CREATE TABLE IF NOT EXISTS `devisexterne` (
  `idDevisExterne` int(11) NOT NULL AUTO_INCREMENT,
  `texteDevisEx` varchar(45) DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `Devis_idDevis` int(11) NOT NULL,
  `Devis_Client_idClient` int(11) NOT NULL,
  `Devis_Projet_idProjet` int(11) NOT NULL,
  `Devis_Projet_Client_idClient` int(11) NOT NULL,
  PRIMARY KEY (`idDevisExterne`,`Devis_idDevis`,`Devis_Client_idClient`,`Devis_Projet_idProjet`,`Devis_Projet_Client_idClient`),
  KEY `fk_DevisExterne_Devis1_idx` (`Devis_idDevis`,`Devis_Client_idClient`,`Devis_Projet_idProjet`,`Devis_Projet_Client_idClient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `devisinterne`
--

CREATE TABLE IF NOT EXISTS `devisinterne` (
  `idDevisInterne` int(11) NOT NULL AUTO_INCREMENT,
  `idProduit` int(11) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `montantHt` float DEFAULT NULL,
  `Devis_idDevis` int(11) NOT NULL,
  `Devis_Client_idClient` int(11) NOT NULL,
  `Devis_Projet_idProjet` int(11) NOT NULL,
  `Devis_Projet_Client_idClient` int(11) NOT NULL,
  PRIMARY KEY (`idDevisInterne`,`Devis_idDevis`,`Devis_Client_idClient`,`Devis_Projet_idProjet`,`Devis_Projet_Client_idClient`),
  KEY `fk_DevisInterne_Devis1_idx` (`Devis_idDevis`,`Devis_Client_idClient`,`Devis_Projet_idProjet`,`Devis_Projet_Client_idClient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fournisseur`
--

CREATE TABLE IF NOT EXISTS `fournisseur` (
  `idFournisseur` int(11) NOT NULL AUTO_INCREMENT,
  `nomF` varchar(45) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `adresseFact` varchar(45) DEFAULT NULL,
  `villaFact` varchar(45) DEFAULT NULL,
  `cpFact` int(11) DEFAULT NULL,
  `paysFact` varchar(45) DEFAULT NULL,
  `gestCompte` varchar(45) DEFAULT NULL,
  `telephoneG` varchar(45) DEFAULT NULL,
  `adresseLiv` varchar(45) DEFAULT NULL,
  `villeLiv` varchar(45) DEFAULT NULL,
  `cpLiv` int(11) DEFAULT NULL,
  `paysLiv` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFournisseur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `fournisseur`
--

INSERT INTO `fournisseur` (`idFournisseur`, `nomF`, `telephone`, `adresseFact`, `villaFact`, `cpFact`, `paysFact`, `gestCompte`, `telephoneG`, `adresseLiv`, `villeLiv`, `cpLiv`, `paysLiv`, `description`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `idProduit` int(11) NOT NULL AUTO_INCREMENT,
  `nomP` varchar(45) DEFAULT NULL,
  `codeP` varchar(45) DEFAULT NULL,
  `produitActif` varchar(45) DEFAULT NULL,
  `prixU` float DEFAULT NULL,
  `imposable` varchar(45) DEFAULT NULL,
  `marge` float DEFAULT NULL,
  `categorieP` varchar(45) DEFAULT NULL,
  `quantiteStock` int(11) DEFAULT NULL,
  `quantiteC` int(11) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `Fournisseur_idFournisseur` int(11) NOT NULL,
  PRIMARY KEY (`idProduit`,`Fournisseur_idFournisseur`),
  KEY `fk_Produit_Fournisseur1_idx` (`Fournisseur_idFournisseur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`idProduit`, `nomP`, `codeP`, `produitActif`, `prixU`, `imposable`, `marge`, `categorieP`, `quantiteStock`, `quantiteC`, `description`, `Fournisseur_idFournisseur`) VALUES
(1, 'Tonic', 'TO', 'oui', 1, '0,10', 0, 'Bimo', 20, 10, 'produit de bon qualité', 1);

-- --------------------------------------------------------

--
-- Table structure for table `projet`
--

CREATE TABLE IF NOT EXISTS `projet` (
  `idProjet` int(11) NOT NULL AUTO_INCREMENT,
  `Client_idClient` int(11) NOT NULL,
  `Fournisseur_idFournisseur` int(11) NOT NULL,
  PRIMARY KEY (`idProjet`,`Client_idClient`,`Fournisseur_idFournisseur`),
  KEY `fk_Projet_Client1_idx` (`Client_idClient`),
  KEY `fk_Projet_Fournisseur1_idx` (`Fournisseur_idFournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `devis`
--
ALTER TABLE `devis`
  ADD CONSTRAINT `fk_Devis_Client1` FOREIGN KEY (`Client_idClient`) REFERENCES `client` (`idClient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Devis_Projet1` FOREIGN KEY (`Projet_idProjet`, `Projet_Client_idClient`) REFERENCES `projet` (`idProjet`, `Client_idClient`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `devisexterne`
--
ALTER TABLE `devisexterne`
  ADD CONSTRAINT `fk_DevisExterne_Devis1` FOREIGN KEY (`Devis_idDevis`, `Devis_Client_idClient`, `Devis_Projet_idProjet`, `Devis_Projet_Client_idClient`) REFERENCES `devis` (`idDevis`, `Client_idClient`, `Projet_idProjet`, `Projet_Client_idClient`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `devisinterne`
--
ALTER TABLE `devisinterne`
  ADD CONSTRAINT `fk_DevisInterne_Devis1` FOREIGN KEY (`Devis_idDevis`, `Devis_Client_idClient`, `Devis_Projet_idProjet`, `Devis_Projet_Client_idClient`) REFERENCES `devis` (`idDevis`, `Client_idClient`, `Projet_idProjet`, `Projet_Client_idClient`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk_Produit_Fournisseur1` FOREIGN KEY (`Fournisseur_idFournisseur`) REFERENCES `fournisseur` (`idFournisseur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `fk_Projet_Client1` FOREIGN KEY (`Client_idClient`) REFERENCES `client` (`idClient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Projet_Fournisseur1` FOREIGN KEY (`Fournisseur_idFournisseur`) REFERENCES `fournisseur` (`idFournisseur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
