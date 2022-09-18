USE sqlDB;
-- 1. v_userbutTbl
CREATE VIEW v_userbuyTbl
AS
	SELECT U.userID AS 'USER ID', U.name AS 'USER NAME', B.prodName AS 'PRODUCT NAME', U.addr, CONCAT(U.mobile1, U.mobile2) AS 'MOBILE PHONE'
		FROM userTbl U
			INNER JOIN buyTbl B
				ON U.userID = B.userID;

SELECT `USER ID`, `USER NAME` FROM v_userbuyTbl;

-- 2. v_userTbl
CREATE OR REPLACE VIEW v_userTbl
AS
	SELECT userid, name, addr FROM userTbl;

DESCRIBE v_userbuyTbl;
DESCRIBE v_userTbl;

UPDATE v_userTbl SET addr = '부산' WHERE userid = 'JKW';

SELECT * FROM userTbl;
SELECT * FROM v_userTbl;

SELECT IS_UPDATABLE FROM INFORMATION_SCHEMA.VIEWS
	WHERE TABLE_SCHEMA = 'sqlDB' AND TABLE_NAME = 'v_userbuyTbl';
DESCRIBE v_userbuyTbl;

SELECT IS_UPDATABLE FROM INFORMATION_SCHEMA.VIEWS
	WHERE TABLE_SCHEMA = 'sqlDB' AND TABLE_NAME = 'v_userTbl';
DESCRIBE v_userTbl;

-- 3. v_sum
CREATE VIEW v_sum
AS
	SELECT userid AS 'userid', SUM(price*amount) AS 'total'
		FROM buyTbl GROUP BY userid;

SELECT * FROM v_sum;

SELECT IS_UPDATABLE FROM INFORMATION_SCHEMA.VIEWS
	WHERE TABLE_SCHEMA = 'sqlDB' AND TABLE_NAME = 'v_sum';

-- 4. v_height
CREATE VIEW v_height177
AS
	SELECT * FROM userTbl WHERE height >= 177
		WITH CHECK OPTION;

SELECT * FROM v_height177;

SHOW CREATE VIEW v_userTbl\G;
-- INSERT INTO v_height177 VALUES('SJH', '서장훈', 2006, '서울', '010', '3333333', 155, '2019-3-3');

DROP TABLE IF EXISTS buyTbl, userTbl;

SELECT * FROM v_userbuyTbl;
CHECK TABLE v_userbuyTbl;

DROP VIEW v_userbuyTbl;
DROP VIEW v_userTbl;
DROP VIEW v_sum;
DROP VIEW v_height177;
