--1). Join the necessary joins on the tables to find the total quantity of each pizza catrgory ordered.
select pizza_types.category,sum(order_details.quantity) as quantity from pizza_types join pizzas on 
pizza_types.pizza_type_id = pizzas.pizza_type_id join order_details on 
order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category
order by quantity desc

--2). Determine the distribution of ordered by an hour of an day

--3). Join relevant tables to find the category-wise distribution of pizzas.

select category ,count(category)as summary from pizza_types
group by category
 
--4). Group the orders by date and calculate average number of pizzas ordered per day

select round(avg(quantity),0) as pizza_orderd_per_day from
(select orders.date , sum(order_details.quantity) as quantity
from orders join order_details on
orders.order_id = order_details.order_id
group by orders.date ) as order_quantity

--5). Determine top 3 most ordered pizza types based on revenue

select top(3) pizza_types.name, sum(order_details.quantity * pizzas.price) as revenue from pizza_types join pizzas on
pizza_types.pizza_type_id = pizzas.pizza_type_id 
join order_details on 
order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name
order by revenue desc



