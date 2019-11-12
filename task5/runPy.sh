#!/bin/bash

cd ~/PycharmProjects/TaskPackage/ships/task5

hdfs dfs -rm -r mapreduce/task5
hdfs dfs -mkdir -p mapreduce/task5/input
hdfs dfs -put ../classes* mapreduce/task5/input
hdfs dfs -put ../outcomes* mapreduce/task5/input

yarn jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
-D mapreduce.job.name="Task5 Job via Streaming" \
-files map.py,reduce.py \
-input mapreduce/task5/input/ \
-output mapreduce/task5/output \
-mapper map.py \
-reducer reduce.py

hdfs dfs -cat mapreduce/task5/output/part-00000
