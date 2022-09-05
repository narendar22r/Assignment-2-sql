create database fisdb2
use fisdb2




create table Dept(  
  deptno numeric(10) primary key,  
  dname  varchar(20),  
  loc    varchar(20),   
)

insert into dept values(10, 'ACCOUNTING', 'NEW YORK')
insert into dept values(20, 'RESEARCH', 'DALLAS')
insert into dept values(30, 'SALES', 'CHICAGO')
insert into dept values(40, 'OPERATIONS', 'BOSTON')


create table emp(  
  empno numeric(10) primary key,  
  ename varchar(20),  
  job varchar(20),  
  mgr_id numeric(10),  
  hiredate date,  
  sal numeric(10),  
  comm numeric(10),  
  deptno numeric(10) foreign key references dept (deptno)   
)


insert into emp  values(   7839, 'KING', 'PRESIDENT', null,   '1981-11-17',   5000, null, 10  )
insert into emp  values(   7698, 'BLAKE', 'MANAGER', 7839,   '1981-05-01',   2850, null, 30  )
insert into emp  values(   7782, 'CLARK', 'MANAGER', 7839,   '1981-06-09'  , 2450, null, 10  )
insert into emp  values(  7566, 'JONES', 'MANAGER', 7839,   '1981-04-02',   2975, null, 20  )
insert into emp  values(   7788, 'SCOTT', 'ANALYST', 7566,   '1987-04-19',   3000, null, 20  )
insert into emp  values(   7902, 'FORD', 'ANALYST', 7566,   '1981-12-03',  3000, null, 20  )
insert into emp  values(   7369, 'SMITH', 'CLERK', 7902,   '1980-12-17',   800, null, 20  )
insert into emp  values(   7499, 'ALLEN', 'SALESMAN', 7698,   '1981-02-20',   1600, 300, 30  )
insert into emp  values(   7521, 'WARD', 'SALESMAN', 7698,   '1981-02-22',  1250, 500, 30  )
insert into emp  values(   7654, 'MARTIN', 'SALESMAN', 7698,  '1981-09-28',  1250, 1400, 30  )
insert into emp  values(   7844, 'TURNER', 'SALESMAN', 7698,   '1981-09-08',   1500, 0, 30  )
insert into emp  values(   7876, 'ADAMS', 'CLERK', 7788,   '1987-05-23',  1100,null, 20  )
insert into emp values(   7900, 'JAMES', 'CLERK', 7698,   '1981-12-03',   950, null, 30  )
insert into emp  values(7934, 'MILLER', 'CLERK', 7782,'1982-01-23',   1300, null, 10  )


select * from emp

select * from dept

--1. List all employees whose name begins with 'A'. 
select ename from emp where ename like 'A%'

--2. Select all those employees who don't have a manager.
select ename from emp where mgr_id is null

--3. List employee name, number and salary for those employees who earn in the range 1200 to 1400. 
select ename,empno,sal from emp where sal between 1200 and 1400

--4. Give all the employees in the RESEARCH department a 10% pay rise. Verify that this has been done by listing all their details before and after the rise.
select ename,sal from emp where deptno=20
update emp set sal=sal+(sal*0.1) where deptno=20

select * from emp where deptno=20

--5. Find the number of CLERKS employed. Give it a descriptive heading. 
select count(*) as 'number of clerks' from emp where job='CLERK' 

--6. Find the average salary for each job type and the number of people employed in each job. 
select job,avg(sal) as Avg_salary,count(job) as no_ofemp from emp group by job

--7. List the employees with the lowest and highest salary.
select * from emp where sal in ((select min(sal) from emp),(select max(sal) from emp))

--8. List full details of departments that don't have any employees.
select d.deptno,d.dname,d.loc from dept d left outer join emp e on e.deptno=d.deptno 
group by d.deptno,d.dname,d.loc 
having count(e.deptno)=0

--9. Get the names and salaries of all the analysts earning more than 1200 who are based in department 20. Sort the answer by ascending order of name.
select ename,sal from emp where job='ANALYST' group by ename,sal,deptno having sal>1200 and deptno=20 order by ename asc 

--10. For each department, list its name and number together with the total salary paid to employees in that department. 
select emp.deptno , sum(sal) as 'total salary', dept.dname from emp inner join dept on emp.deptno=dept.deptno group by emp.deptno,dept.dname

--11. find out salary of both MILLER and SMITH.
select ename,sal from emp  where ename in('MILLER','SMITH')

--12. Find out the names of the employees whose name begin with ‘A’ or ‘M’. 
select ename from emp where ename like 'A%' or ename like 'M%'

--13. Compute yearly salary of SMITH. 
Select ename,sal*12 as yearly_salary from emp where ename='SMITH'

--14. List the name and salary for all employees whose salary is not in the range of 1500 and 2850. 
select ename,empno,sal from emp where sal not between 1500 and 2850

