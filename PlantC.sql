Drop database IF EXISTS lperez5484_db_DatabaseProject;
Create DATABASE lperez5484_db_DatabaseProject;
USE lperez5484_db_DatabaseProject;
Create table Customer
(
    Cus_ID int AUTO_INCREMENT Primary Key NOT NULL,
    Cus_FNAME VARCHAR(50),
    Cus_LNAME VARCHAR(50),
    Cus_PHONE VARCHAR(15),
    Cus_ADDRESS VARCHAR(50),
    Cus_AREA_CODE INT);

Create table Invoice (
Invo_ID int AUTO_INCREMENT Primary Key NOT NULL,
Cus_ID int,
INV_DATE date,
INV_Status varchar(50),
Payment_Method varchar(50),
FOREIGN KEY (Cus_ID) REFERENCES Customer(Cus_ID)
);
Create table Invoice_History(
InvHist_ID int AUTO_INCREMENT Primary Key NOT NULL,
Invo_ID int NOT NULL,
Cus_ID int NOT NULL,
INV_Status varchar(50),
INV_OldStatus varchar(50),
LastChanged date,
FOREIGN KEY (Cus_ID) REFERENCES Customer(Cus_ID),
FOREIGN KEY (Invo_ID) references Invoice(Invo_ID));


Create table Vendor
(
    V_ID      int AUTO_INCREMENT Primary Key NOT NULL,
    V_NAME    VARCHAR(50),
    V_CONTACT VARCHAR(50),
    V_PHONE   VARCHAR(50)
);
Create table Products(
P_CODE int AUTO_INCREMENT Primary Key NOT NULL,
P_DESCRIPTION VARCHAR(200),
V_ID int NOT NULL,
P_TYPE VARCHAR(50),
P_DISCOUNT Decimal(5,2),
FOREIGN KEY  (V_ID) REFERENCES Vendor(V_ID));
Create table Inventory(
    INV_ID int AUTO_INCREMENT Primary Key NOT NULL,
    P_CODE int,
    INV_QUANTITY int,
    INV_INSTOCK int,
    FOREIGN KEY (P_CODE) REFERENCES Products(P_CODE));

Create table Invoice_Line(
    Line_ID int AUTO_INCREMENT Primary Key NOT NULL,
    Invo_ID Int NOT NULL,
    P_CODE int NOT NULL,
    Quantity int,
    Unit_Price Decimal(8,2),
    ##Line_Total will be calculated.
    FOREIGN KEY (Invo_ID) REFERENCES Invoice(Invo_ID),
    FOREIGN KEY (P_CODE) REFERENCES Products(P_CODE));

Create table Incubator(
    INC_ID int AUTO_INCREMENT Primary Key NOT NULL,
    Cus_ID INT NOT NULL,
    INC_START_DATE DATE,
    INC_END_DATE DATE,
    P_CODE int,
    INC_CAPACITY INT,
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
    Constraint Plants_P_CODE PRIMARY KEY (P_CODE),
    UNIQUE (Plant_ID));

Create table Subscription(
    P_CODE int NOT NULL,
    Sub_Type varchar(50),
    Sub_Period varchar(50),
    Sub_Cost decimal(8,2),
    Sub_Location varchar(50),
    FOREIGN KEY (P_CODE) references Products(P_CODE) ON DELETE CASCADE ON UPDATE CASCADE,
    Constraint Subs_P_CODE PRIMARY KEY (P_CODE));
Create table Materials(
    P_CODE int NOT NULL,
    Mat_Weight varchar(50),
    Mat_Size varchar(50),
    Mat_Type varchar(50),
    FOREIGN KEY (P_CODE) references Products(P_CODE) ON DELETE CASCADE ON UPDATE CASCADE,
    Constraint Mat_P_CODE PRIMARY KEY (P_CODE));

Create table Conditions
(
    Condition_ID   int AUTO_INCREMENT Primary Key NOT NULL,
    Condition_Name varchar(50),
    Condition_Type varchar(50),
    Severity_Level varchar(50),
    Description    varchar(200)
);
Create table Region(
    ##Region_ID is marked as an FK1 in the erd, but it's not connected to Plants
    Region_ID int AUTO_INCREMENT Primary Key NOT NULL,
    Region_Name varchar(50),
    Region_Type varchar(50),
    Region_Restrictions varchar(200));

Create table Plant_Region_Availability(
    Availability_ID int AUTO_INCREMENT Primary Key NOT NULL,
    Plant_ID int not null,
    Region_ID int not null,
    Is_Allowed varchar(50),
    FOREIGN KEY (Plant_ID) references Plants(Plant_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Region_ID) references Region(Region_ID) ON DELETE CASCADE ON UPDATE CASCADE);
Create table Plant_Region_Restriction(
    Restriction_ID int AUTO_INCREMENT Primary Key NOT NULL,
    Plant_ID int not null,
    Region_ID int not null,
    Condition_ID int NOT NULL,
    Is_Active varchar(50),
    Notes varchar(500),
    FOREIGN KEY (Plant_ID) references Plants(Plant_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Region_ID) references Region(Region_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Condition_ID) references Conditions(Condition_ID) ON DELETE CASCADE ON UPDATE CASCADE);


