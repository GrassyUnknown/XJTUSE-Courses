select departments.dept_no as 部门编号,
	dept_name as 部门名称,
    concat(first_name," ",last_name) as 经理姓名,
    concat(from_date,"-",to_date) as 时间段
from departments,dept_manager,employees
where departments.dept_no=dept_manager.dept_no
and employees.emp_no=dept_manager.emp_no
order by from_date,to_date,departments.dept_no
