
--1.List the following details of each employee: employee number, last name, first name, gender, and salary.
select public."Employees".emp_no, 
	public."Employees".last_name, 
	public."Employees".first_name, 
	public."Employees".gender, 
	public."Salaries".salary
from public."Employees"
inner join public."Salaries" on
public."Employees".emp_no = public."Salaries".emp_no;


--2.List employees who were hired in 1986.
select * from public."Employees" where hire_date between '1986-01-01' and '1986-12-31'
;

--3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
Select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, e.hire_date, dm.to_date
from public."Dept_manager" dm
join public."Department" d on d.dept_no = dm.dept_no
join public."Employees" e on e.emp_no = dm.emp_no;

--4.List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from public."Employees" e
join public."Dept_Emp" de on e.emp_no = de.emp_no
left join public."Department" d on d.dept_no = de.dept_no
;

--5.List all employees whose first name is "Hercules" and last names begin with "B."
select * from public."Employees" 
where first_name='Hercules'
and last_name like 'B%';

--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from public."Employees" e 
inner join public."Dept_Emp" de on e.emp_no = de.emp_no
inner join public."Department" d on de.dept_no = d.dept_no
where d.dept_name = 'Sales';

--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from public."Employees" e 
inner join public."Dept_Emp" de on e.emp_no = de.emp_no
inner join public."Department" d on de.dept_no = d.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development';

--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count (last_name) as countofName
from public."Employees" e
group by last_name
order by countofName desc;
	
