select employees.emp_no as 雇员编号,
	concat(first_name," ",last_name) as 雇员姓名,
    count(distinct dept_no) as 曾任职部门数
from employees,dept_emp
where employees.emp_no=dept_emp.emp_no
group by employees.emp_no
