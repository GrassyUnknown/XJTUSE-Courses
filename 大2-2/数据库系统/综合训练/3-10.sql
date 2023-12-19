select employees.emp_no as 雇员编号,
	concat(first_name," ",last_name) as 雇员姓名
from employees,dept_manager
where employees.emp_no=dept_manager.emp_no
