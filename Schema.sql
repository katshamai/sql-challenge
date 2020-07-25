--- Create Tables
CREATE TABLE "Departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Department_Managers" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INTEGER  NOT NULL,
    CONSTRAINT "pk_Department_Managers" PRIMARY KEY (
        "dept_no", "emp_no"
     )
);

CREATE TABLE "Department_Employees" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Department_Employees" PRIMARY KEY (
        "emp_no", "dept_no"
     )
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Employees" (
    "emp_no" INTEGER   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);

--- Create foreign keys
ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Department_Managers" ADD CONSTRAINT "fk_Department_Managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Department_Managers" ADD CONSTRAINT "fk_Department_Managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Department_Employees" ADD CONSTRAINT "fk_Department_Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Department_Employees" ADD CONSTRAINT "fk_Department_Employees_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

--- Copy data from CSV to database
COPY "Departments"
FROM 'C:\Users\ksham\OneDrive\Documents\GitHub\sql-challenge\data\departments.csv' DELIMITER ',' CSV HEADER;

COPY "Titles"
FROM 'C:\Users\ksham\OneDrive\Documents\GitHub\sql-challenge\data\titles.csv' DELIMITER ',' CSV HEADER;

COPY "Employees"
FROM 'C:\Users\ksham\OneDrive\Documents\GitHub\sql-challenge\data\employees.csv' DELIMITER ',' CSV HEADER;

COPY "Department_Employees"
FROM 'C:\Users\ksham\OneDrive\Documents\GitHub\sql-challenge\data\dept_emp.csv' DELIMITER ',' CSV HEADER;

COPY "Department_Managers"
FROM 'C:\Users\ksham\OneDrive\Documents\GitHub\sql-challenge\data\dept_manager.csv' DELIMITER ',' CSV HEADER;

COPY "Salaries"
FROM 'C:\Users\ksham\OneDrive\Documents\GitHub\sql-challenge\data\salaries.csv' DELIMITER ',' CSV HEADER;

