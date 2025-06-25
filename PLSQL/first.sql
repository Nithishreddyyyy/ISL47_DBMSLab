CREATE TABLE employee1 (
    empid INT,
    name VARCHAR(50),
    deptno INT,
    salary DECIMAL(10,2)
);

INSERT INTO employee1 VALUES (1, 'John', 10, 1000);
INSERT INTO employee1 VALUES (2, 'Jane', 20, 2000);
INSERT INTO employee1 VALUES (3, 'Alex', 10, 3000);
set serveroutput on
begin
update employee1
set salary=(1.15*salary) where deptno=10;
dbms_output.put_line('number of rows updated are'||sql%rowcount);
end;
/
