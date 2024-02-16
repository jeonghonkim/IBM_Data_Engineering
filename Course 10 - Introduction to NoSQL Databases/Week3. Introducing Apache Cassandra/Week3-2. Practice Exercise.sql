-- Practice Exercise
-- 1. Insert the below new row into the movie table
INSERT into movies(
    movie_id, movie_name, year_of_release)
    VALUES(6, 'Twister', 1997);
-- Verify the changes
SELECT * FROM movies;

-- 2. Modify the release year of Twister to 1996
UPDATE movies SET year_of_release = 1996 WHERE movie_id = 6;
-- Verify the changes
SELECT * FROM movies WHERE movie_id = 6;

-- 3. Delete the movie Twister
delete from movies where movie_id = 6;
-- Verify the changes
SELECT * FROM movies;

-- 4. Drop the training keyspaces
drop keyspace training;
-- Verify the changes
describe keyspaces;