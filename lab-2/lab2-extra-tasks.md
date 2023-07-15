### n1
#### найти все товары (их ProductId), которые были куплены более чем на 3 чека
##### (т. к. в каждом чеке product id - уникальны) 
```sql
SELECT ProductId
FROM Sales.SalesOrderDetail
GROUP BY ProductId
HAVING count(*) > 3
```

### n2
#### найти все цвета товаров, такие что товаров данного цвета не менее 2 и не более 5 в данном магазине 
```sql
SELECT Color
FROM Sales.SalesOrderDetail
WHERE Color is not null
GROUP BY Color
HAVING count(*) between 2 and 5
```

### n3
#### найти номера подкатегорий товаров, таких что существует не менее двух товаров с цветом RED в этой подкатегории 
```sql
SELECT ProductSubcategoryID
FROM Production.Product
WHERE Color = 'Red' and ProductSubcategoryID is not null
GROUP BY ProductSubcategoryID
HAVING count(*) >= 2
```

### n4
#### найти товары, которые были куплены более 3 раз, при этом цена товара была более 100 
```sql
SELECT ProductID
FROM Sales.SalesOrderDetail
WHERE LineTotal > 100
GROUP BY ProductID
HAVING count(*) > 3
```

### n5
#### вывести на экран список размеров товаров, отсортированный по убыванию количества красных товаров этого размера 
```sql
SELECT Size
FROM Production.Product
WHERE Color = 'Red' and Size is not null
GROUP BY Size
ORDER BY count(*) desc
```

### n6
#### найти все размеры товаров, таких что товаров этого размера более 10 
```sql
SELECT Size
FROM Production.Product
WHERE Size is not null
GROUP BY Size
HAVING count(*) > 10
```

### n7
#### найти самый продаваемый товар (его ProductId) из числа тех, чья цена продажи (UnitPrice) не превышает 100 
```sql
SELECT top 1 with ties ProductID
FROM Sales.SalesOrderDetail
WHERE UnitPrice <= 100
GROUP BY ProductID
ORDER BY count(*) desc
```

### n8
#### найти номер подкатегории товаров с наибольшим разнообразием товаров в ней 
```sql
SELECT top 1 with ties ProductSubcategoryID
FROM Production.Product
WHERE ProductSubcategoryID is not null
GROUP BY ProductSubcategoryID
ORDER BY count(*) desc
```

### n9
#### найти список товаров (ProductId), которые продавались на один чек в количестве OrderQty,менее 3 штук за раз и при этом были куплены более чем на 3 разных чека 
```sql
SELECT ProductId
FROM Sales.SalesOrderDetail
WHERE OrderQty < 3
GROUP BY ProductId
HAVING count(*) > 3
```

### n10
#### вывести на экран список номеров категорий (ProductCategoryID) с наибольшим количеством подкатегорий 
```sql
SELECT top 1 with ties ProductCategoryID
FROM Production.ProductSubcategory
WHERE ProductSubcategoryID is not null
GROUP BY ProductCategoryID
ORDER BY count(*) desc
```

### n11
#### вывести номера подкатегорий (ProductSubcategoryID), на которые приходится более 5 товаров 
```sql
SELECT ProductSubcategoryID
FROM Production.Product
WHERE ProductSubcategoryID is not null
GROUP BY ProductSubcategoryID
HAVING count(*) > 5
```

### n12
#### вывести номера подкатегорий (ProductSubcategoryID), на которые приходится более 5 товаров с цветом RED 
```sql
SELECT ProductSubcategoryID
FROM Production.Product
WHERE Color = 'Red' and ProductSubcategoryID is not null
HAVING count(*) > 5
```






