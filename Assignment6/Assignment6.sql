select movie.name, movie.year
from movie, person, actor
where actor_id = person.id and actor.movie_id = movie.id and actor_id = '0000133'

------------------------------------------------------------------------------------------------------

select Min(runtime), Max(runtime), Avg(runtime)
from Movie
where rating = 'R'

------------------------------------------------------------------------------------------------------

select oscar.type, oscar.year, movie.name
from oscar, Movie, person
where oscar.person_id = '0000229' and oscar.person_id = person.id and oscar.movie_id = movie.id

------------------------------------------------------------------------------------------------------

select pob, count(person.pob)
from person
where pob is not NULL
group by pob
having count(person.pob) >= 50

------------------------------------------------------------------------------------------------------

SELECT COUNT(*) 
FROM movie 
WHERE NOT EXISTS (SELECT 1 FROM oscar WHERE oscar.movie_id = movie.id);

------------------------------------------------------------------------------------------------------

SELECT person.name, COUNT(movie.id) AS num_movies_acted
FROM actor
LEFT OUTER JOIN person
ON actor.actor_id = person.id
LEFT OUTER JOIN movie
ON actor.movie_id = movie.id
WHERE person.pob like '%Sweden'
GROUP BY person.name
ORDER BY num_movies_acted DESC, person.name ASC;

-----------------------------------------------------------------------------------------------------

SELECT COUNT(director_id) 
FROM Director, movie
WHERE movie.rating = 'R' and director.movie_id = movie.id

-----------------------------------------------------------------------------------------------------

UPDATE movie
SET rating = 'PG-13'
WHERE movie.name LIKE 'Indiana Jones%' AND movie.year = 1984;

Select movie.name, movie.rating
from movie
WHERE movie.name LIKE 'Indiana Jones%' AND movie.year = 1984;

-----------------------------------------------------------------------------------------------------