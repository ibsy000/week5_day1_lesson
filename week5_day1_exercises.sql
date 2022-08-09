-- ORDER BY CLAUSES:
--SELECT 
--FROM 
--JOIN
--ON
--WHERE 
--GROUP BY 
--HAVING 
--ORDER BY 
--OFFSET 
--LIMIT 


-- Question 1
-- How many actors are there with the last name 'Wahlberg'?

SELECT last_name
FROM actor 
WHERE last_name = 'Wahlberg';

-- Answer: 2



-- Question: 2
-- How many payments were made between $3.99 and $5.99?

SELECT amount, COUNT(*)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99
GROUP BY amount
ORDER BY amount;

-- Answer: 
-- amount|count|
-- ------+-----+
--   3.99|  988|
--   4.99| 3424|
--   5.98|    7|
--   5.99| 1188|



-- Question 3:
-- What films have exactly 7 copies? (search in inventory)

SELECT film_id, COUNT(*)
FROM inventory
GROUP BY film_id
HAVING COUNT(*) = 7
ORDER BY film_id;

-- Answer: Please submit query to see list of film_ids with 7 copies (there is a lot)



-- Question 4:
-- How many customers have the first name 'Willie'?

SELECT first_name
FROM customer
WHERE first_name = 'Willie';

-- Answer: 2



-- Question 5:
-- What store employee (get the id) sold the most rentals (use the rental table)?

SELECT SUM(rental_id), staff_id, COUNT(*)
FROM rental
GROUP BY staff_id;

-- Answer: staff_id (Mike) sold 8040 rentals, while (Jon) sold 8004 rentals
-- sum     |staff_id|count|
-- --------+--------+-----+
-- 64772289|       1| 8040|
-- 63986771|       2| 8004|



-- Question 6:
-- How many unique district names are there? (use address table)

SELECT district, COUNT(*)
FROM address
GROUP BY district
ORDER BY district;

-- Answer: 377
-- it originally fetched 378 rows, but the first listed district is a blank space



-- Question 7:
-- What film has the most actors in it(use film_actor table and get film_id)

SELECT film_id, COUNT(*)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(*) DESC;

-- Answer: film_id 508 (Lambs Cincinatti) with 15 actor count



-- Question 8:
-- From store_id 1, how many customers have a last name ending with 'es'? (use customer table)

SELECT *
FROM customer;

SELECT store_id, last_name
FROM customer
WHERE last_name LIKE '%es'
GROUP BY store_id, last_name
ORDER BY store_id;

-- Answer: 13 



-- Question 9:
-- How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for 
-- customers with ids between 380 and 430? (use group by and having > 250)

SELECT amount, COUNT(*)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(rental_id) > 250
ORDER BY amount;

-- Answer:
-- amount|count|
-- ------+-----+
--   0.99|  269|
--   2.99|  290|
--   4.99|  281|



-- Question 10:
-- Within the film table, how many rating categories are there? 
-- And what rating has the most movies total?

SELECT rating, COUNT(*)
FROM film
GROUP BY rating
ORDER BY COUNT(*) DESC;

-- Answer: 

-- 5 rating categories and PG-13 has the most movies with 223 total

-- rating|count|
-- ------+-----+
-- PG-13 |  223|
-- NC-17 |  210|
-- R     |  195|
-- PG    |  194|
-- G     |  178|









