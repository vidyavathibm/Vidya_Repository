select substr('Accenture',instr('Accenture','e')) from dual;
select substr('vidyavathi.bm@accenture.com',instr('vidyavathi.bm@accenture.com','@')+1,
instr('vidyavathi.bm@accenture.com','.')-2) from dual;
select substr('accenture',2) from dual;
select substr('accenture',1,length('accenture')-1) from dual;

use dummy;
select * from A;
select * from B;
select * from C;
show databases;
use dummy_data;

select * from B;
select id,lead(salary) over (order by salary) as lead_col from B;
select id,lag(salary) over (order by salary) as lag_col from B;

show tables;
select * from A union select * from B;

create table contest(c_id int,start_date date,end_date date);
insert into contest values(1,'2015-02-01','2015-02-04');
insert into contest values(2,'2015-02-02','2015-02-05');
insert into contest values(3,'2015-02-03','2015-02-07');
insert into contest values(4,'2015-02-04','2015-02-06');
insert into contest values(5,'2015-02-06','2015-02-09');
insert into contest values(6,'2015-02-08','2015-02-10');
insert into contest values(7,'2015-02-10','2015-02-11');

SET SQL_SAFE_UPDATES=0;
delete from contest where start_date='2012-02-01';

select * from contest;

Select c_id, start_date, end_date, 
        end_date - lead (start_date) 
        over (order by start_date) 
               + 1 as 'no_of_days' 
                   from contest;
                   
Select c_id, start_date, end_date, 
        lag (start_date) 
        over (order by start_date) 
               as 'no_of_days' 
                   from contest;
                   
Select c_id, start_date, end_date, 
        end_date - lag (start_date) 
        over (order by start_date) 
               + 1 as 'no_of_days' 
                   from contest;
                   
select c_id,start_date,end_date,lag(start_date) over (order by start_date),lag(end_date) over (order by end_date) from contest;
				
select c2.c_id,c2.start_date,c2.end_date from contest c1 join contest c2 on c1.c_id=c2.c_id order by c1.c_id;
                   
                   
                   