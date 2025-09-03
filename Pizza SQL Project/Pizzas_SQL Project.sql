
create database Pizzhut; 
create Table orders(
order_id int not null,
order_date date not null,
order_time time not null,
primary key(order_id) ) ;



create Table orders_details(
order_details_id int not null,
order_id int not null,
pizz_id text not null,
quantity int not null ,
primary key(order_details_id));

select* from orders_details;
 # rename the column name
alter table orders_details 
rename column pizz_id to pizza_id;




# 1.Retrieve the total number of orders placed

select count(*) as total_orders from orders;


# 2.Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(orders_details.quantity * pizzas.price),
            2) AS total_sales
FROM
    orders_details
        JOIN
    pizzas ON pizzas.pizza_id = orders_details.pizz_id,
     SELECT 
        pizza_types.name, pizzas.price
    FROM
        pizza_types
            JOIN
        pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
    ORDER BY pizzas.price DESC
    LIMIT 1;
    
    
   
  -- 4 Identify the most common pizza size ordered.

    select quantity ,count(order_details_id)
    from orders_details group by quantity;
    
    #need to extract on behalf of Size

SELECT 
    pizzas.size,
    COUNT(orders_details.order_details_id) AS order_count
FROM
    pizzas
        JOIN
    orders_details ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC;



-- 5 List the top 5 most ordered pizza types 
-- along with their quantities

SELECT 
    pizza_types.name, SUM(orders_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity DESC
LIMIT 5;




-- 6.Join the necessary tables to find the
--  total quantity of each pizza category ordered.

SELECT 
    pizza_types.category,
    SUM(orders_details.quantity) AS Quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY quantity DESC;




-- 7. Determine the distribution of orders by hour of the day.


SELECT 
    HOUR(order_time), COUNT(order_id) AS number_of_orders
FROM
    orders
GROUP BY HOUR(order_time)
ORDER BY number_of_orders DESC;



-- 8..join relevant tables to find the
--  category-wise distribution of pizzas.


    select category,count(name) from pizza_types
    group by category;
    
    
     --  9.Group the orders by date
     -- and calculate the average number of pizzas ordered per day.

    
 SELECT 
    ROUND(AVG(quantity), 0) AS avg_pizza_ordered_per_day
FROM
    (SELECT 
        orders.order_date, SUM(orders_details.quantity) AS quantity
    FROM
        orders
    JOIN orders_details ON orders.order_id = orders_details.order_id
    GROUP BY orders.order_date) AS order_quantity;
    
    
    
    
    
    
    
    -- 10.Determine the top 3 most ordered pizza types based on revenue.

    
    
    select pizza_types.name,
    
    sum(orders_details.quantity*pizzas.price) as revenue
    from pizza_types join pizzas
    on pizza_types.pizza_type_id=pizzas.pizza_type_id
    join orders_details 
    on orders_details.pizza_id=pizzas.pizza_id
    
    group by pizza_types.name
    order by revenue desc limit 3;
    
    
    
    
   --  10 Calculate the percentage contribution of each pizza type to total revenue.

    
     # Advanced Question
     
     select pizza_types.category,
     round(sum(orders_details.quantity*pizzas.price) / (select 
     round(sum(orders_details.quantity*pizzas.price),2) as  total_sales
     from 
     orders_details
     join 
     pizzas on pizzas.pizza_id
     from pizza_types join pizzas
     on pizzas.pizza_type_id=pizza_types.pizza_type_id
     join orders_details
     on order_details_id.pizza_id=pizzas.pizza_id 
     group by category
     order by revenue desc;
     
     group by 
     
     
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    