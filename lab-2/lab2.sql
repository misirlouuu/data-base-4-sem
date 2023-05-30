/* n1 */
SELECT Color
FROM Production.Product
WHERE ListPrice > 30
GROUP BY Color

/* n2 */
SELECT Color
FROM Production.Product
GROUP BY Color
HAVING min(ListPrice) > 100

/* n3 */
SELECT ProductSubcategoryID, COUNT(*) AS ProductCount
FROM Production.Product
GROUP BY ProductSubcategoryID

/* n4 */
SELECT ProductID, COUNT(*) AS SelledProductCount
FROM Sales.SalesOrderDetail
GROUP BY ProductID

/* n5 */
SELECT ProductID, COUNT(*)
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING COUNT(*) > 5

/* n6 */
SELECT CustomerID, OrderDate
FROM Sales.SalesOrderHeader
GROUP BY CustomerID, OrderDate
HAVING COUNT(*) > 1

/* n7 если кол-во товаров в чеке больше 3ёх */
SELECT DISTINCT SalesOrderID
FROM Sales.SalesOrderDetail
WHERE OrderQty > 3

/* n7.2 если сам чек встречается более 3ёх раз*/
SELECT SalesOrderID
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING COUNT(*) > 3

/* n8 */
SELECT ProductID
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING COUNT(*) > 3

/* n9 */
SELECT ProductID
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING COUNT(*) = 3 OR COUNT(*) = 5

/* n10 */
SELECT ProductSubcategoryID
FROM Production.Product
GROUP BY ProductSubcategoryID
HAVING COUNT(*) > 10

/* n11 */
SELECT ProductID
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING max(OrderQty) = 1

/* n12 (т.к. гарантируется, что в одном чеке product id уникальны) */
SELECT TOP 1 SalesOrderID
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY COUNT(*) DESC

/* n13 (чеки с одинаковой суммой покупки "склеятся", но это не помешает найти max */
SELECT TOP 1 SalesOrderID
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID, UnitPrice * OrderQty
ORDER BY UnitPrice * OrderQty DESC

/* n13.2 line total - общая цена с учётом скидки */
SELECT TOP 1 SalesOrderID
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID, LineTotal
ORDER BY LineTotal DESC

/* n14 */
SELECT ProductSubcategoryID, COUNT(*) AS ProductCount
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL AND Color IS NOT NULL
GROUP BY ProductSubcategoryID

/* n15 */
SELECT Color, COUNT(*) AS ProductCount
FROM Production.Product
GROUP BY Color
ORDER BY COUNT(*) DESC

/* n16 */
SELECT ProductID
FROM Sales.SalesOrderDetail
WHERE OrderQty > 1
GROUP BY ProductID
HAVING COUNT(*) > 2

SELECT Size
FROM Production.Product
WHERE Size IS NOT NULL
GROUP BY Size
HAVING COUNT(*) > 10









