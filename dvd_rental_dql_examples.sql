--"Hello World" OF SQL -- SELECT ALL records FROM a TABLE
SELECT * -- * means ALL COLUMNS
FROM actor; -- semicolon means NEW command

--Query specific columns - SELECT column_name, ... FROM table
SELECT first_name, last_name
FROM actor;

-- Filter rows - use the WHERE clause
SELECT *
FROM actor
WHERE first_name = 'Nick'; -- single quotes

-- Regular Expression Pattern with LIKE clause - % is a wildcard. Can be 0 or any number of characters
SELECT *
FROM actor
WHERE first_name LIKE 'J%'; -- will bring up names that START WITH J AND ANY number OF CHARACTERS AFTER 

-- The underscore _ is a wildcard for 1 and only 1 CHARACTER 
SELECT *
FROM actor
WHERE first_name LIKE 'K__'; -- two underscores means 2 CHARACTERS

-- The underscore _ is a wildcard for 1 and only 1 CHARACTER 
SELECT *
FROM actor
WHERE first_name LIKE '_i_'; -- two underscores means 2 CHARACTERS

-- The underscore _ and %
SELECT *
FROM actor
WHERE first_name LIKE '_i%'; -- one underscore, CHARACTER, THEN ANY number OF CHARACTERS

-- using AND and OR in our WHERE 
-- OR - only one needs to be true
SELECT *
FROM actor
WHERE first_name LIKE 'N%' OR last_name LIKE 'W%';

-- AND - both need to be true
SELECT *
FROM actor
WHERE first_name LIKE 'N%' AND last_name LIKE 'W%';

-- use ILIKE it is case insensitive like example above instead you could do:
-- ILIKE 'n%' and ILIKE 'w%'


-- Comparing Operators in SQL:
-- Greater Than(>) -- Less Than (<)
-- Greater or Equal (>=) -- Less Than or Equal (<=)
-- Equal(=) -- Not Equal (<>)


-- Explore data of a new table with SELECT *
SELECT *
FROM payment;

-- Query for customers from data that has a payment amount GREATER THAN $2.00
SELECT customer_id, amount
FROM payment
WHERE amount > '2'; -- SQL knows the COLUMN VALUES ARE integers, so even IF you ADD a string integer it will WORK

-- Not equal
SELECT customer_id, amount
FROM payment
WHERE amount <> 7.99;

-- Get all of the payments between $3 and $8 (inclusive)
SELECT *
FROM payment
WHERE amount >=3 AND amount <= 8;

-- BETWEEN/AND clause
SELECT *
FROM payment
WHERE amount BETWEEN 3 AND 8; -- does the same thing AS example above, MORE simplified

-- Order our rows of data by using the ORDER BY clause (default to ascending)
SELECT *
FROM payment
WHERE amount BETWEEN 3 AND 8
ORDER BY amount;

-- Order our rows of data in descending order by using the ORDER BY clause and DESC (default to descending)
SELECT *
FROM payment
WHERE amount BETWEEN 3 AND 8
ORDER BY amount DESC; -- ORDER BY ANY COLUMN IF you'd LIKE 

-- Alphabetical order by default with strings
SELECT *
FROM actor
ORDER BY last_name;

-- SQL Aggregations => SUM(), AVG(), COUNT(), MIN(), MAX() -- these act as functions
-- basically taking all the rows and smash them all into one row

-- Get the sum of all of the payments
SELECT SUM(amount)
FROM payment;

-- Get the sum of all payments of more than $5
SELECT SUM(amount)
FROM payment
WHERE amount > 5;

-- Get the average of all payments of more than $5
SELECT AVG(amount)
FROM payment
WHERE amount > 5;

-- get the number of payments greater than $5
SELECT COUNT(*) -- * count how many ROWS, Brian said most people use *
FROM payment
WHERE amount > 5;

-- Alias our column names - AS keyword
SELECT MIN(amount) AS lowest_paid_amount
FROM payment;

SELECT MAX(amount) AS highest_paid_amount
FROM payment;

-- Query the number of payments per amount
SELECT COUNT(*)
FROM payment
WHERE amount = 3.99;

-- GROUP BY clause
SELECT amount, COUNT(*), SUM(amount)
FROM payment
GROUP BY amount;

-- Query the payment table to display the customers who have spent the most (aka order by sum(amount))
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

-- another way to do this by adding an alias for the sum(amount) and calling it in ORDER BY 
SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
ORDER BY total_spent DESC;

-- HAVING clause -> HAVING is to GROUP BY/Aggregations as WHERE is to SELECT 

-- Query the payment table to display the customers who have spent the most having made more than 40 total payments
SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING COUNT(*) >= 40
ORDER BY total_spent DESC;


-- LIMIT and OFFSET clause

-- LIMIT - limit the number of rows that are returned
SELECT *
FROM film
LIMIT 10;

-- OFFSET - Start your rows after a certain amount using OFFSET
SELECT *
FROM film
ORDER BY title
OFFSET 5;

-- e.g. DISPLAY customers 11-15 
SELECT *
FROM film 
ORDER BY title 
OFFSET 10 -- SKIP OVER FIRST 10 ROWS 	
LIMIT 5;

-- PUT IT ALTOGETHER
-- Display the customers 11-20 who have spent the most money in under 20 payments and has a customer_id greater than 350
SELECT customer_id, SUM(amount), COUNT(*)
FROM payment 
WHERE customer_id > 350 -- FILTER FOR customer who have id greater than 50
GROUP BY customer_id 
HAVING COUNT(*) < 20
ORDER BY SUM(amount) DESC 
OFFSET 10
LIMIT 10;

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












