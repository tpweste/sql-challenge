DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;

CREATE TABLE titles (
  id VARCHAR(30) PRIMARY KEY,
  title VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE departments (
  id VARCHAR(30) PRIMARY KEY,
  dept VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE employees (
  id INT PRIMARY KEY,
  title_id VARCHAR(30) NOT NULL REFERENCES titles (id),
  birth_date DATE NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  sex VARCHAR(30) NOT NULL,
  hire_date DATE NOT NULL
);

CREATE TABLE salaries (
  emp_id INT NOT NULL REFERENCES employees (id),
  salary INT NOT NULL
);

CREATE TABLE dept_manager (
  dept_id VARCHAR(30) NOT NULL REFERENCES departments (id),
  emp_id INT NOT NULL REFERENCES employees (id),
  PRIMARY KEY (dept_id, emp_id)
);

CREATE TABLE dept_emp (
  emp_id INT NOT NULL REFERENCES employees (id),
  dept_id VARCHAR(30) NOT NULL REFERENCES departments (id),
  PRIMARY KEY (dept_id, emp_id)
);
