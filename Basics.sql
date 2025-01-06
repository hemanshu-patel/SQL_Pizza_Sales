----BASIC QUESTIONS

--1).Retrieve Total number of orders placed

select count(order_id) as total_orders from orders

--2). Calculate total number of revenue generated from pizza sales

--Method 1
select round(sum(order_details.quantity * pizzas$.price),2) from order_details join pizzas$
on order_details.pizza_id = pizzas$.pizza_id

--Method 2

select round(sum(a.quantity * b.price),1) from  order_details a join pizzas$ b on 
a.pizza_id = b.pizza_id

--3).Identify the price of highest pizza

select top(1) a.name,b.price from pizza_types a join pizzas$ b 
on a.pizza_type_id = b.pizza_type_id
order by b.price desc 

--4). Identify most common pizza size ordered

select pizzas$.size ,count(order_details.quantity) as orderCount from order_details  join pizzas$
on order_details.pizza_id = pizzas$.pizza_id
group by pizzas$.size
order by orderCount desc 

--5).List top 5 most orderd pizza types along with their quantites

select * from order_details
select * from pizza_types
select * from pizzas$

select top(5) a.name,sum(c.quantity) as quantity from pizza_types a join pizzas$ b on 
a.pizza_type_id = b.pizza_type_id join order_details c on 
c.pizza_id = b.pizza_id
group by a.name 
order by quantity desc


