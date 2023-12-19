explain
SELECT from_date as 起始时间,
    to_date as 结束时间,
	departments.dept_no as 部门编号,
	dept_name as 部门名称,
    employees.emp_no as 部门经理编号,
    concat(first_name," ",last_name) as 部门经理姓名
FROM departments,dept_manager,employees
WHERE departments.dept_no=dept_manager.dept_no
AND dept_manager.emp_no=employees.emp_no
ORDER BY from_date,to_date,departments.dept_no,employees.emp_no
