-- Load outlet dataset
SELECT TOP 10 *
FROM Retail..Outlet;

-- Load sales dataset
SELECT TOP 10 *
FROM Retail..Sales;

-- Load product dataset
SELECT TOP 10 *
FROM Retail..Product;

-- Looking total outlet type
SELECT COUNT(DISTINCT OutletType) AS total_outlet_type
FROM Retail..Outlet;

-- Looking differences of outlet type
SELECT DISTINCT
	   OutletType
FROM Retail..Outlet;

-- Looking outlet type count
SELECT OutletType,
	   COUNT(OutletID) AS outlet_type_count
FROM Retail..Outlet
GROUP BY OutletType
ORDER BY outlet_type_count DESC;

-- Looking total outlet size
SELECT COUNT(DISTINCT OutletSize) AS total_outlet_size
FROM Retail..Outlet;

-- Looking differences of outlet size
SELECT DISTINCT
	   OutletSize
FROM Retail..Outlet;

-- Looking outlet size count
SELECT OutletSize, 
       COUNT(OutletID) AS outlet_size_count
FROM Retail..Outlet
GROUP BY OutletSize
ORDER BY outlet_size_count DESC;

-- Looking total fat content
SELECT COUNT(DISTINCT FatContent) AS total_fat_content
FROM Retail..Sales;

-- Looking differences of fat content
SELECT DISTINCT
	   FatContent
FROM Retail..Sales;

-- Looking fat content count
SELECT FatContent, 
       COUNT(ProductID) AS fat_content_count
FROM Retail..Sales
WHERE FatContent NOT IN('LF', 'reg')
GROUP BY FatContent
ORDER BY fat_content_count DESC;

-- Looking total location type
SELECT COUNT(DISTINCT LocationType) AS total_location_type
FROM Retail..Sales;

-- Looking differences of location type
SELECT DISTINCT 
	   LocationType
FROM Retail..Sales;

-- Looking location type count
SELECT LocationType,
	   COUNT(OutletID) AS location_type_count
FROM Retail..Sales
GROUP BY LocationType
ORDER BY location_type_count DESC;

-- Looking total product type
SELECT COUNT(DISTINCT ProductType) AS total_product_type
FROM Retail..Product;

-- Looking differences of product type
SELECT DISTINCT
	   ProductType
FROM Retail..Product;

-- Looking product type count
SELECT ProductType,
	   COUNT(ProductID) AS product_type_count
FROM Retail..Product
GROUP BY ProductType
ORDER BY product_type_count DESC;

-- Looking growth sales percentage and average sales based on outlet type on supermarket type1
SELECT prod.ProductType, 
       sls.FatContent, 
	   sls.LocationType,
       out.OutletSize, 
       ROUND(SUM(sls.Sales) / SUM(sls.MRP), 2) AS [sales growth (%)], 
       ROUND(AVG(sls.Sales), 2) AS avg_sales
FROM Retail..Product prod
     INNER JOIN Retail..Sales sls ON prod.ProductID = sls.ProductID
     INNER JOIN Retail..Outlet out ON sls.OutletID = out.OutletID
WHERE OutletType = 'Supermarket Type1'
      AND FatContent NOT IN('LF', 'reg')
GROUP BY ProductType,
		 LocationType,
         FatContent, 
         OutletSize
ORDER BY avg_sales DESC;

-- Looking growth sales percentage and average sales based on outlet type on supermarket type2
SELECT prod.ProductType, 
       sls.FatContent, 
	   sls.LocationType,
       out.OutletSize, 
       ROUND(SUM(sls.Sales) / SUM(sls.MRP), 2) AS [sales growth (%)], 
       ROUND(AVG(sls.Sales), 2) AS avg_sales
FROM Retail..Product prod
     INNER JOIN Retail..Sales sls ON prod.ProductID = sls.ProductID
     INNER JOIN Retail..Outlet out ON sls.OutletID = out.OutletID
WHERE OutletType = 'Supermarket Type2'
      AND FatContent NOT IN('LF', 'reg')
GROUP BY ProductType,
		 LocationType,
         FatContent, 
         OutletSize
ORDER BY avg_sales DESC;

-- Looking growth sales percentage and average sales based on outlet type on supermarket type3
SELECT prod.ProductType, 
       sls.FatContent, 
	   sls.LocationType,
       out.OutletSize, 
       ROUND(SUM(sls.Sales) / SUM(sls.MRP), 2) AS [sales growth (%)], 
       ROUND(AVG(sls.Sales), 2) AS avg_sales