Create view Invoice_Total as
    SELECT
        Invo_ID, Cus_ID,INV_DATE, SUM(Quantity*Unit_Price) AS Total
FROM Invoice JOIN Invoice_Line using (Invo_ID) GROUP BY Invo_ID, Cus_ID, INV_DATE;

-- 100 Customers
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (1, 'First1', 'Last1', '555-1001', '1 Main St', 67397);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (2, 'First2', 'Last2', '555-1002', '2 Main St', 62792);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (3, 'First3', 'Last3', '555-1003', '3 Main St', 96600);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (4, 'First4', 'Last4', '555-1004', '4 Main St', 39531);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (5, 'First5', 'Last5', '555-1005', '5 Main St', 42332);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (6, 'First6', 'Last6', '555-1006', '6 Main St', 96404);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (7, 'First7', 'Last7', '555-1007', '7 Main St', 62813);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (8, 'First8', 'Last8', '555-1008', '8 Main St', 25131);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (9, 'First9', 'Last9', '555-1009', '9 Main St', 75945);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (10, 'First10', 'Last10', '555-1010', '10 Main St', 35998);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (11, 'First11', 'Last11', '555-1011', '11 Main St', 74072);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (12, 'First12', 'Last12', '555-1012', '12 Main St', 48899);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (13, 'First13', 'Last13', '555-1013', '13 Main St', 47111);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (14, 'First14', 'Last14', '555-1014', '14 Main St', 52753);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (15, 'First15', 'Last15', '555-1015', '15 Main St', 93128);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (16, 'First16', 'Last16', '555-1016', '16 Main St', 61927);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (17, 'First17', 'Last17', '555-1017', '17 Main St', 93709);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (18, 'First18', 'Last18', '555-1018', '18 Main St', 90191);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (19, 'First19', 'Last19', '555-1019', '19 Main St', 37930);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (20, 'First20', 'Last20', '555-1020', '20 Main St', 25280);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (21, 'First21', 'Last21', '555-1021', '21 Main St', 30537);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (22, 'First22', 'Last22', '555-1022', '22 Main St', 69865);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (23, 'First23', 'Last23', '555-1023', '23 Main St', 19125);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (24, 'First24', 'Last24', '555-1024', '24 Main St', 99972);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (25, 'First25', 'Last25', '555-1025', '25 Main St', 33902);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (26, 'First26', 'Last26', '555-1026', '26 Main St', 59809);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (27, 'First27', 'Last27', '555-1027', '27 Main St', 70649);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (28, 'First28', 'Last28', '555-1028', '28 Main St', 39796);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (29, 'First29', 'Last29', '555-1029', '29 Main St', 76942);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (30, 'First30', 'Last30', '555-1030', '30 Main St', 79749);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (31, 'First31', 'Last31', '555-1031', '31 Main St', 45870);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (32, 'First32', 'Last32', '555-1032', '32 Main St', 58290);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (33, 'First33', 'Last33', '555-1033', '33 Main St', 78670);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (34, 'First34', 'Last34', '555-1034', '34 Main St', 94623);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (35, 'First35', 'Last35', '555-1035', '35 Main St', 87335);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (36, 'First36', 'Last36', '555-1036', '36 Main St', 43882);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (37, 'First37', 'Last37', '555-1037', '37 Main St', 53243);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (38, 'First38', 'Last38', '555-1038', '38 Main St', 99529);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (39, 'First39', 'Last39', '555-1039', '39 Main St', 21613);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (40, 'First40', 'Last40', '555-1040', '40 Main St', 55717);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (41, 'First41', 'Last41', '555-1041', '41 Main St', 59781);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (42, 'First42', 'Last42', '555-1042', '42 Main St', 38868);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (43, 'First43', 'Last43', '555-1043', '43 Main St', 94479);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (44, 'First44', 'Last44', '555-1044', '44 Main St', 80945);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (45, 'First45', 'Last45', '555-1045', '45 Main St', 99161);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (46, 'First46', 'Last46', '555-1046', '46 Main St', 39079);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (47, 'First47', 'Last47', '555-1047', '47 Main St', 73943);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (48, 'First48', 'Last48', '555-1048', '48 Main St', 39094);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (49, 'First49', 'Last49', '555-1049', '49 Main St', 96937);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (50, 'First50', 'Last50', '555-1050', '50 Main St', 95895);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (51, 'First51', 'Last51', '555-1051', '51 Main St', 70669);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (52, 'First52', 'Last52', '555-1052', '52 Main St', 81969);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (53, 'First53', 'Last53', '555-1053', '53 Main St', 25949);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (54, 'First54', 'Last54', '555-1054', '54 Main St', 54049);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (55, 'First55', 'Last55', '555-1055', '55 Main St', 82020);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (56, 'First56', 'Last56', '555-1056', '56 Main St', 27768);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (57, 'First57', 'Last57', '555-1057', '57 Main St', 88158);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (58, 'First58', 'Last58', '555-1058', '58 Main St', 92538);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (59, 'First59', 'Last59', '555-1059', '59 Main St', 29425);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (60, 'First60', 'Last60', '555-1060', '60 Main St', 14765);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (61, 'First61', 'Last61', '555-1061', '61 Main St', 90359);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (62, 'First62', 'Last62', '555-1062', '62 Main St', 10825);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (63, 'First63', 'Last63', '555-1063', '63 Main St', 61546);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (64, 'First64', 'Last64', '555-1064', '64 Main St', 40858);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (65, 'First65', 'Last65', '555-1065', '65 Main St', 99753);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (66, 'First66', 'Last66', '555-1066', '66 Main St', 46086);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (67, 'First67', 'Last67', '555-1067', '67 Main St', 10504);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (68, 'First68', 'Last68', '555-1068', '68 Main St', 45584);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (69, 'First69', 'Last69', '555-1069', '69 Main St', 63988);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (70, 'First70', 'Last70', '555-1070', '70 Main St', 13427);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (71, 'First71', 'Last71', '555-1071', '71 Main St', 92000);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (72, 'First72', 'Last72', '555-1072', '72 Main St', 65555);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (73, 'First73', 'Last73', '555-1073', '73 Main St', 98149);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (74, 'First74', 'Last74', '555-1074', '74 Main St', 26450);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (75, 'First75', 'Last75', '555-1075', '75 Main St', 46876);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (76, 'First76', 'Last76', '555-1076', '76 Main St', 71757);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (77, 'First77', 'Last77', '555-1077', '77 Main St', 94701);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (78, 'First78', 'Last78', '555-1078', '78 Main St', 75392);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (79, 'First79', 'Last79', '555-1079', '79 Main St', 54792);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (80, 'First80', 'Last80', '555-1080', '80 Main St', 72761);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (81, 'First81', 'Last81', '555-1081', '81 Main St', 62179);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (82, 'First82', 'Last82', '555-1082', '82 Main St', 10436);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (83, 'First83', 'Last83', '555-1083', '83 Main St', 94513);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (84, 'First84', 'Last84', '555-1084', '84 Main St', 58744);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (85, 'First85', 'Last85', '555-1085', '85 Main St', 20592);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (86, 'First86', 'Last86', '555-1086', '86 Main St', 52196);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (87, 'First87', 'Last87', '555-1087', '87 Main St', 35235);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (88, 'First88', 'Last88', '555-1088', '88 Main St', 83631);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (89, 'First89', 'Last89', '555-1089', '89 Main St', 20837);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (90, 'First90', 'Last90', '555-1090', '90 Main St', 70936);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (91, 'First91', 'Last91', '555-1091', '91 Main St', 48529);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (92, 'First92', 'Last92', '555-1092', '92 Main St', 17934);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (93, 'First93', 'Last93', '555-1093', '93 Main St', 82281);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (94, 'First94', 'Last94', '555-1094', '94 Main St', 58003);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (95, 'First95', 'Last95', '555-1095', '95 Main St', 45033);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (96, 'First96', 'Last96', '555-1096', '96 Main St', 14452);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (97, 'First97', 'Last97', '555-1097', '97 Main St', 19602);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (98, 'First98', 'Last98', '555-1098', '98 Main St', 92173);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (99, 'First99', 'Last99', '555-1099', '99 Main St', 21845);
INSERT INTO Customer (Cus_ID, Cus_FNAME, Cus_LNAME, Cus_PHONE, Cus_ADDRESS, Cus_AREA_CODE) VALUES (100, 'First100', 'Last100', '555-1100', '100 Main St', 46165);

