```Create a table called Employee & execute the following.
Employee (EMPNO, ENAME, JOB, MANAGER_NO, SAL, COMMISSION)
1. Insert any three records in the employee table containing attributes. EMPNO, ENAME
JOB, MANAGER_NO, SAL, COMMISSION and
use rollback. Check the result.
2. Add primary key constraint and not null constraint to the employee table.
3. Insert NULL values to the employee table and verify the result.```

create table Employee (
    EMPNO INT,
    ENAME VARCHAR(50),
    JOB VARCHAR(50),
    MANAGER_NO INT,
    SAL DECIMAL(10, 2),
    COMMISSION DECIMAL(10, 2)
);

start transaction;

insert into Employee (EMPNO, ENAME, JOB, MANAGER_NO, SAL, COMMISSION) values (1, 'John Doe', 'Manager', NULL, 50000.00, 5000.00),
(2, 'Jane Smith', 'Developer', 1, 40000.00, 2000.00),
(3, 'Emily Davis', 'Analyst', 1, 35000.00, NULL);

select * from Employee;

rollback;

select * from Employee;

alter table Employee
add constraint PK_Employee primary key (EMPNO);

alter table Employee
modify ENAME VARCHAR(50) NOT NULL,
JOB VARCHAR(50) NOT NULL,
SAL DECIMAL(10, 2) NOT NULL;

desc Employee;

insert into Employee (EMPNO, ENAME, JOB, MANAGER_NO, SAL, COMMISSION) values (4, NULL, 'Tester', 1, 30000.00, NULL);
insert into Employee (EMPNO, ENAME, JOB, MANAGER_NO, SAL, COMMISSION) values (5, 'Michael Brown', NULL, 1, 45000.00, NULL);
insert into Employee (EMPNO, ENAME, JOB, MANAGER_NO, SAL, COMMISSION) values (6, 'Sarah Wilson', 'Designer', 1, NULL, NULL);

select * from Employee;

