-- Creating the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE,
    DepartmentID INT,
    HireDate DATE,
    Salary DECIMAL(10, 2)
);

-- Creating the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(100)
);


-- Inserting data into the Employees table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, DepartmentID, HireDate, Salary)
VALUES 
(1, 'John', 'Smith', 'john.smith@example.com', 101, '2021-06-15', 75000.00),
(2, 'Jane', 'Doe', 'jane.doe@example.com', 102, '2020-03-10', 85000.00),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', 101, '2019-11-22', 95000.00),
(4, 'Emily', 'Davis', 'emily.davis@example.com', 103, '2022-01-05', 68000.00),
(5, 'William', 'Brown', 'william.brown@example.com', 102, '2018-07-19', 80000.00);

-- Inserting data into the Departments table
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(101, 'Human Resources'),
(102, 'Finance'),
(103, 'IT');

select * from Departments
select * from Employees

select e.FirstName,e.LastName,d.DepartmentName from Employees e
inner join Departments d
on e.DepartmentID=d.DepartmentID


select * from Employees e
left join Departments d
on e.DepartmentID=d.DepartmentID
where d.DepartmentID is null

select * from Departments y
left join Employees x
on x.DepartmentID = y.DepartmentID


select * from Employees where DepartmentID in
(select DepartmentID from Employees
where firstName='Jane' and LastName='Doe')

--
select * from Employees e1
inner join Employees e2
on e1.DepartmentID = e2.DepartmentID
where e1.FirstName='Jane' and e1.LastName='Doe'

select top 1 DepartmentID, sum(Salary) as TotalSalary
from Employees
group by DepartmentID
order by sum(Salary) desc