FROM Retail..Product prod
     INNER JOIN Retail..Sales sls ON prod.ProductID = sls.ProductID
     INNER JOIN Retail..Outlet out ON sls.OutletID = out.OutletID
WHERE OutletType = 'Supermarket Type3'
      AND FatContent NOT IN('LF', 'reg')
GROUP BY ProductType, 
	     LocationType,
         FatContent, 
         OutletSize
ORDER BY avg_sales DESC;

-- Looking growth sales percentage and average sales based on outlet type on grocery store
SELECT prod.ProductType, 
       sls.FatContent,
	   sls.LocationType,
       out.OutletSize, 
       ROUND(SUM(sls.Sales) / SUM(sls.MRP), 2) AS [sales growth (%)], 
       ROUND(AVG(sls.Sales), 2) AS avg_sales
FROM Retail..Product prod
     INNER JOIN Retail..Sales sls ON prod.ProductID = sls.ProductID
     INNER JOIN Retail..Outlet out ON sls.OutletID = out.OutletID
WHERE OutletType = 'Grocery Store'
      AND FatContent NOT IN('LF', 'reg')
GROUP BY ProductType, 
		 LocationType,
         FatContent, 
         OutletSize
ORDER BY avg_sales DESC;

-- Looking growth sales percentage and average sales based on outlet size on small
SELECT prod.ProductType, 
       sls.FatContent,
	   sls.LocationType,
       out.OutletType, 
       ROUND(SUM(sls.Sales) / SUM(sls.MRP), 2) AS [sales growth (%)], 
       ROUND(AVG(sls.Sales), 2) AS avg_sales
FROM Retail..Product prod
     INNER JOIN Retail..Sales sls ON prod.ProductID = sls.ProductID
     INNER JOIN Retail..Outlet out ON sls.OutletID = out.OutletID
WHERE OutletSize = 'Small'
      AND FatContent NOT IN('LF', 'reg')
GROUP BY ProductType, 
	     LocationType,
         FatContent, 
         OutletType
ORDER BY avg_sales DESC;

-- Looking growth sales percentage and average sales based on outlet size on medium
SELECT prod.ProductType, 
       sls.FatContent,
	   sls.LocationType,
       out.OutletType, 
       ROUND(SUM(sls.Sales) / SUM(sls.MRP), 2) AS [sales growth (%)], 
       ROUND(AVG(sls.Sales), 2) AS avg_sales
FROM Retail..Product prod
     INNER JOIN Retail..Sales sls ON prod.ProductID = sls.ProductID
     INNER JOIN Retail..Outlet out ON sls.OutletID = out.OutletID
WHERE OutletSize = 'Medium'
      AND FatContent NOT IN('LF', 'reg')
GROUP BY ProductType,
	     LocationType,
         FatContent, 
         OutletType
ORDER BY avg_sales DESC;

-- Looking growth sales percentage and average sales based on outlet size on high
SELECT prod.ProductType, 
       sls.FatContent,
	   sls.LocationType,
       out.OutletType, 
       ROUND(SUM(sls.Sales) / SUM(sls.MRP), 2) AS [sales growth (%)], 
       ROUND(AVG(sls.Sales), 2) AS avg_sales
FROM Retail..Product prod
     INNER JOIN Retail..Sales sls ON prod.ProductID = sls.ProductID
     INNER JOIN Retail..Outlet out ON sls.OutletID = out.OutletID
WHERE OutletSize = 'High'
      AND FatContent NOT IN('LF', 'reg')
GROUP BY ProductType,
		 LocationType,
         FatContent, 
         OutletType
ORDER BY avg_sales DESC;

-- Looking growth sales percentage and average sales based on location type on tier 1
SELECT prod.ProductType, 
       sls.FatContent,
	   out.OutletSize,
       out.OutletType, 
       ROUND(SUM(sls.Sales) / SUM(sls.MRP), 2) AS [sales growth (%)], 
       ROUND(AVG(sls.Sales), 2) AS avg_sales
FROM Retail..Product prod
     INNER JOIN Retail..Sales sls ON prod.ProductID = sls.ProductID
     INNER JOIN Retail..Outlet out ON sls.OutletID = out.OutletID
WHERE LocationType = 'Tier 1'
      AND FatContent NOT IN('LF', 'reg')
GROUP BY ProductType,
		 OutletSize,
         FatContent, 
         OutletType
ORDER BY avg_sales DESC;