-- 100 Vendors
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (1, 'Vendor1', 'Contact1', '555-2001');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (2, 'Vendor2', 'Contact2', '555-2002');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (3, 'Vendor3', 'Contact3', '555-2003');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (4, 'Vendor4', 'Contact4', '555-2004');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (5, 'Vendor5', 'Contact5', '555-2005');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (6, 'Vendor6', 'Contact6', '555-2006');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (7, 'Vendor7', 'Contact7', '555-2007');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (8, 'Vendor8', 'Contact8', '555-2008');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (9, 'Vendor9', 'Contact9', '555-2009');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (10, 'Vendor10', 'Contact10', '555-2010');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (11, 'Vendor11', 'Contact11', '555-2011');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (12, 'Vendor12', 'Contact12', '555-2012');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (13, 'Vendor13', 'Contact13', '555-2013');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (14, 'Vendor14', 'Contact14', '555-2014');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (15, 'Vendor15', 'Contact15', '555-2015');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (16, 'Vendor16', 'Contact16', '555-2016');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (17, 'Vendor17', 'Contact17', '555-2017');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (18, 'Vendor18', 'Contact18', '555-2018');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (19, 'Vendor19', 'Contact19', '555-2019');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (20, 'Vendor20', 'Contact20', '555-2020');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (21, 'Vendor21', 'Contact21', '555-2021');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (22, 'Vendor22', 'Contact22', '555-2022');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (23, 'Vendor23', 'Contact23', '555-2023');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (24, 'Vendor24', 'Contact24', '555-2024');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (25, 'Vendor25', 'Contact25', '555-2025');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (26, 'Vendor26', 'Contact26', '555-2026');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (27, 'Vendor27', 'Contact27', '555-2027');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (28, 'Vendor28', 'Contact28', '555-2028');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (29, 'Vendor29', 'Contact29', '555-2029');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (30, 'Vendor30', 'Contact30', '555-2030');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (31, 'Vendor31', 'Contact31', '555-2031');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (32, 'Vendor32', 'Contact32', '555-2032');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (33, 'Vendor33', 'Contact33', '555-2033');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (34, 'Vendor34', 'Contact34', '555-2034');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (35, 'Vendor35', 'Contact35', '555-2035');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (36, 'Vendor36', 'Contact36', '555-2036');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (37, 'Vendor37', 'Contact37', '555-2037');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (38, 'Vendor38', 'Contact38', '555-2038');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (39, 'Vendor39', 'Contact39', '555-2039');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (40, 'Vendor40', 'Contact40', '555-2040');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (41, 'Vendor41', 'Contact41', '555-2041');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (42, 'Vendor42', 'Contact42', '555-2042');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (43, 'Vendor43', 'Contact43', '555-2043');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (44, 'Vendor44', 'Contact44', '555-2044');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (45, 'Vendor45', 'Contact45', '555-2045');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (46, 'Vendor46', 'Contact46', '555-2046');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (47, 'Vendor47', 'Contact47', '555-2047');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (48, 'Vendor48', 'Contact48', '555-2048');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (49, 'Vendor49', 'Contact49', '555-2049');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (50, 'Vendor50', 'Contact50', '555-2050');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (51, 'Vendor51', 'Contact51', '555-2051');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (52, 'Vendor52', 'Contact52', '555-2052');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (53, 'Vendor53', 'Contact53', '555-2053');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (54, 'Vendor54', 'Contact54', '555-2054');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (55, 'Vendor55', 'Contact55', '555-2055');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (56, 'Vendor56', 'Contact56', '555-2056');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (57, 'Vendor57', 'Contact57', '555-2057');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (58, 'Vendor58', 'Contact58', '555-2058');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (59, 'Vendor59', 'Contact59', '555-2059');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (60, 'Vendor60', 'Contact60', '555-2060');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (61, 'Vendor61', 'Contact61', '555-2061');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (62, 'Vendor62', 'Contact62', '555-2062');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (63, 'Vendor63', 'Contact63', '555-2063');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (64, 'Vendor64', 'Contact64', '555-2064');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (65, 'Vendor65', 'Contact65', '555-2065');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (66, 'Vendor66', 'Contact66', '555-2066');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (67, 'Vendor67', 'Contact67', '555-2067');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (68, 'Vendor68', 'Contact68', '555-2068');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (69, 'Vendor69', 'Contact69', '555-2069');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (70, 'Vendor70', 'Contact70', '555-2070');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (71, 'Vendor71', 'Contact71', '555-2071');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (72, 'Vendor72', 'Contact72', '555-2072');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (73, 'Vendor73', 'Contact73', '555-2073');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (74, 'Vendor74', 'Contact74', '555-2074');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (75, 'Vendor75', 'Contact75', '555-2075');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (76, 'Vendor76', 'Contact76', '555-2076');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (77, 'Vendor77', 'Contact77', '555-2077');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (78, 'Vendor78', 'Contact78', '555-2078');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (79, 'Vendor79', 'Contact79', '555-2079');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (80, 'Vendor80', 'Contact80', '555-2080');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (81, 'Vendor81', 'Contact81', '555-2081');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (82, 'Vendor82', 'Contact82', '555-2082');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (83, 'Vendor83', 'Contact83', '555-2083');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (84, 'Vendor84', 'Contact84', '555-2084');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (85, 'Vendor85', 'Contact85', '555-2085');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (86, 'Vendor86', 'Contact86', '555-2086');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (87, 'Vendor87', 'Contact87', '555-2087');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (88, 'Vendor88', 'Contact88', '555-2088');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (89, 'Vendor89', 'Contact89', '555-2089');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (90, 'Vendor90', 'Contact90', '555-2090');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (91, 'Vendor91', 'Contact91', '555-2091');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (92, 'Vendor92', 'Contact92', '555-2092');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (93, 'Vendor93', 'Contact93', '555-2093');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (94, 'Vendor94', 'Contact94', '555-2094');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (95, 'Vendor95', 'Contact95', '555-2095');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (96, 'Vendor96', 'Contact96', '555-2096');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (97, 'Vendor97', 'Contact97', '555-2097');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (98, 'Vendor98', 'Contact98', '555-2098');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (99, 'Vendor99', 'Contact99', '555-2099');
INSERT INTO Vendor (V_ID, V_NAME, V_CONTACT, V_PHONE) VALUES (100, 'Vendor100', 'Contact100', '555-2100');

