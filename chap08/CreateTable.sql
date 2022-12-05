DROP DATABASE IF EXISTS tableDB;
CREATE DATABASE tableDB;

USE tableDB;
DROP TABLE IF EXISTS buyTbl, userTbl;
CREATE TABLE userTbl
( userID		CHAR(8),
  name			NVARCHAR(10),
  birthYear		INT,
  addr			NCHAR(2),
  mobile1		CHAR(3),
  mobile2		CHAR(8),
  height		SMALLINT,
  mDate			DATE
);

CREATE TABLE buyTbl
( num			INT AUTO_INCREMENT PRIMARY KEY,
  userID		CHAR(8),
  prodName		NCHAR(6),
  groupName		NCHAR(4),
  price			INT,
  amount		SMALLINT
);

-- INSERT USERTBL DATA
INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '김범수', NULL, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '김경호', 1871, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO userTbl	VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');

-- INSERT BUYTBL DATA
INSERT INTO buyTbl VALUES(NULL, 'KBS', '운동화',   NULL, 30, 2);
INSERT INTO buyTbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buyTbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '모니터', '전자', 200, 5);

ALTER TABLE userTbl
	ADD CONSTRAINT PK_userTbl_userID
	PRIMARY KEY (userID);

DESCRIBE userTbl;
DESCRIBE buyTbl;

DELETE FROM buyTbl WHERE userid = 'BBK';
ALTER TABLE buyTbl
	ADD CONSTRAINT FK_userTbl_buyTbl
	FOREIGN KEY (userID)
	REFERENCES userTbl (userID);

DESCRIBE userTbl;
DESCRIBE buyTbl;

SET foreign_key_checks = 0;
INSERT INTO buyTbl VALUES(NULL, 'BBK', '모니터', '전자', 200,  5);
INSERT INTO buyTbl VALUES(NULL, 'KBS', '청바지', '의류',  50,  3);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '메모리', '전자',  80, 10);
INSERT INTO buyTbl VALUES(NULL, 'SSK', '책'    , '서적',  15,  5);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '책'    , '서적',  15,  2);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '청바지', '의류',  50,  1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '운동화',   NULL,  30,  2);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '책'    , '서적',  15,  1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '운동화',   NULL,  30,  2);
SET foreign_key_checks = 1;

SELECT * FROM buyTbl;

ALTER TABLE userTbl
	ADD CONSTRAINT CK_birthYear
	CHECK (birthYear >= 1900 AND birthYear <= YEAR(CURDATE()));

INSERT INTO userTbl VALUES('SSK', '성시경', 1979, '서울', NULL, NULL,186, '2013-12-12');
INSERT INTO userTbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
INSERT INTO userTbl VALUES('YJS', '윤종신', 1969, '경남', NULL, NULL, 170, '2005-5-5');
INSERT INTO userTbl	VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2013-3-3'); 
INSERT INTO userTbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
INSERT INTO userTbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');

SET foreign_key_checks = 0;
UPDATE userTbl SET userID = 'VVK' WHERE userID = 'BBK';
SET foreign_key_checks = 1;

SELECT B.userID, U.name, B.prodName, U.addr, U.mobile1+U.mobile2 AS '연락처'
	FROM buyTbl B
		INNER JOIN userTbl U
			ON B.userID = U.userID;

SELECT COUNT(*) FROM buyTbl;

SELECT B.userID, U.name, B.prodName, U.addr, U.mobile1+U.mobile2 AS '연락처'
	FROM buyTbl B
		LEFT OUTER JOIN userTbl U
			ON B.userID = U.userID
		ORDER BY B.userID;

SET foreign_key_checks = 0;
UPDATE userTbl SET userID = 'BBK' WHERE userID = 'VVK';
SET foreign_key_checks = 1;

ALTER TABLE buyTbl
	DROP FOREIGN KEY FK_userTbl_buyTbl;
ALTER TABLE buyTbl
	ADD CONSTRAINT FK_userTbl_buyTbl
		FOREIGN KEY (userID)
		REFERENCES userTbl (userID)
		ON UPDATE CASCADE
		ON DELETE CASCADE;

UPDATE userTbl SET userID = 'VVK' WHERE userID = 'BBK';
SELECT B.userID, U.name, B.prodName, U.addr, U.mobile1+U.mobile2 AS '연락처'
	FROM buyTbl B
		INNER JOIN userTbl U
			ON B.userID = U.userID
		ORDER BY B.userID;

DELETE FROM userTbl WHERE userID = 'VVK';
SELECT * FROM buyTbl;

SELECT * FROM userTbl;

ALTER TABLE userTbl
	DROP COLUMN birthYear;

SELECT * FROM userTBl;
