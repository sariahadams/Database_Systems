DROP TABLE IF EXISTS `STUDENT`;
CREATE TABLE `STUDENT` (
    `FirstName` varchar(255) DEFAULT NULL,
    `LastName` varchar(255) DEFAULT NULL,
    `Major` varchar(255) DEFAULT NULL,
    `StudentID` int(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `SCORE`;
CREATE TABLE `SCORE` (
    `StudentID` int(11) NOT NULL,
    `AssignmentID` int(11) NOT NULL,
    `POINTS` int(11) DEFAULT 0 NOT NULL,
    PRIMARY KEY (`StudentID`, `AssignmentID`)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `ASSIGNMENT`;
CREATE TABLE `ASSIGNMENT` (
    `AssignmentID` int(11) NOT NULL UNIQUE AUTO_INCREMENT,
    `DistributionID` int(11) NOT NULL,
    `Instance` int(11) NOT NULL,
    `PointsPossible` int(11) DEFAULT 0 NOT NULL,
    PRIMARY KEY (`AssignmentID`)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `DISTRIBUTION`;
CREATE TABLE `DISTRIBUTION` (
    `DistributionID` int(11) NOT NULL UNIQUE,
    `CourseID` int(11) NOT NULL,
    `CategoryName` varchar(30) NOT NULL,
    `Percentage` int(11) NOT NULL,
    PRIMARY KEY(`DistributionID`)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `ENROLLMENT`;
CREATE TABLE `ENROLLMENT` (
    `StudentID` int(11) NOT NULL,
    `CourseID` int(11) NOT NULL,
    PRIMARY KEY (`StudentID`, `CourseID`)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `COURSE`;
CREATE TABLE `COURSE` (
    `Department` varchar(255) NOT NULL,
    `CourseNumber` int(11) NOT NULL,
    `CourseName` varchar(255) NOT NULL,
    `Term` varchar(255) NOT NULL,
    `Year` int(5) NOT NULL,
    `CourseID` int(11) NOT NULL UNIQUE AUTO_INCREMENT,
    PRIMARY KEY(`CourseID`)
) ENGINE=InnoDB;