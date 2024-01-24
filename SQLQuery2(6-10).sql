
--6-write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission 
--SELECT O.ORD_NO,O.ORD_DATE, O.PURCH_AMT,C.CUST_NAME AS "CUSTOMER NAME",S.NAME AS "SALESMAN_NAME", S.COMMISSION FROM ORDERED AS  O INNER JOIN CUSTOMER AS  C ON O.CUSTOMER_ID = C.CUSTOMER_ID INNER JOIN SALESMAN S  ON O.SALESMAN_ID = S.SALESMAN_ID;


--7--Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned.  
--SELECT C.CUST_NAME,C.CITY AS CUSTOMER_CITY ,S.salesman_id,C.GRADE,S.NAME AS SALESMAN_NAME,S.CITY AS SALESMAN_CITY,O.ord_NO,O.PURCH_AMT,O.ord_date FROM CUSTOMER AS C INNER JOIN SALESMAN AS S ON S.SALESMAN_ID = C.SALESMAN_ID
--INNER JOIN ORDERED AS O ON O.SALESMAN_ID = C.SALESMAN_ID AND O.CUSTOMER_ID = C.CUSTOMER_ID;


--8 write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id
--SELECT C.CUST_NAME,C.CITY,C.GRADE,S.NAME,S.CITY FROM CUSTOMER AS C INNER JOIN SALESMAN AS S ON C.SALESMAN_ID = S.SALESMAN_ID ORDER BY CUSTOMER_ID


--9 write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id.  
--SELECT C.CUST_NAME,C.CITY,C.GRADE,S.NAME AS SALESMAN ,S.CITY AS "SALESMAN CITY" FROM CUSTOMER AS C INNER JOIN SALESMAN AS S ON C.SALESMAN_ID = S.SALESMAN_ID WHERE C.GRADE < 300 ORDER BY CUSTOMER_ID DESC ;

--10 Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to
-- determine whether any of the existing customers have placed an order or not 
--SELECT C.CUST_NAME,C.CITY,O.ord_NO,O.PURCH_AMT,O.ord_date FROM CUSTOMER AS C LEFT JOIN ORDERED AS O ON C.CUSTOMER_ID = O.CUSTOMER_ID ORDER BY ORD_DATE  ;

