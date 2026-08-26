
--Step 1) Create Table
CREATE TABLE EmployeeSales (
    SaleID INT PRIMARY KEY,
    EmployeeID INT,
    Department VARCHAR(50),
    SaleAmount DECIMAL(10, 2),
    SaleDate DATE
);

--Step 2) Insert records into the table
INSERT INTO EmployeeSales (SaleID, EmployeeID, Department, SaleAmount, SaleDate)
VALUES 
(1, 101, 'Electronics', 500.00, '2023-08-01'),
(2, 102, 'Electronics', 300.00, '2023-08-03'),
(3, 101, 'Furniture', 150.00, '2023-08-02'),
(4, 103, 'Electronics', 250.00, '2023-08-04'),
(5, 104, 'Furniture', 200.00, '2023-08-02'),
(6, 101, 'Furniture', 450.00, '2023-08-05'),
(7, 102, 'Electronics', 700.00, '2023-08-05'),
(8, 103, 'Furniture', 100.00, '2023-08-06');


--***********************************************************************************
--Column Definitions

--SaleID (INT PRIMARY KEY): Unique identifier for each sale.
--EmployeeID (INT): Identifier for the employee who made the sale.
--Department (VARCHAR(50)): Name of the department where the sale was made.
--SaleAmount (DECIMAL(10, 2)): Total amount of the sale.
--SaleDate (DATE): Date when the sale occurred.
----***********************************************************************************
select * from employeeSales

--1) 
select EmployeeID,sum(SaleAmount) [sales per each employee] from employeesales
group by EmployeeID

select EmployeeID,count(SaleAmount) [count per each employee]from employeesales
group by EmployeeID


select EmployeeID,AVG(SaleAmount) [average per each employee]from employeesales
group by EmployeeID

select EmployeeID, sum(SaleAmount) [total per each employee]
from employeesales
where EmployeeID > 1
group by EmployeeID

select * from employeeSales

select MONTH(SaleDate) [Month], sum(SaleAmount) [Total Sales]
from employeeSales
where YEAR(SaleDate) = 2023
group by MONTH(SaleDate)
order by MONTH(SaleDate)
