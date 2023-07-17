/* n1
   найти и вывести на экран название продуктов и название категорий товаров, к которым относится этот продукт,
   с учетом того, что в выборку попадут только товары с цветом Red и ценой не менее 100
 */
SELECT p.Name, pc.Name
FROM Production.Product as p
    JOIN Production.ProductSubcategory as psc
        ON p.ProductSubcategoryID = psc.ProductSubcategoryID
    JOIN Production.ProductCategory as pc
        ON psc.ProductCategoryID = pc.ProductCategoryID
WHERE p.Color = 'Red' and p.ListPrice >= 100

/* n2
   вывести на экран названия подкатегорий с совпадающими именами
 */
SELECT psc1.Name
FROM Production.ProductSubcategory as psc1
    JOIN Production.ProductSubcategory as psc2
        ON psc1.ProductSubcategoryID != psc2.ProductSubcategoryID and psc1.Name = psc2.Name

/* n2.2
   вывести на экран названия подкатегорий с совпадающими именами
 */
SELECT psc.Name
FROM Production.ProductSubcategory as psc
GROUP BY ProductSubcategoryID, Name
HAVING count(*) > 1

/* n3
   вывести на экран названия категорий и количество товаров в данной категории
 */
SELECT pc.Name, count(*)
FROM Production.Product as p
    JOIN Production.ProductSubcategory as psc
        ON p.ProductSubcategoryID = psc.ProductSubcategoryID
    JOIN Production.ProductCategory as pc
        ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name

/* n4
   вывести на экран название подкатегории, а также количество товаров в данной подкатегории с учетом ситуации,
   что могут существовать подкатегории с одинаковыми именами
 */
SELECT distinct psc.Name, count(*)
FROM Production.Product as p
    JOIN Production.ProductSubcategory as psc
        ON p.ProductSubcategoryID = psc.ProductSubcategoryID
GROUP BY psc.Name

/* n5
   вывести на экран название первых трех подкатегорий с наибольшим количеством товаров
 */
SELECT top 3 psc.Name
FROM Production.Product as p
    JOIN Production.ProductSubcategory as psc
        ON p.ProductSubcategoryID = psc.ProductSubcategoryID
GROUP BY psc.Name
ORDER BY count(*) desc

/* n6
   вывести на экран название подкатегории и максимальную цену продукта с цветом Red в этой подкатегории
 */
SELECT psc.Name, max(ListPrice)
FROM Production.Product as p
    JOIN Production.ProductSubcategory as psc
        ON p.ProductSubcategoryID = psc.ProductSubcategoryID
WHERE p.Color = 'Red'
GROUP BY psc.Name

/* n7
   вывести на экран название поставщика и количество товаров, которые он поставляет
 */
SELECT v.Name, count(*)
FROM Purchasing.Vendor as v
    JOIN Purchasing.ProductVendor as pv
        ON v.BusinessEntityID = pv.BusinessEntityID
    JOIN Production.Product as p
        ON pv.ProductID = p.ProductID
GROUP BY v.Name

/* n8
   вывести на экран название товаров, которые поставляются более чем одним поставщиком
 */
SELECT p.Name
FROM Purchasing.ProductVendor as pv
    JOIN Production.Product as p
        ON pv.ProductID = p.ProductID
GROUP BY p.Name
HAVING count(*) > 1

/* n9
   вывести на экран название самого продаваемого товара
 */
SELECT top 1 p.Name, count(*)
FROM Purchasing.ProductVendor as pv
    JOIN Production.Product as p
        ON pv.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY count(*) desc

/* n10
   вывести на экран название категории, товары из которой продаются наиболее активно
 */
SELECT top 1 pc.Name
FROM Production.Product as p
    JOIN Production.ProductSubcategory as psc
        ON p.ProductSubcategoryID = psc.ProductSubcategoryID
    JOIN Production.ProductCategory as pc
        ON psc.ProductCategoryID = pc.ProductCategoryID
    JOIN Purchasing.ProductVendor as pv
        ON p.ProductID = pv.ProductID
GROUP BY pc.Name
ORDER BY count(*) desc

/* n11
   вывести на экран названия категорий, количество подкатегорий и количество товаров в них
 */
SELECT pc.Name, count(distinct psc.ProductSubcategoryID), count(p.ProductID)
FROM Production.Product as p
    JOIN Production.ProductSubcategory as psc
        ON p.ProductSubcategoryID = psc.ProductSubcategoryID
    JOIN Production.ProductCategory as pc
        ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name

/* n12
   вывести на экран номер кредитного рейтинга и количество товаров, поставляемых компаниями,
   имеющими этот кредитный рейтинг
 */
SELECT CreditRating, count(ProductID)
FROM Purchasing.ProductVendor as pv
    JOIN Purchasing.Vendor as v
        ON pv.BusinessEntityID = v.BusinessEntityID
GROUP BY CreditRating

SELECT p.Name, pc.Name
FROM Production.Product as p
    JOIN Production.ProductSubcategory as psc
        ON p.ProductSubcategoryID = psc.ProductSubcategoryID
    JOIN Production.ProductCategory as pc
        ON psc.ProductCategoryID = pc.ProductCategoryID
    JOIN Sales.SalesOrderDetail as sod
        ON p.ProductID = sod.ProductID
WHERE Color = 'Blue'
GROUP BY p.Name, pc.Name
HAVING count(*) = 2

