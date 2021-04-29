select to_char(sysdate+1,'Month dd"th of year" yyyy') "Tomorrow"
    from dual

select CONCAT(FIRST_NAME||', ',LAST_NAME||' Is a') "person", JOB_ID "Job"
    from employees
    where upper(LAST_NAME) like'%S' and (upper(FIRST_NAME) like'C%' or upper(FIRST_NAME) like'K%')
    order by LAST_NAME

select LAST_NAME, HIRE_DATE,ROUND((SYSDATE-HIRE_DATE)/365) AS "Years worked"
    from employees
    where HIRE_DATE < '01-JAN-92'
    order by 3

select LAST_NAME,HIRE_DATE, TO_CHAR(NEXT_DAY(add_months(HIRE_DATE, 12),'Tuesday'),'Day, MONTH "the" fmDdspth "of Year" YYYY') "REVIEW DAY"
    from employees
    where HIRE_DATE >'31-DEC-97'


select department_id as "Dept#", job_id as "Job", count(employee_id) as "HowMany"
    from employees
    group by department_id, job_id
    having count(employee_id)>1
    order by 3 desc

select job_id as "Job Title", sum(salary) as "Total Paid"
    from employees
    where job_id not in ('AD_PRES', 'AD_VP')
    group by job_id
    having sum(salary)>15000
    order by 2 desc

select department_id, max(HIRE_DATE) as "Latest Hire Date", min(HIRE_DATE) as "Earliest Hire Date"
    from employees
    where department_id not in (10,20)
    group by department_id
    having max(HIRE_DATE)< '01-JAN-00'
    order by 2 desc
  



