-- MySQL Script generated by MySQL Workbench
-- Sat Apr 30 12:00:01 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bofv3727_medisource-db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `bofv3727_medisource-db`.`systeme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bofv3727_medisource-db`.`systeme` (
  `id_systeme` INT NOT NULL AUTO_INCREMENT,
  `name_systeme` VARCHAR(245) NULL,
  `desc_systeme` LONGTEXT NULL,
  `image_systeme` VARCHAR(45) NULL,
  PRIMARY KEY (`id_systeme`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bofv3727_medisource-db`.`maladie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bofv3727_medisource-db`.`maladie` (
  `id_maladie` INT NOT NULL AUTO_INCREMENT,
  `name_maladie` VARCHAR(245) NULL,
  `desc_maladie` LONGTEXT NULL,
  `image_maladie` VARCHAR(45) NULL,
  PRIMARY KEY (`id_maladie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bofv3727_medisource-db`.`organe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bofv3727_medisource-db`.`organe` (
  `id_organe` INT NOT NULL AUTO_INCREMENT,
  `name_organe` VARCHAR(245) NULL,
  `desc_organe` LONGTEXT NULL,
  `image_organe` VARCHAR(45) NULL,
  `systeme_id_systeme` INT NOT NULL,
  PRIMARY KEY (`id_organe`, `systeme_id_systeme`),
  INDEX `fk_organe_systeme_idx` (`systeme_id_systeme` ASC) ,
  CONSTRAINT `fk_organe_systeme`
    FOREIGN KEY (`systeme_id_systeme`)
    REFERENCES `bofv3727_medisource-db`.`systeme` (`id_systeme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bofv3727_medisource-db`.`traitement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bofv3727_medisource-db`.`traitement` (
  `id_traitement` INT NOT NULL AUTO_INCREMENT,
  `name_traitement` VARCHAR(245) NULL,
  `desc_traitement` LONGTEXT NULL,
  `image_traitement` VARCHAR(45) NULL,
  PRIMARY KEY (`id_traitement`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bofv3727_medisource-db`.`organe_has_maladie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bofv3727_medisource-db`.`organe_has_maladie` (
  `organe_id_organe` INT NOT NULL,
  `organe_systeme_id_systeme` INT NOT NULL,
  `maladie_id_maladie` INT NOT NULL,
  PRIMARY KEY (`organe_id_organe`, `organe_systeme_id_systeme`, `maladie_id_maladie`),
  INDEX `fk_organe_has_maladie_maladie1_idx` (`maladie_id_maladie` ASC) ,
  INDEX `fk_organe_has_maladie_organe1_idx` (`organe_id_organe` ASC, `organe_systeme_id_systeme` ASC) ,
  CONSTRAINT `fk_organe_has_maladie_organe1`
    FOREIGN KEY (`organe_id_organe` , `organe_systeme_id_systeme`)
    REFERENCES `bofv3727_medisource-db`.`organe` (`id_organe` , `systeme_id_systeme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_organe_has_maladie_maladie1`
    FOREIGN KEY (`maladie_id_maladie`)
    REFERENCES `bofv3727_medisource-db`.`maladie` (`id_maladie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bofv3727_medisource-db`.`maladie_has_traitement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bofv3727_medisource-db`.`maladie_has_traitement` (
  `maladie_id_maladie` INT NOT NULL,
  `traitement_id_traitement` INT NOT NULL,
  PRIMARY KEY (`maladie_id_maladie`, `traitement_id_traitement`),
  INDEX `fk_maladie_has_traitement_traitement1_idx` (`traitement_id_traitement` ASC) ,
  INDEX `fk_maladie_has_traitement_maladie1_idx` (`maladie_id_maladie` ASC) ,
  CONSTRAINT `fk_maladie_has_traitement_maladie1`
    FOREIGN KEY (`maladie_id_maladie`)
    REFERENCES `bofv3727_medisource-db`.`maladie` (`id_maladie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_maladie_has_traitement_traitement1`
    FOREIGN KEY (`traitement_id_traitement`)
    REFERENCES `bofv3727_medisource-db`.`traitement` (`id_traitement`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
