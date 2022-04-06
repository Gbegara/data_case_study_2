USE sakila;

-- Select all the actors with the first name ‘Scarlett’.
SELECT *
FROM sakila.actor
WHERE first_name = 'SCARLETT';

-- checking tables
SELECT *
FROM sakila.rental;

SELECT COUNT(DISTINCT inventory_id)
FROM sakila.rental;


-- How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(customer_id)
FROM sakila.rental;

SELECT *
FROM sakila.film;


-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length)
FROM sakila.film;


SELECT MIN(length)
FROM sakila.film;

-- What's the average movie duration expressed in format (hours, minutes)?
SELECT  round((AVG(length) / 60), 0) as avg_hours, round((AVG(length) MOD 60), 0) as avg_min
FROM sakila.film;

-- How many distinct (different) actors' last names are there?
SELECT COUNT(distinct last_name)
FROM sakila.actor;

-- Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(CONVERT(MAX(rental_date), DATETIME), CONVERT(MIN(rental_date), DATETIME)) 
FROM sakila.rental;

-- Show rental info with additional columns month and weekday. Get 20 results.

SELECT *, date_format(CONVERT(rental_date, DATETIME), '%m') AS 'Rental month',
date_format(CONVERT(rental_date, DATETIME), '%d') AS 'Rental day'
FROM sakila.rental;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT
	*,
    monthname(rental_date) AS 'month',
	weekday(rental_date) AS 'weekday',
    CASE
	WHEN weekday(rental_date) <=5 then 'Workday'
	ELSE 'Weekend'
    END AS 'day_type'
FROM rental
LIMIT 20;

-- Get release years.
SELECT release_year 
FROM sakila.film;
-- Get all films with ARMAGEDDON in the title.
SELECT * 
FROM sakila.film
WHERE title 
LIKE '%ARMAGEDDON%';
-- Get all films which title ends with APOLLO.
SELECT * 
FROM sakila.film
WHERE RIGHT(title, 6) = 'APOLLO';

-- Get 10 the longest films.
SELECT * 
FROM sakila.film
ORDER BY length DESC
LIMIT 10;
-- How many films include Behind the Scenes content?
SELECT * 
FROM sakila.film
WHERE special_features 
LIKE 'Behind the Scenes';










