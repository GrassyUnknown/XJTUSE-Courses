select dept_emp.dept_no as 部门编号,
	dept_name as 部门名称,
    title as 职位,
	count(distinct titles.emp_no) as 人数
from titles,dept_emp,departments
where titles.emp_no=dept_emp.emp_no
and dept_emp.dept_no=departments.dept_no
group by dept_emp.dept_no,title
