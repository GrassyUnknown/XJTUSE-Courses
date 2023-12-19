select employees.emp_no as 雇员编号,
	concat(first_name," ",last_name) as 雇员姓名
from employees
where not exists(
	select *
    from departments
    where not exists(
		select dept_no
        from dept_emp as de2
        where de2.dept_no=departments.dept_no
        and de2.emp_no=employees.emp_no
	)
)

