-- MySQL Script generated by MySQL Workbench
-- Thu Apr 28 22:03:35 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_colegio
-- -----------------------------------------------------
-- base de datos de matricula

-- -----------------------------------------------------
-- Schema db_colegio
--
-- base de datos de matricula
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_colegio` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `db_colegio` ;

-- -----------------------------------------------------
-- Table `db_colegio`.`tbl_alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_colegio`.`tbl_alumno` (
  `alumno_id` INT NOT NULL AUTO_INCREMENT,
  `alumno_nombre` VARCHAR(100) NOT NULL,
  `alumno_email` VARCHAR(100) NOT NULL,
  `alumno_celular` VARCHAR(100) NOT NULL,
  `alumno_github` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`alumno_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_colegio`.`tbl_nivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_colegio`.`tbl_nivel` (
  `nivel_id` INT NOT NULL AUTO_INCREMENT,
  `nivel_nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nivel_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_colegio`.`tbl_modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_colegio`.`tbl_modulo` (
  `modulo_id` INT NOT NULL AUTO_INCREMENT,
  `modulo_nombre` VARCHAR(45) NOT NULL,
  `modulo_fecha_inicio` DATE NOT NULL,
  `modulo_nro_sesiones` INT NOT NULL,
  PRIMARY KEY (`modulo_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_colegio`.`tbl_matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_colegio`.`tbl_matricula` (
  `matricula_id` INT NOT NULL AUTO_INCREMENT,
  `matricula_fecha_registro` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `alumno_id` INT NOT NULL,
  `nivel_id` INT NOT NULL,
  `modulo_id` INT NOT NULL,
  PRIMARY KEY (`matricula_id`),
  CONSTRAINT `fk_tbl_matricula_tbl_alumno`
    FOREIGN KEY (`alumno_id`)
    REFERENCES `db_colegio`.`tbl_alumno` (`alumno_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_matricula_tbl_nivel1`
    FOREIGN KEY (`nivel_id`)
    REFERENCES `db_colegio`.`tbl_nivel` (`nivel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_matricula_tbl_modulo1`
    FOREIGN KEY (`modulo_id`)
    REFERENCES `db_colegio`.`tbl_modulo` (`modulo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_colegio`.`tbl_curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_colegio`.`tbl_curso` (
  `curso_id` INT NOT NULL AUTO_INCREMENT,
  `curso_nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`curso_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_colegio`.`tbl_matricula_curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_colegio`.`tbl_matricula_curso` (
  `tbl_matricula_curso_id` INT NOT NULL AUTO_INCREMENT,
  `matricula_id` INT NOT NULL,
  `curso_id` INT NOT NULL,
  `curso_nota` DOUBLE NOT NULL DEFAULT 0,
  PRIMARY KEY (`tbl_matricula_curso_id`),
  CONSTRAINT `fk_tbl_matricula_curso_tbl_matricula1`
    FOREIGN KEY (`matricula_id`)
    REFERENCES `db_colegio`.`tbl_matricula` (`matricula_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_matricula_curso_tbl_curso1`
    FOREIGN KEY (`curso_id`)
    REFERENCES `db_colegio`.`tbl_curso` (`curso_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_colegio`.`tbl_matricula_asistencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_colegio`.`tbl_matricula_asistencia` (
  `matricula_asistencia_id` INT NOT NULL AUTO_INCREMENT,
  `matricula_asistencia_fecha` DATE NOT NULL,
  `matricula_asistencia_estado` CHAR(1) NOT NULL,
  `matricula_curso_id` INT NOT NULL,
  PRIMARY KEY (`matricula_asistencia_id`),
  CONSTRAINT `fk_tbl_matricula_asistencia_tbl_matricula_curso1`
    FOREIGN KEY (`matricula_curso_id`)
    REFERENCES `db_colegio`.`tbl_matricula_curso` (`tbl_matricula_curso_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_colegio`.`tbl_evaluacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_colegio`.`tbl_evaluacion` (
  `evaluacion_id` INT NOT NULL AUTO_INCREMENT,
  `evaluacion_nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`evaluacion_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_colegio`.`tbl_matricula_evaluacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_colegio`.`tbl_matricula_evaluacion` (
  `matricula_evaluacion_id` INT NOT NULL AUTO_INCREMENT,
  `matricula_evaluacion_fecha` DATE NOT NULL,
  `matricula_evalucion_nota` DOUBLE NOT NULL DEFAULT 0,
  `evaluacion_id` INT NOT NULL,
  `matricula_curso_id` INT NOT NULL,
  PRIMARY KEY (`matricula_evaluacion_id`),
  CONSTRAINT `fk_tbl_matricula_evaluacion_tbl_evaluacion1`
    FOREIGN KEY (`evaluacion_id`)
    REFERENCES `db_colegio`.`tbl_evaluacion` (`evaluacion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_matricula_evaluacion_tbl_matricula_curso1`
    FOREIGN KEY (`matricula_curso_id`)
    REFERENCES `db_colegio`.`tbl_matricula_curso` (`tbl_matricula_curso_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
