-- OUTER JOIN
USE sqlDB;
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
	FROM buyTbl B
		RIGHT OUTER JOIN userTbl U
			ON U.userID = B.userID
	WHERE B.prodName IS NULL
	ORDER BY U.userID;

-- OUTER JOIN PRACTICE
USE sqlDB;
SELECT S.stdName, S.addr, C.clubName, C.roomNo
	FROM stdTbl S
		LEFT OUTER JOIN stdclubTbl SC
			ON S.stdName = SC.stdName
		LEFT OUTER JOIN clubTbl C
			ON SC.clubName = C.clubName
	ORDER BY S.stdName;

SELECT C.clubName, C.roomNo, S.stdName, S.addr
	FROM stdTbl S
		LEFT OUTER JOIN stdclubTbl SC
			ON S.stdName = SC.stdName
		RIGHT OUTER JOIN clubTbl C
			ON SC.clubName = C.clubName
	ORDER BY C.clubName;

USE sqlDB;
SELECT S.stdName, S.addr, C.clubName, C.roomNo
	FROM stdTbl S
		LEFT OUTER JOIN stdclubTbl SC
			ON S.stdName = SC.stdName
		LEFT OUTER JOIN clubTbl C
			ON SC.clubName = C.clubName
UNION
SELECT S.stdName, S.addr, C.clubName, C.roomNo
	FROM stdTbl S
		LEFT OUTER JOIN stdclubTbl SC
			ON S.stdName = SC.stdName
		RIGHT OUTER JOIN clubTbl C
			ON SC.clubName = C.clubName

-- CROSS JOIN
USE sqlDB;
SELECT * 
	FROM buyTbl
		CROSS JOIN userTbl;

/* DO NOT RUN IN MAC
USE employees;
SELECT COUNT(*) AS '데이터개수'
	FROM employees
		CROSS JOIN titles;
*/

-- SELF JOIN
USE sqlDB;
DROP TABLE IF EXISTS empTbl;
CREATE TABLE empTbl (emp NCHAR(3), manager NCHAR(3), empTel NVARCHAR(8));

INSERT INTO empTbl VALUES('나사장', NULL, '0000');
INSERT INTO empTbl VALUES('김재무', '나사장', '2222');
INSERT INTO empTbl VALUES('김부장', '김재무', '2222-1');
INSERT INTO empTbl VALUES('이부장', '김부장', '2222-2');
INSERT INTO empTbl VALUES('우대리', '이부장', '2222-2-1');
INSERT INTO empTbl VALUES('지사원', '우대리', '2222-2-2');
INSERT INTO empTbl VALUES('이영업', '지사원', '1111');
INSERT INTO empTbl VALUES('한과장', '이영업', '1111-1');
INSERT INTO empTbl VALUES('최정보', '한과장', '3333');
INSERT INTO empTbl VALUES('윤차장', '최정보', '3333-1');
INSERT INTO empTbl VALUES('이주임', '윤차장', '3333-1-1');

SELECT A.emp AS '부하직원', B.emp AS '직속상관', B.empTel AS '직속상관연락처'
	FROM empTbl A
		INNER JOIN empTbl B
			ON A.manager = B.emp
	WHERE A.emp = '우대리';

-- UNION/UNION ALL/NOT IN/IN
USE sqlDB;
SELECT stdName, addr FROM stdTbl
	UNION ALL
SELECT clubName, roomNo FROM clubTbl;

SELECT name, CONCAT(mobile1, mobile2) AS '전화번호' FROM userTbl
	WHERE name NOT IN (SELECT name FROM userTbl WHERE mobile1 IS NULL);

SELECT name, CONCAT(mobile1, mobile2) AS '전화번호' FROM userTbl
	WHERE name IN (SELECT name FROM userTbl WHERE mobile1 IS NULL);
