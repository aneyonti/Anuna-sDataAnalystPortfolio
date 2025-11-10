-- Stores With Most and Least Sales
SELECT store, SUM(weekly_sales) AS total_sales
FROM walmart_sales
GROUP BY store
ORDER BY total_sales DESC;

SELECT store, SUM(weekly_sales) AS total_sales
FROM walmart_sales
GROUP BY store
ORDER BY total_sales ASC;

-- Most Sales by Week, Month, Year
-- month
SELECT 
    MONTH(STR_TO_DATE(date, '%d-%m-%Y')) AS month,
    SUM(weekly_sales) AS total_sales
FROM walmart_sales
GROUP BY month
ORDER BY total_sales DESC;
-- year
SELECT 
    YEAR(STR_TO_DATE(date, '%d-%m-%Y')) AS year,
    SUM(weekly_sales) AS total_sales
FROM walmart_sales
GROUP BY year
ORDER BY total_sales DESC;
-- year month
SELECT 
    CONCAT(MONTHNAME(STR_TO_DATE(date, '%d-%m-%Y')), ' ', YEAR(STR_TO_DATE(date, '%d-%m-%Y'))) AS month_year,
    SUM(weekly_sales) AS total_sales
FROM walmart_sales
GROUP BY month_year
ORDER BY STR_TO_DATE(CONCAT('01-', month_year), '%d-%M %Y');
-- day month
SELECT 
    DATE_FORMAT(STR_TO_DATE(date, '%d-%m-%Y'), '%m-%d') AS month_day,
    SUM(weekly_sales) AS total_sales
FROM walmart_sales
GROUP BY month_day
ORDER BY month_day; 

-- holiday impact on sales
SELECT 
    Holiday_Flag,
    AVG(weekly_sales) AS avg_sales
FROM walmart_sales
GROUP BY Holiday_Flag;

-- does temp impact sales?
SELECT 
    CASE 
        WHEN temperature < 40 THEN 'Cold'
        WHEN temperature BETWEEN 40 AND 70 THEN 'Moderate'
        ELSE 'Hot'
    END AS temp_category,
    AVG(weekly_sales) AS avg_sales
FROM walmart_sales
GROUP BY temp_category;

-- umemployment rates impact on sales
SELECT 
    ROUND(unemployment, 1) AS unemployment_rate,
    AVG(weekly_sales) AS avg_sales
FROM walmart_sales
GROUP BY ROUND(unemployment, 1)
ORDER BY avg_sales DESC;

-- fuel prices impact on sales
SELECT 
    CASE 
        WHEN fuel_price < 2.5 THEN '< 2.5'
        WHEN fuel_price BETWEEN 2.5 AND 3.0 THEN '2.5 - 3.0'
        WHEN fuel_price BETWEEN 3.0 AND 3.5 THEN '3.0 - 3.5'
        ELSE '> 3.5'
    END AS fuel_price_range,
    AVG(weekly_sales) AS avg_sales
FROM walmart_sales
GROUP BY fuel_price_range
ORDER BY avg_sales DESC;

-- monthly sales totals
SELECT 
    YEAR(STR_TO_DATE(date, '%d-%m-%Y')) AS year,
    MONTH(STR_TO_DATE(date, '%d-%m-%Y')) AS month,
    SUM(weekly_sales) AS total_sales
FROM walmart_sales
GROUP BY year, month
ORDER BY year, month;











