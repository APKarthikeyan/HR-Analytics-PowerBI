create database hr_analytics;
use hr_analytics;

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    department_head VARCHAR(100) NULL
);
DESCRIBE departments;

CREATE TABLE job_roles (
    job_role_id INT PRIMARY KEY AUTO_INCREMENT,
    job_role_name VARCHAR(100) NOT NULL,
    job_level VARCHAR(50) NOT NULL
);
DESCRIBE job_roles;

CREATE TABLE locations (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    office_address VARCHAR(255) NOT NULL
);

DESCRIBE locations;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(20),
    joining_date DATE NOT NULL,
    department_id INT NOT NULL,
    job_role_id INT NOT NULL,
    location_id INT NOT NULL,
    employment_status VARCHAR(30) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    address VARCHAR(255),

    FOREIGN KEY (department_id)
        REFERENCES departments(department_id),

    FOREIGN KEY (job_role_id)
        REFERENCES job_roles(job_role_id),

    FOREIGN KEY (location_id)
        REFERENCES locations(location_id)
);

DESCRIBE employees;

CREATE TABLE salary_history (
    salary_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT NOT NULL,
    effective_date DATE NOT NULL,
    base_salary DECIMAL(10,2) NOT NULL,
    increment_amount DECIMAL(10,2) DEFAULT 0,
    bonus DECIMAL(10,2) DEFAULT 0,
    allowance DECIMAL(10,2) DEFAULT 0,
    deduction DECIMAL(10,2) DEFAULT 0,

    FOREIGN KEY (emp_id)
        REFERENCES employees(emp_id)
);

DESCRIBE salary_history;

CREATE TABLE performance_reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT NOT NULL,
    review_date DATE NOT NULL,
    rating DECIMAL(3,1) NOT NULL,
    performance_level VARCHAR(50) NOT NULL,
    reviewer VARCHAR(100),

    FOREIGN KEY (emp_id)
        REFERENCES employees(emp_id)
);

DESCRIBE performance_reviews;

CREATE TABLE promotions (
    promotion_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT NOT NULL,
    promotion_date DATE NOT NULL,
    previous_role_id INT NOT NULL,
    new_role_id INT NOT NULL,
    previous_salary DECIMAL(10,2) NOT NULL,
    new_salary DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (emp_id)
        REFERENCES employees(emp_id),

    FOREIGN KEY (previous_role_id)
        REFERENCES job_roles(job_role_id),

    FOREIGN KEY (new_role_id)
        REFERENCES job_roles(job_role_id)
);

DESCRIBE promotions;

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,

    FOREIGN KEY (emp_id)
        REFERENCES employees(emp_id)
);

DESCRIBE attendance;

CREATE TABLE employee_exit (
    exit_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT NOT NULL,
    last_date DATE NOT NULL,
    exit_reason VARCHAR(50) NOT NULL,
    exit_type VARCHAR(50) NOT NULL,

    FOREIGN KEY (emp_id)
        REFERENCES employees(emp_id)
);

DESCRIBE employee_exit;


INSERT INTO departments (department_name, department_head)
VALUES
('Information Technology', 'Arun Kumar'),
('Human Resources', 'Priya Sharma'),
('Finance', 'Rahul Mehta'),
('Sales', 'Vikram Singh'),
('Marketing', 'Sneha Kapoor'),
('Operations', 'Karthik Raj'),
('Customer Support', 'Divya Nair'),
('Data & Analytics', 'Ananya Rao'),
('Research & Development', 'Sanjay Iyer'),
('Legal & Compliance', 'Meena Krishnan');

select * from departments;

INSERT INTO job_roles (job_role_name, job_level)
VALUES
('Software Developer', 'Junior'),
('Software Developer', 'Mid'),
('Software Developer', 'Senior'),
('Data Analyst', 'Junior'),
('Data Analyst', 'Mid'),
('Data Analyst', 'Senior'),
('Data Scientist', 'Mid'),
('Data Scientist', 'Senior'),
('HR Executive', 'Junior'),
('HR Manager', 'Manager'),
('Financial Analyst', 'Junior'),
('Financial Analyst', 'Senior'),
('Accountant', 'Mid'),
('Sales Executive', 'Junior'),
('Sales Executive', 'Senior'),
('Sales Manager', 'Manager'),
('Marketing Executive', 'Junior'),
('Marketing Manager', 'Manager'),
('Operations Executive', 'Junior'),
('Operations Manager', 'Manager'),
('Customer Support Executive', 'Junior'),
('Customer Support Lead', 'Lead'),
('Business Analyst', 'Mid'),
('Business Analyst', 'Senior'),
('Project Manager', 'Manager'),
('Product Manager', 'Manager'),
('Research Analyst', 'Mid'),
('Compliance Analyst', 'Mid'),
('Legal Executive', 'Junior'),
('Legal Manager', 'Manager');

SELECT * FROM job_roles;

