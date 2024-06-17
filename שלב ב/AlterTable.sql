CREATE TABLE SOLDIERS
(
  sID NUMBER(9) NOT NULL,
  firstName VARCHAR(20) NOT NULL,
  lastName VARCHAR(20) NOT NULL,
  draftDate DATE NOT NULL,
  releaseDate DATE NOT NULL,
  PRIMARY KEY (sID),
  CHECK (draftDate < releaseDate)
);

CREATE TABLE MISSION
(
  mdate DATE NOT NULL,
  mID NUMBER(9) NOT NULL,
  PRIMARY KEY (mID)
);

CREATE TABLE COMMANDER
(
  cID NUMBER(9) NOT NULL,
  PRIMARY KEY (cID),
  FOREIGN KEY (cID) REFERENCES SOLDIERS(sID)
);

CREATE TABLE CREWMATE
(
  type VARCHAR(20) NOT NULL,
  crID NUMBER(9) NOT NULL,
  cID NUMBER(9) NOT NULL,
  PRIMARY KEY (crID),
  FOREIGN KEY (crID) REFERENCES SOLDIERS(sID),
  FOREIGN KEY (cID) REFERENCES COMMANDER(cID)
);

CREATE TABLE UNIT
(
  unID NUMBER(9) NOT NULL,
  uName VARCHAR(20) NOT NULL,
  cID NUMBER(9) NOT NULL,
  PRIMARY KEY (unID),
  FOREIGN KEY (cID) REFERENCES COMMANDER(cID),
  UNIQUE (uName)
);

CREATE TABLE TANK
(
  tID NUMBER(9) NOT NULL,
  unID NUMBER(9) NOT NULL,
  cID NUMBER(9) NOT NULL,
  PRIMARY KEY (tID),
  FOREIGN KEY (unID) REFERENCES UNIT(unID),
  FOREIGN KEY (cID) REFERENCES COMMANDER(cID)
);

CREATE TABLE participates
(
  mID NUMBER(9) NOT NULL,
  unID NUMBER(9) NOT NULL,
  PRIMARY KEY (mID, unID),
  FOREIGN KEY (mID) REFERENCES MISSION(mID),
  FOREIGN KEY (unID) REFERENCES UNIT(unID)
);