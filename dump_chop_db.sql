CREATE DATABASE security;
USE security;

CREATE TABLE Clients
(
	Client_ID            INTEGER NOT NULL,
	Full_name            VARCHAR(50) NOT NULL,
	Date_of_birth        DATE NOT NULL,
	Contact_phone        VARCHAR(50) NOT NULL UNIQUE,
	Passport_data        VARCHAR(50) NULL UNIQUE,
	Registration_address VARCHAR(60) NULL
);
ALTER TABLE Clients
ADD PRIMARY KEY (Client_ID);



CREATE TABLE Contracts
(
	Contract_ID          INTEGER NOT NULL,
	License_number_ID    INTEGER NULL,
	Client_ID            INTEGER NULL,
	Date_of_conclusion   DATE NOT NULL,
	Date_of_termination  DATE NOT NULL,
	Service_address      VARCHAR(50) NULL
);
ALTER TABLE Contracts
ADD PRIMARY KEY (Contract_ID);



CREATE TABLE Employees
(
	License_number_ID    INTEGER NOT NULL,
	Full_name            VARCHAR(50) NOT NULL,
	Contact_phone        VARCHAR(50) NOT NULL UNIQUE,
	Work_experience      VARCHAR(50) NOT NULL,
	brigade_name         VARCHAR(50) NULL
);
ALTER TABLE Employees
ADD PRIMARY KEY (License_number_ID);



CREATE TABLE Incedents_and_Violations
(
	IaV_ID               INTEGER NOT NULL,
	Contract_ID          INTEGER NULL,
	Call_date            DATE NOT NULL,
	Reason               VARCHAR(50) NOT NULL
);
ALTER TABLE Incedents_and_Violations
ADD PRIMARY KEY (IaV_ID);



CREATE TABLE Services_S
(
	Service_ID           INTEGER NOT NULL,
	Service_s_name         VARCHAR(50) NOT NULL,
	Price_per_month      FLOAT NULL
);
ALTER TABLE Services_S
ADD PRIMARY KEY (Service_ID);



CREATE TABLE Services_in_Contracts
(
	Contract_ID          INTEGER NOT NULL,
	Service_ID           INTEGER NOT NULL
);
ALTER TABLE Services_in_Contracts
ADD PRIMARY KEY (Service_ID,Contract_ID);



ALTER TABLE Contracts
ADD CONSTRAINT R_1 FOREIGN KEY (License_number_ID) REFERENCES Employees (License_number_ID);



ALTER TABLE Contracts
ADD CONSTRAINT R_2 FOREIGN KEY  (Client_ID) REFERENCES Clients (Client_ID);



ALTER TABLE Incedents_and_Violations
ADD CONSTRAINT R_3 FOREIGN KEY (Contract_ID) REFERENCES Contracts (Contract_ID);



ALTER TABLE Services_in_Contracts
ADD CONSTRAINT R_4 FOREIGN KEY (Contract_ID) REFERENCES Contracts (Contract_ID);



ALTER TABLE Services_in_Contracts
ADD CONSTRAINT R_5 FOREIGN KEY (Service_ID) REFERENCES Services_S (Service_ID);


