-- Resource --
-- https://data-flair.training/blogs/hadoop-pig-tutorial/ --

-- Load a data file --
<RELATION_NAME> = LOAD '<PATH_OF_THE_FILE_ON_HDFS>' AS (<COLUMN1>: <DATATYPE>, <COLUMN2>: <DATATYPE>,...);

-- Declaring delimeter while loading data files --
<RELATION_NAME> = LOAD '<PATH_OF_THE_FILE_ON_HDFS>' USING PigStorage('|') AS (<COLUMN1>: <DATATYPE>, <COLUMN2>: <DATATYPE>,...);

-- Process individual rows of data --
<RELATION_NAME> = FOREACH <RELATION_NAME> GENERATE AVG(<COLUMN1>), ToUnixTime(ToDate(<COLUMN2>, 'dd-MMM-yyyy')), ..., <COLUMNn>;

-- Group rows of data over a common condition --
<RELATION_NAME> = GROUP <RELATION_NAME> BY <COMMON_COLUMN>;

-- Describe the complete schema for a relation --
DESCRIBE <RELATION_NAME>

-- Use of relation name while using columns --
<RELATION_NAME> = FOREACH <RELATION_NAME> GENERATE AVG(<RELATION_NAME>.<COLUMN1>), ..., <COLUMNn>;

-- Filter the rows on the basis of condition --
<RELATION_NAME> = FILTER <RELATION_NAME> BY <COLUMN_NAME> <OPERATOR> <VALUE>;

-- Join two relations on common condition --
<RELATION_NAME> = JOIN <RELATION_NAME1> BY <COMMON_COLUMN_NAME>, <RELATION_NAME2> BY <COMMON_COLUMN_NAME>;

-- Sort the relation on column --
<RELATION_NAME> = ORDER <RELATION_NAME> BY <COLUMN_NAME>;

-- Show results on IO --
DUMP <RELATION_NAME>;
