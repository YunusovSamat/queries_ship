#!/bin/bash

hdfs dfs -rm -r /user/samat/task4
hdfs dfs -mkdir -p /user/samat/task4/input
hdfs dfs -put `pwd`/../classes* /user/samat/task4/input
hdfs dfs -put `pwd`/../ships* /user/samat/task4/input

yarn jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
-D mapreduce.job.name="Task4 Job via Streaming" \
-files `pwd`/map.py,`pwd`/reduce.py \
-input task4/input/ \
-output task4/output \
-mapper `pwd`/map.py \
-reducer `pwd`/reduce.py

hdfs dfs -cat /user/samat/task4/output/part-00000
