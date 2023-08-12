use portfolio;
SELECT 
    *
FROM
    sales;
-- How many unique cities does the data have? --
SELECT DISTINCT
    city
FROM
    sales;
-- In which city is each branch? --
SELECT DISTINCT
    city, branch
FROM
    sales;
   
-- How many unique product lines does the data have?
SELECT DISTINCT
    product_line
FROM
    sales;

-- What is the most selling product line
SELECT 
    SUM(quantity) AS qty, product_line
FROM
    sales
GROUP BY product_line
ORDER BY qty DESC
LIMIT 3;
    
-- What is the total revenue by month
SELECT 
    SUM(total) AS total_revenue, month_name AS month
FROM
    sales
GROUP BY month
ORDER BY total_revenue;

-- What month had the largest COGS?
SELECT 
    SUM(cogs) AS cogs, month_name AS month
FROM
    sales
GROUP BY month_name
ORDER BY cogs;

-- What product line had the largest revenue?
SELECT 
    SUM(total) AS total_revenue, product_line
FROM
    sales
GROUP BY product_line
ORDER BY total_revenue DESC
LIMIT 3;

-- What is the city with the largest revenue?
SELECT 
    SUM(total) AS total_revenue, city, branch
FROM
    sales
GROUP BY city , branch
ORDER BY total_revenue DESC
LIMIT 3;

-- What product line had the largest VAT?
SELECT 
    AVG(tax_pct) AS avg_tax, product_line
FROM
    sales
GROUP BY product_line
ORDER BY avg_tax DESC
LIMIT 3;

-- Fetch each product line and add a column to those product 
-- line showing "Good", "Bad". Good if its greater than average gross_income
SELECT 
    product_line,
    CASE
        WHEN AVG(gross_income) > 15.37936900 THEN 'GOOD'
        ELSE 'BAD'
    END AS remark
FROM
    sales
GROUP BY product_line;

-- Which branch sold more products than average product sold?
select branch , sum(quantity) as qnty from sales group by branch having 
sum(quantity) > (select avg(quantity) from sales);

-- What is the most common product line by gender
select gender ,  product_line , count(gender) as total_cnt
from sales group by gender,product_line
order by total_cnt desc;

-- What is the average rating of each product line
select product_line, round(avg(rating),2) as avg_rating from sales 
group by product_line;

-- How many unique customer types does the data have?
select distinct customer_type
from sales;

-- How many unique payment methods does the data have?
select distinct payment from sales;

-- What is the most common customer type?
SELECT
	customer_type,
	count(*) as count
FROM sales
GROUP BY customer_type
ORDER BY count DESC;

-- Which customer type buys the most?
select customer_type, count(quantity) as Total_qty from sales 
group by customer_type
order by Total_qty desc limit 1;

-- What is the gender of most of the customers?
select gender,count(gender) as count from sales
group by gender order by gender;

-- What is the gender distribution per branch?
select gender,count(gender) as count, branch from sales
group by gender,branch order by gender;

-- Which time of the day do customers give most ratings per branch?
select round(avg(rating),2) as rating, time_of_day, branch
from sales
group by time_of_day,branch
order by branch,rating desc;

-- Which day fo the week has the best avg ratings?
select round(avg(rating),2) as rating, day_name,count(quantity)
from sales
group by day_name
order by rating desc;

-- Which day of the week has the best average ratings per branch?
select round(avg(rating),2) as rating, day_name,count(quantity),branch
from sales
group by day_name,branch
order by rating desc,branch ;

-- Number of sales made in each time of the day on sunday
select count(quantity) as total_qty, time_of_day,day_name from sales
where day_name = 'Sunday'
group by time_of_day
order by total_qty desc;

-- Which of the customer types brings the most revenue?
select customer_type,round(sum(total),2) as total_revenue from sales 
group by customer_type
order by total_revenue desc;

-- Which city has the largest tax/VAT percent?
select city, round(avg(tax_pct),2)as avg_tax from sales group by city 
order by avg_tax desc;

-- Which customer type pays the most in VAT?
select customer_type, round(avg(tax_pct),2)as avg_tax from sales 
group by customer_type 
order by avg_tax desc;


