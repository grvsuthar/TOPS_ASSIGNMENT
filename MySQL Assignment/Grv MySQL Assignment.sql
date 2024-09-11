-- 1) Statement to create the Contact table  
-- Table - contact
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql_assignment`.`contact` (
  `ContactID` INT NOT NULL,
  `CompanyID` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL DEFAULT NULL,
  `LastName` VARCHAR(45) NULL DEFAULT NULL,
  `Street` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State` VARCHAR(2) NULL DEFAULT NULL,
  `Zip` VARCHAR(10) NULL DEFAULT NULL,
  `IsMain` TINYINT NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `Phone` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ContactID`, `CompanyID`),
  INDEX `fk_contact_company1_idx` (`CompanyID` ASC) VISIBLE,
  CONSTRAINT `fk_contact_company1`
    FOREIGN KEY (`CompanyID`)
    REFERENCES `mysql_assignment`.`company` (`CompanyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- 2) Statement to create the Employee table
-- Table - employee
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql_assignment`.`employee` (
  `EmployeeID` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL DEFAULT NULL,
  `LastName` VARCHAR(45) NULL DEFAULT NULL,
  `Salary` DECIMAL(10,2) NULL DEFAULT NULL,
  `HireDate` DATE NULL DEFAULT NULL,
  `JobTittle` VARCHAR(25) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `Phone` VARCHAR(12) NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- 3) Statement to create the ContactEmployee table
-- Table - contactemployee
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql_assignment`.`contactemployee` (
  `ContactEmployeeID` INT NULL DEFAULT NULL,
  `ContactID` INT NULL,
  `EmployeeID` INT NOT NULL,
  `ContactDate` DATE NULL,
  `Description` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  INDEX `fk_ContactEmployee_Employee1_idx` (`EmployeeID` ASC) VISIBLE,
  INDEX `fk_contactemployee_contact1_idx` (`ContactID` ASC) VISIBLE,
  CONSTRAINT `fk_ContactEmployee_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `mysql_assignment`.`employee` (`EmployeeID`),
  CONSTRAINT `fk_contactemployee_contact1`
    FOREIGN KEY (`ContactID`)
    REFERENCES `mysql_assignment`.`contact` (`ContactID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;



-- 8) What is the significance of “%” and “_” operators in the LIKE statement? 
/*Ans-In SQL, the LIKE statement is used to search for a specified pattern in a column.
	The % and _ operators are wildcards used in the LIKE statement to specify the pattern.
	% operator -
    The % operator is used to match any number of characters (including zero characters).
    The _ operator is used to 

*/    
    
/*10) What does a join in MySQL mean? 
 Ans -In MySQL, a JOIN is a clause used to combine rows from two or more tables based on a related column
	  between them. The resulting table will contain data from both tables.

Think of it like this: Imagine you have two tables, Customers and Orders. The Customers table has a
 column customer_id and the Orders table has a column customer_id that refers to the customer who
 made the order. By joining these two tables on the customer_id column, you can create a new table
 that contains information about each customer and their corresponding orders.

There are several types of joins in MySQL:-
-INNER JOIN: Returns only the rows that have a match in both tables.
-LEFT JOIN: Returns all the rows from the left table and the matching rows from the right table.
 If there's no match, the result will contain NULL values.
-RIGHT JOIN: Similar to LEFT JOIN, but returns all the rows from the right table and the matching
 rows from the left table. 
 */
 
 /*
 11) What do you understand about DDL, DCL, and DML in MySQL?
Ans- In MySQL, DDL, DCL, and DML are three categories of SQL statements that serve different 
purposes in managing and manipulating database structures and data.

-DDL (Data Definition Language)
DDL statements are used to define the structure of a database, including creating, modifying, and 
deleting database objects such as:
Tables
Indexes
Views
Stored procedures
Functions
Triggers

-DML (Data Manipulation Language)
DML statements are used to manipulate data in a database, including:
Inserting new data
Updating existing data
Deleting data

-DCL (Data Control Language)
DCL statements are used to control access to a database, including:
Granting privileges to users or roles
Revoking privileges from users or roles
DCL statements are used to manage security and access control in a database, ensuring that only 
authorized users can perform certain actions.
 