INSERT INTO locations (city, state, country, office_address)
VALUES
('Chennai', 'Tamil Nadu', 'India', 'OMR IT Corridor'),
('Bengaluru', 'Karnataka', 'India', 'Whitefield Business Park'),
('Hyderabad', 'Telangana', 'India', 'HITEC City'),
('Pune', 'Maharashtra', 'India', 'Hinjewadi IT Park'),
('Mumbai', 'Maharashtra', 'India', 'Andheri Business District'),
('Delhi', 'Delhi', 'India', 'Connaught Place Business Centre'),
('Gurugram', 'Haryana', 'India', 'Cyber City'),
('Noida', 'Uttar Pradesh', 'India', 'Sector 62 IT Hub'),
('Kochi', 'Kerala', 'India', 'Infopark Kochi'),
('Coimbatore', 'Tamil Nadu', 'India', 'TIDEL Park Coimbatore');

SELECT * FROM locations;

with recursive numbers as (
   select 1 as n 
   union all
   select n +1 
   from numbers 
   where n < 10 
   )
   select * from numbers ;
   
   WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 500
)
SELECT 
    n as employee_name,
    concat('emp',lpad(n,4,'0')) as employee_code
from numbers
limit 10 ;

WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 20
)
SELECT
    n,
    CASE
        WHEN n % 10 = 1 THEN 'Arun'
        WHEN n % 10 = 2 THEN 'Priya'
        WHEN n % 10 = 3 THEN 'Karthik'
        WHEN n % 10 = 4 THEN 'Divya'
        WHEN n % 10 = 5 THEN 'Rahul'
        WHEN n % 10 = 6 THEN 'Sneha'
        WHEN n % 10 = 7 THEN 'Vijay'
        WHEN n % 10 = 8 THEN 'Ananya'
        WHEN n % 10 = 9 THEN 'Suresh'
        ELSE 'Meena'
    END AS first_name
FROM numbers;

WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 20
)
SELECT
    n,

    CASE
        WHEN n % 10 = 1 THEN 'Kumar'
        WHEN n % 10 = 2 THEN 'Sharma'
        WHEN n % 10 = 3 THEN 'Raj'
        WHEN n % 10 = 4 THEN 'Nair'
        WHEN n % 10 = 5 THEN 'Singh'
        WHEN n % 10 = 6 THEN 'Iyer'
        WHEN n % 10 = 7 THEN 'Rao'
        WHEN n % 10 = 8 THEN 'Patel'
        WHEN n % 10 = 9 THEN 'Menon'
        ELSE 'Das'
    END AS last_name

FROM numbers;

WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 20
)

SELECT
    n,

    CASE
        WHEN n % 10 = 1 THEN 'Arun'
        WHEN n % 10 = 2 THEN 'Priya'
        WHEN n % 10 = 3 THEN 'Karthik'
        WHEN n % 10 = 4 THEN 'Divya'
        WHEN n % 10 = 5 THEN 'Rahul'
        WHEN n % 10 = 6 THEN 'Sneha'
        WHEN n % 10 = 7 THEN 'Vijay'
        WHEN n % 10 = 8 THEN 'Ananya'
        WHEN n % 10 = 9 THEN 'Suresh'
        ELSE 'Meena'
    END AS first_name,

    CASE
        WHEN n % 10 = 1 THEN 'Kumar'
        WHEN n % 10 = 2 THEN 'Sharma'
        WHEN n % 10 = 3 THEN 'Raj'
        WHEN n % 10 = 4 THEN 'Nair'
        WHEN n % 10 = 5 THEN 'Singh'
        WHEN n % 10 = 6 THEN 'Iyer'
        WHEN n % 10 = 7 THEN 'Rao'
        WHEN n % 10 = 8 THEN 'Patel'
        WHEN n % 10 = 9 THEN 'Menon'
        ELSE 'Das'
    END AS last_name,

    CONCAT(
        CASE
            WHEN n % 10 = 1 THEN 'Arun'
            WHEN n % 10 = 2 THEN 'Priya'
            WHEN n % 10 = 3 THEN 'Karthik'
            WHEN n % 10 = 4 THEN 'Divya'
            WHEN n % 10 = 5 THEN 'Rahul'
            WHEN n % 10 = 6 THEN 'Sneha'
            WHEN n % 10 = 7 THEN 'Vijay'
            WHEN n % 10 = 8 THEN 'Ananya'
            WHEN n % 10 = 9 THEN 'Suresh'
            ELSE 'Meena'
        END,
        ' ',
        CASE
            WHEN n % 10 = 1 THEN 'Kumar'
            WHEN n % 10 = 2 THEN 'Sharma'
            WHEN n % 10 = 3 THEN 'Raj'
            WHEN n % 10 = 4 THEN 'Nair'
            WHEN n % 10 = 5 THEN 'Singh'
            WHEN n % 10 = 6 THEN 'Iyer'
            WHEN n % 10 = 7 THEN 'Rao'
            WHEN n % 10 = 8 THEN 'Patel'
            WHEN n % 10 = 9 THEN 'Menon'
            ELSE 'Das'
        END
    ) AS full_name

