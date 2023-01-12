--Creating table employee
create table employee(
empno int,
empname varchar(50),
job varchar(50),
Mgr varchar(50),
HireDate date,
Salary int,
Comm int,
Deptno int
)
--Insertion of values 
insert into employee values(325, 'Smith', 'Clerk', 433, '11-jan-95', 3500, 1400, 20)
insert into employee values(825, 'James', 'Clerk', 466, '02-aug-81', 2975, null, 20)
insert into employee values(433, 'James', 'Analyst', 825, '03-Dec-89', 3500, null, 40)
insert into employee values(466, 'Mike', 'President', null, '18-nov-97', 7000, null, 30)
insert into employee values(889, 'Adams', 'Manager', 433, '23-may-87', 3250, 0, 10)
insert into employee values(435, 'Blake', 'Analyst', 889, '03-Dec-89', 4500, 0, 40)

--Creation of table departname
create table Department(
Deptno int,
Dname varchar(50),
Loc Varchar(50)
)
--Insertion of values
insert into Department values(10, 'Accounting', 'Chicago')
insert into Department values(20,'Research', 'Dallas')
insert into Department values(30, 'Sales','NewYork')
insert into Department values(40, 'Operations','Boston')
insert into Department values(50, 'Purchase', 'Los Angeles')

--displaying table employee
select * from employee
select * from department
select empno, empname, job from employee
select deptno, dname from department

select distinct job from employee

select empno, empname from employee where Comm is null
select empname from employee where job like 'Analyst' and salary > 2000
select empname from employee where job in ('Clerk','Analyst', 'Manager') and salary>3000
select a.empname from employee a left join department d on a.Deptno = d.Deptno where d.deptno In (10,20,40) and job in ('Clerk', 'Analyst')
select a.empname, d.deptno, dname from employee a left join department d on a.Deptno = d.Deptno where d.dname like 'Research' and job in ('Clerk', 'Analyst')
select empname from employee where empname like 'B%e'

select job from employee where Deptno = 10 intersect select job from employee where Deptno = 20
select job from employee where Deptno = 10



select empname, Salary, (Salary+Salary*20/100) AS hike from employee where Salary>3000

select empname from employee where Mgr is null


select count(*) from employee

select count(a.empname) from employee a left join department d on a.Deptno = d.Deptno where dname = 'Accounting'


select a.deptno, d.dname, max(a.salary), min(a.salary), avg (a.salary) from employee a join department d on a.deptno = d.deptno group by d.dname, a.deptno 
select deptno, max(salary), min(salary), avg (salary) from employee group by deptno having count(empname)>2
select now()
select empname, Salary, Salary*12 as annual from employee

select distinct job, count(empname) from employee group by job
select distinct job, Salary from employee Where Salary>5000
select * from employee order by empname, deptno, Salary
select empname, salary, 12*salary as annual_salary from employee order by annual_salary desc

select empname from employee group by empname, salary having salary = max(salary) 
select empname from employee where salary>(select avg(salary) from employee)
select empname from employee where salary>(select max (salary) from employee where deptno = 30)
select a.empname from employee a join department d on a.deptno = d.deptno WHERE a.salary >(SELECT a.salary FROM employee WHERE d.dname = 'sales')
select empname from employee where MGR like '433'

update employee 
set Mgr = ('James', 'Mike', 'James', null, 'James', 'Adams')
where empname = (325, 825, 433,466,889,435)

select * from employee

select empname from employee where empname = Mgr

create table Cust_dtls(
Cust_no int,
Cust_name varchar(20),
Cust_city varchar(35)
)

insert into cust_dtls values (1, 'GUNA', 'Hyderabad')
insert into cust_dtls values(2, 'ALEX', 'Hayatnagar')

select * from cust_dtls 

alter table employee add constraint emp primary key (empno)
alter table employee 
alter column empname is not null

alter table employee 
alter column comm set default 0

ALTER TABLE employee
ADD CONSTRAINT fk_deptno
FOREIGN KEY (Deptno)
REFERENCES department(Deptno)

SELECT constraint_name, constraint_type
FROM information_schema.table_constraints
WHERE table_name = 'employee'
AND constraint_type != 'FOREIGN KEY'

alter table department
add column Budget varchar(10)

alter table department
alter column budget set data type varchar(12)

alter table department
alter column budget set default 5000

alter table department 
rename to dept_details

delete from department where loc = 'NewYork'

select * from department

delete from employee where salary < (select avg(salary) from employee)

select * from employee


update dept_details
set deptno = 70
where deptno = 30

update dept_details
set dname = 'Distribution'
where dname = 'Sales'

select * from dept_details





