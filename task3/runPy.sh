#!/bin/bash

cd ~/PycharmProjects/TaskPackage/ships/task3

hdfs dfs -rm -r mapreduce/task3
hdfs dfs -mkdir -p mapreduce/task3/input
hdfs dfs -put ../classes* mapreduce/task3/input
hdfs dfs -put ../ships* mapreduce/task3/input

yarn jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
-D mapreduce.job.name="Task3 Job via Streaming" \
-files map.py,reduce.py \
-input mapreduce/task3/input/ \
-output mapreduce/task3/output \
-mapper map.py \
-reducer reduce.py

hdfs dfs -cat mapreduce/task3/output/part-00000
