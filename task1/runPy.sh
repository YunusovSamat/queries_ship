#!/bin/bash

hdfs dfs -rm -r /user/samat/task1
hdfs dfs -mkdir -p /user/samat/task1/input
hdfs dfs -put `pwd`/../outcomes* /user/samat/task1/input

yarn jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
-D mapreduce.job.name="Task1 Job via Streaming" \
-files `pwd`/map.py,`pwd`/reduce.py \
-input task1/input/ \
-output task1/output \
-mapper `pwd`/map.py \
-reducer `pwd`/reduce.py

hdfs dfs -cat /user/samat/task1/output/part-00000