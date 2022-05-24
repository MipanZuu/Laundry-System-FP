CREATE TABLE Laundry_Package_Rate (
	LPR_ID varchar(5),
	LPR_Name varchar(100),
	LPR_Price numeric(6,2)
);

ALTER TABLE Laundry_Package_Rate
ADD CONSTRAINT pk_Laundry_Package_Rate
PRIMARY KEY(LPR_ID);

CREATE TABLE Employee (
	E_NO char(2),
    M_NO int,
	E_Name varchar(100),
	E_Task varchar(25),
	E_registerDate date,
	E_Email varchar(100),
	E_password varchar(100)
);

ALTER TABLE Employee
ADD CONSTRAINT pk_Employee
PRIMARY KEY(E_NO);
ALTER TABLE Employee
ADD CONSTRAINT fk_Employee
FOREIGN KEY(M_NO);

CREATE TABLE Customer (
	C_NO char(5),
	C_Name varchar(60) NOT NULL,
	C_Sex char(1),
	C_DOB varchar(200),
	C_telpNo varchar(15),
	C_registerDate date
);

ALTER TABLE Customer
ADD CONSTRAINT pk_Customer
PRIMARY KEY(M_NO);

CREATE TABLE Invoice (
	I_No int,
    Pay_I_NO int,
    P_NO int,
    C_NO int,
	I_orderDate DATE,
	I_endDate DATE,
	I_completeDate DATE,
	I_pickUp TIMESTAMP,
    I_Quantity int,
	I_status VARCHAR(10),
	I_shelfCode VARCHAR(3)
);

ALTER TABLE Invoice
ADD CONSTRAINT pk_Invoice
PRIMARY KEY(I_NO);

ALTER TABLE Invoice
ADD CONSTRAINT fk1_Invoice
FOREIGN KEY(C_NO) REFERENCES Customer(C_NO);

ALTER TABLE Invoice
ADD CONSTRAINT fk2_Invoice
FOREIGN KEY(P_NO); REFERENCES Payment(P_NO);

CREATE TABLE Payment (
	I_No INT,
	P_No INT,
	P_totalPrice NUMERIC(10,2),
	P_date DATE
);

ALTER TABLE Payment
ADD CONSTRAINT pk_Payment
PRIMARY KEY(P_No);

ALTER TABLE Payment
ADD CONSTRAINT fk_Payment
FOREIGN KEY(I_No) REFERENCES Invoice(I_No);




