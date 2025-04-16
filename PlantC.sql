Drop database IF EXISTS lperez5484_db_DatabaseProject;
Create DATABASE lperez5484_db_DatabaseProject;
USE lperez5484_db_DatabaseProject;
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
V_ID int NOT NULL,
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
    INV_ID Int NOT NULL,
    P_Code int NOT NULL,
    P_Amount int,
    Line_Price Decimal(8,2),
    FOREIGN KEY (INV_ID) REFERENCES Inventory(INV_ID),
    Constraint INV_ID Primary Key (INV_ID),
    FOREIGN KEY (P_Code) REFERENCES Products(P_CODE));

Create table Incubator(
    INC_ID INT NOT NULL,
    Cus_ID INT NOT NULL,
    INC_START_DATE DATE,
    INC_END_DATE DATE,
    P_CODE int,
    INC_CAPACITY INT,
    CONSTRAINT INC_ID PRIMARY KEY (INC_ID),
    FOREIGN KEY (Cus_ID) REFERENCES Customer(Cus_ID),
    FOREIGN KEY (P_CODE) REFERENCES Products(P_CODE)
);
Create table Plants(
    P_CODE int NOT NULL,
    Plant_ID int NOT NULL,
    Plant_Species varchar(50),
    Plant_Description varchar(200),
    Plant_Size varchar(50),
    Plant_Region varchar(50),
    Plant_Water_Req varchar(50),
    FOREIGN KEY (P_CODE) references Products(P_CODE) ON DELETE CASCADE ON UPDATE CASCADE,
    Constraint P_CODE PRIMARY KEY (P_CODE),
    UNIQUE (Plant_ID));

Create table Subscription(
    P_CODE int NOT NULL,
    Sub_Type varchar(50),
    Sub_Period varchar(50),
    Sub_Cost varchar(50),
    Sub_Location varchar(50),
    FOREIGN KEY (P_CODE) references Products(P_CODE) ON DELETE CASCADE ON UPDATE CASCADE,
    Constraint P_CODE PRIMARY KEY (P_CODE));
Create table Materials(
    P_CODE int NOT NULL,
    Mat_Weight varchar(50),
    Mat_Size varchar(50),
    Mat_Type varchar(50),
    FOREIGN KEY (P_CODE) references Products(P_CODE) ON DELETE CASCADE ON UPDATE CASCADE,
    Constraint P_CODE PRIMARY KEY (P_CODE));

Create table Conditions(
    Condition_ID int NOT NULL,
    Condition_Name varchar(50),
    Condition_Type varchar(50),
    Severity_Level varchar(50),
    Description varchar(200),
    Constraint Condition_ID PRIMARY KEY (Condition_ID));
Create table Region(
    ##Region_ID is marked as an FK1 in the erd, but it's not connected to Plants
    Region_ID int NOT NULL,
    Region_Name varchar(50),
    Region_Type varchar(50),
    Region_Restrictions varchar(200),
    Constraint Region_ID PRIMARY KEY (Region_ID));
Create table Plant_Region_Availability(
    Availability_ID int not null,
    Plant_ID int not null,
    Region_ID int not null,
    Is_Allowed varchar(50),
    FOREIGN KEY (Plant_ID) references Plants(Plant_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Region_ID) references Region(Region_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    Constraint Availability_ID Primary Key (Availability_ID));
Create table Plant_Region_Restriction(
    Restriction_ID int not null,
    Plant_ID int not null,
    Region_ID int not null,
    Condition_ID int NOT NULL,
    Is_Active varchar(50),
    Notes varchar(500),
    FOREIGN KEY (Plant_ID) references Plants(Plant_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Region_ID) references Region(Region_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Condition_ID) references Conditions(Condition_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    Constraint Restriction_ID Primary Key (Restriction_ID));












