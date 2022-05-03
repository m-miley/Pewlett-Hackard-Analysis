--Retirement Eligibility, employees retiring soon
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- 1952 Birth Year
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- 1953 Birth Year
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

-- 1954 Birth Year
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

-- 1955 Birth Year
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

--Birth & Hire date eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
	
--Count eligible employees
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
	
-- Save results in new table
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


---------------------------------CLASS 5/2/22------------------------------------------------------------------

-- Drop table if exists
DROP TABLE cities;

-- Create a new table
CREATE TABLE cities (
	-- create automatic id column that increments per row
	id SERIAL PRIMARY KEY,
	city VARCHAR(30) NOT Null,
	--(30) optional
	state VARCHAR(30) NOT Null,
	population INT
	);

-- Insert data into the table
INSERT INTO cities (city, state, population)
VALUES ('Alameda', 'California', 79177),
	('Mesa', 'Arizona', 496401);
	
SELECT *
FROM cities;

-- Update table
UPDATE cities
SET state = 'California'
WHERE city = 'Anaheim';

DELETE FROM cities
WHERE id = 4;

DROP TABLE people CASCADE;

CREATE TABLE people (
	name VARCHAR(30) NOT NULL,
	has_pet BOOLEAN DEFAULT FALSE,
	pet_type VARCHAR(10) NOT NULL,
	pet_name VARCHAR(30) NOT NULL,
	pet_age INT);
	
INSERT INTO people (name, has_pet, pet_type, pet_name, pet_age)
VALUES ('Jacob', true, 'dog', 'Misty', 10);

select * from people;

-------------------------------------MODULE 7.3 ----------------------------------------------------


DROP TABLE retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

--Joining departments and dept_manager tables
SELECT dep.dept_name,
	man.emp_no,
	man.from_date,
	man.to_date
FROM departments AS dep
INNER JOIN dept_manager AS man
	ON dep.dept_no = man.dept_no
ORDER BY 1;

--Joining retirement_info and dept_emp tables
SELECT r.emp_no,
	r.first_name,
	r.last_name,
	d.to_date
FROM retirement_info as r
LEFT JOIN dept_emp as d
	ON r.emp_no = d.emp_no
ORDER BY 3;

-- Save above table into new table
--Joining retirement_info and dept_emp tables
SELECT r.emp_no,
	r.first_name,
	r.last_name,
	d.to_date
INTO current_emp_retiring
FROM retirement_info as r
LEFT JOIN dept_emp as d
	ON r.emp_no = d.emp_no
WHERE d.to_date = ('9999-01-01');

-- COUNT employees
SELECT d.dept_no, COUNT(c.emp_no)
FROM current_emp_retiring as c
LEFT JOIN dept_emp as d
	ON c.emp_no = d.emp_no
GROUP BY d.dept_no
ORDER BY 2 DESC;

-- new table for dept count results
SELECT d.dept_no, COUNT(c.emp_no)
INTO employee_count_dept_retiring
FROM current_emp_retiring as c
LEFT JOIN dept_emp as d
	ON c.emp_no = d.emp_no
GROUP BY d.dept_no;

select * from employee_count_dept_retiring
order by 1;

select * from salaries
order by 4 desc;

-- Create table with retiring emp info, salary, and presently working
SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary, d.to_date
INTO emp_info
FROM employees AS e
JOIN salaries AS s
	ON e.emp_no = s.emp_no
JOIN dept_emp AS d
	ON e.emp_no = d.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (d.to_date = '9999-01-01')
ORDER BY 1;

select * from emp_info;