-- 100 Products
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (1, 'Product description 1', 44, 'TypeA', 22.5);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (2, 'Product description 2', 11, 'TypeC', 1.61);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (3, 'Product description 3', 25, 'TypeA', 10.08);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (4, 'Product description 4', 90, 'TypeC', 27.62);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (5, 'Product description 5', 97, 'TypeA', 42.34);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (6, 'Product description 6', 17, 'TypeB', 48.33);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (7, 'Product description 7', 31, 'TypeA', 12.7);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (8, 'Product description 8', 47, 'TypeB', 27.73);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (9, 'Product description 9', 90, 'TypeB', 9.83);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (10, 'Product description 10', 6, 'TypeC', 48.45);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (11, 'Product description 11', 6, 'TypeC', 0.58);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (12, 'Product description 12', 93, 'TypeA', 11.27);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (13, 'Product description 13', 6, 'TypeA', 12.73);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (14, 'Product description 14', 78, 'TypeC', 1.81);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (15, 'Product description 15', 64, 'TypeB', 34.18);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (16, 'Product description 16', 10, 'TypeC', 14.8);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (17, 'Product description 17', 96, 'TypeC', 2.18);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (18, 'Product description 18', 85, 'TypeC', 44.9);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (19, 'Product description 19', 70, 'TypeA', 21.83);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (20, 'Product description 20', 54, 'TypeC', 5.72);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (21, 'Product description 21', 61, 'TypeC', 36.33);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (22, 'Product description 22', 54, 'TypeB', 5.72);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (23, 'Product description 23', 77, 'TypeA', 12.84);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (24, 'Product description 24', 4, 'TypeC', 43.78);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (25, 'Product description 25', 75, 'TypeB', 49.53);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (26, 'Product description 26', 75, 'TypeC', 35.67);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (27, 'Product description 27', 82, 'TypeB', 37.43);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (28, 'Product description 28', 88, 'TypeC', 36.35);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (29, 'Product description 29', 75, 'TypeA', 36.98);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (30, 'Product description 30', 21, 'TypeB', 31.97);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (31, 'Product description 31', 58, 'TypeA', 6.06);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (32, 'Product description 32', 43, 'TypeB', 44.0);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (33, 'Product description 33', 89, 'TypeA', 32.99);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (34, 'Product description 34', 91, 'TypeA', 25.46);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (35, 'Product description 35', 70, 'TypeC', 39.62);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (36, 'Product description 36', 6, 'TypeC', 14.75);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (37, 'Product description 37', 95, 'TypeB', 1.06);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (38, 'Product description 38', 60, 'TypeA', 49.25);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (39, 'Product description 39', 17, 'TypeC', 41.91);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (40, 'Product description 40', 22, 'TypeC', 16.92);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (41, 'Product description 41', 55, 'TypeA', 6.18);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (42, 'Product description 42', 86, 'TypeA', 24.17);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (43, 'Product description 43', 51, 'TypeB', 11.03);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (44, 'Product description 44', 39, 'TypeB', 7.11);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (45, 'Product description 45', 77, 'TypeA', 39.6);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (46, 'Product description 46', 12, 'TypeC', 12.14);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (47, 'Product description 47', 54, 'TypeA', 44.07);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (48, 'Product description 48', 51, 'TypeC', 38.15);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (49, 'Product description 49', 9, 'TypeB', 36.48);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (50, 'Product description 50', 42, 'TypeB', 22.01);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (51, 'Product description 51', 79, 'TypeB', 16.33);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (52, 'Product description 52', 21, 'TypeA', 46.22);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (53, 'Product description 53', 61, 'TypeC', 47.27);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (54, 'Product description 54', 31, 'TypeC', 11.37);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (55, 'Product description 55', 74, 'TypeC', 35.67);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (56, 'Product description 56', 76, 'TypeB', 36.66);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (57, 'Product description 57', 15, 'TypeA', 27.96);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (58, 'Product description 58', 58, 'TypeA', 46.0);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (59, 'Product description 59', 29, 'TypeB', 28.86);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (60, 'Product description 60', 44, 'TypeB', 39.1);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (61, 'Product description 61', 74, 'TypeC', 11.95);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (62, 'Product description 62', 3, 'TypeC', 28.15);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (63, 'Product description 63', 17, 'TypeC', 32.35);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (64, 'Product description 64', 15, 'TypeA', 4.87);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (65, 'Product description 65', 36, 'TypeB', 11.01);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (66, 'Product description 66', 71, 'TypeB', 26.47);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (67, 'Product description 67', 81, 'TypeA', 31.26);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (68, 'Product description 68', 65, 'TypeC', 27.33);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (69, 'Product description 69', 71, 'TypeB', 44.45);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (70, 'Product description 70', 97, 'TypeA', 4.58);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (71, 'Product description 71', 93, 'TypeA', 41.47);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (72, 'Product description 72', 52, 'TypeC', 6.52);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (73, 'Product description 73', 43, 'TypeA', 49.85);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (74, 'Product description 74', 35, 'TypeB', 17.63);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (75, 'Product description 75', 9, 'TypeB', 37.89);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (76, 'Product description 76', 26, 'TypeB', 23.52);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (77, 'Product description 77', 13, 'TypeB', 31.43);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (78, 'Product description 78', 98, 'TypeA', 44.48);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (79, 'Product description 79', 94, 'TypeC', 13.75);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (80, 'Product description 80', 35, 'TypeC', 49.41);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (81, 'Product description 81', 45, 'TypeC', 45.34);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (82, 'Product description 82', 47, 'TypeC', 45.38);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (83, 'Product description 83', 33, 'TypeB', 6.25);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (84, 'Product description 84', 29, 'TypeA', 0.2);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (85, 'Product description 85', 44, 'TypeC', 45.11);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (86, 'Product description 86', 84, 'TypeC', 41.45);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (87, 'Product description 87', 98, 'TypeC', 40.51);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (88, 'Product description 88', 100, 'TypeC', 27.69);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (89, 'Product description 89', 79, 'TypeC', 46.59);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (90, 'Product description 90', 6, 'TypeB', 8.43);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (91, 'Product description 91', 98, 'TypeA', 34.98);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (92, 'Product description 92', 61, 'TypeC', 27.64);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (93, 'Product description 93', 28, 'TypeC', 17.22);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (94, 'Product description 94', 28, 'TypeB', 17.54);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (95, 'Product description 95', 63, 'TypeB', 2.92);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (96, 'Product description 96', 4, 'TypeA', 20.05);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (97, 'Product description 97', 26, 'TypeA', 36.42);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (98, 'Product description 98', 62, 'TypeC', 17.04);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (99, 'Product description 99', 18, 'TypeB', 16.21);
INSERT INTO Products (P_CODE, P_DESCRIPTION, V_ID, P_TYPE, P_DISCOUNT) VALUES (100, 'Product description 100', 39, 'TypeC', 39.63);

