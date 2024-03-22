I met a problem when I tried to replay the failure on HDFS on my local machine.
The problem actually comes from the environment difference between the server and local,
this reflects on the configuraiton value.

A concrete example from HDFS project:

The test name is called: 
org.apache.hadoop.hdfs.TestViewDistributedFileSystemWithMountLinks#testListStatusOnNonMountedPath

The key configuration parameter is:
```json
"hdfs.minidfs.basedir": "/mnt/batch/tasks/workitems/FUZZ_hdfs_r3_1M16d23h30m50s/job-1/Task755/wd/confuzz/scripts/fuzz-hadoop/hadoop-hdfs-project/hadoop-hdfs/target/test/data/dfs",
"dfs.namenode.name.dir": "file:/mnt/batch/tasks/workitems/FUZZ_hdfs_r3_1M16d23h30m50s/job-1/Task755/wd/confuzz/scripts/fuzz-hadoop/hadoop-hdfs-project/hadoop-hdfs/target/test/data/dfs/name-0-1,file:/mnt/batch/tasks/workitems/FUZZ_hdfs_r3_1M16d23h30m50s/job-1/Task755/wd/confuzz/scripts/fuzz-hadoop/hadoop-hdfs-project/hadoop-hdfs/target/test/data/dfs/name-0-2",
"dfs.namenode.checkpoint.dir": "file:/mnt/batch/tasks/workitems/FUZZ_hdfs_r3_1M16d23h30m50s/job-1/Task755/wd/confuzz/scripts/fuzz-hadoop/hadoop-hdfs-project/hadoop-hdfs/target/test/data/dfs/namesecondary-0-1,file:/mnt/batch/tasks/workitems/FUZZ_hdfs_r3_1M16d23h30m50s/job-1/Task755/wd/confuzz/scripts/fuzz-hadoop/hadoop-hdfs-project/hadoop-hdfs/target/test/data/dfs/namesecondary-0-2"
```
(There are in total 11 parmaeters related to specific directory path)

Those parameters are actually not fuzzed during the campaign because it will obviously cause test fail and false positive.
(The failure is actually caused by other parameters on Azure rounds)

However later I want to replay the failure on my local machine with the input seed of fuzzer stores. And the fuzzer will
generate these parameters' value with exact the same value as it on the Azure VMs, which is totally different with the 
environment that I have locally. And the test behaves differently. In this example the test will report can not find the 
path directory.

This makes me hard to use experiments on Azure. One way I can do is to ignore these directory-related parameters when I 
want to replay the failure on a different machine.
