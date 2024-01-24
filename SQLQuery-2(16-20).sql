--16)Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only 
--those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade. 

--SELECT C.CUST_NAME AS "CUSTOMER NAME",C.CITY, O.ORD_NO, O.ORD_DATE, O.PURCH_AMT FROM CUSTOMER C FULL OUTER JOIN ORDERED O ON C.CUSTOMER_ID = O.CUSTOMER_ID AND C.GRADE IS NOT NULL;


--17)Write a SQL query to combine each row of the salesman table with each row of the customer table 

--SELECT * FROM SALESMAN S CROSS JOIN CUSTOMER C;

--18)Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for all customers and vice versa for that salesperson who belongs to that city 
--SELECT S.NAME AS SALESMAN_NAME,S.CITY,C.CITY,  C.CUST_NAME AS CUSTOMER_NAME FROM SALESMAN S CROSS JOIN CUSTOMER C WHERE C.CITY = S.CITY;

--19)Write a SQL statement to create a Cartesian product between salesperson and customer, 
--i.e. each salesperson will appear for every customer and vice versa for those salesmen who belong to a city and customers who require a grade 
--SELECT S.NAME AS SALESMAN_NAME,C.CUST_NAME AS CUSTOMER_NAME FROM CUSTOMER AS C CROSS JOIN SALESMAN AS S WHERE C.GRADE IS NOT NULL;


--20)Write a SQL statement to make a Cartesian product between salesman and customer 
--i.e. each salesman will appear for all customers and vice versa for those salesmen who must belong to a city which is not the same as his customer and the customers should have their own grade 

--SELECT S.NAME AS SALESMAN_NAME,C.CUST_NAME AS CUSTOMER_NAME FROM CUSTOMER AS C CROSS JOIN SALESMAN AS S WHERE C.GRADE IS NOT NULL AND C.CITY != S.CITY;


