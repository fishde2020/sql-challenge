-- Table Schema: Data Engineering 


-- Make Tables to import csv files for challenge:
-- Create departments table:
CREATE TABLE departments (
    dept_no VARCHAR(30),
    dept_name VARCHAR(30),
    PRIMARY KEY (dept_no)
);
-- Import department.csv using pgAdmin GUI.

-- Create dept_emp table with both columns as pk:
CREATE TABLE dept_emp (
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR(30),
    PRIMARY KEY(emp_no, dept_no)
);
-- Import dept_emp.csv using pgAdmin GUI.

-- Create dept_manager table with both columns as pk:
CREATE TABLE dept_manager (
    dept_no VARCHAR(30),
    emp_no INTEGER NOT NULL,
    PRIMARY KEY(dept_no, emp_no)
);
-- Import dept_manager.csv using pgAdmin GUI.

-- Create employees table:
CREATE TABLE employees (
    emp_no INTEGER NOT NULL,
    emp_title_id VARCHAR(30),
    birth_date DATE NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    sex VARCHAR(30),
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no)
);
-- Import employees.csv using pgAdmin GUI.

-- Create salaries table:
CREATE TABLE salaries (
    emp_no INTEGER NOT NULL,
    salary INTEGER NOT NULL,
    PRIMARY KEY (emp_no)
);
-- Import salaries.csv using pgAdmin GUI.

-- Create titles table:
CREATE TABLE titles (
    title_id VARCHAR(30),
    title VARCHAR(30),
    PRIMARY KEY (title_id)
);
-- Import titles.csv using pgAdmin GUI.

-- Add foreign keys to all of the tables now that all the tables are added:
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES salaries (emp_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_no FOREIGN KEY(emp_no)
REFERENCES salaries (emp_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

--Check all tables:
SELECT * FROM departments;

SELECT * FROM dept_emp;

SELECT * FROM dept_manager;

SELECT * FROM employees;

SELECT * FROM salaries;

SELECT * FROM titles;