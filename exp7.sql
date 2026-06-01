```
Views and Indexes
Tables:
• EMPLOYEE(Emp_ID, Emp_Name, Dept_ID, Salary)
Tasks:
1. Create a view called HighEarners that shows employees with salary > 60000.
2. Use the view HighEarners to select employees from the Sales department.
3. Modify the view to include job role and bonus = 10% of salary.
4. Create an index on Salary and verify its impact (use EXPLAIN or DESCRIBE).
5. Drop the created view and re-create it using a JOIN with the DEPARTMENT table.
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
    Job VARCHAR(50),
    FOREIGN KEY (Dept_ID) REFERENCES DEPARTMENT(Dept_ID)
);

INSERT INTO DEPARTMENT (Dept_ID, Dept_Name) VALUES (1, 'Sales'), (2, 'HR'), (3, 'IT'), (4, 'Finance');

INSERT INTO EMPLOYEE (Emp_ID, Emp_Name, Dept_ID, Salary, Job)
VALUES
(1, 'John Doe', 1, 75000.00, 'Manager'),
(2, 'Jane Smith', 2, 65000.00, 'Analyst'),
(3, 'Emily Davis', 3, 35000.00, 'Developer'),
(4, 'Michael Brown', 1, 70000.00, 'Salesperson'),
(5, 'Sarah Wilson', 4, 45000.00, 'Accountant'),
(6, 'Anjali Kumar', 2, 42000.00, 'HR Specialist');

-- 1. Create View HighEarners

CREATE VIEW HighEarners AS
SELECT Emp_Name, Salary
FROM EMPLOYEE
WHERE Salary > 60000;

SELECT * FROM HighEarners;
```
| Emp_Name      | Salary |
| ------------- | ------ |
| John Doe      | 75000  |
| Jane Smith    | 65000  |
| Michael Brown | 70000  |
```

-- 2. Select Sales Employees Using View

SELECT HE.Emp_Name, HE.Salary
FROM HighEarners HE
JOIN EMPLOYEE E
ON HE.Emp_Name = E.Emp_Name
WHERE E.Dept_ID = 1;
```
### Output

| Emp_Name      | Salary |
| ------------- | ------ |
| John Doe      | 75000  |
| Michael Brown | 70000  |
```

-- 3. Modify View with Job and Bonus

CREATE OR REPLACE VIEW HighEarners AS
SELECT Emp_Name,
       Salary,
       Job,
       Salary * 0.10 AS Bonus
FROM EMPLOYEE
WHERE Salary > 60000;

SELECT * FROM HighEarners;
```

| Emp_Name      | Salary | Job         | Bonus |
| ------------- | ------ | ----------- | ----- |
| John Doe      | 75000  | Manager     | 7500  |
| Jane Smith    | 65000  | Analyst     | 6500  |
| Michael Brown | 70000  | Salesperson | 7000  |
```

-- 4. Create Index

CREATE INDEX idx_salary
ON EMPLOYEE(Salary);

-- Verify

EXPLAIN
SELECT * FROM EMPLOYEE
WHERE Salary > 60000;

-- 5. Drop and Recreate View Using JOIN

DROP VIEW HighEarners;

CREATE VIEW HighEarners AS
SELECT E.Emp_Name,
       E.Salary,
       E.Job,
       D.Dept_Name,
       E.Salary * 0.10 AS Bonus
FROM EMPLOYEE E
JOIN DEPARTMENT D
ON E.Dept_ID = D.Dept_ID
WHERE E.Salary > 60000;

```### Check Output

sql
SELECT * FROM HighEarners;


| Emp_Name      | Salary | Job         | Dept_Name | Bonus |
| ------------- | ------ | ----------- | --------- | ----- |
| John Doe      | 75000  | Manager     | Sales     | 7500  |
| Jane Smith    | 65000  | Analyst     | HR        | 6500  |
| Michael Brown | 70000  | Salesperson | Sales     | 7000  |

```