FROM numbers;

WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 20
)
SELECT
    n,

    CASE
        WHEN n % 10 IN (1,3,5,7,9) THEN 'Male'
        ELSE 'Female'
    END AS gender

FROM numbers;
  
WITH RECURSIVE numbers AS (
     SELECT 1 AS n
     
     UNION ALL 
     
     SELECT n + 1
     FROM numbers 
     WHERE n < 20 
)
SELECT 
    n,
    DATE_ADD(
		'1985-01-01',
        INTERVAL ((n * 47)) DAY 
	) AS date_of_birth
FROM numbers;
 
 WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 20
)

SELECT
    n,

    CASE
        WHEN n % 10 = 1 THEN 'Arun'
        WHEN n % 10 = 2 THEN 'Priya'
        WHEN n % 10 = 3 THEN 'Karthik'
        WHEN n % 10 = 4 THEN 'Divya'
        WHEN n % 10 = 5 THEN 'Rahul'
        WHEN n % 10 = 6 THEN 'Sneha'
        WHEN n % 10 = 7 THEN 'Vijay'
        WHEN n % 10 = 8 THEN 'Ananya'
        WHEN n % 10 = 9 THEN 'Suresh'
        ELSE 'Meena'
    END AS first_name,

    CASE
        WHEN n % 10 = 1 THEN 'Kumar'
        WHEN n % 10 = 2 THEN 'Sharma'
        WHEN n % 10 = 3 THEN 'Raj'
        WHEN n % 10 = 4 THEN 'Nair'
        WHEN n % 10 = 5 THEN 'Singh'
        WHEN n % 10 = 6 THEN 'Iyer'
        WHEN n % 10 = 7 THEN 'Rao'
        WHEN n % 10 = 8 THEN 'Patel'
        WHEN n % 10 = 9 THEN 'Menon'
        ELSE 'Das'
    END AS last_name,

    CASE
        WHEN n % 10 IN (1,3,5,7,9) THEN 'Male'
        ELSE 'Female'
    END AS gender,

    DATE_ADD(
        '1985-01-01',
        INTERVAL ((n * 47) % 6935) DAY
    ) AS date_of_birth 

FROM numbers;

WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 20
)

SELECT
    n,
    DATE_ADD(
        '2015-01-01',
        INTERVAL ((n * 83) % 4383) DAY
    ) AS joining_date
FROM numbers;

WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 20
)
SELECT
    n,
    ((n - 1) % 10) + 1 AS department_id
FROM numbers;

USE hr_analytics;

SELECT * FROM job_roles;

WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 20
)

SELECT
    n,
    ((n - 1) % 10) + 1 AS department_id,

    CASE
        WHEN ((n - 1) % 10) + 1 = 1 THEN 1
        WHEN ((n - 1) % 10) + 1 = 2 THEN 9
        WHEN ((n - 1) % 10) + 1 = 3 THEN 11
        WHEN ((n - 1) % 10) + 1 = 4 THEN 14
        WHEN ((n - 1) % 10) + 1 = 5 THEN 17
        WHEN ((n - 1) % 10) + 1 = 6 THEN 19
        WHEN ((n - 1) % 10) + 1 = 7 THEN 21
        WHEN ((n - 1) % 10) + 1 = 8 THEN 4
        WHEN ((n - 1) % 10) + 1 = 9 THEN 27
        WHEN ((n - 1) % 10) + 1 = 10 THEN 29
    END AS job_role_id

FROM numbers;

WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 20
)

SELECT
    n,
    ((n - 1) % 10) + 1 AS location_id
FROM numbers;

WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 20
)

SELECT
    n,

    CASE
        WHEN n % 20 BETWEEN 1 AND 16 THEN 'Active'
        WHEN n % 20 BETWEEN 17 AND 18 THEN 'On Leave'
        ELSE 'Notice Period'
    END AS employment_status

FROM numbers;

WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 10
)

SELECT
    n,

    CASE
        WHEN n % 10 = 1 THEN 'arun'
        WHEN n % 10 = 2 THEN 'priya'
        WHEN n % 10 = 3 THEN 'karthik'
        WHEN n % 10 = 4 THEN 'divya'
        WHEN n % 10 = 5 THEN 'rahul'
        WHEN n % 10 = 6 THEN 'sneha'
        WHEN n % 10 = 7 THEN 'vijay'
        WHEN n % 10 = 8 THEN 'ananya'
        WHEN n % 10 = 9 THEN 'suresh'
        ELSE 'meena'
    END AS first_name,

    CONCAT(
        CASE
            WHEN n % 10 = 1 THEN 'arun'
            WHEN n % 10 = 2 THEN 'priya'
            WHEN n % 10 = 3 THEN 'karthik'
            WHEN n % 10 = 4 THEN 'divya'
            WHEN n % 10 = 5 THEN 'rahul'
            WHEN n % 10 = 6 THEN 'sneha'
            WHEN n % 10 = 7 THEN 'vijay'
            WHEN n % 10 = 8 THEN 'ananya'
            WHEN n % 10 = 9 THEN 'suresh'
            ELSE 'meena'
        END,
        '.employee',
        LPAD(n, 4, '0'),
        '@company.com'
    ) AS email

