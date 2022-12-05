-- INSERT
USE sqlDB;
DROP TABLE IF EXISTS testTbl1;
CREATE TABLE testTbl1 (id int, userName nchar(3), age int);
INSERT INTO testTbl1 VALUES (1, '나연', 24);
INSERT INTO testTbl1(id, userName) VALUES (2, '정연');
INSERT INTO testTbl1(userName, age, id) VALUES ('모모', 23, 3);
SELECT * FROM testTbl1;

-- AUTO_INCREMENT
DROP TABLE IF EXISTS testTbl2;
CREATE TABLE testTbl2
	(id int AUTO_INCREMENT PRIMARY KEY,
	 userName nchar(3),
	 age int);
INSERT INTO testTbl2 VALUES (NULL, '사나', 23);
INSERT INTO testTbl2 VALUES (NULL, '지효', 22);
INSERT INTO testTbl2 VALUES (NULL, '미나', 22);
SELECT * FROM testTbl2;

ALTER TABLE testTbl2 AUTO_INCREMENT = 100;
INSERT INTO testTbl2 VALUES (NULL, '다현', 21);
SELECT * FROM testTbl2;

DROP TABLE IF EXISTS testTbl3;
CREATE TABLE testTbl3
	(id int AUTO_INCREMENT PRIMARY KEY,
	 userName nchar(3),
	 age int);
ALTER TABLE testTbl3 AUTO_INCREMENT = 1000;
SET @@auto_increment_increment = 3;
INSERT INTO testTbl3 VALUES (NULL, '채영', 20);
INSERT INTO testTbl3 VALUES (NULL, '쯔위', 20);
SELECT * FROM testTbl3;
SET @@auto_increment_increment = 1;

-- BIG DATA
DROP TABLE IF EXISTS testTbl4;
CREATE TABLE testTbl4(id int, Fname varchar(50), Lname varchar(50));
INSERT INTO testTbl4
	SELECT emp_no, first_name, last_name FROM employees.employees;

DROP TABLE IF EXISTS testTbl5;
CREATE TABLE testTbl5
	(SELECT emp_no, first_name, last_name FROM employees.employees);

-- UPDATE
UPDATE testTbl4
	SET Lname = 'NONE'
	WHERE Fname = 'Kyoichi';
SELECT * FROM testTbl4 WHERE Fname = 'Kyoichi'; 

SELECT * FROM buyTbl;
UPDATE buyTbl SET price = price * 1.5;
SELECT * FROM buyTbl;

-- DELETE
DELETE FROM testTbl4 WHERE Fname = 'Aamer' LIMIT 5;
