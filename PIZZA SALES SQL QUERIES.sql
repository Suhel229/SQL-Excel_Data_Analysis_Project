use Pizza_DB

------------------------------ For KPI's -----------------------------------------
Select * from pizza_sales
Select SUM(total_price) as Total_Revenue from pizza_sales

Select * from pizza_sales
Select SUM(total_price)/ COUNT(Distinct order_id) as Avg_Order_Value from pizza_sales

Select * from pizza_sales
Select SUM(quantity) as Total_Pizzas_Sold from pizza_sales

Select * from pizza_sales
Select Count(Distinct order_id) as Total_Orders from pizza_sales

Select * from pizza_sales
Select Cast(Cast(SUM(quantity) as decimal(10,2)) / 
Cast(Count(Distinct order_id) as decimal(10,2)) as decimal (10,2)) 
as Average_pizza_per_orders from pizza_sales

------------------------------ For Charts -----------------------------------------
Select * from pizza_sales
Select DATENAME(DW,order_date) as order_day , COUNT(Distinct order_id) as Total_orders
from pizza_sales 
group by DATENAME(DW,order_date) order by COUNT(Distinct order_id) desc --- daily trend

Select * from pizza_sales
Select DATEPART(HOUR,order_time) as Order_Hour, COUNT(Distinct order_id) as total_orders
from pizza_sales 
Group by DATEPART(HOUR,order_time) order by DATEPART(HOUR,order_time) --- Hourly trend

Select * from pizza_sales  
Select Pizza_Category, SUM(Total_price) as Total_Sales,
Cast(Cast(Sum(Total_Price) as decimal(10,2)) * 100 / (Select Cast(Sum(Total_Price)as decimal(10,2)) from pizza_sales)
as decimal(10,2)) as Percentage_of_Sales From pizza_sales
group by Pizza_Category  ---- Percentage of sales by pizza category

Select * from pizza_sales  
Select pizza_size, Cast(SUM(Total_price) as decimal(10,2)) as Total_Sales,
Cast(Cast(Sum(Total_Price) as decimal(10,2)) * 100 / (Select Cast(Sum(Total_Price)as decimal(10,2)) from pizza_sales)
as decimal(10,2)) as Percentage_of_Sales From pizza_sales
group by pizza_size  ---- Percentage of sales by pizza Size

Select * from pizza_sales  
Select pizza_Category , Cast(SUM(quantity) as decimal(10,2)) 
as Total_Pizzas_Sold from pizza_sales
Group by pizza_Category 
order by SUM(quantity) desc ---------- Total pizzas sold by category

Select * from pizza_sales
Select Top 5 pizza_name, Sum(quantity) as Total_Pizzas_Sold from pizza_Sales
group by Pizza_name
order by Sum(quantity) desc -------- Top 5 pizza

Select * from pizza_sales
Select Top 5 pizza_name, Sum(quantity) as Total_Pizzas_Sold from pizza_Sales
group by Pizza_name
order by Sum(quantity) Asc -------- Bottom 5 pizza