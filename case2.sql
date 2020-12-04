DROP TABLE IF EXISTS BusyBee;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Equipment;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS Order;
CREATE TABLE BusyBee (
orderNo  INTEGER(5)        NOT NULL,       
staffNo  INTEGER (5)        NOT NULL,      
clientNo   INTEGER(8)        NOT NULL,       
equipNo  INTEGER(5)        NOT NULL,
  FOREIGN KEY (orderNo)   REFERENCES orderNo (Order),
  FOREIGN KEY (staffNo)   REFERENCES staffNo (Employee),
  FOREIGN KEY (clientNo)   REFERENCES clientNo (Client),
  FOREIGN KEY (equipNo)   REFERENCES equipNo (Equipment));
  INSERT INTO BusyBee VALUES (132, 01, 31, 423),(133, 02, 32, 424),(134, 03, 32, 435),(135, 04, 34, 426),(136, 05, 35, 427);

CREATE TABLE Employee (
	staffNo        INTEGER(5)        NOT NULL,
fName       VARCHAR (10)   NOT NULL,
lName       VARCHAR (10)   NOT NULL,
salary        INTEGER (10)   NOT NULL,
address     VARCHAR(30)        NOT NULL,
telNo          INTEGER(10)     NOT NULL,	
orderNo        INTEGER(5)      NOT NULL, 	
PRIMARY KEY (staffNo)
UNIQUE (telNo)
FOREIGN KEY (orderNo) REFERENCES orderNo (Order));
  INSERT INTO Employee VALUES (01, ‘Jason’, ‘Bourne’, 4200, ‘1330 S Dixie Hwy’, 3050001111),(133, ‘Ethan’, ‘Hunt’, 4300, ‘3120 Red Rd’, 3051112222),(134, ‘James’, ‘Bond’, 4400, ‘1521 Liguria Ave’, 3052223333),(135,  ‘Louise’, ‘Sawyer’, 4500, ‘SW 51st Terrace’, 3053334444 ),(136, ‘Thelma’, ‘Dickinson’, 4600, ‘6757 Miller Dr’, 3054445555);

CREATE TABLE Equipment( 
	equipNo      INTEGER(5)    NOT NULL,       
equipName    VARCHAR (30)   NOT NULL,
description     VARCHAR (50)   NOT NULL,
usage    VARCHAR (9) DEFAULT ‘NO’ CHECK (VALUE IN (‘AVAILABLE’, ‘EMPTY’)),  
cost       INTEGER(4)    NOT NULL,
PRIMARY KEY (equipNo));
INSERT INTO Equipment VALUES (423, ‘Industrial Floor Cleaner’,  ‘A floor cleaning machine’, ‘AVAILABLE’, 100),(424, ‘Industrial Scrubber Dryer’, ‘for cleaning large areas’, ‘AVAILABLE’, 100),(425, ‘Carpet Cleaner’, ‘clean rugs, carpet, stains’, ‘AVAILABLE’, 50),(426, ‘Manual Push Sweeper’, ‘removing dirt and debris from large areas’, ‘AVAILABLE’, 30),(427, UV Disinfection’, ‘ultraviolet sterilizers’, ‘AVAILABLE’, 10);

CREATE TABLE Client (
clientNo        INTEGER(8)        NOT NULL,
fName       VARCHAR (10)   NOT NULL,
lName       VARCHAR (10)   NOT NULL,
address     VARCHAR(30)     NOT NULL,
telNo          INTEGER(10)     NOT NULL,
orderNo      INTEGER(5)      NOT NULL,             
PRIMARY KEY (clientNo),
UNIQUE (telNo),
FOREIGN KEY (orderNo) REFERENCES orderNo (Order));
INSERT INTO Client VALUES (31, ‘Joanna’, ‘Smith’, ‘SW 51st St’, 4001112222, 423),(32, ‘Peter’, ‘White’, ‘SW 32nd St’, 4002223333, 424),(33, ‘Frank’, ‘Wood’, ‘4400 W Bird Rd’, 4003334444, 425),(34, ‘Bob’, ‘Marly’, ‘9350 Coral Way’, 4004445555, 426),(35, ‘Emily’, ‘Clark’, 4005556666, 427);

CREATE TABLE Order (
	orderNo        INTEGER(5)        NOT NULL,
daysOkWork    VARCHAR(14)    NOT NULL  CHECK(VALUE IN (‘SU’, ‘MO’, ‘TU’, ‘WE’, ‘TH’, ‘FR’, ‘SA’),
timeStart     INTEGER(4)     NOT NULL    CHECK(VALUE BETWEEN 0000 AND 2400),
timefinish    INTEGER (4)     NOT NULL     CHECK(VALUE BETWEEN 0000 AND 2400),
staffNo         INTEGER (5)        NOT NULL,
clientNo        INTEGER(8)        NOT NULL,    
equipNo        INTEGER(5)        NOT NULL,      
	PRIMARY KEY (orderNo),
	FOREIGN KEY (staffNo) REFERENCES staffNo(Employee),
FOREIGN KEY (clientNo) REFERENCES clientNo(Client),
FOREIGN KEY (equipNo) REFERENCES equipNo(Equipment)); 
INSERT INTO Order VALUES (132, ‘MO TU WE’, 0500, 0700, 01,31, 423);
INSERT INTO Order VALUES (133, ‘WE’, 1900, 2100, 02, 32, 424);
INSERT INTO Order VALUES (134, ‘TH FR’, 2000, 2200, 03, 33, 425);
INSERT INTO Order VALUES (135, ‘SU SA’, 1900, 2000, 04, 34, 426);
INSERT INTO Order VALUES (136, ‘MO’, 0530, 0730, 05, 35, 427);

