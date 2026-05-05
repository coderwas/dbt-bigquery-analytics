WITH
    employees as (
        SELECT 
            employeeNumber AS employee_number,
            firstName AS first_name,
            lastName AS last_name,
            jobTitle AS job_title,
            officeCode AS office_id,
            extension,
            email,
            reportsTo AS reports_to
            
            
        FROM
        {{ source('mysql', 'employees') }}

    )

SELECT * FROM employees