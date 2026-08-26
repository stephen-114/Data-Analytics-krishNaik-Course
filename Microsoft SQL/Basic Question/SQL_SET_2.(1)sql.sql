CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE,
    DepartmentID INT,
    HireDate DATE,
    Salary DECIMAL(10, 2)
);


INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, DepartmentID, HireDate, Salary)
VALUES 
(1, 'John', 'Smith', 'john.smith@example.com', 101, '2021-06-15', 75000.00),
(2, 'Jane', 'Doe', 'jane.doe@example.com', 102, '2020-03-10', 85000.00),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', 101, '2019-11-22', 95000.00),
(4, 'Emily', 'Davis', 'emily.davis@example.com', 103, '2022-01-05', 68000.00),
(5, 'William', 'Brown', 'william.brown@example.com', 102, '2018-07-19', 80000.00);


select * from Employees
where salary>(
select  avg(salary) [avg_salary] from Employees
) 

select FirstName, LastName, DepartmentID
from Employees 
where HireDate > (select min(HireDate) from Employees)

select * from Employees where salary = (select max(salary) from Employees)

select * from Employees
where DepartmentID in
(
select DepartmentID from Employees
where FirstNAme='john' and LastName='Smith'
)

select FirstName, LastName, DepartmentID
from Employees
where DepartmentID <> (
    select top 1 DepartmentID
    from Employees
    group by DepartmentID
    order by AVG(Salary) desc
)
