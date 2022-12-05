-- GROUP BY 
USE sqlDB; 
SELECT userID, amount FROM buyTbl ORDER BY userID;
SELECT userID, SUM(amount) FROM buyTbl GROUP BY userID;
SELECT userID AS '사용자 아이디', SUM(amount) AS '총 구매 개수' FROM buyTbl GROUP BY userID;
SELECT userID AS '사용자 아이디', SUM(price*amount) AS '총 구매액' FROM buyTbl GROUP BY userID;

-- Aggregate Function
SELECT AVG(amount) AS '평균 구매 개수' FROM buyTbl;
SELECT userID, AVG(amount) AS '평균 구매 개수' FROM buyTbl GROUP BY userID;
SELECT Name, height 
	FROM userTbl
	WHERE height = (SELECT MAX(height) FROM userTbl)
		OR height = (SELECT MIN(height) FROM userTbl);
SELECT COUNT(mobile1) AS '휴대폰이 있는 사용자' FROM userTbl;

-- HAVING
SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'
	FROM buyTbl
	GROUP BY userID
	HAVING SUM(price*amount) > 1000;
SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'
	FROM buyTbl
	GROUP BY userID
	HAVING SUM(price*amount) > 1000
	ORDER BY SUM(price*amount);

-- ROLLUP
SELECT num, groupName, SUM(price*amount) AS '비용'
	FROM buyTbl
	GROUP BY groupName, num
	WITH ROLLUP;
SELECT groupName, SUM(price*amount) AS '비용'
	FROM buyTbl
	GROUP BY groupName
	WITH ROLLUP;
