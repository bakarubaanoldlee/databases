                 --My own creation--
				 -- Belong to Employees database

CREATE TABLE EMPLOYEE
(Emp_id INT PRIMARY KEY
,Emp_Name VARCHAR(50) NOT NULL
,Dept_Name VARCHAR(50) 
,Salary INT);

DROP TABLE  EMPLOYEE;

SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENTS;

INSERT INTO EMPLOYEE 
VALUES (104, 'Doreen', 'Finance', 6500)
,(107, 'Joel', 'IT', 6500)
,(109, 'Vanessa', 'IT', 7000)
,(110, 'Linden', 'IT', 6500)
,(111, 'Johannah', 'IT', 8000)
,(112, 'Shakie', 'IT', 10000);

INSERT INTO EMPLOYEE
VALUES(101, 'Linden', 'Admin', 4000)
,(102, 'Ronnette', 'HR', 3000)
,(103, 'Akbar', 'HR', 4500);




CREATE TABLE DEPARTMENTS
(DEPT_ID INT PRIMARY KEY
,DEPT_NAME VARCHAR(50)
,LOCATION VARCHAR(50));



INSERT INTO DEPARTMENTS
VALUES(1, 'Admin', 'Mumbai')
,(2, 'HR', 'Bangladesh')
,(3, 'IT', 'Bangladesh')
,(4, 'Finance', 'Mumbai')
,(5, 'Marketing', 'Bangladesh')
,(6, 'Sales', 'Mumbai');


-- Departments who do not have any employees.

SELECT * FROM DEPARTMENTS
WHERE DEPT_NAME NOT IN (SELECT DISTINCT DEPT_NAME  FROM EMPLOYEE)


-- Correlated query
-- Find employees in each department whose salary is greater than the average salary in that department

SELECT * FROM EMPLOYEE E1 WHERE SALARY > (SELECT AVG(SALARY) 
										FROM EMPLOYEE E2 
										WHERE E2.DEPT_NAME = E1.DEPT_NAME
										);
					

-- Correlated query
-- Departments who do not have any employees.
					
SELECT * FROM DEPARTMENTS D
WHERE NOT EXISTS (SELECT 1 
					FROM EMPLOYEE E 
					WHERE E.DEPT_NAME = D.DEPT_NAME);




--Sub-query inside a sub-query
