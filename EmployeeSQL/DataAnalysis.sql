--DATA ANALYSIS
--List the employee number, last name, first name, sex, and salary of each employee.
SELECT Employees.emp_no,
	last_name,
	first_name,
	sex,
	salary
FROM Employees
INNER JOIN Salaries ON
Employees.emp_no = Salaries.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name,
	last_name,
	hire_date
FROM Employees
WHERE date_part('year', hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT Department_Manager.dept_no,
	Departments.dept_name,
	Department_Manager.emp_no,
	Employees.last_name,
	Employees.first_name
FROM Department_Manager
INNER JOIN Departments ON
	Department_Manager.dept_no = Departments.dept_no
INNER JOIN Employees ON
	Department_Manager.emp_no = Employees.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT Department_Employee.dept_no,
	Department_Employee.emp_no,
	Employees.last_name,
	Employees.first_name,
	Departments.dept_name
FROM Department_Employee
INNER JOIN Employees ON
	Department_Employee.emp_no = Employees.emp_no
INNER JOIN Departments ON
	Department_Employee.dept_no = Departments.dept_no;

--List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name,
	last_name,
	sex
FROM Employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT Employees.emp_no,
	Employees.last_name,
	Employees.first_name
FROM Employees
INNER JOIN Department_Employee ON
	Employees.emp_no = Department_Employee.emp_no
INNER JOIN Departments ON
	Departments.dept_no = Department_Employee.dept_no
WHERE Departments.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT Employees.emp_no,
	Employees.last_name,
	Employees.first_name,
	Departments.dept_name
FROM Employees
INNER JOIN Department_Employee ON
	Employees.emp_no = Department_Employee.emp_no
INNER JOIN Departments ON
	Departments.dept_no = Department_Employee.dept_no
WHERE Departments.dept_name = 'Sales' OR
	Departments.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name,
	count(last_name)
FROM Employees
GROUP BY last_name
ORDER BY count(last_name) DESC;