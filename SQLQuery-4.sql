--1. Create a stored procedure in the Northwind database that will calculate the average 
--value of Freight for a specified customer.Then, a business rule will be added that will 
--be triggered before every Update and Insert command in the Orders controller,and 
--will use the stored procedure to verify that the Freight does not exceed the average 
--freight. If it does, a message will be displayed and the command will be cancelled.

--ALTER PROCEDURE CALCULATE_AVG_FREIGHT
--@CUSTOMERID VARCHAR(20),
--@AVG_FREIGHT INT OUT
--  AS 
--BEGIN
--SELECT @AVG_FREIGHT=AVG(FREIGHT)  FROM ORDERS WHERE CUSTOMERID = @CUSTOMERID ;
--END; 

--CREATE TRIGGER VALIDATELIMIT
--	ON ORDERS FOR INSERT,UPDATE
--	AS
--	BEGIN

--DECLARE @CUSTOMERID VARCHAR(20),@FREIGHT INT,@AVGFREIGHT INT;

--SELECT @CUSTOMERID = CUSTOMERID,@FREIGHT = FREIGHT FROM INSERTED;

--EXEC CALCULATE_AVG_FREIGHT @CUSTOMERID,@AVGFREIGHT OUTPUT;

--	IF @FREIGHT > @AVGFREIGHT
--	BEGIN
--	PRINT('THE FREIGHT VALUE IS HIGHER THAN AVG FREIGHT');
--	ROLLBACK;
--	END;
--END;




--2. write a SQL query to Create Stored procedure in the Northwind database to retrieve  Employee Sales by Country
 

 --CREATE PROC SALES_BY_COUNTRY
 --@COUNTRYNAME VARCHAR(10)
	-- AS
	-- BEGIN
	-- SELECT E.COUNTRY,SUM(OD.UNITPRICE*OD.QUANTITY*(1-OD.DISCOUNT)) FROM EMPLOYEES AS E INNER JOIN ORDERS AS O ON E.EMPLOYEEID = O.EMPLOYEEID  INNER JOIN
	-- "ORDER DETAILS" AS OD ON O.ORDERID = OD.ORDERID  WHERE E.COUNTRY=@COUNTRYNAME GROUP BY E.COUNTRY;
	-- END;


--3. write a SQL query to Create Stored procedure in the Northwind database to retrieve Sales by Year

  --CREATE PROC SALES_BY_YEAR 
  --AS
  --BEGIN
  --SELECT YEAR(O.SHIPPEDDATE) ,SUM(OD.UNITPRICE*OD.QUANTITY*(1-OD.DISCOUNT)) FROM ORDERS AS O INNER JOIN "ORDER DETAILS" AS OD ON O.ORDERID=OD.ORDERID GROUP BY  YEAR(O.SHIPPEDDATE);
  --END;


--4. write a SQL query to Create Stored procedure in the Northwind database to retrieve Sales By Category
 ALTER PROC SALES_BY_CATOGERY	AS 	BEGIN	 SELECT C.CATEGORYNAME , SUM (D.UNITPRICE* D.QUANTITY *(1-D.DISCOUNT)) AS PRICE FROM CATEGORIES AS C JOIN PRODUCTS AS P ON C.CATEGORYID = P.CATEGORYID JOIN "ORDER DETAILS" AS D ON D.PRODUCTID = P.PRODUCTID GROUP BY C.CATEGORYNAMEEND



--5. write a SQL query to Create Stored procedure in the Northwind database to retrieve Ten Most Expensive Products

ALTER PROC TOP_TEN
AS
BEGIN
SELECT TOP 10 P.PRODUCTNAME,P.PRODUCTID,P.UNITPRICE FROM PRODUCTS AS P ORDER BY P.UNITPRICE DESC
END



--6. write a SQL query to Create Stored procedure in the Northwind database to insert Customer Order Details 
ALTER PROCEDURE INSERT_CUSTOMER_ORDERDETAILS    @ORDERID INT,    @PRODUCTID INT ,	@UNITPRICE INT,    @QUANTITY INT,    @DISCOUNT FLOATASBEGIN    INSERT INTO "ORDER DETAILS" (ORDERID, PRODUCTID,UNITPRICE, QUANTITY, DISCOUNT)    VALUES (@ORDERID, @PRODUCTID,@UNITPRICE, @QUANTITY, @DISCOUNT);END;--INSERT_CUSTOMER_ORDERDETAILS 10248,17,55,33,0.23
--7. write a SQL query to Create Stored procedure in the Northwind database to update Customer Order Details
create PROCEDURE UPDATE_CUSTOMER_ORDER_DETAILS	@ORDERID INT , 	@PRODUCTID INT,	 @QUANTITY INT,	 @UNITPRICE INT, 	 @DISCOUNT FLOATASBEGIN	UPDATE "ORDER DETAILS"	SET PRODUCTID = @PRODUCTID, QUANTITY = @QUANTITY,@UNITPRICE=UNITPRICE, DISCOUNT = @DISCOUNT	WHERE ORDERID = @ORDERID;END --UPDATE_CUSTOMER_ORDER_DETAILS 123,234,333,44,9.0 