-- Constraints allow to impose conditions or restrictions on database.

-- ● SQL allows 2 levels of constraints:
-- o Column Level - applied on a single column

-- o Table Level - applied on multiple columns
-- Types of Constraints:

-- o NOT NULL - value cannot be empty
-- o UNIQUE - duplicate values not allowed
-- o PRIMARY KEY - Not Null + Unique
-- o FOREIGN KEY - Reference to Primary key of another table
-- o CHECK - enforce a certain condition
-- o DEFAULT - set a default value, if nothing given



-----------------------------------DATABASE--------------------------------------------
CREATE allows to create a new database
Syntax - CREATE DATABASE dbname;
dbname should be unique
Requires admin privilege

-----------------------------------DROP DATABASE--------------------------------------------
DROP deletes an existing database (Careful!!!)
Syntax - DROP DATABASE [IF EXISTS] dbname;
Requires admin privilege
dbname should be existing
-----------------------------------DATABASE--------------------------------------------


------------------------created----tables------------------------------------------
create table table_name
(
	columan_name1 datatype constraints,
	column_name2 datatype constraints,
	
);


For example

--column name data type constraints
CREATE TABLE emp_details(
emp_id SERIAL PRIMARY KEY,
emp_name VARCHAR(50) NOT NULL,
emo_location VARCHAR(100) NOT NULL,
emp_salary INT);
------------------------created----tables------------------------------------------


----------------------------INSERT DATA----------------------------------------
INSERT INTO emp_details(emp_salary,emp_name,emo_location)
VALUES (1000, 'Mustang', 'hahahahaa');

INSERT INTO emp_details(emp_salary,emp_name,emo_location)
VALUES (10000, 'gt', 'hahaha');

----------------------------INSERT DATA----------------------------------------

select * from emp_details

------------------------------UPDATE DATA----------------------------

--if you not provide conditions in where then all the tables data will be changed

update emp_details 
set emp_salary=10,emo_location='bhangar'
where emp_salary = 10000;

------------------------------UPDATE DATA----------------------------

------------------------------alter--------------------------------
ALTER is used to add/remove/modify columns in an existing table.
It can also be used to add/remove constraints


Example & Syntax:
o Add column - ALTER TABLE table_name ADD COLUMN col_name datatype;
o Rename column - ALTER TABLE table_name RENAME COLUMN col_name TO new_col_name;
o Drop column - ALTER TABLE table_name DROP COLUMN col_name;
o Change data type - ALTER TABLE table_name ALTER COLUMN col_name TYPE datatype;
o Constraints - ALTER TABLE table_name ALTER COLUMN col_name SET NOT NULL;
-------------------------------alter------------------------------------