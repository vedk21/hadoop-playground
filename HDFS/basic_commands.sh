# list down the files from hdfs
hadoop fs -ls

# create directory
hadoop fs -mkdir <NAME_OF_DIRECTORY>

# copy file from local machine
hadoop fs -copyFromLocal <LOCAL_FILE_PATH> <REMOTE_DESTINATION_PATH>
