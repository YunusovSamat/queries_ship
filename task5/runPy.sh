#!/bin/bash

hdfs dfs -rm -r /user/samat/task5
hdfs dfs -mkdir -p /user/samat/task5/input
hdfs dfs -put `pwd`/../classes* /user/samat/task5/input
hdfs dfs -put `pwd`/../outcomes* /user/samat/task5/input

yarn jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
-D mapreduce.job.name="Task5 Job via Streaming" \
-files `pwd`/map.py,`pwd`/reduce.py \
-input task5/input/ \
-output task5/output \
-mapper `pwd`/map.py \
-reducer `pwd`/reduce.py

hdfs dfs -cat /user/samat/task5/output/part-00000
