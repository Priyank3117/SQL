--11 Write a SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission 
--to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves 

--SELECT C.CUST_NAME AS "CUSTOMER NAME",C.CITY,O.ORD_NO, O.ORD_DATE,O.PURCH_AMT, S.NAME AS "SALESMAN",S.COMMISSION FROM CUSTOMER C LEFT  JOIN ORDERED O ON C.CUSTOMER_ID=O.CUSTOMER_ID LEFT  JOIN SALESMAN S
-- ON C.SALESMAN_ID = S.SALESMAN_ID;

--12 Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers 
--SELECT S.NAME AS SALESPERSON_NAME FROM SALESMAN AS S LEFT JOIN CUSTOMER AS C ON S.SALESMAN_ID=C.SALESMAN_ID ORDER BY S.SALESMAN_ID; 

--13 write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount. 
--SELECT S.NAME AS SALESPERSON_NAME,C.CUST_NAME,C.CITY AS CUST_CITY FROM SALESMAN AS S LEFT JOIN CUSTOMER AS C ON S.SALESMAN_ID=C.SALESMAN_ID LEFT JOIN ORDERED AS O ON S.SALESMAN_ID=O.SALESMAN_ID;

--14 Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customers.
-- The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier. 

--SELECT S.NAME AS SALESMAN_NAME  FROM SALESMAN AS S LEFT JOIN CUSTOMER AS C ON S.SALESMAN_ID = C.SALESMAN_ID LEFT JOIN ORDERED AS O  ON O.customer_id = c.customer_id WHERE O.purch_amt >2000 AND C.GRADE is not null;

-- 15 Write a SQL statement to generate a list of all the salesmen who either work for one or more customers or have yet to join any of them. 
--The customer may have placed one or more orders at or above order amount 2000, and must have a grade, or he may not have placed any orders to the associated supplier. 
--SELECT S.NAME AS SALESMAN_NAME  FROM SALESMAN AS S LEFT JOIN CUSTOMER AS C ON S.SALESMAN_ID = C.SALESMAN_ID left JOIN ORDERED AS O  ON O.customer_id = c.customer_id WHERE O.purch_amt >2000 AND C.GRADE is not null;
