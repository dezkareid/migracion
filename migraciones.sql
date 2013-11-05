SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `migrantes` ;
CREATE SCHEMA IF NOT EXISTS `migrantes` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `migrantes` ;


CREATE TABLE `pais` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(2) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `abrev` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='Tabla de Estados de la República Mexicana';

CREATE TABLE `municipios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado_id` int(11) NOT NULL COMMENT 'Relación con estados',
  `clave` varchar(3) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `sigla` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `estado_id` (`estado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2493 DEFAULT CHARSET=utf8 COMMENT='Tabla de Municipios de la Republica Mexicana';


CREATE TABLE `localidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `municipio_id` int(11) NOT NULL COMMENT 'Relación con municipios',
  `clave` varchar(4) NOT NULL,
  `nombre` varchar(110) NOT NULL,
  `latitud` varchar(6) NOT NULL,
  `longitud` varchar(7) NOT NULL,
  `altitud` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `municipio_id` (`municipio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=299639 DEFAULT CHARSET=utf8 COMMENT='Tabla de Localidades de la Republica Mexicana';
-- -----------------------------------------------------
-- Table `migrantes`.`preguntas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `migrantes`.`preguntas` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `pregunta` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `migrantes`.`migrantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `migrantes`.`migrantes` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `pseudonimo` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `respuesta` VARCHAR(50) NOT NULL,
  `pais` int(11) NOT NULL,
  `edad` TINYINT NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  `fecharegistro` DATE NOT NULL,
  `pregunta` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`pais`)
  REFERENCES `migrantes`.`pais` (`id`),
  INDEX `fk_migrantes_preguntas1_idx` (`pregunta` ASC),
  CONSTRAINT `fk_migrantes_preguntas1`
    FOREIGN KEY (`pregunta`)
    REFERENCES `migrantes`.`preguntas` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `migrantes`.`abusos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `migrantes`.`abusos` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `abuso` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `migrantes`.`registroabusos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `migrantes`.`registroabusos` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `descripcion` TEXT NOT NULL,
  `estado` VARCHAR(50) NOT NULL,
  `municipio` VARCHAR(50) NOT NULL,
  `localidad` VARCHAR(50) NOT NULL,
  `fecha` DATE NOT NULL,
  `abuso` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_registroabusos_abusos1_idx` (`abuso` ASC),
  CONSTRAINT `fk_registroabusos_abusos1`
    FOREIGN KEY (`abuso`)
    REFERENCES `migrantes`.`abusos` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `migrantes`.`lugares`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `migrantes`.`lugares` (
  `id` INT NOT NULL,
  `estado` VARCHAR(50) NOT NULL,
  `municipio` VARCHAR(50) NOT NULL,
  `localidad` VARCHAR(50) NOT NULL,
  `fecha` DATE NULL,
  `migrante` INT UNSIGNED NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lugares_migrantes1_idx` (`migrante` ASC),
  CONSTRAINT `fk_lugares_migrantes1`
    FOREIGN KEY (`migrante`)
    REFERENCES `migrantes`.`migrantes` (`id`)
    ON DELETE SET NULL
    ON UPDATE SET NULL)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