FROM numbers;

WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 20
)

SELECT
    n,
    CAST(
        6000000000 + MOD((n * 7919) + 123456789, 4000000000)
        AS CHAR
    ) AS phone
FROM numbers;

WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 20
)

SELECT
    n,

    CASE
        WHEN n % 10 = 1 THEN CONCAT('No. ', 100 + n, ', Anna Nagar, Chennai')
        WHEN n % 10 = 2 THEN CONCAT('No. ', 100 + n, ', Whitefield, Bengaluru')
        WHEN n % 10 = 3 THEN CONCAT('No. ', 100 + n, ', Banjara Hills, Hyderabad')
        WHEN n % 10 = 4 THEN CONCAT('No. ', 100 + n, ', Hinjewadi, Pune')
        WHEN n % 10 = 5 THEN CONCAT('No. ', 100 + n, ', Andheri, Mumbai')
        WHEN n % 10 = 6 THEN CONCAT('No. ', 100 + n, ', Rohini, Delhi')
        WHEN n % 10 = 7 THEN CONCAT('No. ', 100 + n, ', Sector 29, Gurugram')
        WHEN n % 10 = 8 THEN CONCAT('No. ', 100 + n, ', Sector 62, Noida')
        WHEN n % 10 = 9 THEN CONCAT('No. ', 100 + n, ', Kakkanad, Kochi')
        ELSE CONCAT('No. ', 100 + n, ', RS Puram, Coimbatore')
    END AS address

FROM numbers;


USE hr_analytics;

INSERT INTO employees
(
    first_name,
    last_name,
    date_of_birth,
    gender,
    joining_date,
    department_id,
    job_role_id,
    location_id,
    employment_status,
    email,
    phone,
    address
)

WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 10
)

SELECT

    /* FIRST NAME */
    CASE
        WHEN n % 10 = 1 THEN 'Arun'
        WHEN n % 10 = 2 THEN 'Priya'
        WHEN n % 10 = 3 THEN 'Karthik'
        WHEN n % 10 = 4 THEN 'Divya'
        WHEN n % 10 = 5 THEN 'Rahul'
        WHEN n % 10 = 6 THEN 'Sneha'
        WHEN n % 10 = 7 THEN 'Vijay'
        WHEN n % 10 = 8 THEN 'Ananya'
        WHEN n % 10 = 9 THEN 'Suresh'
        ELSE 'Meena'
    END,

    /* LAST NAME */
    CASE
        WHEN n % 10 = 1 THEN 'Kumar'
        WHEN n % 10 = 2 THEN 'Sharma'
        WHEN n % 10 = 3 THEN 'Raj'
        WHEN n % 10 = 4 THEN 'Nair'
        WHEN n % 10 = 5 THEN 'Singh'
        WHEN n % 10 = 6 THEN 'Iyer'
        WHEN n % 10 = 7 THEN 'Rao'
        WHEN n % 10 = 8 THEN 'Patel'
        WHEN n % 10 = 9 THEN 'Menon'
        ELSE 'Das'
    END,

    /* DOB */
    DATE_ADD(
        '1985-01-01',
        INTERVAL ((n * 347) % 6935) DAY
    ),

    /* GENDER */
    CASE
        WHEN n % 10 IN (1,3,5,7,9) THEN 'Male'
        ELSE 'Female'
    END,

    /* JOINING DATE */
    DATE_ADD(
        '2018-01-01',
        INTERVAL ((n * 83) % 2922) DAY
    ),

    /* DEPARTMENT */
    ((n - 1) % 10) + 1,

    /* JOB ROLE */
    CASE
        WHEN ((n - 1) % 10) + 1 = 1 THEN 1
        WHEN ((n - 1) % 10) + 1 = 2 THEN 9
        WHEN ((n - 1) % 10) + 1 = 3 THEN 11
        WHEN ((n - 1) % 10) + 1 = 4 THEN 14
        WHEN ((n - 1) % 10) + 1 = 5 THEN 17
        WHEN ((n - 1) % 10) + 1 = 6 THEN 19
        WHEN ((n - 1) % 10) + 1 = 7 THEN 21
        WHEN ((n - 1) % 10) + 1 = 8 THEN 4
        WHEN ((n - 1) % 10) + 1 = 9 THEN 27
        ELSE 29
    END,

    /* LOCATION */
    ((n - 1) % 10) + 1,

    /* STATUS */
    CASE
        WHEN n % 20 BETWEEN 1 AND 16 THEN 'Active'
        WHEN n % 20 BETWEEN 17 AND 18 THEN 'On Leave'
        ELSE 'Notice Period'
    END,

    /* EMAIL */
    CONCAT(
        CASE
            WHEN n % 10 = 1 THEN 'arun'
            WHEN n % 10 = 2 THEN 'priya'
            WHEN n % 10 = 3 THEN 'karthik'
            WHEN n % 10 = 4 THEN 'divya'
            WHEN n % 10 = 5 THEN 'rahul'
            WHEN n % 10 = 6 THEN 'sneha'
            WHEN n % 10 = 7 THEN 'vijay'
            WHEN n % 10 = 8 THEN 'ananya'
            WHEN n % 10 = 9 THEN 'suresh'
            ELSE 'meena'
        END,
        '.employee',
        LPAD(n,4,'0'),
        '@company.com'
    ),

    /* PHONE */
    CAST(
        6000000000 +
        MOD((n * 7919) + 123456789, 4000000000)
        AS CHAR
    ),

    /* ADDRESS */
    CASE
        WHEN n % 10 = 1 THEN CONCAT('No. ',100+n,', Anna Nagar, Chennai')
        WHEN n % 10 = 2 THEN CONCAT('No. ',100+n,', Whitefield, Bengaluru')
        WHEN n % 10 = 3 THEN CONCAT('No. ',100+n,', Banjara Hills, Hyderabad')
        WHEN n % 10 = 4 THEN CONCAT('No. ',100+n,', Hinjewadi, Pune')
        WHEN n % 10 = 5 THEN CONCAT('No. ',100+n,', Andheri, Mumbai')
        WHEN n % 10 = 6 THEN CONCAT('No. ',100+n,', Rohini, Delhi')
        WHEN n % 10 = 7 THEN CONCAT('No. ',100+n,', Sector 29, Gurugram')
        WHEN n % 10 = 8 THEN CONCAT('No. ',100+n,', Sector 62, Noida')
        WHEN n % 10 = 9 THEN CONCAT('No. ',100+n,', Kakkanad, Kochi')
        ELSE CONCAT('No. ',100+n,', RS Puram, Coimbatore')
    END

