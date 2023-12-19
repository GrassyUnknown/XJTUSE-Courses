select employees.emp_no as 雇员编号,
	concat(first_name," ",last_name) as 雇员姓名,
    salary as 最高工资,
    from_date as 起始时间,
    to_date as 结束时间
from employees,salaries a
where employees.emp_no=a.emp_no
and salary=(select max(salary)
			from salaries b 
            where b.emp_no=a.emp_no)
