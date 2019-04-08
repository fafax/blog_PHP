-- MySQL Script generated by MySQL Workbench
-- Sun Apr  7 12:09:22 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS bdd_blog_php DEFAULT CHARACTER SET utf8 ;
USE bdd_blog_php ;

-- -----------------------------------------------------
-- Table `mydb`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Role (
  id_role INT NOT NULL AUTO_INCREMENT,
  role VARCHAR(45),
  PRIMARY KEY (id_role, role),
  UNIQUE INDEX role_UNIQUE (role ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS User (
  id_user INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(100) NULL,
  last_name VARCHAR(100) NULL,
  email VARCHAR(255) NULL,
  url_img VARCHAR(255) NULL,
  create_date DATE NULL,
  password VARCHAR(43) NULL,
  Role_id_role INT NOT NULL,
  PRIMARY KEY (id_user),
  INDEX fk_User_Role_id (Role_id_role ASC),
  CONSTRAINT fk_User_Role
    FOREIGN KEY (Role_id_role)
    REFERENCES Role (id_role)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Post (
  id_post INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(100) NOT NULL,
  lede VARCHAR(255) NULL,
  text LONGTEXT NULL,
  url_image VARCHAR(255) NULL,
  create_date DATE NOT NULL,
  User_id_user INT NOT NULL,
  PRIMARY KEY (id_post, title, create_date),
  UNIQUE INDEX title_UNIQUE (title ASC),
  INDEX fk_Post_User_id (User_id_user ASC),
  CONSTRAINT fk_Post_User
    FOREIGN KEY (User_id_user)
    REFERENCES User (id_user)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Status (
  id_status INT NOT NULL AUTO_INCREMENT,
  status VARCHAR(45) NULL,
  PRIMARY KEY (id_status))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Comment (
  id_comment INT NOT NULL AUTO_INCREMENT,
  text LONGTEXT NULL,
  Status_id_status INT NOT NULL,
  Post_id_post INT NOT NULL,
  User_id_user INT NOT NULL,
  PRIMARY KEY (id_comment),
  INDEX fk_Comment_Status_id (Status_id_status ASC),
  INDEX fk_Comment_Post_id (Post_id_post ASC),
  INDEX fk_Comment_User_id (User_id_user ASC),
  CONSTRAINT fk_Comment_Status
    FOREIGN KEY (Status_id_status)
    REFERENCES Status (id_status)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Comment_Post
    FOREIGN KEY (Post_id_post)
    REFERENCES Post (id_post)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Comment_User
    FOREIGN KEY (User_id_user)
    REFERENCES User (id_user)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


