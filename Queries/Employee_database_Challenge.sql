--Assignment 7 Schema
--table 1
SELECT e.emp_no, e.first_name, e.last_name, 
 t.title, t.from_date,
t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- table 2
SELECT DISTINCT ON (emp_no) emp_no, 
first_name, 
last_name, 
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- employees most recent job who are retiring soon
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC

--Mentorship Eligibility Table

SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name,
 e.last_name, e.birth_date, de.from_date, de.to_date, t.title
 INTO mentorship_table
 FROM employees as e
 INNER JOIN dept_emp as de
 ON e.emp_no = de.emp_no
 INNER JOIN titles as t
 ON e.emp_no = t.emp_no
 WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
 AND de.to_date = '9999-01-01'
 ORDER BY e.emp_no