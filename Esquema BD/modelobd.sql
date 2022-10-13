-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema organicos_bd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema organicos_bd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `organicos_bd` DEFAULT CHARACTER SET utf8 ;
USE `organicos_bd` ;

-- -----------------------------------------------------
-- Table `organicos_bd`.`tipo_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `organicos_bd`.`tipo_producto` (
  `idtipo_producto` INT NOT NULL,
  `nombre_tipo_producto` VARCHAR(50) NULL,
  PRIMARY KEY (`idtipo_producto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `organicos_bd`.`tipo_medida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `organicos_bd`.`tipo_medida` (
  `idtipo_medida` INT NOT NULL,
  `nombre_medida` VARCHAR(45) NULL,
  PRIMARY KEY (`idtipo_medida`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `organicos_bd`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `organicos_bd`.`producto` (
  `idproductos` INT NOT NULL,
  `nombre` VARCHAR(50) NULL,
  `tipo_producto` INT NULL,
  `tipo_unidad` INT NULL,
  `cantidad` INT NULL,
  `descripcion_producto` VARCHAR(250) NULL,
  `valor` DOUBLE NULL,
  `fecha_inicio` DATE NULL,
  `fecha_fin` DATE NULL,
  `estado` VARCHAR(20) NULL,
  PRIMARY KEY (`idproductos`),
  INDEX `TP_FK_P_TP_idx` (`tipo_producto` ASC) VISIBLE,
  INDEX `M_FK_P_TM_idx` (`tipo_unidad` ASC) VISIBLE,
  CONSTRAINT `TP_FK_P_TP`
    FOREIGN KEY (`tipo_producto`)
    REFERENCES `organicos_bd`.`tipo_producto` (`idtipo_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `M_FK_P_TM`
    FOREIGN KEY (`tipo_unidad`)
    REFERENCES `organicos_bd`.`tipo_medida` (`idtipo_medida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `organicos_bd`.`tipo_documento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `organicos_bd`.`tipo_documento` (
  `idtipo_documento` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idtipo_documento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `organicos_bd`.`tipo_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `organicos_bd`.`tipo_usuario` (
  `idtipo_usuario` INT NOT NULL,
  `nombre` VARCHAR(30) NULL,
  PRIMARY KEY (`idtipo_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `organicos_bd`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `organicos_bd`.`usuario` (
  `idclientes` INT NOT NULL,
  `nombre` VARCHAR(50) NULL,
  `apellido` VARCHAR(50) NULL,
  `tipo_documento` INT NULL,
  `documento` INT(15) NULL,
  `telefono` VARCHAR(20) NULL,
  `direccion` VARCHAR(100) NULL,
  `email` VARCHAR(70) NULL,
  `contraseña` VARCHAR(70) NULL,
  `tipo_usuario` INT NULL,
  `estado` VARCHAR(30) NULL,
  PRIMARY KEY (`idclientes`),
  INDEX `D_FK_C_TD_idx` (`tipo_documento` ASC) VISIBLE,
  INDEX `U_FK_C_TU_idx` (`tipo_usuario` ASC) VISIBLE,
  CONSTRAINT `D_FK_C_TD`
    FOREIGN KEY (`tipo_documento`)
    REFERENCES `organicos_bd`.`tipo_documento` (`idtipo_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `U_FK_C_TU`
    FOREIGN KEY (`tipo_usuario`)
    REFERENCES `organicos_bd`.`tipo_usuario` (`idtipo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `organicos_bd`.`producto_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `organicos_bd`.`producto_cliente` (
  `id_producto` INT NOT NULL,
  `id_clientes` INT NOT NULL,
  PRIMARY KEY (`id_producto`, `id_clientes`),
  INDEX `C_FK_C_PC_idx` (`id_clientes` ASC) VISIBLE,
  CONSTRAINT `P_FK_P_PC`
    FOREIGN KEY (`id_producto`)
    REFERENCES `organicos_bd`.`producto` (`idproductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `C_FK_C_PC`
    FOREIGN KEY (`id_clientes`)
    REFERENCES `organicos_bd`.`usuario` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
