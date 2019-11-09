#!/bin/bash

hdfs dfs -rm -r /user/samat/task3
hdfs dfs -mkdir -p /user/samat/task3/input
hdfs dfs -put `pwd`/../classes* /user/samat/task3/input
hdfs dfs -put `pwd`/../ships* /user/samat/task3/input

yarn jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
-D mapreduce.job.name="Task3 Job via Streaming" \
-files `pwd`/map.py,`pwd`/reduce.py \
-input task3/input/ \
-output task3/output \
-mapper `pwd`/map.py \
-reducer `pwd`/reduce.py

hdfs dfs -cat /user/samat/task3/output/part-00000
