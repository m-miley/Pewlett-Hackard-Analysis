-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;

----------------------------------------- DEL 1 --------------------------------------------------------
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees AS e
JOIN titles AS t
	ON e.emp_no = t.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY 1;

select *from retirement_titles;

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM employee_title
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

select * from unique_titles

--16
SELECT title, COUNT(emp_no)
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

select * from retiring_titles;

--------------------------------------- DEL 2 --------------------------------------------------------

SELECT DISTINCT ON(e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees e
JOIN dept_emp de
	ON e.emp_no = de.emp_no
JOIN titles t
	ON e.emp_no = t.emp_no
WHERE de.to_date = '9999-01-01' AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no, to_date DESC;

select * from mentorship_eligibility;