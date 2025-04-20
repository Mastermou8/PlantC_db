USE lperez5484_db_DatabaseProject;
Select Customer.Cus_FNAME,Invoice.Invo_ID, Invoice.INV_DATE,Invoice.INV_Status,
Invoice.INV_Status,Invoice.Payment_Method,Invoice_Total.Total
FROM Invoice JOIN Customer ON Invoice.Cus_ID=Customer.Cus_ID
JOIN Invoice_Total ON Invoice.Invo_ID=Invoice_Total.Invo_ID
WHERE Customer.Cus_FNAME= 'First14' AND Invoice.INV_DATE='2024-10-03';


SELECT DISTINCT
Products.P_CODE, Products.P_DESCRIPTION,Inventory.INV_QUANTITY,Inventory.INV_INSTOCK
FROM Inventory Join Products ON Inventory.P_CODE=Products.P_CODE
JOIN Invoice_Line ON Products.P_CODE=Invoice_Line.P_CODE
JOIN Invoice ON Invoice_Line.Invo_ID=Invoice.Invo_ID
Where Invoice.INV_DATE BETWEEN '2020-01-01' AND '2025-01-01'
ORDER BY Products.P_CODE;

SELECT Products.P_CODE,Products.P_DESCRIPTION,Products.P_TYPE,Inventory.INV_QUANTITY,
       Inventory.INV_INSTOCK
FROM Products
Join Inventory ON Products.P_CODE=Inventory.P_CODE
WHERE Products.P_TYPE='TypeA';

DROP PROCEDURE IF EXISTS GetProductType;
Create Procedure GetProductType(
    IN PCODE INT
)
BEGIN SELECT Products.P_CODE, Products.P_DESCRIPTION,Products.P_TYPE FROM Products
Where Products.P_CODE=PCODE;
end;
CALL GetProductType(1);

INSERT INTO Products(
P_DESCRIPTION, V_ID, P_TYPE,P_DISCOUNT
)
VALUES( 'Fertilizer',2,'Materials',0);

Insert into Invoice(
Invo_ID,
Cus_ID,
INV_DATE,
INV_Status,
Payment_Method)
Values(355,25,'2025-01-01','Pending','Paypal');
Select * From Invoice where Invo_ID=355;

##Already implemented in main code.
#Create view Invoice_Total as
#   SELECT
#       Invo_ID, Cus_ID,INV_DATE, SUM(Quantity*Unit_Price) AS Total
#FROM Invoice JOIN Invoice_Line using (Invo_ID) GROUP BY Invo_ID, Cus_ID, INV_DATE;
SELECT * FROM Invoice_Total;

SET @price_Point:=50.00;
SELECT Invoice_Line.Unit_Price,
Count(DISTINCT Invoice.Cus_ID) AS Customers_Num,
Min(Invoice_Line.Quantity) AS Min_Qty,
MAX(Invoice_Line.Quantity) AS Max_Qty,
Round(AVG(Invoice_Line.Quantity),2) AS Avg_Qty
FROM Invoice_Line
Join Invoice using (Invo_ID)
WHERE Invoice_Line.Unit_Price>@price_Point
Group By Invoice_Line.Unit_Price
Order by Invoice_Line.Unit_Price DESC
Limit 3;

