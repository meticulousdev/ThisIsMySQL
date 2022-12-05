/*
-- OUTER JOIN
USE sqlDB;
SELECT * FROM userTbl;
SELECT * FROM buyTbl;

SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(mobile1, mobile2) AS '연락처'
	FROM userTbl U
		LEFT OUTER JOIN buyTbl B
			ON U.userID = B.userID
	ORDER BY U.name;

SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(mobile1, mobile2) AS '연락처'
	FROM userTbl U
		RIGHT OUTER JOIN buyTbl B
			ON U.userID = B.userID
	ORDER BY U.name;

SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(mobile1, mobile2) AS '연락처'
	FROM userTbl U
		LEFT OUTER JOIN buyTbl B
			ON U.userID = B.userID
	WHERE B.prodName IS NULL
	ORDER BY U.name;
*/

USE sqlDB;
DROP PROCEDURE IF EXISTS ifProc1;
DELIMITER $$
CREATE PROCEDURE ifProc1()
BEGIN
	DECLARE score INT;

	SET score = 70;
	IF score < 40 THEN
		SELECT 'D 입니다.';
	ELSEIF score < 60 THEN
		SELECT 'C 입니다.';
	ELSEIF score < 80 THEN
		SELECT 'B 입니다.';
	ELSE
		SELECT 'A 입니다.';
	END IF;
END $$
DELIMITER ;
CALL ifProc1();
