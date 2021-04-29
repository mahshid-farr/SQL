select EMPLOYEE_ID, LAST_NAME, SALARY
    from employees
    where SALARY between 8000 and 15000
    order by "SALARY" DESC, LAST_NAME

select EMPLOYEE_ID, LAST_NAME, SALARY
    from employees
    where SALARY between 8000 and 15000 and JOB_ID in ('IT_PROG', 'SA_REP')
    order by "SALARY" DESC, LAST_NAME

    
select EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY
    from employees
    where SALARY not between 8000 and 15000 and JOB_ID in ('IT_PROG', 'SA_MAN', 'SA_REP')
    order by "SALARY" DESC, LAST_NAME

select LAST_NAME, JOB_ID, SALARY
    from employees
    where HIRE_DATE <'01-JAN-98'
    order by "HIRE_DATE" DESC
 
select LAST_NAME, JOB_ID, SALARY
    from employees
    where SALARY > 10000 and HIRE_DATE <'01-JAN-98'
    order by JOB_ID, "SALARY" DESC
  
select  JOB_ID, FIRST_NAME, LAST_NAME
    from employees
    where FIRST_NAME like'%e%' or FIRST_NAME like'%E%'
    order by JOB_ID
  
select LAST_NAME, JOB_ID, SALARY
 from employees
 where SALARY > 10000 and HIRE_DATE <'01-JAN-98'
 order by JOB_ID, "SALARY" DESC