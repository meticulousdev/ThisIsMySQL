-- DELETE DROP TRUNCATE
USE sqlDB;
DROP TABLE IF EXISTS bigTbl1;
CREATE TABLE bigTbl1
	(SELECT * FROM employees.employees);
DROP TABLE IF EXISTS bigTbl2;
CREATE TABLE bigTbl2
	(SELECT * FROM employees.employees);
DROP TABLE IF EXISTS bigTbl3;
CREATE TABLE bigTbl3
	(SELECT * FROM employees.employees);

DELETE FROM bigTbl1;
DROP TABLE bigTbl2;
TRUNCATE TABLE bigTbl3;

-- INSERT
DROP TABLE IF EXISTS memberTBL;
CREATE TABLE memberTBL (SELECT userID, name, addr FROM userTbl LIMIT 3);
ALTER TABLE memberTBL
	ADD CONSTRAINT pk_memberTBL PRIMARY KEY (userID);
SELECT * FROM memberTBL;

USE information_schema;
SELECT * FROM TABLE_CONSTRAINTS WHERE TABLE_SCHEMA = 'sqlDB';

USE sqlDB;
INSERT IGNORE INTO memberTBL VALUES('BBK', '바비코', '미국');
INSERT IGNORE INTO memberTBL VALUES('SJH', '서장훈', '서울');
INSERT IGNORE INTO memberTBL VALUES('HJY', '현주엽', '경기');
SELECT * FROM memberTBL;

INSERT IGNORE INTO memberTBL VALUES('BBK', '바비코', '미국')
	ON DUPLICATE KEY UPDATE name = '바비코', addr = '미국';
INSERT IGNORE INTO memberTBL VALUES('DJM', '동짜몽', '일본')
	ON DUPLICATE KEY UPDATE name = '동짜몽', addr = '일본';
SELECT * FROM memberTBL;
