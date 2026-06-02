```Subqueries and Nested Queries
Tables:
EMPLOYEE(Emp_ID, Emp_Name, Dept_ID, Salary)
DEPARTMENT(Dept_ID, Dept_Name)
Tasks:
1. Find the names of employees whose salary is greater than the average salary of all
employees.
2. Display names of employees who earn more than any employee in department 2.
3. List employees who are working in the same department as ‘Anjali’.
4. Retrieve department names that have more than 3 employees using a correlated subquery.
5. Find employees whose salary is equal to the maximum salary using a subquery.
```

CREATE TABLE DEPARTMENT (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50)
);

CREATE TABLE EMPLOYEE (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Dept_ID INT,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (Dept_ID) REFERENCES DEPARTMENT(Dept_ID)
);

INSERT INTO DEPARTMENT (Dept_ID, Dept_Name) VALUES (1, 'Sales'), (2, 'HR'), (3, 'IT'), (4, 'Finance');

INSERT INTO EMPLOYEE (Emp_ID, Emp_Name, Dept_ID, Salary) VALUES (1, 'John Doe', 1, 50000.00),
(2, 'Jane Smith', 2, 40000.00),
(3, 'Emily Davis', 3, 35000.00),
(4, 'Michael Brown', 1, 30000.00),
(5, 'Sarah Wilson', 4, 45000.00),
(6, 'Anjali Kumar', 2, 42000.00);

-- 1. Employees with salary greater than average
SELECT Emp_Name
FROM EMPLOYEE
WHERE Salary > (SELECT AVG(Salary) FROM EMPLOYEE);

-- 2. Employees who earn more than any employee in department 2
SELECT Emp_Name
FROM EMPLOYEE
WHERE Salary > (SELECT MAX(Salary) FROM EMPLOYEE WHERE Dept_ID = 2);

-- 3. Employees in the same department as Anjali
SELECT Emp_Name
FROM EMPLOYEE
WHERE Dept_ID = (SELECT Dept_ID FROM EMPLOYEE WHERE Emp_Name = 'Anjali Kumar');

-- 4. Departments with more than 3 employees
SELECT Dept_Name
FROM DEPARTMENT
WHERE Dept_ID IN (SELECT Dept_ID FROM EMPLOYEE GROUP BY Dept_ID HAVING COUNT(*) > 3);

-- 5. Employees with salary equal to maximum salary
SELECT Emp_Name
FROM EMPLOYEE
WHERE Salary = (SELECT MAX(Salary) FROM EMPLOYEE);

