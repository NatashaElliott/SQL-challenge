-- Create table
CREATE TABLE Departments (
	dept_no TEXT PRIMARY KEY,
	dept_name TEXT NOT NULL
);
CREATE TABLE Titles (
	title_id TEXT PRIMARY KEY,
	title TEXT NOT NULL
);
CREATE TABLE Employees (
	emp_no INT PRIMARY KEY,
	emp_title_id TEXT NOT NULL,
	birth_date DATE NOT NULL,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);
CREATE TABLE Department_Employee (
	emp_no INT NOT NULL,
	dept_no TEXT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);
CREATE TABLE Department_Manager (
	dept_no TEXT NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);
CREATE TABLE Salaries (
	emp_no INT PRIMARY KEY,
	salary TEXT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);