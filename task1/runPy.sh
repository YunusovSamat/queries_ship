#!/bin/bash

cd ~/PycharmProjects/TaskPackage/ships/task1

hdfs dfs -rm -r mapreduce/task1
hdfs dfs -mkdir -p mapreduce/task1/input
hdfs dfs -put ../outcomes* mapreduce/task1/input

yarn jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
-D mapreduce.job.name="Task1 Job via Streaming" \
-files map.py,reduce.py \
-input mapreduce/task1/input \
-output mapreduce/task1/output \
-mapper map.py \
-reducer reduce.py

hdfs dfs -cat mapreduce/task1/output/part-00000
