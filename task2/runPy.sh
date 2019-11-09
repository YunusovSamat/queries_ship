#!/bin/bash

hdfs dfs -rm -r /user/samat/task2
hdfs dfs -mkdir -p /user/samat/task2/input
hdfs dfs -put `pwd`/../classes* /user/samat/task2/input

yarn jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
-D mapreduce.job.name="Task2 Job via Streaming" \
-files `pwd`/map.py,`pwd`/reduce.py \
-input task2/input/ \
-output task2/output \
-mapper `pwd`/map.py \
-reducer `pwd`/reduce.py

hdfs dfs -cat /user/samat/task2/output/part-00000