FROM numbers;

SELECT COUNT(*) AS total_employees
FROM employees;

SELECT *
FROM employees;

SELECT
    email,
    COUNT(*) AS email_count
FROM employees
GROUP BY email
HAVING COUNT(*) > 1;

SELECT *
FROM employees
WHERE first_name IS NULL
   OR last_name IS NULL
   OR date_of_birth IS NULL
   OR gender IS NULL
   OR joining_date IS NULL
   OR department_id IS NULL
   OR job_role_id IS NULL
   OR location_id IS NULL
   OR employment_status IS NULL
   OR email IS NULL
   OR phone IS NULL
   OR address IS NULL;
   
   SELECT e.emp_id, e.department_id
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id IS NULL;
   
   SELECT e.emp_id, e.job_role_id
FROM employees e
LEFT JOIN job_roles j
    ON e.job_role_id = j.job_role_id
WHERE j.job_role_id IS NULL;

SELECT e.emp_id, e.location_id
FROM employees e
LEFT JOIN locations l
    ON e.location_id = l.location_id
WHERE l.location_id IS NULL;

#insert 490 row data 


INSERT INTO employees
(
    first_name,
    last_name,
    date_of_birth,
    gender,
    joining_date,
    department_id,
    job_role_id,
    location_id,
    employment_status,
    email,
    phone,
    address
)

WITH RECURSIVE numbers AS (
    SELECT 11 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 500
)

