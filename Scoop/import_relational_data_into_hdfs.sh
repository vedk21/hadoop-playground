# Import data from relational database into hdfs
sqoop import --connect jdbc:mysql://localhost/movielens --driver com.mysql.jdbc.Driver --username sqlimport -P  --table movies -m 1

# Make sure the directory (ex: 'movies') for the given import is not already present in hdfs

