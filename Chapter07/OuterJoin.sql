USE sqlDB;

SELECT * FROM userTbl;
SELECT * FROM buyTbl;

SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
	FROM userTbl U
		LEFT OUTER JOIN buyTbl B
			ON U.userID = B.userID
	ORDER BY U.userID;

SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
	FROM buyTbl B
		RIGHT OUTER JOIN userTbl U
			ON U.userID = B.userID
	ORDER BY U.userID;

SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
	FROM userTbl U
		RIGHT OUTER JOIN buyTbl B
			ON U.userID = B.userID
	ORDER BY U.userID;
