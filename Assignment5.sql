INSERT INTO Movie (id, name, year, rating, runtime, genre, earnings_rank)
Values(4846340, 'Hidden Figures', 2016, 'PG', 127, 'BDH', NULL)

insert into Actor (movie_id)
values (4846340)

Create table Hidden_Figures(
actor_id integer primary key autoincrement,
movie_id integer,
movie_name varchar(64),
actor_name varchar(64))

Insert into hidden_figures (movie_name, movie_id)
values ('Hidden Figures', 4846340)

Insert into hidden_figures (actor_id, actor_name)
values 
	(0378245, 'Taraji P. Henson'),
	(1847117, 'Janelle Monae'),
	(0818055, 'Octavia Spencer');

select Hidden_Figures.actor_id, Hidden_Figures.movie_id, Hidden_Figures.actor_name, Hidden_Figures.movie_name
from Hidden_Figures
inner join Person
on Hidden_Figures.actor_id = Person.id
limit 3

----------------------------------------------------------------------------------------------------------------

select earnings_rank, rating, runtime
from Movie
where name = 'Incredibles 2'

----------------------------------------------------------------------------------------------------------------

select name, pob, dob
from person
where name = 'Lady Gaga' or name = 'Melissa McCarthy'

----------------------------------------------------------------------------------------------------------------

select name, year
from movie
where year >= 2010 and rating = 'G'

----------------------------------------------------------------------------------------------------------------

select avg(earnings_rank)
from movie
where rating = 'G'

----------------------------------------------------------------------------------------------------------------

select year
from oscar
group by year
having count(year) < 6 or count(year) > 6

----------------------------------------------------------------------------------------------------------------

select name, runtime
from movie
where name = 'Star Wars'


