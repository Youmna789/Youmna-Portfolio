--Assignment SqL 4
--Q11)
SELECT COUNT(*) AS Total_Customers
FROM sales.customers;

--Q12) 
SELECT COUNT(*) AS Total_Orders
FROM sales.orders;

-- Q13)
SELECT s.store_name, COUNT(o.order_id) AS Total_Sales
FROM sales.orders o
JOIN sales.stores s ON o.store_id = s.store_id
GROUP BY s.store_name
ORDER BY Total_Sales DESC;

-- Q14) 
SELECT s.store_name,
       FORMAT(o.order_date, 'yyyy-MM') AS Order_Month,
       SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS Total_Sales
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
JOIN sales.stores s ON o.store_id = s.store_id
GROUP BY s.store_name, FORMAT(o.order_date, 'yyyy-MM')
ORDER BY Total_Sales DESC;

-- Q15)
SELECT c.first_name + ' ' + c.last_name AS Customer_Name,
       COUNT(o.order_id) AS Total_Orders
FROM sales.orders o
JOIN sales.customers c ON o.customer_id = c.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY Total_Orders DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- Q16) 
SELECT p.product_name, SUM(oi.quantity) AS Total_Sold
FROM sales.order_items oi
JOIN production.products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY Total_Sold DESC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;

--Q17) 
WITH CustOrders AS (
    SELECT customer_id, COUNT(order_id) AS Total_Orders
    FROM sales.orders
    GROUP BY customer_id
)
SELECT TOP 1 c.first_name + ' ' + c.last_name AS Customer_Name,
       MIN(o.order_date) AS First_Order,
       MAX(o.order_date) AS Last_Order
FROM sales.orders o
JOIN CustOrders co ON o.customer_id = co.customer_id
JOIN sales.customers c ON o.customer_id = c.customer_id
WHERE co.Total_Orders = (SELECT MAX(Total_Orders) FROM CustOrders)
GROUP BY c.first_name, c.last_name;

-- Q18)
SELECT c.customer_id, 
       c.first_name + ' ' + c.last_name AS Customer_Name,
       MIN(p.list_price) AS Cheapest_Product,
       MAX(p.list_price) AS Most_Expensive_Product
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
JOIN production.products p ON oi.product_id = p.product_id
JOIN sales.customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- Q19) 
SELECT p.product_name, SUM(oi.quantity) AS Total_Ordered
FROM sales.order_items oi
JOIN production.products p ON oi.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(oi.quantity) > 100;

-- Q20) 
SELECT DISTINCT order_date
FROM sales.orders
ORDER BY order_date ASC;

--Q21)
SELECT DISTINCT brand_id, category_id
FROM production.products;

-- Q22)
SELECT *
FROM sales.staffs
WHERE store_id = 1 AND manager_id = 2
ORDER BY first_name ASC;

--Q23)
SELECT *
FROM production.products
WHERE brand_id IN (1, 9)
  AND list_price BETWEEN 199.99 AND 499.99;

-- Q24) 
SELECT TOP 5 product_name, list_price
FROM production.products
WHERE model_year = 2018
ORDER BY list_price DESC;
-- Q25) 
SELECT *
FROM sales.customers
WHERE first_name LIKE '%t'
  AND zip_code LIKE '11%'
ORDER BY first_name;

-- Q26) 
SELECT *
FROM production.products
WHERE list_price IN (999.99, 1999.99, 2999.99);

--Q27) 
SELECT COUNT(*) AS Total_Products
FROM production.products
WHERE product_name LIKE 'Trek%'
  AND list_price BETWEEN 199.99 AND 999.99;

-- Q28)
SELECT p.product_name,
       SUM(oi.list_price * oi.quantity) AS Total_Price,
       SUM(oi.quantity) AS Total_Quantity
FROM sales.order_items oi
JOIN production.products p ON oi.product_id = p.product_id
WHERE p.product_name LIKE '%Ladies%'
GROUP BY p.product_name;

-- Q29)
SELECT o.order_id,
       SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS Net_Value
FROM sales.order_items oi
JOIN sales.orders o ON oi.order_id = o.order_id
GROUP BY o.order_id
HAVING SUM(oi.quantity * oi.list_price * (1 - oi.discount)) > 20000;

-- Q30) 
SELECT p.product_name,
       o.order_id,
       oi.quantity,
       o.order_date
FROM sales.order_items oi
JOIN production.products p ON oi.product_id = p.product_id
JOIN sales.orders o ON oi.order_id = o.order_id
ORDER BY o.order_date;

-- Q31)
SELECT b.brand_name,
       AVG(p.list_price) AS Average_List_Price
FROM production.products p
JOIN production.brands b ON p.brand_id = b.brand_id
WHERE p.model_year = 2018
GROUP BY b.brand_name;

--Q32) 
SELECT o.order_id,
       c.first_name + ' ' + c.last_name AS Customer_Name,
       s.store_name,
       SUM(oi.quantity) AS Total_Quantity,
       SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS Total_Net_Value
FROM sales.orders o
JOIN sales.customers c ON o.customer_id = c.customer_id
JOIN sales.stores s ON o.store_id = s.store_id
JOIN sales.order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, c.first_name, c.last_name, s.store_name;

-- Q33) 
SELECT p.product_name, c.category_name
FROM production.products p
JOIN production.categories c ON p.category_id = c.category_id
LEFT JOIN sales.order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;