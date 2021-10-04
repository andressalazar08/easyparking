-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema easyParking
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema easyParking
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `easyParking` DEFAULT CHARACTER SET utf8 ;
USE `easyParking` ;

-- -----------------------------------------------------
-- Table `easyParking`.`cajero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easyParking`.`cajero` (
  `idcajero` INT NOT NULL AUTO_INCREMENT,
  `documentoCajero` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `nickname` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcajero`),
  UNIQUE INDEX `idcajero_UNIQUE` (`idcajero` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easyParking`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easyParking`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `documentoCliente` INT NOT NULL,
  `nombreCliente` VARCHAR(45) NOT NULL,
  `apellidoCliente` VARCHAR(45) NOT NULL,
  `telefonoCliente` INT NOT NULL,
  PRIMARY KEY (`idcliente`),
  UNIQUE INDEX `idcliente_UNIQUE` (`idcliente` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easyParking`.`tipo_ vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easyParking`.`tipo_ vehiculo` (
  `idtipoVehiculo` INT NOT NULL AUTO_INCREMENT,
  `tipoVehiculo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipoVehiculo`),
  UNIQUE INDEX `idtipo_vehiculo_UNIQUE` (`idtipoVehiculo` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easyParking`.`vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easyParking`.`vehiculo` (
  `idvehiculo` INT NOT NULL AUTO_INCREMENT,
  `placaVehiculo` VARCHAR(6) NOT NULL,
  `idtipoVehiculo_vehiculo` INT NOT NULL,
  PRIMARY KEY (`idvehiculo`),
  UNIQUE INDEX `idvehiculo_UNIQUE` (`idvehiculo` ASC) ,
  INDEX `idtipoVehiculo_vehiculo_idx` (`idtipoVehiculo_vehiculo` ASC),
  CONSTRAINT `idtipoVehiculo_vehiculo`
    FOREIGN KEY (`idtipoVehiculo_vehiculo`)
    REFERENCES `easyParking`.`tipo_ vehiculo` (`idtipoVehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easyParking`.`ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easyParking`.`ticket` (
  `idticket` INT NOT NULL AUTO_INCREMENT,
  `fechaTicket` DATETIME NOT NULL,
  `medioPago` VARCHAR(45) NOT NULL,
  `idCajero_ticket` INT NOT NULL,
  `idCliente_ticket` INT NOT NULL,
  `idvehiculo_ticket` INT NOT NULL,
  PRIMARY KEY (`idticket`),
  UNIQUE INDEX `idticket_UNIQUE` (`idticket` ASC),
  INDEX `idCajero_Ticket_idx` (`idCajero_ticket` ASC) ,
  INDEX `idCliente_ticket_idx` (`idCliente_ticket` ASC) ,
  INDEX `idvehiculo_ticket_idx` (`idvehiculo_ticket` ASC) ,
  CONSTRAINT `idCajero_ticket`
    FOREIGN KEY (`idCajero_ticket`)
    REFERENCES `easyParking`.`cajero` (`idcajero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCliente_ticket`
    FOREIGN KEY (`idCliente_ticket`)
    REFERENCES `easyParking`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idvehiculo_ticket`
    FOREIGN KEY (`idvehiculo_ticket`)
    REFERENCES `easyParking`.`vehiculo` (`idvehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easyParking`.`espacio_Parking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easyParking`.`espacio_Parking` (
  `idespacio` INT NOT NULL AUTO_INCREMENT,
  `codigoEspacio` VARCHAR(45) NOT NULL,
  `disponibilidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idespacio`),
  UNIQUE INDEX `idespacio_UNIQUE` (`idespacio` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easyParking`.`detalle_ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easyParking`.`detalle_ticket` (
  `iddetalle` INT NOT NULL AUTO_INCREMENT,
  `fechaHoraEntrada` DATETIME NOT NULL,
  `fechaHoraSalida` DATETIME NOT NULL,
  `tarifaBase` INT NOT NULL,
  `idticket_detalleticket` INT NOT NULL,
  `idespacio_detalleticket` INT NOT NULL,
  PRIMARY KEY (`iddetalle`),
  UNIQUE INDEX `iddetalle_ticket_UNIQUE` (`iddetalle` ASC) ,
  INDEX `idticket_ticket_idx` (`idticket_detalleticket` ASC) ,
  INDEX `idespacio_detalle_ticket_idx` (`idespacio_detalleticket` ASC) ,
  CONSTRAINT `idticket_detalleticket`
    FOREIGN KEY (`idticket_detalleticket`)
    REFERENCES `easyParking`.`ticket` (`idticket`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idespacio_detalleticket`
    FOREIGN KEY (`idespacio_detalleticket`)
    REFERENCES `easyParking`.`espacio_Parking` (`idespacio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
