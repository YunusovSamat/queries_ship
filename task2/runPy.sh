#!/bin/bash

cd ~/PycharmProjects/TaskPackage/ships/task2

hdfs dfs -rm -r mapreduce/task2
hdfs dfs -mkdir -p mapreduce/task2/input
hdfs dfs -put ../classes* mapreduce/task2/input

yarn jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
-D mapreduce.job.name="Task2 Job via Streaming" \
-files map.py,reduce.py \
-input mapreduce/task2/input/ \
-output mapreduce/task2/output \
-mapper map.py \
-reducer reduce.py

hdfs dfs -cat mapreduce/task2/output/part-00000
