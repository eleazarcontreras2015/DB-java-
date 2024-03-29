-- MySQL Script generated by MySQL Workbench
-- 03/30/18 11:57:57
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Users` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Users` (
  `username` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `fullname` VARCHAR(45) NULL,
  `email` VARCHAR(60) NULL,
  `phone` VARCHAR(45) NULL,
  `department` VARCHAR(45) NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Capstone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Capstone` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Capstone` (
  `capstoneid` INT NOT NULL,
  `title` VARCHAR(100) NULL,
  `desc` VARCHAR(255) NULL,
  `plagerismscore` INT NULL,
  `grade` VARCHAR(2) NULL,
  `type` VARCHAR(15) NULL,
  `defensedate` VARCHAR(15) NULL,
  PRIMARY KEY (`capstoneid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Committee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Committee` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Committee` (
  `username` VARCHAR(45) NOT NULL,
  `capstoneid` INT NOT NULL,
  `has_accepted` TINYINT(1) NULL DEFAULT 0,
  `has_declined` TINYINT(1) NULL DEFAULT 0,
  `position` VARCHAR(45) NULL,
  `tracking` TINYINT(1) NULL,
  PRIMARY KEY (`username`, `capstoneid`),
  INDEX `fk_committee_capstone_idx` (`capstoneid` ASC),
  CONSTRAINT `fk_committee_users`
    FOREIGN KEY (`username`)
    REFERENCES `mydb`.`Users` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_committee_capstone`
    FOREIGN KEY (`capstoneid`)
    REFERENCES `mydb`.`Capstone` (`capstoneid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`status` ;

CREATE TABLE IF NOT EXISTS `mydb`.`status` (
  `sid` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `stepcode` VARCHAR(45) NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`sid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`statushistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`statushistory` ;

CREATE TABLE IF NOT EXISTS `mydb`.`statushistory` (
  `capstoneid` INT NOT NULL,
  `sid` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `prove` boolean NOT NULL,
  PRIMARY KEY (`capstoneid`, `sid`, `date`),
  INDEX `fk_sh_status_idx` (`sid` ASC),
  CONSTRAINT `fk_sh_capstone`
    FOREIGN KEY (`capstoneid`)
    REFERENCES `mydb`.`Capstone` (`capstoneid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sh_status`
    FOREIGN KEY (`sid`)
    REFERENCES `mydb`.`status` (`sid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`studentdetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`studentdetails` ;

CREATE TABLE IF NOT EXISTS `mydb`.`studentdetails` (
  `username` VARCHAR(45) NOT NULL,
  `mastersstart` INT NULL COMMENT 'term',
  `capstonestart` INT NULL COMMENT 'term',
  PRIMARY KEY (`username`),
  CONSTRAINT `fk_sdetails_users`
    FOREIGN KEY (`username`)
    REFERENCES `mydb`.`Users` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ritcalendar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ritcalendar` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ritcalendar` (
  `term` INT NOT NULL,
  `startdate` DATE NULL,
  `adddropdeadline` DATE NULL,
  `gradedeadline` DATE NULL,
  `enddate` DATE NULL,
  PRIMARY KEY (`term`))
ENGINE = InnoDB;

select sha1('password');
-- -----------------------------------------------------
-- Data for table `mydb`.`Users`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('gpavks', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Garret Arcoraci', 'gpavks@rit.edu', '5854757854', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('dlaics', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Daniel Ashbrook', 'daniel.ashbrook@rit.edu', '(585) 475-4784', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('ciiics', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Catherine Beaton', 'catherine.beaton@rit.edu', '585-281-6162', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('dsbics', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Daniel Bogaard', 'dsbics@rit.edu', '5854755231', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('cbbics', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Charlie Border', 'cbbics@rit.edu', '585-475-7946', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('mjfics', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Michael Floeser', 'Michael.Floeser@rit.edu', '585-475-7031', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('bdfvks', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Bryan French', 'bdfvks@rit.edu', '(585) 475-6511', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('efgics', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Erik Golen', 'efgics@rit.edu', '0', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('jrhicsa', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'James Habermas', 'jrhicsa@rit.edu', '475-6369', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('vlhics', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Vicki Hanson', 'vlh@rit.edu', '(585)-475-5384', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('bhhics', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Bruce Hartpence', 'Bruce.Hartpence@rit.edu', '585-475-7938', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('amhgss', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Andrew Herbert', 'amhgss@rit.edu', '(585) 475-4554', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('lwhfac', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Larry Hill', 'Lawrence.Hill@rit.edu', '585-475-7064', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('ephics', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Ed Holden', 'edward.holden@rit.edu', '585-475-5361', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('mphics', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Matt Huenerfauth', 'matt.huenerfauth (AT) rit.edu', '585-475-2459', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('jwkics', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Jai Kang', 'jai.kang@rit.edu', '585-475-5362', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('drkisd', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Dan Kennedy', '0', '585-475-2811', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('dmlics', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Deborah LaBelle', 'dmlics@rit.edu', '5001', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('jalics', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Jeffrey Lasky', 'Jeffrey.Lasky@rit.edu', '585-475-2284', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('jalvks', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Jim Leone', 'jalvks@rit.edu', '585-475-6451', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('phlics', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Peter Lutz', 'Peter.Lutz@rit.edu', '585-475-6162', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('spmics', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Sharon Mason', 'Sharon.Mason@rit.edu', '585-475-6989', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('mjmics', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Michael McQuaid', 'mickmcquaid@gmail.com', '0', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('thoics', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Tae (Tom) Oh', 'Tom.Oh@rit.edu', '585-475-7642', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('sphics', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Sylvia Perez-Hardy', 'sylvia.perez-hardy@rit.edu', '475-7941', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('djpihst', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Jerry Powell', 'djpihst@rit.edu', '585-475-2487', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('nxsvks', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Nirmala Shenoy', 'nxsvks@rit.edu', '0', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('kssics', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Kristen Shinohara', 'kssics@rit.edu', '0', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('aesfaa', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Adam Smith', 'adam.smith@rit.edu', '585-475-4552', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('bmtski', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Brian Tomaszewski', 'bmtski@rit.edu', '585-475-2859', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('rpvvks', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Ronald Vullo', 'rpv@mail.rit.edu', '585-475-7281', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('emwics', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Elissa Weeden', 'emwics@rit.edu', '585-475-6733', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('qyuvks', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Qi Yu', 'qyuvks@rit.edu', '585-475-6929', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('sjzics', 'faculty', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Steve Zilora', 'sjzics@rit.edu', '585-475-7643', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('rdbcst', 'staff', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Rhonda Baker-Smith', 'rdbcst@rit.edu', '585-475-7924', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('aacics', 'staff', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Anthony Critelli', 'aacics@rit.edu', '585-475-7931', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('mchics', 'staff', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Melissa Hanna', 'mchics@rit.edu', '585-475-6179', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('echics', 'staff', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Betty Hillman', 'echics@rit.edu', '585-475-2700', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('tlhdsa', 'staff', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Tracy Larkins-Hobbs', 'tlhdsa@rit.edu', '585-475-4302', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('krmics', 'staff', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Kailey McCabe', 'krmics@rit.edu', '585-475-7321', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('jmpics', 'staff', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Jill Persson', 'jmpics@rit.edu', '0', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('jssics', 'staff', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'John Simonson', 'jssics@rit.edu', '0', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('jhsics', 'staff', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Jeffrey Spain', 'jhsics@rit.edu', '475-2700', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('jxa4717', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Joseph Agnelli', 'jxa4717@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('ima2139', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Ian Ayala', 'ima2139@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('tjb5185', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Todd Bednarczyk', 'tjb5185@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('cnb5597', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Chris Bonsu', 'cnb5597@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('cdc8840', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Charles Casas', 'cdc8840@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('lxc9094', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Lin Jian Chen', 'lxc9094@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('ec8155', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Eleazar Contreras', 'ec8155@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('cjc1785', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Christian Cote', 'cjc1785@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('avd2225', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Anthony DiGiovanni', 'avd2225@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('iae2784', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Ian Effendi', 'iae2784@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('tae7612', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Tiffany Ellis', 'tae7612@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('jxf3071', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Joseph Fabrizio', 'jxf3071@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('jdf4921', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Joseph Farrell', 'jfarrell@mail.rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('jpf6185', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Jacob Feiner', 'jpf6185@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('mjf7345', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Matthew Fitzgerald', 'mjf7345@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('aah3099', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Alexander Heerding', 'aah3099@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('jxh6494', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'John Hill', 'jxh6494@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('ajj2634', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Alexander Johnson', 'ajj2634@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('jak6380', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'James Kerwin', 'jak6380@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('zjk2213', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Zachary Kutik', 'zjk2213@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('jrl1547', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Jason Lamb', 'jrl1547@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('axl8078', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Alexa Lewis', 'axl8078@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('fxl2968', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Feng Lin', 'fxl2968@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('jnl9935', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Jordan Loomis', 'jnl9935@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('wdm1252', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'William Mangiamele', 'wdm1252@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('axr1623', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Abid Raja', 'axr1623@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('jas6531', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Joshua Schrader', 'jas6531@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('rms1252', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Rachael Simmonds', 'rms1252@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('rs7386', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Ryan Stadtlander', 'rs7386@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('gxs6379', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Garrett Steele', 'gxs6379@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('mas6700', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Mitchell Sweet', 'mas6700@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('jxt8029', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Jacob Toporoff', 'jxt8029@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('bev4807', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Brandon Valenzuela', 'bev4807@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('vxv2326', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Vincent Venutolo', 'vxv2326@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('aav8553', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Ariel Viggiano', 'aav8553@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('rdw6297', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Ryan Wren', 'rdw6297@rit.edu', '', 'IST');
INSERT INTO `mydb`.`Users` (`username`, `role`, `password`, `fullname`, `email`, `phone`, `department`) VALUES ('acy8525', 'student', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Alexander Yu Huang', 'acy8525@rit.edu', '', 'IST');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Capstone`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Capstone` (`capstoneid`, `title`, `desc`, `plagerismscore`, `grade`, `type`, `defensedate`) VALUES (1, 'Penguins and computers', 'The complex integration of Linux on the keyboard', NULL, NULL, 'Project', NULL);
INSERT INTO `mydb`.`Capstone` (`capstoneid`, `title`, `desc`, `plagerismscore`, `grade`, `type`, `defensedate`) VALUES (2, 'How to give flightless birds flight', 'The series of unfortunate experiments', NULL, NULL, 'Project', NULL);
INSERT INTO `mydb`.`Capstone` (`capstoneid`, `title`, `desc`, `plagerismscore`, `grade`, `type`, `defensedate`) VALUES (3, 'Dodos, where did they go?', 'Dugh!', NULL, NULL, 'Project', NULL);
INSERT INTO `mydb`.`Capstone` (`capstoneid`, `title`, `desc`, `plagerismscore`, `grade`, `type`, `defensedate`) VALUES (4, 'Waterbottles and Keyboards why they don\'t mix', 'Another series of uhnfortunate experiments', NULL, NULL, 'Thesis', NULL);
INSERT INTO `mydb`.`Capstone` (`capstoneid`, `title`, `desc`, `plagerismscore`, `grade`, `type`, `defensedate`) VALUES (5, 'Proof why printers are evil', 'A simple proof', NULL, NULL, 'Project', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Committee`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Committee` (`username`, `capstoneid`, `has_accepted`, `has_declined`, `position`, `tracking`) VALUES ('cjc1785', 1, 0, 0, 'Student', 0);
INSERT INTO `mydb`.`Committee` (`username`, `capstoneid`, `has_accepted`, `has_declined`, `position`, `tracking`) VALUES ('mjfics', 1, 1, 0, 'Chair', 0);
INSERT INTO `mydb`.`Committee` (`username`, `capstoneid`, `has_accepted`, `has_declined`, `position`, `tracking`) VALUES ('gpavks', 1, 1, 0, 'Reader 1', 0);
INSERT INTO `mydb`.`Committee` (`username`, `capstoneid`, `has_accepted`, `has_declined`, `position`, `tracking`) VALUES ('jpf6185', 2, 0, 0, 'Student', 0);
INSERT INTO `mydb`.`Committee` (`username`, `capstoneid`, `has_accepted`, `has_declined`, `position`, `tracking`) VALUES ('sphics', 2, 1, 0, 'Chair', 0);
INSERT INTO `mydb`.`Committee` (`username`, `capstoneid`, `has_accepted`, `has_declined`, `position`, `tracking`) VALUES ('mjfics', 2, 0, 1, '', 1);
INSERT INTO `mydb`.`Committee` (`username`, `capstoneid`, `has_accepted`, `has_declined`, `position`, `tracking`) VALUES ('drksib', 4, 1, 0, 'Chair', 0);
INSERT INTO `mydb`.`Committee` (`username`, `capstoneid`, `has_accepted`, `has_declined`, `position`, `tracking`) VALUES ('sjzics', 4, 1, 0, 'Reader 1', 0);
INSERT INTO `mydb`.`Committee` (`username`, `capstoneid`, `has_accepted`, `has_declined`, `position`, `tracking`) VALUES ('bhhics', 4, 1, 0, 'Reader 2', 0);
INSERT INTO `mydb`.`Committee` (`username`, `capstoneid`, `has_accepted`, `has_declined`, `position`, `tracking`) VALUES ('rs7386', 4, 0, 0, 'Student', 0);
INSERT INTO `mydb`.`Committee` (`username`, `capstoneid`, `has_accepted`, `has_declined`, `position`, `tracking`) VALUES ('dmlics', 5, 0, 0, 'Reader 1', 0);
INSERT INTO `mydb`.`Committee` (`username`, `capstoneid`, `has_accepted`, `has_declined`, `position`, `tracking`) VALUES ('jalvks', 5, 1, 0, 'Chair', 0);
INSERT INTO `mydb`.`Committee` (`username`, `capstoneid`, `has_accepted`, `has_declined`, `position`, `tracking`) VALUES ('aav8553', 5, 0, 0, 'Student', 0);
INSERT INTO `mydb`.`Committee` (`username`, `capstoneid`, `has_accepted`, `has_declined`, `position`, `tracking`) VALUES ('jsvics', 3, 1, 0, 'Chair', 0);
INSERT INTO `mydb`.`Committee` (`username`, `capstoneid`, `has_accepted`, `has_declined`, `position`, `tracking`) VALUES ('mjf7345', 3, 0, 0, 'Student', 0);
INSERT INTO `mydb`.`Committee` (`username`, `capstoneid`, `has_accepted`, `has_declined`, `position`, `tracking`) VALUES ('phlics', 3, 1, 0, 'Reader 1', 0);
INSERT INTO `mydb`.`Committee` (`username`, `capstoneid`, `has_accepted`, `has_declined`, `position`, `tracking`) VALUES ('mjfics', 3, 0, 1, NULL, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`status`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`status` (`sid`, `name`, `stepcode`, `description`) VALUES (100, 'Pre proposal', 'status', '1. Pre-proprosal (optional but very useful)');
INSERT INTO `mydb`.`status` (`sid`, `name`, `stepcode`, `description`) VALUES (200, 'Committee formed', 'student', '2. Forming the committee (two for project and three for thesis)');
INSERT INTO `mydb`.`status` (`sid`, `name`, `stepcode`, `description`) VALUES (250, 'Get approval form', 'instruction', '2.1 Download the proposal approval form from http://ist.rit.edu/');
INSERT INTO `mydb`.`status` (`sid`, `name`, `stepcode`, `description`) VALUES (300, 'Proposal development', 'status', '3. Continue proposal development ');
INSERT INTO `mydb`.`status` (`sid`, `name`, `stepcode`, `description`) VALUES (400, 'Proposal approved', '', '4. Proposal approved');
INSERT INTO `mydb`.`status` (`sid`, `name`, `stepcode`, `description`) VALUES (500, 'Get prop. approval form', '', '4.1 Download the proposal approval form from the IST website (under forms)');
INSERT INTO `mydb`.`status` (`sid`, `name`, `stepcode`, `description`) VALUES (600, 'Proposal signed ', '', '4.2 Collect signatures from committee members (email approval is fine)');
INSERT INTO `mydb`.`status` (`sid`, `name`, `stepcode`, `description`) VALUES (700, 'Proposal & form to IST', '', '4.3 Submit the approved proposal form along with the electronic version of the proposal to the department office (Tracy)');
INSERT INTO `mydb`.`status` (`sid`, `name`, `stepcode`, `description`) VALUES (800, 'Plagiarism checked', '', '4.4 The IST department office performs plagiarism checking and sends the results and proposal to the Graduate Director for final approval');
INSERT INTO `mydb`.`status` (`sid`, `name`, `stepcode`, `description`) VALUES (900, 'Grad director approved', '', '4.5 After the approval from the Graduate Director');
INSERT INTO `mydb`.`status` (`sid`, `name`, `stepcode`, `description`) VALUES (1000, 'Working on capstone', '', '5. Continue the capstone work based on what is proposed in the proposal. ');
INSERT INTO `mydb`.`status` (`sid`, `name`, `stepcode`, `description`) VALUES (1100, 'Work & report finished', '', '6. Finish the work and complete the final report.');
INSERT INTO `mydb`.`status` (`sid`, `name`, `stepcode`, `description`) VALUES (1200, 'Work & report approved', '', '7. Get approval from the committee to schedule the final defense.');
INSERT INTO `mydb`.`status` (`sid`, `name`, `stepcode`, `description`) VALUES (1300, 'Defense completed', '', '7.1 Conduct the defense');
INSERT INTO `mydb`.`status` (`sid`, `name`, `stepcode`, `description`) VALUES (1400, 'Report revised, post defense', '', '8. Revise the final report based on committee feedback. (if committee requires revisions)');
INSERT INTO `mydb`.`status` (`sid`, `name`, `stepcode`, `description`) VALUES (1500, 'Final committee approval', '', '9. After getting the final approval from the committee');
INSERT INTO `mydb`.`status` (`sid`, `name`, `stepcode`, `description`) VALUES (1600, 'Grade reported', '', '10. Committee chair report the capstone grade to the IST department office.');
INSERT INTO `mydb`.`status` (`sid`, `name`, `stepcode`, `description`) VALUES (1700, 'Capstone finished', '', '11. All work for capstone is completed by the students, staff and faculty.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`statushistory`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`statushistory` (`capstoneid`, `sid`, `date`, `prove` ) VALUES (1, 200, '2018-02-28', 1);
INSERT INTO `mydb`.`statushistory` (`capstoneid`, `sid`, `date`, `prove`) VALUES (2, 200, '2018-01-28', 0);
INSERT INTO `mydb`.`statushistory` (`capstoneid`, `sid`, `date`, `prove`) VALUES (3, 200, '2018-03-12', 0);
INSERT INTO `mydb`.`statushistory` (`capstoneid`, `sid`, `date`, `prove`) VALUES (4, 1700, '2018-03-27', 0);
INSERT INTO `mydb`.`statushistory` (`capstoneid`, `sid`, `date`, `prove`) VALUES (5, 100, '2018-03-26', 0);
INSERT INTO `mydb`.`statushistory` (`capstoneid`, `sid`, `date`, `prove`) VALUES (1, 100, '2018-01-15', 0);
INSERT INTO `mydb`.`statushistory` (`capstoneid`, `sid`, `date`, `prove`) VALUES (2, 100, '2018-01-14', 0);
INSERT INTO `mydb`.`statushistory` (`capstoneid`, `sid`, `date`, `prove`) VALUES (3, 100, '2018-02-10', 0);


COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`ritcalendar`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`ritcalendar` (`term`, `startdate`, `adddropdeadline`, `gradedeadline`, `enddate`) VALUES (2161, NULL, '2016-08-09', '2016-12-19', NULL);
INSERT INTO `mydb`.`ritcalendar` (`term`, `startdate`, `adddropdeadline`, `gradedeadline`, `enddate`) VALUES (2163, NULL, '2017-01-05', '2017-01-23', NULL);
INSERT INTO `mydb`.`ritcalendar` (`term`, `startdate`, `adddropdeadline`, `gradedeadline`, `enddate`) VALUES (2165, NULL, '2017-01-30', '2017-05-23', NULL);
INSERT INTO `mydb`.`ritcalendar` (`term`, `startdate`, `adddropdeadline`, `gradedeadline`, `enddate`) VALUES (2168, NULL, '2017-06-06', '2017-08-14', NULL);
INSERT INTO `mydb`.`ritcalendar` (`term`, `startdate`, `adddropdeadline`, `gradedeadline`, `enddate`) VALUES (2171, NULL, '2017-09-05', '2017-12-21', NULL);
INSERT INTO `mydb`.`ritcalendar` (`term`, `startdate`, `adddropdeadline`, `gradedeadline`, `enddate`) VALUES (2175, NULL, '2018-01-23', '2018-05-10', NULL);
INSERT INTO `mydb`.`ritcalendar` (`term`, `startdate`, `adddropdeadline`, `gradedeadline`, `enddate`) VALUES (2178, NULL, '2018-05-24', '2018-08-16', NULL);
INSERT INTO `mydb`.`ritcalendar` (`term`, `startdate`, `adddropdeadline`, `gradedeadline`, `enddate`) VALUES (2181, NULL, '2018-09-03', '2018-12-20', NULL);
INSERT INTO `mydb`.`ritcalendar` (`term`, `startdate`, `adddropdeadline`, `gradedeadline`, `enddate`) VALUES (2185, NULL, '2019-01-21', '2019-05-09', NULL);
INSERT INTO `mydb`.`ritcalendar` (`term`, `startdate`, `adddropdeadline`, `gradedeadline`, `enddate`) VALUES (2188, NULL, '2019-05-23', '2019-08-20', NULL);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;