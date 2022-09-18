/*
-- INNER JOIN
USE sqlDB;
SELECT *
	FROM buyTbl
		INNER JOIN userTbl
			ON buyTbl.userID = userTbl.userID
	WHERE buyTbl.userID = 'JYP';

SELECT buyTbl.userID, name, prodName, addr, mobile1 + mobile2 AS '연락처'
	FROM buyTbl
		INNER JOIN userTbl
			ON buyTbl.userID = userTbl.userID;

SELECT B.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 AS '연락처'
	FROM buyTbl B
		INNER JOIN userTbl U
			ON B.userID = U.userID;

SELECT B.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 AS '연락처'
	FROM buyTbl B
		INNER JOIN userTbl U
			ON B.userID = U.userID
	WHERE B.userID = 'JYP';

SELECT U.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 AS '연락처'
	FROM userTbl U
		INNER JOIN buyTbl B
			ON U.userID = B.userID
	ORDER BY U.userID;

SELECT DISTINCT U.userID, U.name, U.addr
	FROM userTbl U
		INNER JOIN buyTbl B
			ON U.userID = B.userID
	ORDER BY U.userID;

SELECT U.userID, U.name, U.addr
	FROM userTbl U
	WHERE EXISTS (
		SELECT *
		FROM buyTbl B
		WHERE U.userID = B.userID );
*/
-- INNER TABLE PRACTICE
USE sqlDB;
DROP TABLE IF EXISTS stdclubTbl;
DROP TABLE IF EXISTS stdTbl;
DROP TABLE IF EXISTS clubTbl;

CREATE TABLE stdTbl
( stdName	NVARCHAR(10) NOT NULL PRIMARY KEY,
  addr		NCHAR(4) 	 NOT NULL
);

CREATE TABLE clubTbl
( clubName  NVARCHAR(10) NOT NULL PRIMARY KEY,
  roomNo	NCHAR(4) 	 NOT NULL
);

CREATE TABLE stdclubTbl
( num int AUTO_INCREMENT NOT NULL PRIMARY KEY,
  stdName	NVARCHAR(10) NOT NULL,
  clubName  NVARCHAR(10) NOT NULL,
  FOREIGN KEY(stdName) 	 REFERENCES stdTbl(stdName),
  FOREIGN KEY(clubName)  REFERENCES clubTbl(clubName)
);

INSERT INTO stdTbl VALUES ('김범수', '강남'), ('성시경', '서울'), ('조용필', '경기'), ('은지원', '경북'), ('바비킴', '서울');
INSERT INTO clubTbl VALUES ('수영', '101호'), ('바둑', '102호'), ('축구', '103호'), ('봉사', '104호');
INSERT INTO stdclubTbl VALUES (NULL, '김범수', '바둑'), (NULL, '김범수', '축구'), (NULL, '조용필', '축구'), (NULL, '은지원', '축구'), (NULL, '은지원', '봉사'), (NULL, '바비킴', '봉사');

SELECT 'stdTbl';
SELECT * FROM stdTbl;
SELECT 'clubTbl';
SELECT * FROM clubTbl;
SELECT 'stdclubTbl';
SELECT * FROM stdclubTbl;

SELECT S.stdName, S.addr, C.clubName, C.roomNo
	FROM stdTbl S
		INNER JOIN stdclubTbl SC
			ON S.stdName = SC.stdName 
		INNER JOIN clubTbl C
			ON SC.clubName = C.clubName
	ORDER BY S.stdName;

SELECT C.clubName, C.roomNo, S.stdName, S.addr
	FROM stdTbl S
		INNER JOIN stdclubTbl SC
			ON S.stdName = SC.stdName
		INNER JOIN clubTbl C
			ON SC.clubName = C.clubName
	ORDER BY C.clubName;
