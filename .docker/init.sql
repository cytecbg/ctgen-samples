-- MySQL Workbench Synchronization
-- Generated: 2024-02-20 20:35
-- Model: Example
-- Version: 1.0
-- Project: Example DB
-- Author: Ivan Ganev

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE TABLE IF NOT EXISTS `example`.`authors` (
  `author_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `country_id` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `nickname` VARCHAR(255) NULL DEFAULT NULL,
  `dob` DATE NULL DEFAULT NULL,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`author_id`),
  INDEX `fk_authors_1_idx` (`country_id` ASC),
  CONSTRAINT `fk_authors_1`
    FOREIGN KEY (`country_id`)
    REFERENCES `example`.`countries` (`country_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `example`.`countries` (
  `country_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `language_id` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `iso_code` CHAR(2) NOT NULL,
  PRIMARY KEY (`country_id`),
  INDEX `fk_countries_1_idx` (`language_id` ASC),
  CONSTRAINT `fk_countries_1`
    FOREIGN KEY (`language_id`)
    REFERENCES `example`.`languages` (`language_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `example`.`languages` (
  `language_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `local_name` VARCHAR(255) NULL DEFAULT NULL,
  `iso_code` CHAR(2) NOT NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `example`.`books` (
  `book_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `primary_author_id` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `published` DATE NOT NULL,
  `isbn` VARCHAR(13) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `is_out_of_print` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`book_id`),
  INDEX `fk_books_1_idx` (`primary_author_id` ASC),
  CONSTRAINT `fk_books_1`
    FOREIGN KEY (`primary_author_id`)
    REFERENCES `example`.`authors` (`author_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `example`.`book_authors` (
  `book_author_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `book_id` INT(10) UNSIGNED NOT NULL,
  `author_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`book_author_id`),
  INDEX `fk_book_authors_1_idx` (`book_id` ASC),
  INDEX `fk_book_authors_2_idx` (`author_id` ASC),
  CONSTRAINT `fk_book_authors_1`
    FOREIGN KEY (`book_id`)
    REFERENCES `example`.`books` (`book_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_book_authors_2`
    FOREIGN KEY (`author_id`)
    REFERENCES `example`.`authors` (`author_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `example`.`book_releases` (
  `book_release_id` INT(11) NOT NULL,
  `book_id` INT(10) UNSIGNED NOT NULL,
  `country_id` INT(10) UNSIGNED NOT NULL,
  `language_id` INT(10) UNSIGNED NOT NULL,
  `publisher_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  `isbn` VARCHAR(13) NOT NULL,
  `published` DATE NOT NULL,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`book_release_id`),
  INDEX `fk_book_releases_1_idx` (`book_id` ASC),
  INDEX `fk_book_releases_2_idx` (`country_id` ASC),
  INDEX `fk_book_releases_3_idx` (`language_id` ASC),
  INDEX `fk_book_releases_4_idx` (`publisher_id` ASC),
  CONSTRAINT `fk_book_releases_1`
    FOREIGN KEY (`book_id`)
    REFERENCES `example`.`books` (`book_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_book_releases_2`
    FOREIGN KEY (`country_id`)
    REFERENCES `example`.`countries` (`country_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_book_releases_3`
    FOREIGN KEY (`language_id`)
    REFERENCES `example`.`languages` (`language_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_book_releases_4`
    FOREIGN KEY (`publisher_id`)
    REFERENCES `example`.`publishers` (`publisher_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `example`.`publishers` (
  `publisher_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `country_id` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`publisher_id`),
  INDEX `fk_publishers_1_idx` (`country_id` ASC),
  CONSTRAINT `fk_publishers_1`
    FOREIGN KEY (`country_id`)
    REFERENCES `example`.`countries` (`country_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
