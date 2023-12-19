select employees.emp_no as 雇员编号,
	concat(first_name," ",last_name) as 雇员姓名,
    from_date as 起始时间,
    to_date as 结束时间,
    dept_name as 工作部门名称
from employees,dept_emp,departments
where employees.emp_no=dept_emp.emp_no
and departments.dept_no=dept_emp.dept_no
order by from_date,to_date,employees.emp_no

