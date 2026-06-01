```
Set Operations (UNION, INTERSECT, EXCEPT)
Tables:
• PROJECT_A(Emp_ID)
PROJECT_B(Emp_ID)
Tasks:
1. Write a query to find employees working in both Project A and Project B (INTERSECT).
2. List employees working in either Project A or Project B (UNION).
3. Find employees working in Project A but not in Project B (EXCEPT or MINUS).
4. Retrieve employees who are not working in any project using NOT IN or NOT EXISTS.
5. List employees who are only in one of the two projects (Project A or B), but not both.
```
CREATE TABLE PROJECT_A (
    Emp_ID INT PRIMARY KEY
);

CREATE TABLE PROJECT_B (
    Emp_ID INT PRIMARY KEY
);

INSERT INTO PROJECT_A (Emp_ID) VALUES (1), (2), (3), (4);
INSERT INTO PROJECT_B (Emp_ID) VALUES (3), (4), (5), (6);

-- 1. Employees in both Project A and Project B
SELECT Emp_ID FROM PROJECT_A
INTERSECT
SELECT Emp_ID FROM PROJECT_B;

-- 2. Employees in either Project A or Project B
SELECT Emp_ID FROM PROJECT_A
UNION
SELECT Emp_ID FROM PROJECT_B;

-- 3. Employees in Project A but not in Project B
SELECT Emp_ID FROM PROJECT_A
EXCEPT
SELECT Emp_ID FROM PROJECT_B;

-- 4. Employees not working in any project
SELECT Emp_ID
FROM EMPLOYEE
WHERE Emp_ID NOT IN (
    SELECT Emp_ID FROM PROJECT_A
    UNION
    SELECT Emp_ID FROM PROJECT_B
);

-- 5. Employees only in one of the two projects
SELECT Emp_ID FROM PROJECT_A
WHERE Emp_ID NOT IN (SELECT Emp_ID FROM PROJECT_B)
UNION
SELECT Emp_ID FROM PROJECT_B
WHERE Emp_ID NOT IN (SELECT Emp_ID FROM PROJECT_A);

