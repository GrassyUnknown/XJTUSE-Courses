select title as 职位,
	count(distinct emp_no) as 人数
from titles
group by title