-- Lab | SQL Join (Part I)

USE sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query

SELECT c.name as category, count(fc.film_id) as amount_of_films
FROM  category c
JOIN   film_category fc 
ON c.category_id = fc.category_id
GROUP BY c.name;

-- 2. Display the total amount rung up by each staff member in August of 2005

SELECT s.first_name, s.last_name,  SUM(p.amount) AS 'receive_amount'
FROM staff AS s
JOIN payment AS p
ON s.staff_id = p.staff_id
WHERE YEAR(p.payment_date)= 2005 AND MONTH(p.payment_date) = 8
GROUP BY p.staff_id

-- 3. Which actor has appeared in the most films

SELECT a.actor_id, a.first_name, a.last_name, count(fa.actor_id)
FROM  actor a
JOIN  film_actor fa 
ON a.actor_id = fa.actor_id
GROUP BY fa.actor_id;


-- 4. Most active customer (the customer that has rented the most number of films)

SELECT c.customer_id, c.first_name, c.last_name, count(r.rental_id) AS 'count_customer'
FROM  customer c
JOIN  rental r 
ON c.customer_id = r.customer_id
GROUP BY r.customer_id
order BY count_customer DESC
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member

SELECT  s.first_name, s.last_name, a.address
FROM staff s
JOIN address a on s.address_id = a.address_id
-- GROUP BY  s.first_name, s.last_name, a.address;

-- 6. List each film and the number of actors who are listed for that film

SELECT f.title as film_title, COUNT(fa.actor_id) as number_of_actors
FROM film f
JOIN film_actor fa 
ON f.film_id = fa.film_id
GROUP BY fa.film_id;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount)
FROM customer c
JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY p.customer_id
ORDER BY c.last_name ASC;
 
 
-- 8. List the titles of films per category

SELECT c.category_id, c.name as name_of_category, f.title as film_title
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f 
ON fc.film_id = f.film_id
ORDER BY c.category_id;