SELECT

    CASE
        WHEN n % 10 = 1 THEN 'Arun'
        WHEN n % 10 = 2 THEN 'Priya'
        WHEN n % 10 = 3 THEN 'Karthik'
        WHEN n % 10 = 4 THEN 'Divya'
        WHEN n % 10 = 5 THEN 'Rahul'
        WHEN n % 10 = 6 THEN 'Sneha'
        WHEN n % 10 = 7 THEN 'Vijay'
        WHEN n % 10 = 8 THEN 'Ananya'
        WHEN n % 10 = 9 THEN 'Suresh'
        ELSE 'Meena'
    END,

    CASE
        WHEN n % 10 = 1 THEN 'Kumar'
        WHEN n % 10 = 2 THEN 'Sharma'
        WHEN n % 10 = 3 THEN 'Raj'
        WHEN n % 10 = 4 THEN 'Nair'
        WHEN n % 10 = 5 THEN 'Singh'
        WHEN n % 10 = 6 THEN 'Iyer'
        WHEN n % 10 = 7 THEN 'Rao'
        WHEN n % 10 = 8 THEN 'Patel'
        WHEN n % 10 = 9 THEN 'Menon'
        ELSE 'Das'
    END,

    DATE_ADD(
        '1985-01-01',
        INTERVAL ((n * 347) % 6935) DAY
    ),

    CASE
        WHEN n % 10 IN (1,3,5,7,9) THEN 'Male'
        ELSE 'Female'
    END,

    DATE_ADD(
        '2018-01-01',
        INTERVAL ((n * 83) % 2922) DAY
    ),

    ((n - 1) % 10) + 1,

    CASE
        WHEN ((n - 1) % 10) + 1 = 1 THEN 1
        WHEN ((n - 1) % 10) + 1 = 2 THEN 9
        WHEN ((n - 1) % 10) + 1 = 3 THEN 11
        WHEN ((n - 1) % 10) + 1 = 4 THEN 14
        WHEN ((n - 1) % 10) + 1 = 5 THEN 17
        WHEN ((n - 1) % 10) + 1 = 6 THEN 19
        WHEN ((n - 1) % 10) + 1 = 7 THEN 21
        WHEN ((n - 1) % 10) + 1 = 8 THEN 4
        WHEN ((n - 1) % 10) + 1 = 9 THEN 27
        ELSE 29
    END,

    ((n - 1) % 10) + 1,

    CASE
        WHEN n % 20 BETWEEN 1 AND 16 THEN 'Active'
        WHEN n % 20 BETWEEN 17 AND 18 THEN 'On Leave'
        ELSE 'Notice Period'
    END,

    CONCAT(
        CASE
            WHEN n % 10 = 1 THEN 'arun'
            WHEN n % 10 = 2 THEN 'priya'
            WHEN n % 10 = 3 THEN 'karthik'
            WHEN n % 10 = 4 THEN 'divya'
            WHEN n % 10 = 5 THEN 'rahul'
            WHEN n % 10 = 6 THEN 'sneha'
            WHEN n % 10 = 7 THEN 'vijay'
            WHEN n % 10 = 8 THEN 'ananya'
            WHEN n % 10 = 9 THEN 'suresh'
            ELSE 'meena'
        END,
        '.employee',
        LPAD(n,4,'0'),
        '@company.com'
    ),

    CAST(
        6000000000 +
        MOD((n * 7919) + 123456789, 4000000000)
        AS CHAR
    ),

    CASE
        WHEN n % 10 = 1 THEN CONCAT('No. ',100+n,', Anna Nagar, Chennai')
        WHEN n % 10 = 2 THEN CONCAT('No. ',100+n,', Whitefield, Bengaluru')
        WHEN n % 10 = 3 THEN CONCAT('No. ',100+n,', Banjara Hills, Hyderabad')
        WHEN n % 10 = 4 THEN CONCAT('No. ',100+n,', Hinjewadi, Pune')
        WHEN n % 10 = 5 THEN CONCAT('No. ',100+n,', Andheri, Mumbai')
        WHEN n % 10 = 6 THEN CONCAT('No. ',100+n,', Rohini, Delhi')
        WHEN n % 10 = 7 THEN CONCAT('No. ',100+n,', Sector 29, Gurugram')
        WHEN n % 10 = 8 THEN CONCAT('No. ',100+n,', Sector 62, Noida')
        WHEN n % 10 = 9 THEN CONCAT('No. ',100+n,', Kakkanad, Kochi')
        ELSE CONCAT('No. ',100+n,', RS Puram, Coimbatore')
    END

FROM numbers;

select * from employees ;

SELECT COUNT(*) AS total_employees
FROM employees;

SELECT
    COUNT(*) AS total_employees,
    MIN(emp_id) AS minimum_id,
    MAX(emp_id) AS maximum_id
FROM employees;

SELECT
    e1.emp_id + 1 AS missing_id
FROM employees e1
LEFT JOIN employees e2
    ON e2.emp_id = e1.emp_id + 1
WHERE e2.emp_id IS NULL
  AND e1.emp_id < (SELECT MAX(emp_id) FROM employees);
  
  WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 505
)

SELECT
    n AS missing_emp_id
FROM numbers
LEFT JOIN employees e
    ON numbers.n = e.emp_id
WHERE e.emp_id IS NULL;
  
  SELECT
    emp_id,
    first_name,
    last_name,
    date_of_birth,
    TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age
FROM employees
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) NOT BETWEEN 18 AND 50;

SELECT
    emp_id,
    first_name,
    last_name,
    date_of_birth,
    joining_date,
    TIMESTAMPDIFF(
        YEAR,
        date_of_birth,
        joining_date
    ) AS age_at_joining
FROM employees
WHERE TIMESTAMPDIFF(
        YEAR,
        date_of_birth,
        joining_date
      ) < 18;
  
  UPDATE employees
SET date_of_birth = DATE_SUB(joining_date, INTERVAL 18 YEAR)
WHERE TIMESTAMPDIFF(
    YEAR,
    date_of_birth,
    joining_date
) < 18;

START TRANSACTION;
  
UPDATE employees
SET date_of_birth = DATE_SUB(joining_date, INTERVAL 18 YEAR)
WHERE emp_id > 0
  AND TIMESTAMPDIFF(
        YEAR,
        date_of_birth,
        joining_date
      ) < 18;
  
  SELECT
    emp_id,
    first_name,
    last_name,
    date_of_birth,
    joining_date,
    TIMESTAMPDIFF(
        YEAR,
        date_of_birth,
        joining_date
    ) AS age_at_joining
