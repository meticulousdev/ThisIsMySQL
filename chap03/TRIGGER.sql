INSERT INTO memberTBL VALUES('Figure', '연아', '경기도 군포시 당정동');membertblmemberID
SELECT * FROM memberTBL;
UPDATE memberTBL SET memberAddress = '서울 강남구 역삼동' WHERE memberName = '연아';
SELECT * FROM memberTBL;
DELETE FROM memberTBL WHERE memberName = '연아';
SELECT * FROM memberTBL;

CREATE TABLE deletedMemberTBL (
	memberID CHAR(8) ,
    memberName CHAR(5) ,
    memberAddress CHAR(20) ,
    deletedDate date
);

DELIMITER //
CREATE TRIGGER trg_deletedMemberTBL
	AFTER DELETE
    ON memberTBL
    FOR EACH ROW
BEGIN
    INSERT INTO deletedMemberTBL
			VALUES (OLD.memberID, OLD.memberName, OLD.memberAddress, CURDATE() );
END //
DELIMITER ;

DELETE FROM memberTBL WHERE memberName = '당탕이';
SELECT * FROM memberTBL;
SELECT * FROM deletedMemberTBL;