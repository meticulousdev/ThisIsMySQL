USE sqlDB;
DROP TABLE IF EXISTS pivotTest;
CREATE TABLE pivotTest
( uName		NCHAR(3),
  season	NCHAR(2),
  amount	INT );

INSERT INTO pivotTest VALUES
	('김범수', '겨울', 10), ('윤종신', '여름', 15), ('김범수', '가을', 25), ('김범수', '봄', 3),
	('김범수', '봄', 37), ('윤종신', '겨울', 40), ('김범수', '여름', 14), ('김범수', '겨울', 22),
	('윤종신', '여름', 64);
SELECT * FROM pivotTest;

SELECT uName,
	   SUM(IF(season='봄', amount, 0)) AS '봄',
	   SUM(IF(season='여름', amount, 0)) AS '여름',
	   SUM(IF(season='가을', amount, 0)) AS '가을',
	   SUM(IF(season='겨울', amount, 0)) AS '겨울',
	   SUM(amount) AS '합계' FROM pivotTest GROUP BY uName;

SELECT season,
	   SUM(IF(uName='김범수', amount, 0)) AS '김범수',
	   SUM(IF(uName='윤종신', amount, 0)) AS '윤종신',
	   SUM(amount) AS '합계' FROM pivotTest GROUP BY season;