-- Looking growth sales percentage and average sales based on location type on tier 2
SELECT prod.ProductType, 
       sls.FatContent,
	   out.OutletSize,
       out.OutletType, 
       ROUND(SUM(sls.Sales) / SUM(sls.MRP), 2) AS [sales growth (%)], 
       ROUND(AVG(sls.Sales), 2) AS avg_sales
FROM Retail..Product prod
     INNER JOIN Retail..Sales sls ON prod.ProductID = sls.ProductID
     INNER JOIN Retail..Outlet out ON sls.OutletID = out.OutletID
WHERE LocationType = 'Tier 2'
      AND FatContent NOT IN('LF', 'reg')
GROUP BY ProductType,
		 OutletSize,
         FatContent, 
         OutletType
ORDER BY avg_sales DESC;

-- Looking growth sales percentage and average sales based on location type on tier 3
SELECT prod.ProductType, 
       sls.FatContent,
	   out.OutletSize,
       out.OutletType, 
       ROUND(SUM(sls.Sales) / SUM(sls.MRP), 2) AS [sales growth (%)], 
       ROUND(AVG(sls.Sales), 2) AS avg_sales
FROM Retail..Product prod
     INNER JOIN Retail..Sales sls ON prod.ProductID = sls.ProductID
     INNER JOIN Retail..Outlet out ON sls.OutletID = out.OutletID
WHERE LocationType = 'Tier 3'
      AND FatContent NOT IN('LF', 'reg')
GROUP BY ProductType,
		 OutletSize,
         FatContent, 
         OutletType
ORDER BY avg_sales DESC;

-- Looking maximum sales based on outlet type
WITH OutletSalesMax
     AS (SELECT out.OutletType, 
                sls.Sales
         FROM Retail..Outlet out
              INNER JOIN Retail..Sales sls ON out.OutletID = sls.OutletID)
     SELECT *
     FROM OutletSalesMax PIVOT(MAX(Sales) FOR OutletType IN([Supermarket Type1], 
                                                            [Supermarket Type2], 
                                                            [Supermarket Type3], 
                                                            [Grocery Store])) AS outlet_sales_max_pvt;

-- Looking minimum sales based on outlet type
WITH OutletSalesMin
     AS (SELECT out.OutletType, 
                sls.Sales
         FROM Retail..Outlet out
              INNER JOIN Retail..Sales sls ON out.OutletID = sls.OutletID)
     SELECT *
     FROM OutletSalesMin PIVOT(MIN(Sales) FOR OutletType IN([Supermarket Type1], 
                                                            [Supermarket Type2], 
                                                            [Supermarket Type3], 
                                                            [Grocery Store])) AS outlet_sales_min_pvt;

-- Looking maximum sales based on product type
WITH ProductTypeSalesMax
     AS (SELECT prod.ProductType, 
                sls.Sales
         FROM Retail..Product prod
              INNER JOIN Retail..Sales sls ON prod.ProductID = sls.ProductID)
     SELECT *
     FROM ProductTypeSalesMax PIVOT(MAX(Sales) FOR ProductType IN([Soft Drinks], 
                                                                  [Seafood], 
                                                                  [Others], 
                                                                  [Snack Foods], 
                                                                  [Starchy Foods], 
                                                                  [Hard Drinks], 
                                                                  [Fruits and Vegetables], 
                                                                  [Meat], 
                                                                  [Breakfast], 
                                                                  [Frozen Foods], 
                                                                  [Baking Goods], 
                                                                  [Canned], 
                                                                  [Household], 
                                                                  [Health and Hygiene], 
                                                                  [Dairy], 
                                                                  [Breads])) AS product_type_sales_max_pvt;

-- Looking minimum sales based on product type
WITH ProductTypeSalesMin
     AS (SELECT prod.ProductType, 
                sls.Sales
         FROM Retail..Product prod
              INNER JOIN Retail..Sales sls ON prod.ProductID = sls.ProductID)
     SELECT *
     FROM ProductTypeSalesMin PIVOT(MIN(Sales) FOR ProductType IN([Soft Drinks], 
                                                                  [Seafood], 
                                                                  [Others], 
                                                                  [Snack Foods], 
                                                                  [Starchy Foods], 
                                                                  [Hard Drinks], 
                                                                  [Fruits and Vegetables], 
                                                                  [Meat], 
                                                                  [Breakfast], 
                                                                  [Frozen Foods], 
                                                                  [Baking Goods], 
                                                                  [Canned], 
                                                                  [Household], 
                                                                  [Health and Hygiene], 
                                                                  [Dairy], 
                                                                  [Breads])) AS product_type_sales_min_pvt;
															