#!/bin/bash

cd ~/PycharmProjects/TaskPackage/ships/task4

hdfs dfs -rm -r mapreduce/task4
hdfs dfs -mkdir -p mapreduce/task4/input
hdfs dfs -put ../classes* mapreduce/task4/input
hdfs dfs -put ../ships* mapreduce/task4/input

yarn jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
-D mapreduce.job.name="Task4 Job via Streaming" \
-files map.py,reduce.py \
-input mapreduce/task4/input/ \
-output mapreduce/task4/output \
-mapper map.py \
-reducer reduce.py

hdfs dfs -cat mapreduce/task4/output/part-00000
