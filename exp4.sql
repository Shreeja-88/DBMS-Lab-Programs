```
Queries using Joins
Tables:
• DEPARTMENT(Dept_ID, Dept_Name)
EMPLOYEE(Emp_ID, Emp_Name, Dept_ID, Salary)
Tasks:
1. Write a query to display employee names and their corresponding department names using
INNER JOIN.
2. List all departments along with employee names using LEFT OUTER JOIN.
3. Display departments that do not have any employees using RIGHT OUTER JOIN or NOT
IN.
4. Write a query to list employees whose department names start with ‘S’ using JOIN.
5. Find employees who belong to the same department as ‘Rahul’ using SELF JOIN.
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
(6, 'Rahul Kumar', 2, 42000.00);

-- 1. INNER JOIN
SELECT E.Emp_Name, D.Dept_Name
FROM EMPLOYEE E
INNER JOIN DEPARTMENT D ON E.Dept_ID = D.Dept_ID;

-- 2. LEFT OUTER JOIN
SELECT D.Dept_Name, E.Emp_Name
FROM DEPARTMENT D
LEFT OUTER JOIN EMPLOYEE E ON D.Dept_ID = E.Dept_ID;

-- 3. RIGHT OUTER JOIN
SELECT D.Dept_Name, E.Emp_Name
FROM DEPARTMENT D
RIGHT OUTER JOIN EMPLOYEE E ON D.Dept_ID = E.Dept_ID
WHERE D.Dept_ID IS NULL;

-- 4. JOIN with condition
SELECT E.Emp_Name, D.Dept_Name
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.Dept_ID = D.Dept_ID
WHERE D.Dept_Name LIKE 'S%';

-- 5. SELF JOIN
SELECT E1.Emp_Name AS Employee, E2.Emp_Name AS Colleague
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 ON E1.Dept_ID = E2.Dept_ID
WHERE E1.Emp_Name = 'Rahul Kumar' AND E2.Emp_Name <> 'Rahul Kumar';

