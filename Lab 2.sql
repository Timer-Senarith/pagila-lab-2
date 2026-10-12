-- Q1 Basic INNER JOIN
SELECT c.first_name,
       c.last_name,
       a.address,
       ci.city
FROM customer AS c
INNER JOIN address AS a ON c.address_id = a.address_id
INNER JOIN city AS ci ON a.city_id = ci.city_id;

-- Q2 LEFT JOIN to find non matching rows
SELECT c.customer_id,
       c.first_name,
       c.last_name
FROM customer AS c
LEFT JOIN payment AS p ON c.customer_id = p.customer_id
WHERE p.customer_id IS NULL;

-- Q3 Multi table JOIN using the film rental chain
SELECT c.first_name,
       c.last_name,
       f.title,
       r.rental_date
FROM customer AS c
INNER JOIN rental AS r ON c.customer_id = r.customer_id
INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id
INNER JOIN film AS f ON i.film_id = f.film_id
WHERE c.customer_id = 130
ORDER BY r.rental_date ASC;

-- Q4 FULL OUTER JOIN for a data quality check
SELECT f.film_id,
       i.inventory_id
FROM film AS f
FULL OUTER JOIN inventory AS i ON f.film_id = i.film_id
WHERE f.film_id IS NULL
   OR i.inventory_id IS NULL;

-- Q5 JOIN type selection
-- 1. INNER JOIN: Only customers with matching rental records are needed.

-- 2. LEFT JOIN: Keeps every actor, including those with no films and when joining actor to film_actor and then film.

-- 3. FULL OUTER JOIN: Keeps records from both staff tables so records and found in only one store system can be identified.

-- Q6 Evaluate AI generated query

-- 1. The missing join condition creates a Cartesian product, pairing every qualifying film with every rental, even when unrelated.

-- 2. I would compare the result count with SELECT COUNT(*) FROM rental. The incorrect count is qualifying films × rentals, instead of one row per rental.

-- 3. The corrected query connects rental to film through inventory:

-- SELECT f.title,
--        r.rental_date
-- FROM rental AS r
-- INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id
-- INNER JOIN film AS f ON i.film_id = f.film_id
-- ORDER BY r.rental_date;

-- 4. Inflated rental figures could lead a store manager to purchase unnecessary film copies.

