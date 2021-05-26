-- 1. List the following details of each employee:
-- employee number, last name, first name, sex, and salary.
SELECT
  employees.id as employee_id,
  employees.last_name,
  employees.first_name,
  employees.sex,
  salaries.salary
FROM employees
JOIN salaries
ON employees.id = salaries.emp_id;


-- 2. List first name, last name, and hire date
-- for employees who were hired in 1986.
SELECT
  first_name,
  last_name,
  hire_date
FROM employees
where hire_date >= '1986-01-01' 
       and hire_date < '1987-01-01'
	   order by hire_date;
	   
-- 3. List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name.
SELECT
  departments.id as "department_id",
  departments.dept as "department",
  employees.id as "employee_id",
  employees.last_name,
  employees.first_name
FROM employees
JOIN dept_manager ON employees.id = dept_manager.emp_id
JOIN departments ON dept_manager.dept_id = departments.id
ORDER BY departments.id; 

-- 4. List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
SELECT
  employees.id as "employee_id",
  employees.last_name,
  employees.first_name,
  departments.dept
FROM employees
JOIN dept_emp ON employees.id = dept_emp.emp_id
JOIN departments ON dept_emp.dept_id = departments.id
ORDER BY employees.id;

-- 5. List first name, last name, and sex for employees
-- whose first name is "Hercules" and last names begin with "B."
SELECT
  first_name,
  last_name,
  sex
FROM employees
WHERE
  first_name = 'Hercules'
and
  last_name LIKE 'B%'
ORDER BY last_name;

-- 6. List all employees in the Sales department, including their
-- employee number, last name, first name, and department name.
SELECT
  employees.id as "employee_id",
  employees.last_name,
  employees.first_name,
  departments.dept
FROM employees
JOIN dept_emp ON employees.id = dept_emp.emp_id
JOIN departments ON dept_emp.dept_id = departments.id
WHERE departments.dept = 'Sales'
ORDER BY employees.last_name;

-- 7. List all employees in the Sales and Development departments
-- including their employee number, last name, first name, and department name.
SELECT
  employees.id as "employee_id",
  employees.last_name,
  employees.first_name,
  departments.dept
FROM employees
JOIN dept_emp ON employees.id = dept_emp.emp_id
JOIN departments ON dept_emp.dept_id = departments.id
WHERE departments.dept = 'Sales' or departments.dept = 'Development';

-- 8. In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.
SELECT
 	count(employees.last_name) as last_name_count, employees.last_name
	from employees
	group by last_name
	order by last_name_count DESC;
