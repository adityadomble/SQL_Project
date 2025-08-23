USE sakila;

#LIST ALL CUSTOMERS with there email id

SELECT first_name, last_name, email
FROM customer;

#all films with rental rate greater than 4

SELECT film_id, title , rental_rate
FROM film
WHERE rental_rate > 4;

#first and last name
SELECT actor_id, first_name, last_name
FROM actor;

#all films in 2006
SELECT film_id,title,release_year
FROM film
WHERE release_year = 2006;

#all categories
SELECT category_id,name
FROM category;


#all customers first name start "J"

SELECT customer_id,first_name,last_name
FROM customer
WHERE first_name LIKE 'J%';

#all films title contain the word ACTION
SELECT film_id,title
FROM film
WHERE title LIKE '%ACTION%';

#ALL FILM WITH LENGTH 90 AND 120

SELECT film_id, title, length
FROM film
WHERE length BETWEEN 90 AND 120;

#sort the store with storeid DESC

SELECT * FROM store 
ORDER BY store_id DESC;


#top 10 long film

SELECT film_id, title, length
FROM film
ORDER BY length DESC
LIMIT 10;

SELECT film_id, title, length
FROM film
ORDER BY length ASC
LIMIT 10;

#count total no films

SELECT COUNT(*) AS total_count
FROM film;

#average renatal rate

SELECT AVG(rental_rate) AS average_rental_rate
FROM film;

#min and max film lenghth
SELECT MIN(length) AS min_length, 
MAX(length) AS max_length
FROM film;

#total no of customer in each store

SELECT store_id, COUNT(customer_id) AS total_customer
FROM customer
GROUP BY store_id;

#total revenue .

SELECT SUM(amount) AS total_revenue
FROM payment;

USE sakila;

#group films by rating  count()

SELECT rating, count(*) AS film_count
FROM film
GROUP BY rating;

# TOTAL LENGTH , CATEGORY 
SELECT c.name , SUM(f.length) AS total_length
FROM category c
JOIN film_category fc ON fc.category_id = c.category_id
JOIN film f ON  fc.film_id  = f.film_id
GROUP BY c.name;

#list no. of film each replacement cost

SELECT replacement_cost, 
count(*) AS film_count
FROM film
GROUP BY replacement_cost;

#Avg rental rate by category

SELECT c.name , AVG(f.rental_rate)
AS average_rental_rate
FROM category c
JOIN film_category fc 
ON fc.category_id = c.category_id
JOIN film f ON f.film_id = fc.film_id
GROUP BY c.name;

#20
SELECT last_name, COUNT(*)
AS  actor_count
FROM actor
GROUP BY last_name;

USE sakila;
#21 all films & categories

SELECT f.title , c.name
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON c.category_id = fc.category_id;

#
SELECT c.first_name, c.last_name, f.title
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film f ON i.film_id = f.film_id;

SELECT c.first_name, c.last_name, f.title
FROM film f
JOIN inventory i ON i.film_id = f.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN customer c ON c.customer_id = r.customer_id;

#
SELECT sta.first_name, sta.last_name, sto.store_id,
sto.manager_staff_id
FROM staff sta
JOIN store sto ON sta.store_id = sto.store_id;

#24 all film, actor

SELECT f.title , a.first_name, a.last_name
FROM film f
JOIN film_actor fa ON fa.film_id = f.film_id
JOIN actor a ON a.actor_id = fa.actor_id;

SELECT c.name , COUNT(f.film_id) AS film_count
FROM category c
JOIN film_category fc ON fc.category_id = c.category_id
JOIN film f ON f.film_id = fc.film_id
GROUP BY c.name;

USE sakila;

#26 - film with highest rental rate . 

SELECT MAX(rental_rate) FROM film;

SELECT title , rental_rate 
FROM FILM WHERE rental_rate = 5.99;

SELECT title , rental_rate 
FROM FILM WHERE 
rental_rate = (SELECT MAX(rental_rate) FROM film);

#all customers - rent more than 5 film

SELECT c.customer_id, c.first_name, c.last_name
FROM customer c 
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
HAVING COUNT(r.rental_id) > 5;

SELECT c.customer_id, c.first_name, c.last_name
FROM customer c 
WHERE c.customer_id IN (
SELECT r.customer_id FROM rental r 
GROUP BY r.customer_id HAVING count(r.rental_id) > 5);

#film title - rented 10time

SELECT f.title
FROM film f 
WHERE f.film_id IN
(SELECT i.film_id FROM inventory i 
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY i.film_id
HAVING COUNT(r.rental_id) > 10
);

SELECT f.title
FROM film f JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
group by f.title
having count(r.rental_id) > 10;

#29 - 
SELECT s.store_id
FROM store s
WHERE s.store_id IN
(SELECT c.store_id from customer c 
GROUP BY c.store_id
ORDER BY count(customer_id) desc
)
LIMIT 1 ;

#30 - 
SELECT c.customer_id, c.first_name,c.last_name
FROM customer c 
WHERE c.customer_id NOT IN
(SELECT DISTINCT r.customer_id FROM rental r
);


#31 - 
Use sakila;

SELECT * FROM rental
WHERE 
rental_date >= date_sub(curdate() , interval 30 Day);

SELECT * FROM rental
WHERE rental_date 
BETWEEN "2005-05-24" and "2005-06-04";

SELECT c.first_name, c.last_name , r.rental_date
FROM customer c
JOIN rental r ON r.customer_id = c.customer_id
ORDER BY r.rental_date desc
limit 1;

SELECT monthname(rental_date) AS month,
count(*) AS total_rentals
FROM rental
WHERE YEAR(rental_date) = 2005
GROUP BY month;

SELECT f.title, 
SUM(datediff(r.return_date , r.rental_date))
AS total_days
FROM film f 
JOIN inventory i ON i.film_id = f.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
GROUP BY f.title
ORDER BY total_days desc;




SELECT first_name, last_name , create_date
from customer
WHERE YEAR(create_date)>= "2006";

#36 
select f.title , c.first_name, 
c.last_name, r.rental_date
FROM film f 
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
JOIN customer c ON c.customer_id = r.customer_id;

#37
SELECT sto.store_id , 
SUM(p.amount) as total_revenue
FROM store sto
JOIN staff sta ON sta.store_id = sto.store_id
JOIN payment p ON sta.staff_id = p.staff_id
GROUP BY sto.store_id;

















