/*
====================================================================================================
EDA
====================================================================================================
*/

-- Total Sales Insights
select 
format(count(Total_Payment),'N0') as No_of_Sales,
format(round(sum(Total_Payment),0),'N0') as Total_Sales,
format(round(avg(Total_Payment),0),'N0') as Avg_Sales,
format(round(max(Total_Payment),0),'N0') as Highest_Sales
from gold.fact_orders



-- Total Sales by Category
select top(10) p.Product_Category,format(round(sum(o.Total_Payment),0),'N0') as TotalSales
from gold.fact_orders o 
left join gold.dim_products p on o.Product_ID = p.Product_ID 
group by p.Product_Category
order by sum(o.Total_Payment) desc



-- Transportation Cost by Product and Category
select 
Product_Category,
case
	when (p.Product_Length * p.Product_Width * p.Product_Height) / 5000 <= 2 or (p.Product_Weight/ 1000.0) <= 2 then 'Light & Compact'
	when (p.Product_Length * p.Product_Width * p.Product_Height) / 5000 <=12 or (p.Product_Weight/ 1000.0) <= 12 then 'Standard'
	when (p.Product_Length * p.Product_Width * p.Product_Height) / 5000 <=30 or (p.Product_Weight/ 1000.0) <= 30 then 'Heavy'
	when (p.Product_Length * p.Product_Width * p.Product_Height) / 5000 > 30 or (p.Product_Weight/ 1000.0) > 30  then 'Cargo'
	else 
		case 
			when (p.Product_Length * p.Product_Width * p.Product_Height) / 5000 < (p.Product_Weight/ 1000) then 'Too Much Heavy'
			else 'Issue'
		end
end Transporation_Category,
o.Transportation_Cost
from gold.dim_products p
left join gold.fact_orders o on p.Product_ID = o.Product_ID 
where Product_Category is not null and Transportation_Cost != 0
order by Transporation_Category,Transportation_Cost desc


-- Top 10 sales by seller and location
select top(10) s.Seller_ID,s.Seller_City,s.Seller_State,round(sum(o.Price),0) as Total_Sales 
from gold.fact_orders o
left join gold.dim_seller s
on o.Seller_ID = s.Seller_ID
group by s.Seller_ID,s.Seller_City,s.Seller_State
order by sum(o.Price) desc




-- Bad Review Analysis
select top(20) 
Delivered_Date,
Expected_Delivery,
DATEDIFF(day,Expected_Delivery,Delivered_Date) as Delay,
Review_Score,review_comment_message
from gold.fact_orders
where Review_Score is not null and review_comment_message is not null 
and review_comment_message like '%produto%' 
and DATEDIFF(day,Expected_Delivery,Delivered_Date) > 0
order by Review_Score asc ,DATEDIFF(day,Expected_Delivery,Delivered_Date) desc



-- Total Customers
select count(distinct(customer_unique_id)) as Total_Customers 
from gold.dim_customer

-- Top Customer Spendings
select top (10)
c.customer_unique_id,c.customer_city,round(sum(o.Total_Payment),0) as Total_Spendings
from gold.dim_customer c
left join gold.fact_orders o
on c.customer_id = o.Customer_ID
group by c.customer_unique_id,c.customer_city
order by round(sum(o.Total_Payment),0) desc



-- Most Used Payment Method

select Payment_Type, format(round(sum(Total_Payment),0),'N0') as Total_Payment
from gold.fact_orders
where Total_Payment is not null
group by Payment_Type
order by sum(Total_Payment) desc



-- Highest Installations by Customer
select Payment_Installation, round( max( Total_Payment),0) as Payment
from gold.fact_orders
where Total_Payment is not null
group by Payment_Installation
order by Payment_Installation desc






-- Frequency (No. of Orders per Year)
select year(Purchased_Date) as Year, count(order_id) as Orders
from gold.fact_orders
group by year(Purchased_Date)
order by count(order_id) desc