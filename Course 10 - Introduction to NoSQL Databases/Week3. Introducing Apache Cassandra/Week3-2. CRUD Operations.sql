-- Create a keyspace named training using SimpleStrategy and replication factor of 3
CREATE KEYSPACE training
WITH replication = {'class':'SimpleStrategy', 'replication_factor':3};

-- Create a table named movies 
-- with columns ‘movie_id’ which is the primary key and integer type, 
-- ‘movie_name’ of type text, and ‘year_of_release’ of type integer
use training;
CREATE TABLE movies(
    movie_id int PRIMARY KEY,
    movie_name text,
    year_of_release int
);

-- Insert a row into the table movies
INSERT into movies(
    movie_id, movie_name, year_of_release)
    VALUES (1, 'Toy Story', 1995);
-- Verify the changes
SELECT * FROM movies;

-- Insert four rows into the table movies
INSERT into movies(
    movie_id, movie_name, year_of_release)
    VALUES (2, 'Jumanji', 1995);

INSERT into movies(
    movie_id, movie_name, year_of_release)
    VALUES (3, 'Heat', 1995);

INSERT into movies(
    movie_id, movie_name, year_of_release)
    VALUES (4, 'Scream', 1995);

INSERT into movies(
    movie_id, movie_name, year_of_release)
    VALUES (5, 'Fargo', 1996);
-- Verify the changes
SELECT * FROM movies;

-- Read the movie name with movie_id 1 from the movies table
select movie_name from movies where movie_id = 1;

-- Update table
UPDATE movies SET year_of_release = 1996 WHERE movie_id = 4;
-- Verify the changes
SELECT * FROM movies where movie_id = 4;

-- Delete table
DELETE from movies WHERE movie_id = 5;
-- Verify the changes
SELECT * FROM movies;