 select d.DEPARTMENT_NAME, l.CITY, l.STREET_ADDRESS, l.POSTAL_CODE
    from departments d join locations l
    on d.LOCATION_ID=l.LOCATION_ID
    order by 1 desc


 select CONCAT(FIRST_NAME||'/ ',LAST_NAME) as "Full Name",e.HIRE_DATE, e.salary,d.DEPARTMENT_NAME
    from employees e join departments d
    on e.DEPARTMENT_ID = d.DEPARTMENT_ID
    where d.DEPARTMENT_NAME like'A%' or  d.DEPARTMENT_NAME like'S%'
    order by d.DEPARTMENT_NAME, LAST_NAME


 select CONCAT(m.FIRST_NAME||',',m.LAST_NAME||'.') as "Full Name", d.DEPARTMENT_NAME, l.STATE_PROVINCE, l.CITY, l.POSTAL_CODE
    from employees m join employees w
    on m.employee_id = w.employee_id
    join departments d
    on m.DEPARTMENT_ID = d.DEPARTMENT_ID
    join locations l
    on d.LOCATION_ID =l.LOCATION_ID
    where STATE_PROVINCE in ('Ontario','California','Washington')
    order by l.CITY, d.DEPARTMENT_NAME


 select max(e.SALARY) as "High", min(e.SALARY) as "Low", avg(e.SALARY) as "Avg", d.DEPARTMENT_NAME, NVL(e.DEPARTMENT_ID, 0) as "pay values"
    from employees e left outer join departments d
    on e.DEPARTMENT_ID = d.DEPARTMENT_ID
    group by d.DEPARTMENT_NAME, e.DEPARTMENT_ID
    order by 1


select e.LAST_NAME as Employee, e.EMPLOYEE_ID as Emp#,m.LAST_NAME as Manager, m.MANAGER_ID as Mgr#
    from employees e full outer join employees m
    on m.employee_id = e.MANAGER_ID
                        