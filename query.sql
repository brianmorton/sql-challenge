drop table dept_emp

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

