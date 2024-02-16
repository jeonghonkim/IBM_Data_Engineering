# Start the cassandra server
start_cassandra

# Connect to the cassandra server
cqlsh --username cassandra --password yourpassword

# Create a keyspace named training using SimpleStrategy and replication factor of 3
CREATE KEYSPACE training
WITH replication = {'class':'SimpleStrategy', 'replication_factor':3};

# Use training keyspace
use training;

# Create movies table
CREATE TABLE movies(
    movie_id int PRIMARY KEY,
    movie_name text,
    year_of_release int
);

# Verify the table got created
describe tables;

# Describe the table
describe movies

# Alter a table
ALTER TABLE movies
ADD genre text;
# Verify the changes
describe movies;

# Drop the table
drop table movies;
# Verify the changes
describe movies;

# Practice Excercies
# 1. Create a table names books with 3 columns;
# - 'book_id', primary key, integer
# - 'author', text and 'title', text
CREATE TABLE books(
    book_id int PRIMARY KEY,
    author text,
    title text
);
# Verify the changes
describe tables;

# 2. Add a column 'date_of_publication', date
ALTER TABLE books
ADD date_of_publication date;
# Verify the changes
describe books

# 3. Add a column 'price', decimal
ALTER TABLE books
ADD price decimal;
# Verify the changes
describe books

# 4. Drop the column 'price'
ALTER TABLE books
drop price;
# Verify the changes
describe books

# 5. Drop the books table
drop table books;
# Verify the cnages
describe tables;

# 6. Drop the training keyspace
drop keyspace training;
# Verify the cnages
describe keyspaces;

# 7. Disconnect the cassandra server
exit

