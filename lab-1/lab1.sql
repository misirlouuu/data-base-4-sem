/* n1 */
SELECT Name, Color, Size
FROM Production.Product

/* n2 */
SELECT Name, Color, Size
FROM Production.Product
WHERE ListPrice > 100

/* n3 */
SELECT Name, Color, Size
FROM Production.Product
WHERE ListPrice < 100 AND Color = 'Black'

/* n4 */
SELECT Name, Color, Size
FROM Production.Product
WHERE ListPrice < 100 AND Color = 'Black'
ORDER BY ListPrice ASC

/* n5 */
SELECT TOP 3 WITH TIES Name, Size
FROM Production.Product
ORDER BY ListPrice DESC

/* n6 */
SELECT Name, Color
FROM Production.Product
WHERE Color IS NOT NULL AND Size IS NOT NULL

/* n7 */
SELECT DISTINCT Color
FROM Production.Product
WHERE ListPrice BETWEEN 10 AND 50

/* n8 */
SELECT Color
FROM Production.Product
WHERE Name LIKE 'L_N%'

/* n9 */
SELECT Name
FROM Production.Product
WHERE Name LIKE '[DM]%' AND len(Name) > 3

/* n10 */
SELECT Name
FROM Production.Product
WHERE datepart(YEAR, SellStartDate) <= 2012

/* n11 */
SELECT Name
FROM Production.ProductSubcategory

/* n12 */
SELECT Name
FROM Production.ProductCategory

/* n13 */
SELECT FirstName
FROM Person.Person
WHERE Title = 'Mr.'

/* n14 */
SELECT FirstName
FROM Person.Person
WHERE Title IS NULL

SELECT Name
FROM Production.Product
WHERE ProductSubcategoryID = 1 OR ProductSubcategoryID = 3