FROM employees
WHERE TIMESTAMPDIFF(
    YEAR,
    date_of_birth,
    joining_date
) < 18;
  
  SELECT COUNT(*) AS invalid_joining_age
FROM employees
WHERE TIMESTAMPDIFF(
    YEAR,
    date_of_birth,
    joining_date
) < 18;
  
  SELECT COUNT(*) AS invalid_current_age
FROM employees
WHERE TIMESTAMPDIFF(
    YEAR,
    date_of_birth,
    CURDATE()
) NOT BETWEEN 18 AND 50;

COMMIT;

SELECT
    emp_id,
    first_name,
    last_name,
    date_of_birth,
    TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age
FROM employees
ORDER BY age;
  
SELECT
    TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age,
    COUNT(*) AS employee_count
FROM employees
GROUP BY age
ORDER BY age; 

WITH RECURSIVE years AS (
    SELECT 2022 AS salary_year

    UNION ALL

    SELECT salary_year + 1
    FROM years
    WHERE salary_year < 2026
)

SELECT
    1 AS emp_id,
    salary_year,
    CONCAT(salary_year, '-01-01') AS effective_date
FROM years;

WITH RECURSIVE years AS (
    SELECT 2022 AS salary_year

    UNION ALL

    SELECT salary_year + 1
    FROM years
    WHERE salary_year < 2026
)

SELECT
    1 AS emp_id,
    CONCAT(salary_year, '-01-01') AS effective_date,

    30000 AS base_salary,

    (salary_year - 2022) * 3000 AS increment_amount,

    5000 AS bonus,

    2000 AS allowance,

    1000 AS deduction,

    30000
      + ((salary_year - 2022) * 3000)
      + 5000
      + 2000
      - 1000 AS net_salary

FROM years;

DESCRIBE salary_history;
USE hr_analytics;

SELECT COUNT(*) AS total_salary_records
FROM salary_history;

INSERT INTO salary_history (
    emp_id,
    effective_date,
    base_salary,
    increment_amount,
    bonus,
    allowance,
    deduction
)
SELECT
    emp_id,
    joining_date,
    30000,
    0,
    5000,
    2000,
    1000
FROM employees;


SELECT COUNT(*) AS total_salary_records
FROM salary_history;

SELECT *
FROM salary_history
LIMIT 10;


SELECT
    salary_id,
    emp_id,
    base_salary,
    increment_amount,
    bonus,
    allowance,
    deduction,
    (
        base_salary
        + increment_amount
        + bonus
        + allowance
        - deduction
    ) AS net_salary
FROM salary_history;


WITH RECURSIVE years AS (
    SELECT 2022 AS salary_year

    UNION ALL

    SELECT salary_year + 1
    FROM years
    WHERE salary_year < 2026
)
SELECT
    salary_year,
    30000 AS base_salary,
    (salary_year - 2022) * 3000 AS increment_amount,
    5000 AS bonus,
    2000 AS allowance,
    1000 AS deduction,
    (
        30000
        + (salary_year - 2022) * 3000
        + 5000
        + 2000
        - 1000
    ) AS net_salary
FROM years;


SELECT
    e.emp_id,
    e.first_name,
    e.last_name,
    d.department_name,
    s.effective_date,
    s.base_salary,
    s.increment_amount,
    s.bonus,
    s.allowance,
    s.deduction,
    (
        s.base_salary
        + s.increment_amount
        + s.bonus
        + s.allowance
        - s.deduction
    ) AS net_salary
FROM employees e
JOIN salary_history s
    ON e.emp_id = s.emp_id
JOIN departments d
    ON e.department_id = d.department_id
ORDER BY e.emp_id;


SELECT
    d.department_name,
    COUNT(e.emp_id) AS total_employees,
    ROUND(AVG(
        s.base_salary
        + s.increment_amount
        + s.bonus
        + s.allowance
        - s.deduction
    ), 2) AS average_net_salary,
    MAX(
        s.base_salary
        + s.increment_amount
        + s.bonus
        + s.allowance
        - s.deduction
    ) AS highest_net_salary
FROM departments d
JOIN employees e
    ON d.department_id = e.department_id
JOIN salary_history s
    ON e.emp_id = s.emp_id
GROUP BY d.department_id, d.department_name
ORDER BY average_net_salary DESC;


SELECT
    e.emp_id,
    e.first_name,
    e.last_name,
    d.department_name,
    s.base_salary,
    s.increment_amount,
    s.bonus,
    s.allowance,
    s.deduction,
    (
        s.base_salary
        + s.increment_amount
        + s.bonus
        + s.allowance
        - s.deduction
    ) AS net_salary
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN salary_history s
    ON e.emp_id = s.emp_id
ORDER BY net_salary DESC, e.emp_id
LIMIT 10;


USE hr_analytics;

