# Import data from relational database into hive
sqoop import --connect jdbc:mysql://localhost/movielens --driver com.mysql.jdbc.Driver --username sqlimport -P  --table movies -m 1 --hive-import

# Make sure the table (ex: 'movies') for the given import is not already present in hive

