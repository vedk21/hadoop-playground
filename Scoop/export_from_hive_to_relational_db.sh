# Export data from hive into relational database
sqoop export --connect jdbc:mysql://localhost/movielens --driver com.mysql.jdbc.Driver --username sqlimport -P  --table exported_movies -m 1 --export-dir /apps/hive/warehouse/movies --input-fields-terminated-by '\0001'

# Make sure proper permissions are given inside the relational db
