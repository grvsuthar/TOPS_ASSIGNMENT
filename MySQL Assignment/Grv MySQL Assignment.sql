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

/*  4)  In the Employee table, the statement that changes Lesley Bland’s phone number 
        to 215-555-8800.

Ans-	UPDATE Employee
		SET phone_number = '215-555-8800'
		WHERE first_name = 'Lesley' AND last_name = 'Bland';
        
*/ 


/* 5 ) In the Company table, the statement that changes the name of “Urban 
Outfitters, Inc.” to “Urban Outfitters” . 

Ans - 	UPDATE Company
		name = 'Urban Outfitters'
		WHERE name = 'Urban Outfitters, Inc.';
*/

/* 6)  In ContactEmployee table, the statement that removes Dianne Connor’s contact 
event with Jack Lee (one statement). 

Ans - 	DELETE FROM ContactEmployee
		WHERE employee_id = (SELECT id FROM Employee WHERE first_name = 'Dianne ' AND last_name = 'Connor')
		AND contact_id = (SELECT id FROM Contact WHERE first_name = 'Jack' AND last_name = 'Lee');
*/ 

/* 7) Write the SQL SELECT query that displays the names of the employees that 
have contacted Toll Brothers (one statement). Run the SQL SELECT query in 
MySQL Workbench. Copy the results below as well.

Ans - 	SELECT employee.first_name, employee.last_name
		FROM Employee
		JOIN ContactEmployee ce ON employed.id = ce.employee_id
		JOIN Contact c ON ce.contact_id = c.id
		WHERE c.company_name = 'Toll Brothers';
*/

-- 8) What is the significance of “%” and “_” operators in the LIKE statement? 
/*Ans-In SQL, the LIKE statement is used to search for a specified pattern in a column.
	The % and _ operators are wildcards used in the LIKE statement to specify the pattern.
	% operator -
    The % operator is used to match any number of characters (including zero characters).
    The _ operator is used to 

*/    

/* 9)Explain normalization in the context of databases. 

Ans- Normalization is a crucial concept in database design that ensures data consistency, reduces
 data redundancy, and improves data integrity. In the context of MySQL, normalization is the process
 of organizing data in a database to minimize data redundancy and dependency.

Why Normalize?
Normalization is essential because it helps to:

Eliminate data redundancy: Redundant data can lead to inconsistencies and errors. Normalization 
ensures that each piece of data is stored in one place and one place only.
Improve data integrity: Normalization helps to ensure that data is consistent and accurate by 
reducing the likelihood of data anomalies.
Reduce data storage: By eliminating redundancy, normalization reduces the amount of storage needed 
for the database.
Improve query performance: Normalization can improve query performance by reducing the amount of 
data that needs to be processed. 

*/

   
/*10) What does a join in MySQL mean? 
 Ans -In MySQL, a JOIN is a clause used to combine rows from two or more tables based on a related 
 column
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

/* 12)What is the role of the MySQL JOIN clause in a query, and what are some 
common types of joins? 

Ans - The MySQL JOIN clause plays a crucial role in combining data from two or more tables into a 
single result set. It allows you to retrieve data from multiple tables based on a related column
 between them.

What is a JOIN?

A JOIN is a way to combine rows from two or more tables based on a common column between them. 
The resulting table contains columns from both tables, allowing you to access data from multiple 
tables in a single query.

Types of JOINs-
1. INNER JOIN
An INNER JOIN returns only the rows that have a match in both tables. It is the most common type of
JOIN.
2. LEFT JOIN (or LEFT OUTER JOIN)
A LEFT JOIN returns all the rows from the left table and the matching rows from the right table. 
If there is no match, the result set will contain NULL values for the right table columns.
3. RIGHT JOIN (or RIGHT OUTER JOIN)
A RIGHT JOIN is similar to a LEFT JOIN, but it returns all the rows from the right table and the 
matching rows from the left table.
When to use JOINs

JOINs are useful when:

You need to combine data from multiple tables.
You need to perform data aggregation or grouping across multiple tables.
You need to filter data based on conditions in multiple tables.
*/
 