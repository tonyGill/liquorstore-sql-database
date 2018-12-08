create database projectFinal;
use projectFinal;

CREATE TABLE Customer (
    loyaltyPointsID VARCHAR(4) NOT NULL,
	noPoints INT,
	pointsDiscount DECIMAL(5,2) NOT NULL,
	CHECK (pointsDiscount >= 100.00),
    fName VARCHAR(25),
    lName VARCHAR(20) NOT NULL DEFAULT '',
	street VARCHAR(25) NOT NULL DEFAULT '',
    city VARCHAR(20) NOT NULL DEFAULT '',
    postcode VARCHAR(8) NOT NULL DEFAULT '',
    PRIMARY KEY (loyaltyPointsID)
);

CREATE TABLE OrderInv (
    orderNo VARCHAR(4) NOT NULL,
	buyingPrice DECIMAL(5,2) NOT NULL,
	sellingPrice DECIMAL(5,2) NOT NULL,
	quantity INT,
    PRIMARY KEY (orderNo)
   
);

CREATE TABLE Inventory (
    inventoryID VARCHAR(4) NOT NULL,
	type VARCHAR(5) NOT NULL,
	invoiceNo INT NOT NULL,
	buyingPrice DECIMAL(5,2) NOT NULL,
	sellingPrice DECIMAL(5,2) NOT NULL,
	quantity INT,
    PRIMARY KEY (inventoryID)
   
);
 

 CREATE TABLE Wine (
    ID VARCHAR(4) NOT NULL,
	inventoryID VARCHAR(4) NOT NULL,
	des VARCHAR(5) NOT NULL,
    PRIMARY KEY (ID),
  FOREIGN KEY (inventoryID)
        REFERENCES Inventory (inventoryID)
        ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE Liquor (
    ID VARCHAR(4) NOT NULL,
	inventoryID VARCHAR(4) NOT NULL,
	des VARCHAR(5) NOT NULL,
    PRIMARY KEY (ID),
  FOREIGN KEY (inventoryID)
        REFERENCES Inventory (inventoryID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Beer (
    ID VARCHAR(4) NOT NULL,
	inventoryID VARCHAR(4) NOT NULL,
	des VARCHAR(5) NOT NULL,
    PRIMARY KEY (ID),
  FOREIGN KEY (inventoryID)
        REFERENCES Inventory (inventoryID)
        ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE Tabacco (
    ID VARCHAR(4) NOT NULL,
	inventoryID VARCHAR(4) NOT NULL,
	descustomer VARCHAR(5) NOT NULL,
    PRIMARY KEY (ID),
  FOREIGN KEY (inventoryID)
        REFERENCES Inventory (inventoryID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Supplier (
    supplierID VARCHAR(4) NOT NULL,
	phoneNo CHAR(14) NOT NULL,
	phoneAlt CHAR(14) NOT NULL,
	street VARCHAR(25) NOT NULL DEFAULT '',
    city VARCHAR(20) NOT NULL DEFAULT '',
    postcode VARCHAR(8) NOT NULL DEFAULT '',
    PRIMARY KEY (supplierID)
);

CREATE TABLE Store (
    storeNo INT NOT NULL,
	phoneNo CHAR(14) NOT NULL,
	phoneAlt CHAR(14) NOT NULL,
	street VARCHAR(25) NOT NULL DEFAULT '',
    city VARCHAR(20) NOT NULL DEFAULT '',
    postcode VARCHAR(8) NOT NULL DEFAULT '',
    PRIMARY KEY (storeNo)
);


CREATE TABLE Employee (
    employeeNo VARCHAR(4) NOT NULL,
    fName VARCHAR(25),
    lName VARCHAR(20) NOT NULL DEFAULT '',
	street VARCHAR(25) NOT NULL DEFAULT '',
    city VARCHAR(20) NOT NULL DEFAULT '',
    postcode VARCHAR(8) NOT NULL DEFAULT '',
	phoneNo CHAR(14) NOT NULL,
	phoneAlt CHAR(14) NOT NULL,
    PRIMARY KEY (employeeNo)
);

CREATE TABLE StoreManager (
	managerID  VARCHAR(4) NOT NULL,
	storeNo INT NOT NULL,
    employeeNo VARCHAR(4) NOT NULL,
    fName VARCHAR(25),
    lName VARCHAR(20) NOT NULL DEFAULT '',
	street VARCHAR(25) NOT NULL DEFAULT '',
    city VARCHAR(20) NOT NULL DEFAULT '',
    postcode VARCHAR(8) NOT NULL DEFAULT '',
	phoneNo CHAR(14) NOT NULL,
	phoneAlt CHAR(14) NOT NULL,
    PRIMARY KEY (managerID),
   FOREIGN KEY (storeNo) REFERENCES Store (storeNo),
   FOREIGN KEY (employeeNo) REFERENCES Employee (employeeNo)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE POSMachine (
	terminalNo  INT NOT NULL,
	paymentID VARCHAR(8) NOT NULL,
	loyaltyPointsID VARCHAR(4) NOT NULL,
	noPoints INT,
	pointsDiscount DECIMAL(5,2) NOT NULL,
	CHECK (pointsDiscount >= 100.00),
    total DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (terminalNo),
   FOREIGN KEY (paymentID) REFERENCES Payment (paymentID),
   FOREIGN KEY (loyaltyPointsID) REFERENCES Customer (loyaltyPointsID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Receipt (
	receiptNo  INT NOT NULL,
	total DECIMAL(5,2) NOT NULL,
	noPoints INT NOT NULL,
    PRIMARY KEY (receiptNo),
   FOREIGN KEY (loyaltyPointsID) REFERENCES Customer (loyaltyPointsID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Payment (
	paymentID VARCHAR(8) NOT NULL,
	total DECIMAL(5,2) NOT NULL,
	paymentForm VARCHAR(5) NOT NULL,
    PRIMARY KEY (paymentID)
);

CREATE TABLE CreditCard (
	cardNo INT NOT NULL,
	paymentID VARCHAR(8) NOT NULL,
	total DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (cardNo),
   FOREIGN KEY (paymentID) REFERENCES Paymment (paymentID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE DebitCard (
	cardNo INT NOT NULL,
	paymentID VARCHAR(8) NOT NULL,
	total DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (cardNo),
   FOREIGN KEY (paymentID) REFERENCES Paymment (paymentID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Inventory_Customer (
	inventoryID VARCHAR(4) NOT NULL,
	loyaltyPointsID VARCHAR(4) NOT NULL,
    PRIMARY KEY (inventoryID),
	PRIMARY KEY (loyaltyPointsID),
   FOREIGN KEY (inventoryID) REFERENCES Inventory (inventoryID),
   FOREIGN KEY (loyaltyPointsID) REFERENCES Customer (loyaltyPointsID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Customer_Payment (
	loyaltyPointsID VARCHAR(4) NOT NULL,
	paymentID VARCHAR(8) NOT NULL,
	total DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (loyaltyPointsID),
	PRIMARY KEY (paymentID),
   FOREIGN KEY (loyaltyPointsID) REFERENCES Customer (loyaltyPointsID),
   FOREIGN KEY (paymentID) REFERENCES Payment (paymentID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Inventory_Order (
	inventoryID VARCHAR(4) NOT NULL,
	orderNo VARCHAR(4) NOT NULL,
	quantity INT, 
    PRIMARY KEY (inventoryID),
	PRIMARY KEY (orderNo),
   FOREIGN KEY (inventoryID) REFERENCES Inventory (inventoryID),
   FOREIGN KEY (orderNo) REFERENCES OrderInv (orderNo)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Supplier_Inventory (
	supplierID VARCHAR(4) NOT NULL,
	inventoryID VARCHAR(4) NOT NULL,
	type VARCHAR(5) NOT NULL,
    PRIMARY KEY (supplierID),
	PRIMARY KEY (inventoryID),
   FOREIGN KEY (supplierID) REFERENCES Supplier (supplierID),
   FOREIGN KEY (inventoryID) REFERENCES Inventory (inventoryID)
        ON UPDATE CASCADE ON DELETE CASCADE
);






 
 show tables;
 
 