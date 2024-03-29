


--1. write a SQL query to find Employees who have the biggest salary in their Department

--SELECT DEPARTMENT_ID , MAX(SALARY) FROM employee  GROUP BY DEPARTMENT_ID ;
 
--2. write a SQL query to find Departments that have less than 3 people in it

 -- SELECT D.DEPARTMENT_ID,D.DEPARTMENT_NAME, COUNT(E.DEPARTMENT_ID) AS NUM_OF_EMPLOYEE FROM EMPLOYEE AS E RIGHT JOIN DEPARTMENT AS D ON D.DEPARTMENT_ID=E.DEPARTMENT_ID GROUP BY D.DEPARTMENT_ID,D.DEPARTMENT_NAME HAVING COUNT(E.DEPARTMENT_ID) < 3 ;


--3. write a SQL query to find All Department along with the number of people there
--SELECT D.DEPARTMENT_NAME, COUNT(E.DEPARTMENT_ID) AS NUM_OF_EMPLOYEE FROM EMPLOYEE AS E RIGHT JOIN DEPARTMENT AS D ON D.DEPARTMENT_ID=E.DEPARTMENT_ID GROUP BY E.DEPARTMENT_ID,D.DEPARTMENT_NAME ;

--4. write a SQL query to find All Department along with the total salary there

--SELECT D.department_id,D.DEPARTMENT_NAME, SUM(E.SALARY) AS SALARY FROM EMPLOYEE AS E RIGHT JOIN DEPARTMENT AS D ON D.DEPARTMENT_ID=E.DEPARTMENT_ID GROUP BY D.DEPARTMENT_ID,D.DEPARTMENT_NAME ;
