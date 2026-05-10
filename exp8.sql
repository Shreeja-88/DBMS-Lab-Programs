```
Create a row level trigger for the ‘customers’ table that would fire for INSERT or UPDATE or
DELETE operations performed on the CUSTOMERS table. This trigger will display the salary
difference between the old & new Salary.
CUSTOMERS (ID, NAME, AGE, ADDRESS, SALARY)
```

CREATE TABLE CUSTOMERS (
    ID INT Auto_increment PRIMARY KEY,
    NAME VARCHAR(50),
    AGE INT,
    ADDRESS VARCHAR(100),
    SALARY DECIMAL(10, 2)
);

create table audit_log (
    id INT Auto_increment PRIMARY KEY,
    operation VARCHAR(10),
    customer_id INT,
    salary_diff DECIMAL(10, 2),
);

DELIMITER //
create trigger insert_sal_diff_trigger
after insert on CUSTOMERS
for each row
begin
    insert into audit_log (operation, customer_id, salary_diff)
    values ('INSERT', NEW.ID, new.SALARY);
end ; 
//
DELIMITER ;

delimiter //
create trigger update_sal_diff_trigger
after update on CUSTOMERS
for each row
begin
    declare salary_diff decimal(10, 2);
    set salary_diff = new.SALARY - old.SALARY;
    insert into audit_log (operation, customer_id, salary_diff)
    values ('UPDATE', NEW.ID, salary_diff);
end ; 
//

create trigger delete_sal_diff_trigger
after delete on CUSTOMERS
for each row
begin
    insert into audit_log (operation, customer_id, salary_diff)
    values ('DELETE', OLD.ID, -old.SALARY);
end ;
//
DELIMITER ;

insert into CUSTOMERS (NAME, AGE, ADDRESS, SALARY) values ('John Doe', 30, '123 Main St', 50000);

update CUSTOMERS set SALARY = 55000 where ID = 1;

delete from CUSTOMERS where ID = 1;

select * from audit_log;
