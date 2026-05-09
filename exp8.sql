```
Create a row level trigger for the ‘customers’ table that would fire for INSERT or UPDATE or
DELETE operations performed on the CUSTOMERS table. This trigger will display the salary
difference between the old & new Salary.
CUSTOMERS (ID, NAME, AGE, ADDRESS, SALARY)
```

CREATE TABLE CUSTOMERS (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    AGE INT,
    ADDRESS VARCHAR(100),
    SALARY DECIMAL(10, 2)
);
