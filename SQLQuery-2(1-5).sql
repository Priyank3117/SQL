--1 write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city 
--SELECT S.NAME,C.cust_name,S.CITY FROM SALESMAN AS S INNER JOIN Customer AS C ON S.CITY = C.CITY;


--2 write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city 
--SELECT C.cust_name,C.CITY,O.ORD_NO,O.PURCH_AMT FROM CUSTOMER AS C INNER JOIN ORDERED AS O ON  O.CUSTOMER_ID = C.CUSTOMER_ID WHERE O.PURCH_AMT BETWEEN 500 AND 2000;

 
 --3 write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission 
  --SELECT C.CUST_NAME,C.CITY,S.NAME,S.COMMISSION FROM  CUSTOMER AS C INNER JOIN SALESMAN AS S  ON C.SALESMAN_ID = S.SALESMAN_ID ;

 --4 write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission
--SELECT C.CUST_NAME,C.CITY,S.NAME,S.COMMISSION FROM CUSTOMER AS C INNER JOIN  SALESMAN AS S ON C.salesman_id = S.SALESMAN_ID WHERE S.COMMISSION > 0.12;

  --5 write a SQL query to locate those salespeople who do not live in the same city where their customers live and have 
  --received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission 
--SELECT C.CUST_NAME,S.CITY,C.CITY,S.NAME,S.COMMISSION FROM CUSTOMER AS C INNER JOIN  SALESMAN AS S ON C.salesman_id = S.SALESMAN_ID WHERE S.CITY != C.CITY AND  S.COMMISSION > 0.12;



