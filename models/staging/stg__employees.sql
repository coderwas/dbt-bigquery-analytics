WITH
    employees as (
        SELECT 
            employeeNumber AS employee_id,
            firstName AS first_name,
            lastName AS last_name,
            jobTitle AS job_title,
            officeCode AS office_id,
            extension,
            email,
            reportsTo AS manager_id
            
            
        FROM
        {{ source('mysql', 'employees') }}

    )

SELECT * FROM employees