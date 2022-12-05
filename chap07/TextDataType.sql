USE sqlDB;
DROP TABLE IF EXISTS maxTbl;
CREATE TABLE maxTbl(col1 LONGTEXT, col2 LONGTEXT);
INSERT INTO maxTbl VALUES (REPEAT('A', 10000000), REPEAT('B', 10000000));
SELECT LENGTH(col1), LENGTH(col2) FROM maxTbl;
SHOW variables LIKE 'max%';

SELECT * INTO OUTFILE '/tmp/userTBL.txt' character set utf8 FROM userTBL;

DROP TABLE IF EXISTS memberTBL;
CREATE TABLE memberTBL LIKE userTBL;
-- LOAD DATA LOCAL INFILE '/tmp/userTBL.txt' INTO TABLE memberTBL;
LOAD DATA LOCAL INFILE '/tmp/userTBL.txt' INTO TABLE memberTBL character set utf8;
SELECT * FROM memberTBL;