SELECT
    e.emp_id,
    e.first_name,
    e.last_name,
    d.department_name,
    (
        s.base_salary
        + s.increment_amount
        + s.bonus
        + s.allowance
        - s.deduction
    ) AS net_salary
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN salary_history s
    ON e.emp_id = s.emp_id
WHERE (
    s.base_salary
    + s.increment_amount
    + s.bonus
    + s.allowance
    - s.deduction
) > 40000
ORDER BY net_salary DESC;


SELECT
    emp_id,
    first_name,
    last_name,
    30000 + (emp_id % 10) * 2000 AS proposed_base_salary
FROM employees
ORDER BY emp_id
LIMIT 20;

START TRANSACTION;

UPDATE salary_history
SET base_salary = 30000 + (emp_id % 10) * 2000
WHERE emp_id BETWEEN 1 AND 505;


SELECT
    emp_id,
    base_salary,
    increment_amount,
    bonus,
    allowance,
    deduction,
    base_salary + increment_amount
        + bonus + allowance - deduction AS net_salary
FROM salary_history
ORDER BY emp_id
LIMIT 20;

SELECT
    COUNT(*) AS total_records,
    MIN(base_salary) AS minimum_salary,
    MAX(base_salary) AS maximum_salary,
    AVG(base_salary) AS average_salary
FROM salary_history;

SELECT
    emp_id,
    effective_date,
    base_salary,
    increment_amount,
    base_salary + increment_amount
        + bonus + allowance - deduction AS net_salary
FROM salary_history
WHERE increment_amount > 0
ORDER BY increment_amount DESC, emp_id
LIMIT 20;

SELECT
    increment_amount,
    COUNT(*) AS employee_count
FROM salary_history
GROUP BY increment_amount
ORDER BY increment_amount;

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT emp_id) AS employees,
    COUNT(DISTINCT effective_date) AS effective_dates,
    MIN(base_salary) AS min_salary,
    MAX(base_salary) AS max_salary
FROM salary_history;

SELECT
    d.department_name,
    COUNT(DISTINCT e.emp_id) AS total_employees,
    SUM(
        s.base_salary
        + s.increment_amount
        + s.bonus
        + s.allowance
        - s.deduction
    ) AS total_net_salary,
    ROUND(
        AVG(
            s.base_salary
            + s.increment_amount
            + s.bonus
            + s.allowance
            - s.deduction
        ), 2
    ) AS average_net_salary
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN salary_history s
    ON e.emp_id = s.emp_id
GROUP BY d.department_id, d.department_name
ORDER BY total_net_salary DESC;

SELECT
    d.department_name,
    COUNT(e.emp_id) AS total_employees
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name
ORDER BY total_employees DESC;

SELECT department_id, department_name
FROM departments
ORDER BY department_id;


SELECT
    d.department_id,
    d.department_name,
    COUNT(e.emp_id) AS total_employees
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name
ORDER BY total_employees DESC;


SELECT
    department_id,
    COUNT(*) AS total_employees
FROM employees
GROUP BY department_id
ORDER BY department_id;



SELECT
    emp_id,
    first_name,
    last_name,
    department_id
FROM employees
ORDER BY emp_id;


SELECT 'employees' AS table_name, COUNT(*) AS total_records
FROM employees

UNION ALL

SELECT 'departments', COUNT(*)
FROM departments

UNION ALL

SELECT 'salary_history', COUNT(*)
FROM salary_history;


SELECT emp_id, COUNT(*) AS duplicate_count
FROM employees
GROUP BY emp_id
HAVING COUNT(*) > 1;


SELECT COUNT(*) AS incomplete_records
FROM employees
WHERE first_name IS NULL
   OR last_name IS NULL
   OR date_of_birth IS NULL
   OR joining_date IS NULL
   OR department_id IS NULL
   OR job_role_id IS NULL
   OR location_id IS NULL;
   
   
SELECT e.emp_id, e.department_id
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id IS NULL;


SELECT emp_id, COUNT(*) AS salary_records
FROM salary_history
GROUP BY emp_id
HAVING COUNT(*) > 1;


SELECT
    emp_id,
    first_name,
    last_name,
    date_of_birth,
    joining_date
FROM employees
WHERE date_of_birth >= joining_date
   OR joining_date > CURDATE();


SELECT
    emp_id,
    first_name,
    last_name,
    TIMESTAMPDIFF(
        YEAR,
        date_of_birth,
        joining_date
    ) AS age_at_joining
FROM employees
WHERE TIMESTAMPDIFF(
    YEAR,
    date_of_birth,
    joining_date
) NOT BETWEEN 18 AND 50;


SELECT
    e.emp_id,
    e.job_role_id
FROM employees e
LEFT JOIN job_roles j
    ON e.job_role_id = j.job_role_id
WHERE j.job_role_id IS NULL;


SELECT
    e.emp_id,
    e.location_id
FROM employees e
LEFT JOIN locations l
    ON e.location_id = l.location_id
WHERE l.location_id IS NULL;




