-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary

-- Join Employees with Salaries
SELECT public."Employees".emp_no,
  last_name,
  first_name,
  sex
  FROM public."Employees"
INNER JOIN public."Salaries" ON
public."Employees".emp_no=public."Salaries".emp_no;


-- Join Salaries with Employees
SELECT public."Salaries".emp_no,
  salary
FROM public."Salaries"
INNER JOIN public."Employees" ON
public."Salaries".emp_no = public."Employees".emp_no;

-- Display Employee and Salaries 
Create View emp_salary as
Select emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
From
       public."Employees" as emp, public."Salaries" as sal
Where
       emp.emp_no = sal.emp_no

SELECT *
FROM emp_salary;

-- 2. List first name, last name and hire date for employees who were hired in 1986

-- Query to identify year of hiring
SELECT EXTRACT(YEAR FROM public."Employees".hire_date)
FROM public."Employees";

-- Display Employee who were hired in 1986
Create View emp_hire as
Select emp.first_name, emp.last_name, emp.hire_date
From
       public."Employees" as emp
Where
        EXTRACT(YEAR FROM emp.hire_date) = 1986; 
		
SELECT *
FROM emp_hire;

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name

-- Join Departments to Department Managers
SELECT public."Departments".dept_no,
  dept_name
  FROM public."Departments"
INNER JOIN public."Department_Managers" ON
public."Departments".dept_no=public."Department_Managers".dept_no;

-- Join Department Managers to Employees
SELECT public."Employees".emp_no,
  last_name, first_name
  FROM public."Employees"
INNER JOIN public."Department_Managers" ON
public."Employees".emp_no=public."Department_Managers".emp_no;

-- Create View to display Department Manager information
Create View dep_mgr_info as
Select dep.dept_no, dep.dept_name, emp.emp_no, emp.last_name, emp.first_name
From
       public."Employees" as emp, public."Departments" as dep, public."Department_Managers" as dep_mgr
Where
       emp.emp_no = dep_mgr.emp_no AND dep_mgr.dept_no = dep.dept_no;

SELECT *
FROM dep_mgr_info;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name

-- Join Departments to Department Employees
SELECT public."Departments".dept_no,
  dept_name
  FROM public."Departments"
INNER JOIN public."Department_Employees" ON
public."Departments".dept_no=public."Department_Employees".dept_no;

-- Join Department Employees to Employees
SELECT public."Employees".emp_no,
  last_name, first_name
  FROM public."Employees"
INNER JOIN public."Department_Employees" ON
public."Employees".emp_no=public."Department_Employees".emp_no;

-- Create View to display Department Employee information
Create View dep_emp_info as
Select emp.last_name, emp.first_name, dep.dept_name
From
       public."Employees" as emp, public."Departments" as dep, public."Department_Employees" as dep_emp
Where
       emp.emp_no = dep_emp.emp_no AND dep_emp.dept_no = dep.dept_no;

SELECT *
FROM dep_emp_info;

-- 5. List first name, last name and sex for employees whose first name is "Hercules" and last name begins with "B"

-- Query to extract B from last_name
SELECT SUBSTRING(public."Employees".last_name, 1, 1)
FROM public."Employees";

-- Display Employee who were hired in 1986
Create View hercules_b as
Select emp.first_name, emp.last_name, emp.sex
From
       public."Employees" as emp
Where
        SUBSTRING(emp.last_name, 1, 1) ='B' AND emp.first_name = 'Hercules'; 
		
SELECT *
FROM hercules_b;

-- 6. List all employees in the Sales department, including their employee number, last name, first anem and department name

-- Join Departments to Department Employees
SELECT public."Departments".dept_no,
  dept_name
  FROM public."Departments"
INNER JOIN public."Department_Employees" ON
public."Departments".dept_no=public."Department_Employees".dept_no;

-- Join Department Employees to Employees
SELECT public."Employees".emp_no,
  last_name, first_name
  FROM public."Employees"
INNER JOIN public."Department_Employees" ON
public."Employees".emp_no=public."Department_Employees".emp_no;

-- Create View to display Sales Department Employee information
Create View sales_emp_info as
Select emp.last_name, emp.first_name, dep.dept_name
From
       public."Employees" as emp, public."Departments" as dep, public."Department_Employees" as dep_emp
Where
       emp.emp_no = dep_emp.emp_no AND dep_emp.dept_no = dep.dept_no AND dep.dept_name = 'Sales';

SELECT *
FROM sales_emp_info;

-- 7. List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name

-- Join Departments to Department Employees
SELECT public."Departments".dept_no,
  dept_name
  FROM public."Departments"
INNER JOIN public."Department_Employees" ON
public."Departments".dept_no=public."Department_Employees".dept_no;

-- Join Department Employees to Employees
SELECT public."Employees".emp_no,
  last_name, first_name
  FROM public."Employees"
INNER JOIN public."Department_Employees" ON
public."Employees".emp_no=public."Department_Employees".emp_no;

-- Create View to display Sales and Development Department Employee information
Create View sales_dev_emp_info as
Select emp.last_name, emp.first_name, dep.dept_name
From
       public."Employees" as emp, public."Departments" as dep, public."Department_Employees" as dep_emp
Where
       emp.emp_no = dep_emp.emp_no AND dep_emp.dept_no = dep.dept_no AND dep.dept_name = 'Sales' OR
       emp.emp_no = dep_emp.emp_no AND dep_emp.dept_no = dep.dept_no AND dep.dept_name = 'Development';

SELECT *
FROM sales_dev_emp_info;

-- 8. In descending order, list the frequency count of employee last names, i.e. how many employees share each last name

-- Query last names and frequency of occurrence
SELECT 
last_name,
COUNT(last_name)

FROM public."Employees"

GROUP BY last_name

ORDER BY count DESC;


