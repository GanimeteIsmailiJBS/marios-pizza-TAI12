-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema marios_pizza
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema marios_pizza
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `marios_pizza` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `marios_pizza` ;

-- -----------------------------------------------------
-- Table `marios_pizza`.`kategorie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `marios_pizza`.`kategorie` (
  `kategorie_id` INT NOT NULL AUTO_INCREMENT,
  `bezeichnung` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`kategorie_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `marios_pizza`.`artikel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `marios_pizza`.`artikel` (
  `artikel_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `beschreibung` VARCHAR(120) NULL DEFAULT NULL,
  `preis` DECIMAL(6,2) NOT NULL,
  `kategorie_id` INT NOT NULL,
  PRIMARY KEY (`artikel_id`),
  INDEX `kategorie_id` (`kategorie_id` ASC) VISIBLE,
  CONSTRAINT `artikel_ibfk_1`
    FOREIGN KEY (`kategorie_id`)
    REFERENCES `marios_pizza`.`kategorie` (`kategorie_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `marios_pizza`.`kunde`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `marios_pizza`.`kunde` (
  `kunde_id` INT NOT NULL AUTO_INCREMENT,
  `vorname` VARCHAR(40) NOT NULL,
  `nachname` VARCHAR(40) NOT NULL,
  `telefon` VARCHAR(20) NULL DEFAULT NULL,
  `strasse` VARCHAR(60) NULL DEFAULT NULL,
  `plz` VARCHAR(10) NULL DEFAULT NULL,
  `ort` VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (`kunde_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `marios_pizza`.`bestellung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `marios_pizza`.`bestellung` (
  `bestell_id` INT NOT NULL AUTO_INCREMENT,
  `kunde_id` INT NOT NULL,
  `bestelldatum` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lieferart` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`bestell_id`),
  INDEX `kunde_id` (`kunde_id` ASC) VISIBLE,
  CONSTRAINT `bestellung_ibfk_1`
    FOREIGN KEY (`kunde_id`)
    REFERENCES `marios_pizza`.`kunde` (`kunde_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `marios_pizza`.`bestellposition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `marios_pizza`.`bestellposition` (
  `bestell_id` INT NOT NULL,
  `artikel_id` INT NOT NULL,
  `menge` INT NOT NULL DEFAULT '1',
  PRIMARY KEY (`bestell_id`, `artikel_id`),
  INDEX `artikel_id` (`artikel_id` ASC) VISIBLE,
  CONSTRAINT `bestellposition_ibfk_1`
    FOREIGN KEY (`bestell_id`)
    REFERENCES `marios_pizza`.`bestellung` (`bestell_id`),
  CONSTRAINT `bestellposition_ibfk_2`
    FOREIGN KEY (`artikel_id`)
    REFERENCES `marios_pizza`.`artikel` (`artikel_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
