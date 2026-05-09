```Queries using aggregate functions (COUNT, AVG, MIN, MAX, SUM), Group by, Orderby.
Employee (E_id, E_name, Age, Salary)
1. Create Employee table containing all Records E_id, E_name, Age, Salary.
2. Count number of employee names from employee table.
3. Find the Maximum age from the employee table.
4. Find the Minimum age from the employee table.
5. Find salaries of employees in Ascending Order.
6. Find grouped salaries of employees.```


CREATE TABLE Employee (
    E_id INT PRIMARY KEY,
    E_name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10,2)
);

insert into Employee (E_id, E_name, Age, Salary) values (1, 'John Doe', 30, 50000.00),
(2, 'Jane Smith', 25, 40000.00),
(3, 'Emily Davis', 35, 35000.00),
(4, 'Michael Brown', 28, 30000.00),
(5, 'Sarah Wilson', 32, 45000.00);

select * from Employee;

select count(E_name) as Employee_Count from Employee;

select max(Age) as Max_Age from Employee;

select min(Age) as Min_Age from Employee;

select E_name, Salary from Employee order by Salary asc;

select Salary, count(*) as Employee_Count from Employee group by Salary;


