#1.顯示和Blake同部門的所有員工之姓名和進公司日期。
select ename, hiredate 
from emp 
where deptno = (select deptno from emp where ename='blake') ;

#2.顯示所有在Blake之後進公司的員工之姓名及進公司日期。
select ename, hiredate 
from emp 
where HIREDATE > (select hiredate from emp where ename='blake');

#3.顯示薪資比公司平均薪資高的所有員工之員工編號,姓名和薪資，並依薪資由高到低排列。
select empno, ename, sal 
from emp 
where sal > (select avg(sal) from emp) 
order by sal desc;

#4.顯示和姓名中包含 T 的人在相同部門工作的所有員工之員工編號和姓名。
 select ename,empno, deptno 
 from emp 
 where deptno in (select deptno from emp where ename like '%T%') ;
 #and ename not in (select ename from emp where ename like '%T%') ;

select ename,deptno from emp where ename like '%T%';

#5.顯示在Dallas工作的所有員工之姓名, 部門編號和職稱。
select ename, deptno, job from emp where deptno = (select deptno from dept where loc = 'dallas');

select emp.ename,emp.deptno,emp.job from emp,dept where emp.deptno=dept.deptno and dept.loc='dallas';
select emp.ename,emp.deptno,emp.job from emp join dept on (emp.deptno=dept.deptno) where dept.loc='dallas';


#6.顯示直屬於”King”的員工之姓名和薪資。
select ename,sal from emp where mgr = (select empno from emp where ename='king');

#7.顯示銷售部門”Sales” 所有員工之部門編號,姓名和職稱。
select  deptno, ename, job 
from emp
where deptno = (select deptno from dept where dname = 'sales');

#8.顯示薪資比公司平均薪資還要高且和名字中有 T 的人在相同部門上班的所有員工之員工編號,姓名和薪資。
select empno, ename, sal, deptno 
from emp 
where sal > (select avg(sal) from emp) 
and deptno in (select deptno from emp  where ename like '%T%');


#9.顯示 和有賺取佣金的員工 之 部門編號和薪資都相同的員工之姓名,部門編號和薪資。
select ename, deptno,sal,comm 
from emp e1 
where 
e1.deptno in (
	select deptno 
	from emp e2
    where e2.comm > 0)
and 
e1.sal in (
	select sal 
	from emp e3
    where  e3.ename != e1.ename 
    );

select ename, deptno,sal,comm 
from emp e1 
where (e1.deptno, e1.sal) in (
	select e2.deptno, e2.sal 
	from emp e2
    where e1.comm > 0 and e2.ename != e1.ename 
    );


#10.顯示和在Dalls工作的員工之薪資和佣金都相同的員工之姓名,部門編號和薪資。
 select ename, deptno, sal, comm 
 from emp e1 
 where ( sal, ifnull(comm,0) ) in  (
	select sal, ifnull(comm,0) 
    from emp e2  
	where e1.ename != e2.ename and deptno=(select deptno from dept where loc = 'dallas')
 );


#11.顯示薪資和佣金都和Scott相同的所有員工之姓名,進公司日期和薪資。(不要在結果中顯示Scott的資料)
 select ename, hiredate, sal 
 from emp 
 where sal = (select sal from emp where ename='Scott')  
      and ifnull(comm,0) = (select ifnull(comm,0) from emp where ename='Scott')
	  and ename != 'Scott';
 
 
#12.顯示薪資比所有職稱是”Clerks”還高的員工之姓名,進公司日期和薪資，並將結果依薪資由高至低顯示。
 select ename, hiredate, sal  from emp  
 where sal > (select MAX(sal) from emp where job = 'CLERK') 
 order by sal DESC;
 
select ename, hiredate, sal  from emp  
 where sal > all (select sal from emp where job = 'CLERK') 
 order by sal DESC;
 
