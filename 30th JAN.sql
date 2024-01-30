
-- I want something to analyse the pattern between film language and its rental rate
-- Send me a data extract (a report) that shows language of each movie, its title and
-- the rental rate.

select f.title as movie_title,f.rental_rate,l.name as language_of_movie from film as f inner join 
language as l on f.language_id=l.language_id;

-- Show me a list of actors and the count of movies they have acted in. Sort
-- it in a way that the actor who has done most movies is at top.

select CONCAT(a.first_name,' ',a.last_name) as actor_name, count(f.title) as movie_count from film as f
inner join film_actor as fa on f.film_id=fa.film_id join actor as a on fa.actor_id=a.actor_id  
group by actor_name  order by  movie_count desc; 

-- I want to create a report, that shows the different ratings of all movies, and count of
-- movies that have been rented for each rating.
--film,rental,inventory

select f.rating as rating,count(i.inventory_id) as rented_movie from film as f left join inventory as i on i.film_id = f.film_id join rental as r on i.inventory_id = r.inventory_id 
group by rating

-- The "rental" table has fields for rental_date (when the movie was rented), and return_date (when it
-- was returned). We want to reach out to customers whose rental duration was 7 or more days, and
-- send them an email. Can you create a report for me that lists down following columns:



-- Rental Date
--  Return Date
-- Rent Duration that is, difference between two dates (HINT: Use AGE function)
-- Customer First name
-- Customer Last Name
-- Customer Email

-- You can find the last 3 fields in the "customer" table
-- Keep the data sorted by rent duration (high to low) so we can see the longest renters first.

SELECT r.rental_date, r.return_date, AGE(return_date, rental_date) AS "Rent Duration", c.first_name, c.last_name, c.email
FROM rental as r
JOIN customer as c 
ON r.customer_id= c.customer_id
WHERE AGE (return_date, rental_date) >= interval '7 days'
ORDER BY "Rent Duration" ASC;


-- The "film" table has a title field containing name of movies. Some of the movie names are
-- pretty long. Practice writing queries using SUBSTR function to do following:

-- Return string after the 10th character
-- Return string after the 15th character. Notice how some results are blank because titles
-- do not have 15 characters (HINT: You can use the LENGTH() function to see length of
-- title)
-- Return string after the 5th character, just 3 words
-- Return string after the 5th character, just 1 word

select title as movie_name,
substr(title,10) as after_10th_ch,
substr(title,15) as after_15th_ch,
substr(title,5,3)as start_5th_to_3_letter,
substr(title,5,1)as start_5th_to_1_letter
from film
limit 20;



