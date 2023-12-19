select employees.emp_no as 雇员编号,
	concat(first_name," ",last_name) as 雇员姓名,
    from_date as 起始时间,
    to_date as 结束时间,
    salary as 工资额
from employees,salaries
where employees.emp_no=salaries.emp_no
order by from_date,to_date,employees.emp_no
