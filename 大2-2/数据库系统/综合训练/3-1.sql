explain
select departments.dept_no as 部门编号,
	dept_name as 部门名称,
    count(distinct dept_emp.emp_no) as 雇员人数,
    min(salary) as 最低工资,
    avg(salary) as 平均工资,
    max(salary) as 最高工资,
    sum(salary) as 工资总额
from departments,dept_emp,salaries
where departments.dept_no=dept_emp.dept_no
and dept_emp.emp_no=salaries.emp_no
group by departments.dept_no