-- 100 Inventory
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (1, 1, 947, 682);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (2, 2, 616, 943);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (3, 3, 0, 996);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (4, 4, 212, 600);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (5, 5, 839, 648);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (6, 6, 530, 290);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (7, 7, 426, 690);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (8, 8, 687, 234);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (9, 9, 111, 390);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (10, 10, 190, 594);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (11, 11, 756, 320);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (12, 12, 293, 679);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (13, 13, 961, 646);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (14, 14, 631, 115);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (15, 15, 61, 681);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (16, 16, 227, 641);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (17, 17, 592, 680);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (18, 18, 874, 359);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (19, 19, 909, 1);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (20, 20, 9, 98);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (21, 21, 792, 580);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (22, 22, 845, 459);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (23, 23, 627, 732);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (24, 24, 208, 171);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (25, 25, 948, 53);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (26, 26, 694, 582);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (27, 27, 492, 660);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (28, 28, 84, 658);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (29, 29, 300, 861);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (30, 30, 666, 817);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (31, 31, 666, 17);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (32, 32, 548, 436);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (33, 33, 922, 325);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (34, 34, 734, 996);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (35, 35, 754, 267);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (36, 36, 762, 915);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (37, 37, 27, 297);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (38, 38, 871, 965);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (39, 39, 816, 353);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (40, 40, 650, 623);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (41, 41, 661, 226);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (42, 42, 460, 743);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (43, 43, 240, 101);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (44, 44, 115, 246);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (45, 45, 551, 510);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (46, 46, 63, 194);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (47, 47, 737, 123);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (48, 48, 637, 269);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (49, 49, 809, 938);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (50, 50, 287, 362);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (51, 51, 625, 233);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (52, 52, 245, 234);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (53, 53, 107, 814);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (54, 54, 734, 332);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (55, 55, 825, 97);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (56, 56, 11, 708);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (57, 57, 19, 840);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (58, 58, 638, 865);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (59, 59, 175, 233);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (60, 60, 816, 647);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (61, 61, 807, 605);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (62, 62, 776, 582);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (63, 63, 742, 37);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (64, 64, 56, 380);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (65, 65, 584, 300);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (66, 66, 277, 266);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (67, 67, 810, 948);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (68, 68, 55, 774);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (69, 69, 61, 611);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (70, 70, 799, 860);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (71, 71, 400, 914);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (72, 72, 237, 689);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (73, 73, 972, 278);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (74, 74, 888, 369);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (75, 75, 615, 413);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (76, 76, 203, 582);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (77, 77, 657, 732);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (78, 78, 444, 290);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (79, 79, 491, 84);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (80, 80, 481, 754);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (81, 81, 923, 280);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (82, 82, 445, 19);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (83, 83, 757, 588);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (84, 84, 370, 850);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (85, 85, 783, 966);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (86, 86, 722, 879);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (87, 87, 161, 67);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (88, 88, 164, 462);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (89, 89, 595, 36);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (90, 90, 2, 195);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (91, 91, 446, 933);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (92, 92, 368, 264);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (93, 93, 338, 72);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (94, 94, 287, 412);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (95, 95, 769, 594);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (96, 96, 418, 675);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (97, 97, 859, 322);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (98, 98, 356, 333);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (99, 99, 668, 951);
INSERT INTO Inventory (INV_ID, P_CODE, INV_QUANTITY, INV_INSTOCK) VALUES (100, 100, 739, 295);

