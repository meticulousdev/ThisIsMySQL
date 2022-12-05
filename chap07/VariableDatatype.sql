-- VARIABLE
/*
USE sqlDB;

SET @myVar1 = 5;
SET @myVar2 = 3;
SET @myVar3 = 4.25;
SET @myVar4 = '가수 이름==>';

SELECT @myVar1;
SELECT @myVar2 + @myVar3;

SELECT @myVar4, Name FROM userTbl WHERE height > 180;

SET @myVar1 = 3;
PREPARE myQuery
	FROM 'SELECT NAME, height FROM userTbl ORDER BY height LIMIT ?';
EXECUTE myQuery USING @myVar1;
*/
-- TYPE CAST
USE sqlDB;
SELECT AVG(amount) AS '평균 구매 개수' FROM buyTbl;
SELECT CAST(AVG(amount) AS SIGNED INTEGER) AS '평균 구매 개수' FROM buyTbl;
SELECT CONVERT(AVG(amount), SIGNED INTEGER) AS '평균 구매 개수' FROM buyTbl;
