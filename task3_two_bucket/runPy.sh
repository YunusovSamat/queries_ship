#!/bin/bash

cd ~/PycharmProjects/TaskPackage/ships/task3_two_bucket/

hdfs dfs -rm -r mapreduce/task3_two_bucket
hdfs dfs -mkdir -p mapreduce/task3_two_bucket/input
hdfs dfs -put ../classes* mapreduce/task3_two_bucket/input
hdfs dfs -put ../ships* mapreduce/task3_two_bucket/input

yarn jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
-D mapreduce.job.name="Task3 two bucket Job via Streaming" \
-files map.py,reduce.py \
-input mapreduce/task3_two_bucket/input/ \
-output mapreduce/task3_two_bucket/output \
-mapper map.py \
-reducer reduce.py

hdfs dfs -cat mapreduce/task3_two_bucket/output/part-00000
