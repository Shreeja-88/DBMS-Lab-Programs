```Create a table called Employee that contains attributes EMPNO, ENAME, JOB, MGR, SAL and
execute the following.
1. Add a column commission with domain to the Employee table.
2. Insert any five records into the table.
3. Update the column details of job.
4. Rename the column of Employ table using alter command.
5. Delete the employee whose EMPNO is 105.
```

create table Employee (
    EMPNO INT,
    ENAME VARCHAR(50),
    JOB VARCHAR(50),
    MGR INT,
    SAL DECIMAL(10, 2)
);

alter table Employee
add column COMMISSION DECIMAL(10, 2);

insert into Employee (EMPNO, ENAME, JOB, MGR, SAL, COMMISSION) values (101, 'John Doe', 'Manager', NULL, 50000.00, 5000.00),
(102, 'Jane Smith', 'Developer', 101, 40000.00, 2000.00),
(103, 'Emily Davis', 'Analyst', 101, 35000.00, NULL),
(104, 'Michael Brown', 'Tester', 101, 30000.00, NULL),
(105, 'Sarah Wilson', 'Designer', 101, NULL, NULL);

select * from Employee;

update Employee
set JOB = case EMPNO
when 101 then 'Senior Manager'
when 102 then 'Senior Developer'
when 103 then 'Senior Analyst'
when 104 then 'Senior Tester'
when 105 then 'Senior Designer'
end;

alter table Employee
rename column MGR to MANAGER_NO;

delete from Employee
where EMPNO = 105;

select * from Employee;


