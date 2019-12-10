create database dummy;
use dummy;

create table emp(empid int(10) primary key,emp_name varchar(50),emp_sal float(20,2),
dept_id  int(50) references dept(dept_id));
create table dept(dept_id int(50) primary key,dept_name varchar(50));

insert into emp values(10,"Vivek",2000.00,1);
insert into emp values(20,"Raj",3000.00,1);
insert into emp values(30,"Vinoth",4000.00,1);
insert into emp values(40,"Abhishek",5000.00,2);
insert into emp values(50,"Divya",6000.00,2);
insert into emp values(60,"Chaithra",7000.00,3);


insert into dept values(1,"IT");
insert into dept values(2,"Admin");
insert into dept values(4,"HR");

select * from emp;
select * from dept;

#1)Fetch all the Deptid,DeptName from department table & Corresponding Department salary using Employee
#  Table. If Any department is not available in employee table then assign salary as 0.
#Note: Don’t use sub quesry or in or not in

select d.dept_id,d.dept_name,coalesce(sum(e.emp_sal),0) as Total_salary
from dept d left join emp e
on e.dept_id=d.dept_id 
group by d.dept_id;

#2)Fetch all the Deptid &  aggregate all the salary for the respective dept id from Employee table & Corresponding Department name using department Table. 
#If Any department is not available in department table then assign departname as 'Others'
#Note: Don’t use sub quesry or in or not in

select e.dept_id,e.emp_sal,coalesce(d.dept_name,'Others') as Department
from emp e 
left join dept d 
on e.dept_id=d.dept_id group by e.dept_id;

#3)Fetch all the Emp_id,Emp_name,Manager_ID and salary who is getting between 2700 and 10000
#Note: Don't use  between
select emp_id,emp_name,manager_id,emp_sal from emp  where emp_sal>2700 and emp_sal<10000;

#4)Fetch all the Manager_ID,Manager_Name and Sum of the employee salary who is reporting to that manager
#Note: Don't use between

#9)Fetch emp_id,Emp_name,Dept_name & Salary who is getting salary greater than 3000
#int 'IT' and  salary greater than 3400 int 'Admin'

select A.* 
from(
select e.empid,e.emp_name,d.dept_name,
case when e.emp_sal>3000 and d.dept_name='IT' 
then e.emp_sal
when e.emp_sal>3400 and d.dept_name='Admin' 
then e.emp_sal end as Salary 
from emp e inner join dept d 
on e.dept_id=d.dept_id ) A 
where A.salary is not null;


#7)Fetch emp_id,Emp_name & Salary who is getting 2nd maximum salary
select A.empid,A.emp_name,A.emp_sal 
from(select empid,emp_name,emp_sal,dense_rank() 
over(order by emp_sal desc) as Max_salary 
from emp) A where A.Max_salary<=3;                                       