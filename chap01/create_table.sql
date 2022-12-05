-- DROP TABLE IF EXISTS `shopdb`;

CREATE TABLE `shopdb`, `membertbl` (
    `memberID` char(8) NOT NULL,
    `memberName` char(5) NOT NULL,
    `memberAddress` char(20) NOT NULL,
    PRIMARY KEY (`memberID`));