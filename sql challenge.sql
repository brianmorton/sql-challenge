-- Create tables
CREATE TABLE departments (
  dept_no VARCHAR(30) Primary Key,
  dept_name VARCHAR(30) 
)

CREATE TABLE dept_manger (
  dept_no VARCHAR(30) NOT NULL,
  emp_no VARCHAR(30) 
)

CREATE TABLE dept_emp (
  emp_no VARCHAR(30),
  dept_no VARCHAR(30)
)

CREATE TABLE employees (
  emp_no VARCHAR(30) Primary Key,
  emp_title_id VARCHAR(30),
	birth_date VARCHAR(30),
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(30),
	hire_date VARCHAR(30)
)

CREATE TABLE salaries (
  emp_no VARCHAR(30),
  salary VARCHAR(30)   
)

CREATE TABLE titles (
  title_id VARCHAR(30) Primary Key,
  title VARCHAR(30)   
)

--adding fk constraint
ALTER TABLE dept_manger
ADD CONSTRAINT constraint_name 
FOREIGN KEY (dept_no) 
REFERENCES  departments (dept_no);

ALTER TABLE dept_emp
ADD CONSTRAINT constraint_name 
FOREIGN KEY (dept_no) 
REFERENCES  departments (dept_no);

ALTER TABLE employees
ADD CONSTRAINT constraint_name 
FOREIGN KEY (emp_title_id) 
REFERENCES  titles (title_id);


ALTER TABLE salaries
ADD CONSTRAINT constraint_name 
FOREIGN KEY (emp_no) 
REFERENCES  employees (emp_no);



--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

Select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees, salaries
where employees.emp_no = salaries.emp_no

--2. List first name, last name, and hire date for employees who were hired in 1986.
Select employees.last_name, employees.first_name, employees.hire_date
from employees
where hire_date = '%1986'

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
Select dept_manger.dept_no, departments.dept_name,employees.emp_no,employees.last_name, employees.first_name
from dept_manger, departments, employees
where dept_manger.dept_no = departments.dept_no and dept_manger.emp_no = employees.emp_no

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

Select dept_emp.emp_no,employees.last_name, employees.first_name, departments.dept_name
from dept_emp, departments, employees
where dept_emp.dept_no = departments.dept_no and dept_emp.emp_no = employees.emp_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

Select employees.first_name, employees.last_name, employees.sex
from employees
where first_name = 'Hercules' and last_name = 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

Select dept_emp.emp_no,employees.last_name, employees.first_name, departments.dept_name
from dept_emp, departments, employees
where dept_emp.dept_no = departments.dept_no and dept_emp.emp_no = employees.emp_no and dept_name = 'Sales'

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

Select dept_emp.emp_no,employees.last_name, employees.first_name, departments.dept_name
from dept_emp, departments, employees
where dept_emp.dept_no = departments.dept_no and dept_emp.emp_no = employees.emp_no and dept_name = 'Sales' or 'Development'

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

Select Count (Last_name)
from employees
Group by Last_name
order by last_name DESC
