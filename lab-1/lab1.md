### n1
```sql
SELECT Name, Color, Size
FROM Production.Product
```

### n2
```sql
SELECT Name, Color, Size
FROM Production.Product
WHERE ListPrice > 100
```

### n3
```sql
SELECT Name, Color, Size
FROM Production.Product
WHERE ListPrice < 100 AND Color = 'Black'
```

### n4 
```sql
SELECT Name, Color, Size
FROM Production.Product
WHERE ListPrice < 100 AND Color = 'Black'
ORDER BY ListPrice ASC
```

### n5
```sql
SELECT TOP 3 WITH TIES Name, Size
FROM Production.Product
ORDER BY ListPrice DESC
```

### n6
```sql
SELECT Name, Color
FROM Production.Product
WHERE Color IS NOT NULL AND Size IS NOT NULL
```

### n7
```sql
SELECT DISTINCT Color
FROM Production.Product
WHERE ListPrice BETWEEN 10 AND 50
```

### n8
```sql
SELECT Color
FROM Production.Product
WHERE Name LIKE 'L_N%'
```

### n9
```sql
SELECT Name
FROM Production.Product
WHERE Name LIKE '[DM]%' AND len(Name) > 3
```

### n10
```sql
SELECT Name
FROM Production.Product
WHERE datepart(YEAR, SellStartDate) <= 2012
```

### n11
```sql
SELECT Name
FROM Production.ProductSubcategory
```

### n12 
```sql
SELECT Name
FROM Production.ProductCategory
```

### n13
```sql
SELECT FirstName
FROM Person.Person
WHERE Title = 'Mr.'
```

### n14 
```sql
SELECT FirstName
FROM Person.Person
WHERE Title IS NULL

SELECT Name
FROM Production.Product
WHERE ProductSubcategoryID = 1 OR ProductSubcategoryID = 3
```
