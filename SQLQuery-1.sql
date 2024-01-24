/*SELECT Productid,ProductName,UnitPrice FROM products WHERE UnitPrice < 20;*/

/*SELECT Productid,ProductName,UnitPrice FROM products WHERE UnitPrice BETWEEN 15 AND 20*/


/*SELECT ProductName,UnitPrice FROM products WHERE UnitPrice > (SELECT avg(UnitPrice) from Products);*/

/*SELECT TOP 10 ProductName,UnitPrice FROM Products;*/

/*SELECT Count(Discontinued) as currentproduct From Products  Where Discontinued = 0;*/

/*SELECT Count(Discontinued) as currentproduct From Products  Where Discontinued = 1;*/

SELECT ProductName,UnitsInStock,UnitsOnOrder  FROM Products Where UnitsInstock < UnitsOnOrder