-- 100 Invoices
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (1, 14, '2024-10-03', 'Paid', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (2, 84, '2024-01-07', 'Pending', 'Credit Card');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (3, 99, '2024-03-07', 'Paid', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (4, 58, '2024-08-15', 'Canceled', 'Credit Card');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (5, 62, '2024-09-05', 'Canceled', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (6, 19, '2024-12-07', 'Shipped', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (7, 50, '2024-11-05', 'Pending', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (8, 85, '2024-12-19', 'Pending', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (9, 49, '2024-04-21', 'Pending', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (10, 20, '2025-03-08', 'Shipped', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (11, 64, '2024-11-14', 'Paid', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (12, 27, '2025-01-13', 'Shipped', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (13, 66, '2024-10-15', 'Shipped', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (14, 69, '2024-12-09', 'Pending', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (15, 86, '2024-12-29', 'Shipped', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (16, 96, '2024-08-17', 'Paid', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (17, 28, '2024-09-01', 'Canceled', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (18, 93, '2024-12-20', 'Pending', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (19, 12, '2024-06-27', 'Canceled', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (20, 3, '2024-11-21', 'Shipped', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (21, 23, '2024-08-02', 'Paid', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (22, 95, '2025-02-28', 'Paid', 'Credit Card');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (23, 80, '2024-02-03', 'Paid', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (24, 45, '2024-08-03', 'Shipped', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (25, 99, '2024-09-20', 'Shipped', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (26, 82, '2025-03-13', 'Shipped', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (27, 81, '2024-05-03', 'Paid', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (28, 79, '2024-04-29', 'Shipped', 'Credit Card');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (29, 13, '2024-01-03', 'Pending', 'Credit Card');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (30, 49, '2024-09-20', 'Canceled', 'Credit Card');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (31, 62, '2024-10-29', 'Canceled', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (32, 31, '2025-01-12', 'Canceled', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (33, 84, '2024-11-22', 'Canceled', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (34, 44, '2024-09-21', 'Pending', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (35, 45, '2024-04-03', 'Canceled', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (36, 53, '2024-06-01', 'Shipped', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (37, 49, '2024-06-24', 'Shipped', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (38, 11, '2024-09-12', 'Canceled', 'Credit Card');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (39, 92, '2024-10-26', 'Pending', 'Credit Card');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (40, 17, '2024-05-03', 'Pending', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (41, 10, '2024-08-31', 'Paid', 'Credit Card');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (42, 60, '2025-01-01', 'Canceled', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (43, 11, '2024-08-03', 'Canceled', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (44, 73, '2024-05-14', 'Paid', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (45, 95, '2024-07-12', 'Pending', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (46, 60, '2024-09-01', 'Paid', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (47, 9, '2024-09-10', 'Pending', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (48, 90, '2024-03-01', 'Paid', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (49, 78, '2025-03-22', 'Paid', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (50, 75, '2025-02-28', 'Paid', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (51, 90, '2025-01-04', 'Canceled', 'Credit Card');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (52, 80, '2025-01-31', 'Canceled', 'Credit Card');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (53, 75, '2025-01-15', 'Shipped', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (54, 26, '2024-01-07', 'Paid', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (55, 76, '2024-10-09', 'Paid', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (56, 30, '2025-02-17', 'Shipped', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (57, 38, '2024-07-13', 'Paid', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (58, 95, '2024-02-18', 'Pending', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (59, 87, '2024-10-22', 'Shipped', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (60, 31, '2024-09-24', 'Canceled', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (61, 88, '2024-09-05', 'Canceled', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (62, 68, '2024-05-16', 'Shipped', 'Credit Card');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (63, 49, '2025-02-07', 'Paid', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (64, 28, '2024-05-10', 'Canceled', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (65, 8, '2024-11-05', 'Shipped', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (66, 44, '2024-12-22', 'Paid', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (67, 40, '2024-08-04', 'Shipped', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (68, 100, '2025-04-14', 'Canceled', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (69, 76, '2025-03-03', 'Pending', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (70, 77, '2024-06-22', 'Shipped', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (71, 75, '2024-01-11', 'Canceled', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (72, 49, '2025-02-16', 'Pending', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (73, 14, '2024-11-18', 'Paid', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (74, 82, '2024-09-28', 'Pending', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (75, 45, '2024-08-24', 'Pending', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (76, 4, '2024-09-24', 'Canceled', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (77, 16, '2024-01-01', 'Pending', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (78, 70, '2025-03-27', 'Shipped', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (79, 54, '2024-01-09', 'Pending', 'Credit Card');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (80, 25, '2024-01-10', 'Paid', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (81, 77, '2024-11-10', 'Paid', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (82, 98, '2024-01-26', 'Canceled', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (83, 51, '2024-04-25', 'Paid', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (84, 77, '2025-02-06', 'Canceled', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (85, 9, '2024-07-28', 'Paid', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (86, 94, '2024-06-17', 'Shipped', 'Credit Card');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (87, 64, '2024-09-28', 'Canceled', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (88, 40, '2024-06-18', 'Paid', 'Credit Card');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (89, 63, '2024-05-02', 'Canceled', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (90, 98, '2024-11-03', 'Paid', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (91, 44, '2024-01-16', 'Canceled', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (92, 8, '2024-09-06', 'Canceled', 'Credit Card');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (93, 53, '2024-10-06', 'Paid', 'Bank Transfer');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (94, 24, '2024-02-29', 'Pending', 'Credit Card');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (95, 8, '2024-10-13', 'Shipped', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (96, 78, '2024-08-06', 'Pending', 'Credit Card');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (97, 82, '2024-07-24', 'Paid', 'Cash');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (98, 36, '2025-02-19', 'Pending', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (99, 83, '2024-06-24', 'Pending', 'PayPal');
INSERT INTO Invoice (Invo_ID, Cus_ID, INV_DATE, INV_Status, Payment_Method) VALUES (100, 64, '2025-01-04', 'Shipped', 'PayPal');

INSERT INTO Invoice_Line (Invo_ID, P_CODE, Quantity, Unit_Price) VALUES
 (1,   1,  2,  19.99),
 (1,   5,  1,  50.50),
 (2,   3,  4,   5.00),
 (3,   2,  1,  12.75),
 (3,   4,  2,   75.25),
 (4,   6,  3,  15.00),
 (5,   1,  1,  19.99),
 (6,   7,  5,  25.00),
 (7,   8,  2,  30.00),
 (8,   9,  1, 100.00);

-- invoice_history
INSERT INTO Invoice_History (Invo_ID, Cus_ID, INV_Status, INV_OldStatus, LastChanged) VALUES
 (1,1,'Pending','Paid','2025-01-05'),
 (2,2,'Pending','Canceled','2025-01-10'),
 (3,3,'Pending','Paid','2025-02-02'),
 (4,4,'Pending','Shipped','2025-02-15'),
 (5,5,'Shipped','Delivered','2025-03-01');

-- incubator
INSERT INTO Incubator (Cus_ID, INC_START_DATE, INC_END_DATE, P_CODE, INC_CAPACITY) VALUES
 (1,'2025-01-01','2025-01-10',1,50),
 (2,'2025-01-05','2025-01-15',2,40),
 (3,'2025-02-01','2025-02-20',3,30);

-- plants (subtype of products)
INSERT INTO Plants (P_CODE, Plant_ID, Plant_Species, Plant_Description, Plant_Size, Plant_Region, Plant_Water_Req) VALUES
 (1,101,'Ficus','Indoor ficus tree','Medium','Tropical','Moderate'),
 (2,102,'Aloe','Succulent aloe vera','Small','Desert','Low'),
 (3,103,'Oak','Oak seedling','Large','Temperate','High');

-- subscription (subtype)
INSERT INTO Subscription (P_CODE, Sub_Type, Sub_Period, Sub_Cost, Sub_Location) VALUES
 (4,'Monthly','1 month',9.99,'Online'),
 (5,'Annual','12 months',99.99,'In-Store');

-- materials (subtype)
INSERT INTO Materials (P_CODE, Mat_Weight, Mat_Size, Mat_Type) VALUES
 (6,'2kg','30x20cm','Metal'),
 (7,'0.5kg','10x10cm','Plastic');

-- conditions
INSERT INTO Conditions (Condition_Name, Condition_Type, Severity_Level, Description) VALUES
 ('Hot','Temperature','Medium','Requires warm climate'),
 ('Cold','Temperature','High','Requires cold climate'),
 ('Humidity','Moisture','Low','Requires high humidity');

-- region
INSERT INTO Region (Region_Name, Region_Type, Region_Restrictions) VALUES
 ('North America','Continent','None'),
 ('Europe','Continent','Pesticide restrictions');

-- plant_region_availability
INSERT INTO Plant_Region_Availability (Plant_ID,Region_ID,Is_Allowed) VALUES
 (101,1,'Y'),
 (102,2,'N');

-- plant_region_restriction
INSERT INTO Plant_Region_Restriction (Plant_ID,Region_ID,Condition_ID,Is_Active,Notes) VALUES
 (101,1,1,'Y','Summer only'),
 (102,2,2,'Y','Winter shipping only');



ALTER TABLE Inventory
Add column    INV_LAST_RESTOCKDATE Date DEFAULT CURRENT_DATE AFTER INV_QUANTITY;





