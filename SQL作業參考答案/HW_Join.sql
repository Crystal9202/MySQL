#1.顯示所有員工之姓名,所屬部門編號,部門名稱及部門所在地點。
select e.ename, e.deptno, d.dname, d.loc 
from emp e, dept d
where e.deptno = d.deptno ;

select e.ename, e.deptno, d.dname, d.loc 
from emp e join dept d on (e.deptno = d.deptno) ;

#2.顯示所有有賺取佣金的員工之姓名,佣金金額,部門名稱及部門所在地點。
select e.ename, e.comm, d.dname, d.loc 
from emp e, dept d 
where e.deptno = d.deptno and e.comm > 0 ;

select e.ename,e.comm,d.dname, d.loc 
from emp e join dept d on e.deptno = d.deptno 
where e.comm > 0 ;

#3.顯示姓名中包含有”A”的員工之姓名及部門名稱。
select emp.ename, dept.dname 
from emp, dept 
where emp.deptno = dept.deptno and emp.ename like '%A%';

select e.ename, d.dname 
from emp e join dept d on e.deptno = d.deptno 
where e.ename like '%A%';

#4.顯示所有在”DALLAS”工作的員工之姓名,職稱,部門編號及部門名稱
select e.ename, e.job, d.deptno, d.dname 
from emp e, dept d 
where e.deptno=d.deptno and d.loc='DALLAS';

select e.ename,e.job, e.deptno, d.dname , d.loc
from emp e join dept d on e.deptno=d.deptno 
where  d.loc = 'DALLAS';

#5.顯示出表頭名為: Employee, Emp#, Manager, Mgr#，分別表示所有員工之姓名,員工編號,主管姓名, 主管的員工編號。
SELECT a.ename Employee, a.empno 'Emp#', b.ename Manager, b.empno 'Mgr#' 
FROM emp a join emp b on a.mgr = b.empno  ;

#6.顯示出SALGRADE資料表的結構，並建立一查詢顯示所有員工之姓名,職稱,部門名稱,薪資及薪資等級。
 Desc salgrade;
 SELECT a.ename, a.job, d.dname,  a.sal, b.grade 
 FROM emp a JOIN salgrade b ON (a.sal BETWEEN b.losal AND b.hisal) 
            JOIN dept d ON (a.deptno = d.deptno);

#7.顯示出表頭名為: Employee, Emp Hiredate, Manager, Mgr Hiredate的資料項，來顯示所有比他的主管還要早進公司的員工之姓名,進公司日期和主管之姓名及進公司日期。
SELECT a.ename Employee, a.hiredate 'Emp Hiredate', b.ename 'Manager', b.hiredate 'Mgr Hiredate' 
FROM emp a join emp b on ( a.mgr = b.empno ) 
WHERE a.hiredate < b.hiredate;

#8.顯示出表頭名為: dname, loc, Number of People, Salary的資料來顯示所有部門之部門名稱,部門所在地點,部門員工數量及部門員工的平均薪資，平均薪資四捨五入取到小數第二位。
select d.dname 'dname', d.loc 'loc', count(empno) 'Nunber of People', ROUND(AVG(e.sal),2) 'Salary' 
from dept d left outer join emp e on (d.deptno = e.deptno) 
group by d.dname;



