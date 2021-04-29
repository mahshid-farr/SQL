select LAST_NAME, JOB_ID
    from employees
    where JOB_ID =
                    (select JOB_ID
                     from employees
                     where LAST_NAME = 'Davies') and LAST_NAME<> 'Davies'


 select LAST_NAME, JOB_ID, HIRE_DATE
    from employees
    where HIRE_DATE >
                      (select HIRE_DATE
                       from employees
                       where LAST_NAME = 'Grant')
    order by HIRE_DATE DESC


 select CITY "City", NVL(STATE_PROVINCE,'Unknown') "Province", POSTAL_CODE "PCode", COUNTRY_ID "CC"
    from locations
    where COUNTRY_ID IN
                         (select COUNTRY_ID
                          from countries
                          where COUNTRY_NAME  like'I%')
    order by CITY
 

 select LAST_NAME, JOB_ID, SALARY
    from employees
   where SALARY <
                   (select avg(SALARY)
                    from employees
                    where JOB_ID like'SA%')
    order by SALARY desc, JOB_ID


 select last_name, job_id, salary
    from employees
    where salary in (select salary
                     from employees
                     where department_id = (select department_id
                                            from departments
                                            where department_name = 'IT'))
    order by salary, last_name

 select LAST_NAME, SALARY
    from employees
    where SALARY < any
                       (select min(SALARY)
                        from employees
                        group by DEPARTMENT_ID)
    order by SALARY  desc, LAST_NAME
