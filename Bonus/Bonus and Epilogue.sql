-- Bonus: Create View for Employee Salary and titles

-- Join Salaries and Employees
SELECT public."Salaries".emp_no,
  salary
FROM public."Salaries"
INNER JOIN public."Employees" ON
public."Salaries".emp_no=public."Employees".emp_no;

-- Join Employees and Titles
SELECT public."Titles".title_id,
  title
FROM public."Titles"
INNER JOIN public."Employees" ON
public."Titles".title_id=public."Employees".emp_title_id;

-- Display Employee and Salaries 
Create View salary_title as
Select til.title, sal.salary
From
       public."Titles" as til, public."Salaries" as sal, public."Employees" as emp
Where
       emp.emp_no= sal.emp_no AND emp.emp_title_id = til.title_id;

SELECT *
FROM salary_title;


-- Epilogue: Search your ID number - 499942
SELECT 
first_name, last_name
FROM public."Employees"
WHERE emp_no = 499942;