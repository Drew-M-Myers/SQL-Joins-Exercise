/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT P.NAME AS ProductName, C.NAME AS CategoryName
FROM products AS P
INNER JOIN categories AS C ON C.CategoryID = P.CategoryID
WHERE C.NAME = 'Computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT products.NAME, products.Price, reviews.Rating
 FROM products
 INNER JOIN reviews ON reviews.ProductID = products.ProductID
 WHERE reviews.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
-- Employee ID is shared part and want employee with most sold. 
SELECT employees.EmployeeID, employees.FirstName, employees.LastName, sum(sales.Quantity) AS Total
FROM employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID
ORDER BY Total DESC
LIMIT 5;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.NAME, categories.NAME, categories.CategoryID
FROM departments
INNER JOIN categories ON departments.DepartmentID = categories.DepartmentID
WHERE categories.NAME = 'Appliances' OR categories.NAME = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name, sum(sales.Quantity * sales.PricePerUnit) as TotalPrice, sum(sales.Quantity) as TotalSold
FROM  products
INNER JOIN sales ON products.ProductID = sales.ProductID
WHERE products.ProductID = 97;

-- To Verif
SELECT * FROM sales WHERE productID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.NAME, reviews.Reviewer, reviews.Rating, reviews.Comment
FROM products
INNER JOIN reviews ON products.ProductID = reviews.ProductID
WHERE products.NAME = 'Visio TV' and reviews.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT E.EmployeeID, E.FirstName, E.LastName, P.NAME, SUM(S.Quantity) as TotalSold
FROM sales as S
INNER JOIN employees AS E ON E.EmployeeID = S.EmployeeID
INNER JOIN products AS P ON P.ProductID = S.ProductID
GROUP BY E.EmployeeID, P.ProductID
ORDER BY E.FirstName;
