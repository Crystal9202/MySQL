#1.建立一個查詢來顯示部門(dept)資料表中的所有資料。
select * from dept;

#2.建立一個查詢來顯示每一位員工的姓名(name)、職稱(job)、進公司日期(hire date)及員工編號(employee number )，並將且員工編號顯示在最前面。
select empno 'employee number' , ename 'name', job 'job' , hiredate 'hire date' from emp;

#3.建立一個查詢來顯示所有員工所擔任的職稱有哪些? (重複的資料只顯示一次)
 select distinct job from emp;

#4.建立一個查詢來顯示每一位員工的姓名(name)、職稱(job)、進公司日期(hire date)及員工編號(employee number )，並將且員工編號顯示在最前面。並將資料表頭重新命名為：Emp#, Employee, Job, Hire Date。
select empno as 'Emp#', ename as Employee, job as Job, hiredate as 'Hire Date' from emp;

#5.建立一個查詢將姓名(name)及職稱(job)串接為依個資料項(資料中間利用一個空白和一個逗號做區隔)，並將表頭重新命名為 Employee and Title。
select concat(ename, ', ', job) 'Employee and Title'  from emp;
