-- The "film" table has the replacement cost and rental duration (assume, in weeks)
-- for each movie.
-- Can you tell me the movies (just the title and relevant details) sorted by highest
-- to lowest replacement cost and rented out for 4-6 weeks.
-- Also I don't want all the data, just give me 100 records.
select  title as movie_name,replacement_cost,rental_duration 
from film where  rental_duration between 4 and 6  order by replacement_cost desc limit 100;



-- I want a list of all movies that either have the rating 'G' or 'PG'.
-- The movies must be longer than 120 minutes in length, and they should have the
-- word 'Action' anywhere in the description.
-- HINT:
-- Use the "film" table
-- Use LIKE keyword, for the requirement on 'Action'

select * from film
select title as movie_name from film where rating  in('G','PG') and length > 120 and  description ilike '%action%';



-- The "actor" table has names of all actors. Can you tell me which actor first names
-- are most common and how many records have it?

SELECT DISTINCT first_name, COUNT(*)
FROM actor
GROUP BY first_name
ORDER BY count DESC;
