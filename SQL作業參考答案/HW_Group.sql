#1.顯示所有員工的最高、最低、總和及平均薪資，依序將表頭命名為 Maximum, Minimum, Sum 和 Average，請將結果顯示為四捨五入的整數。
select ROUND(MAX(sal)) Maximum, ROUND(MIN(sal)) Minimum, ROUND(SUM(sal)) Sum, ROUND(AVG(sal)) Average 
from emp;

#2.顯示每種職稱的最低、最高、總和及平均薪水。
select job, MIN(sal), MAX(sal), SUM(sal), AVG(sal) 
from emp 
group by job;

#3.顯示每種職稱的人數。
 select job, count(*) 
 from emp 
 group by job;

#4.顯示資料項命名為Number of Managers來表示擔任主管的人數。
select count(distinct mgr) 'Number of Managers'  
from emp ;

#5.顯示資料項命名為DIFFERENCE的資料來表示公司中最高和最低薪水間的差額。
select MAX(sal)-MIN(sal) DIFFERENCE  from emp ;

#6.顯示每位主管的員工編號及該主管下屬員工最低的薪資，排除沒有主管和下屬員工最低薪資少於1000的主管，並以下屬員工最低薪資作降冪排列。
select mgr , min(sal) 
from emp 
group by mgr 
having mgr is not null and min(sal) >= 1000 
order by 2 desc;

#7.顯示在1980,1981,1982,1983年進公司的員工數量，並給該資料項一個合適的名稱。
select YEAR(HIREDATE) YEAR, count(*) COUNT 
from emp 
where YEAR(HIREDATE) between 1980 and 1983  
group by YEAR(HIREDATE);



