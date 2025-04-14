Drop database IF EXISTS DatabaseProject;
Create DATABASE DatabaseProject;
USE DatabaseProject;
Create table Customer
(
    Cus_ID int NOT NULL,
    Cus_FNAME VARCHAR(50),
    Cus_LNAME VARCHAR(50),
    Cus_PHONE VARCHAR(15),
    Cus_ADDRESS VARCHAR(50),
    Cus_AREA_CODE INT,
constraint Cus_ID PRIMARY KEY (Cus_ID));

Create table Invoice (
Invo_ID int NOT NULL,
Cus_ID int,
INV_DATE date,
INV_TOTAL decimal(8,2),
constraint Invo_ID Primary Key (Invo_ID),
FOREIGN KEY (Cus_ID) REFERENCES Customer(Cus_ID)
);
Create table Vendor
(
    V_ID      int NOT NULL,
    V_NAME    VARCHAR(50),
    V_CONTACT VARCHAR(50),
    V_PHONE   VARCHAR(50),
    Constraint V_ID Primary Key (V_ID)
);
Create table Products(
P_CODE int NOT NULL,
P_DESCRIPTION VARCHAR(200),
V_ID int,
P_TYPE VARCHAR(50),
P_DISCOUNT Decimal(5,2),
Constraint P_CODE Primary Key (P_Code),
FOREIGN KEY  (V_ID) REFERENCES Vendor(V_ID));
Create table Inventory(
    INV_ID int Not null,
    P_CODE int,
    INV_QUANTITY int,
    INV_INSTOCK int,
    Constraint INV_ID PRIMARY KEY  (INV_ID),
    FOREIGN KEY (P_CODE) REFERENCES Products(P_CODE));

Create table Line(
    INV_ID Int,
    P_Code int,
    P_Amount int,
    Line_Price Decimal(8,2),
    FOREIGN KEY (INV_ID) REFERENCES Inventory(INV_ID),
    Constraint INV_ID Primary Key (INV_ID),
    FOREIGN KEY (P_Code) REFERENCES Products(P_CODE));

Create table Incubator(
    INC_ID INT NOT NULL,
    Cus_ID INT,
    INC_START_DATE DATE,
    INC_END_DATE DATE,
    P_CODE int,
    INC_CAPACITY INT,
    CONSTRAINT INC_ID PRIMARY KEY (INC_ID),
    FOREIGN KEY (Cus_ID) REFERENCES Customer(Cus_ID),
    FOREIGN KEY (P_CODE) REFERENCES Products(P_CODE)
);










