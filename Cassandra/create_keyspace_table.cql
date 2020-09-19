-- Create keyspace (database in relational database) --
CREATE KEYSPACE movielens WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'} AND durable_writes = true;

-- Create table --
CREATE TABLE users (user_id int, age int, gender text, occupation text, zip text, PRIMARY KEY (user_id));

-- Describe the table schema --
DESCRIBE TABLE users;

-- Select data from table --
SELECT * FROM users;
