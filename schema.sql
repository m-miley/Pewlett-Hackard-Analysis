-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
	dept_no VARCHAR(4) NOT Null,
	dept_name VARCHAR(40) Not Null,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);

CREATE TABLE employees (
	emp_no INT NOT Null,
	birth_date DATE NOT Null,
	first_name VARCHAR NOT Null,
	last_name VARCHAR NOT Null,
	gender VARCHAR NOT Null,
	hire_date DATE NOT Null,
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT Null,
	emp_no INT NOT Null,
	from_date DATE NOT Null,
	to_date DATE NOT Null,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
	emp_no INT NOT Null,
	salary INT NOT Null,
	from_date DATE NOT Null,
	to_date DATE NOT Null,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_emp (
	emp_no INT NOT Null,
	dept_no VARCHAR(4) NOT Null,
	from_date DATE NOT Null,
	to_date DATE NOT Null,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE titles (
	emp_no INT NOT Null,
	title VARCHAR NOT Null,
	from_date DATE NOT Null,
	to_date DATE NOT Null,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, title, from_date)
);

SELECT * 
FROM departments;