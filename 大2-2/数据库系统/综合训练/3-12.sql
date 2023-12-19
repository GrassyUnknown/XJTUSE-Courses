select employees.emp_no as 雇员编号,
    concat(first_name," ",last_name) as 雇员姓名,
    concat(from_date,"-",to_date) as 时间段
from departments,dept_emp,employees
where departments.dept_no=dept_emp.dept_no
and employees.emp_no=dept_emp.emp_no
and departments.dept_name="Development"
order by from_date,to_date,employees.emp_no
