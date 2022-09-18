USE sqlDB;
SELECT * FROM userTbl;
SELECT * FROM userTbl WHERE Name = '김경호';

-- Basic WHERE
SELECT userID, Name FROM userTbl WHERE birthYear >= 1970 AND height >= 182;
SELECT userID, Name FROM userTbl WHERE birthYear >= 1970 OR height >= 182;

-- BETWEEN ... AND & IN() & LIKE
SELECT Name, height FROM userTbl WHERE height >= 180 AND height <= 183;
SELECT Name, height FROM userTbl WHERE height BETWEEN 180 AND 183;
SELECT Name, addr FROM userTbl WHERE addr = '경남' OR addr = '경북'; 
SELECT Name, addr FROM userTbl WHERE addr IN('경남', '전남', '경북');
SELECT Name, height FROM userTbl WHERE name LIKE '김%';
SELECT Name, height FROM userTbl WHERE name LIKE '_종신';

-- ANY/ALL/SOME & SUBQUERY
SELECT Name, height FROM userTbl WHERE height > 177;
SELECT Name, height FROM userTbl
	WHERE height > (SELECT height FROM userTbl WHERE Name = '김경호');
SELECT addr, Name, height FROM userTbl
	WHERE height >= ANY (SELECT height FROM userTbl WHERE addr = '경남');
SELECT addr, Name, height FROM userTbl
	WHERE height >= ALL (SELECT height FROM userTbl WHERE addr = '경남');
SELECT addr, Name, height FROM userTbl
	WHERE height = ANY (SELECT height FROM userTbl WHERE addr = '경남');
SELECT addr, Name, height FROM userTbl
	WHERE height IN (SELECT height FROM userTbl WHERE addr = '경남');

-- ORDER BY
SELECT Name, mDate FROM userTbl ORDER BY mDate;
SELECT Name, mDate FROM userTbl ORDER BY mDate DESC;
SELECT Name, height FROM userTbl ORDER BY height DESC, name ASC;

-- DISTINCT
SELECT addr FROM userTbl;
SELECT addr FROM userTbl ORDER BY addr;
SELECT DISTINCT addr FROM userTbl;

-- LIMIT
USE employees;
SELECT emp_no, hire_date FROM employees
	ORDER BY hire_date ASC
	LIMIT 5;

-- CREATE TABLE ... SELECT
USE sqlDB;
DROP TABLE IF EXISTS buyTbl2;
CREATE TABLE buyTbl2 (SELECT * FROM buyTbl);
SELECT * FROM buyTbl2;

DROP TABLE IF EXISTS buyTbl3;
CREATE TABLE buyTbl3 (SELECT userID, prodName FROM buyTbl);
SELECT * FROM buyTbl3;

USE information_schema;
SELECT * FROM TABLE_CONSTRAINTS WHERE TABLE_SCHEMA = 'sqlDB';
