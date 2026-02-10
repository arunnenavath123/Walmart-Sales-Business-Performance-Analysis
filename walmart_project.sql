use walmart_db;

select * from walmart;

-- 
# no of columns present
select count(*) 
from walmart;

#distinct payment type 
select distinct payment_method
from walmart;

#total payment_method with no of transactions made
select payment_method, count(*) as transaction_made
from walmart
group by payment_method
order by transaction_made desc;

#total number stores 
select distinct branch
from walmart
order by branch;

# count of distict branch
select count(distinct branch)
from walmart;

#max and min quantity
select max(quantity) 
from walmart;

select min(quantity)
from walmart;

-- BUSINESS PROBLEMS:

# Identifying the Most Profitable Product Category in Each Branch
-- We wants to know which product category generates maximum revenue per branch to optimize store inventory.
select * from walmart;

with cte1 as (
select branch, category, sum(total) as total_revenue,
rank() over(partition by branch order by sum(total) desc) as rank_1
from walmart
group by branch, category
order by branch, rank_1)
select * from cte1
where rank_1 = 1;

-- Insight we gained from this problem is that: 
-- Home & Lifestyle is the most profitable product category out of every branches, indicating strong and consistent customer demand 
-- across the business, highlighting the need for optimized inventory management.

#or
with category_total as(
select branch, category, sum(total) as total_revenue
from walmart group by branch, category),
branch_max as (
select branch, max(total_revenue) as max_revenue
from category_total
group by branch)
select c.branch, c.category, c.total_revenue
from category_total as c
join branch_max as b
on c.branch = b.branch
and c.total_revenue = b.max_revenue
order by c.branch;


#Finding Branches With Declining Monthly Sales Trend
-- we need to find branches where sales are dropping month over month.
with monthly_sales as (
select branch, date_format(date, '%Y-%m') as month,
sum(total) as monthly_total
from walmart
group by branch, month),
sale_lag as (
select branch, month, monthly_total,
lag(monthly_total, 1) over(partition by branch order by month) as prev_month_total
from monthly_sales)
select * from sale_lag
where monthly_total < prev_month_total;

-- Insight gained from this problem is that: 
-- The branch WALM001 has experienced multiple declining sales months, 
-- some of them showing very steep drops. This indicates inconsistent performance and potential operational.



#Determining Customer Spending Pattern by Time-of-Day
-- Understanding if customers spend more in morning, afternoon, or evening
select case
when hour(time)<12 then 'Morning'
when hour(time)<17 then 'Afternoon'
else 'Evening'
end as shift,
count(*) as no_of_invoices,
sum(total) as total_sales,
avg(rating) as avg_rating
from walmart 
group by shift
order by total_sales desc;

-- Insight gained from this problem is that: 
-- the customer spend the most in th EVENING. Where Evening sales is 495702 and highest no of invoices: 4273
-- Afternoon is the second busiest period, while mornings have the least activity. 
-- Customer satisfaction (avg ratings) remains consistent across all time periods, indicating stable service quality regardless of store crowd levels.



#Identifying Categories With High Sales But Low Ratings
select * from walmart;

select category, avg(rating) as avg_rating, sum(total) as total_sales
from walmart
group by category
having avg(rating) < 6
order by total_sales desc;

-- Insight we gained from this problem is that: 
-- The categories Fashion accessories, electronic accessories and Home & lifestyle have the highest sales but comparatively low customer ratings (below 6).
-- This indicates that although these categories generate strong revenue, customers are less satisfied with the products or service experience. 


#Identifying which Payment Method generates the Highest Average Order Value?
select payment_method, count(*) as transaction_made,
avg(total) as avg_order_value, sum(total) as total_sales
from walmart
group by payment_method
order by avg(total) desc;

-- Insight we gained from the problem is that: 
-- Cash has the highest average order value, indicating that customers making bigger purchases prefer cash.



#Identifying which Branch Has the Best Customer Satisfaction Score?
select branch, avg(rating) as avg_rating,
count(*) as total_customer
from walmart
group by branch
order by avg_rating desc;

-- Insight we gained from this problem is that:
-- branch WALM004 has the highest customer satisfaction score (avg rating 7.0)
-- indicating best service and store experience.



#Comparing Weekend vs Weekday Revenue
select case
when dayofweek(date) in (1,7) then 'weekend'
else 'weekday'
end as day_type,
count(*) as transaction_made,
sum(total) as total_sales,
avg(rating) as avg_rating
from walmart
group by day_type;

-- Insight we gained from this problem is that:
-- Weekdays generate the highest revenue and have the maximum customer traffic, 
-- Weekends have significantly fewer transactions and lower sales, although customer satisfaction remains almost the same across both periods.