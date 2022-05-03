-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;

-- DEL 1
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO employee_title
FROM employees AS e
JOIN titles AS t
	ON e.emp_no = t.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY 1;

select *from employee_title;

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM employee_title
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

select * from unique_titles

SELECT title, COUNT(emp_no)
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

select * from retiring_titles;