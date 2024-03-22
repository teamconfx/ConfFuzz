## NameNode can timeout during initialization with dfs.datanode.volumes.replica-add.threadpool.size being 0

When `dfs.datanode.volumes.replica-add.threadpool.size` is 0, HDFS cluster is never able to start and gets timed out eventually.

To reproduce:
1. set `dfs.datanode.volumes.replica-add.threadpool.size` to 0
2. run `mvn surefire:test -Dtest=org.apache.hadoop.hdfs.server.namenode.metrics.TestNameNodeMetrics#testExcessBlocks`

We also link this issue to a PR that improves the description of `replica-add.threadpool.size` in `hdfs-default.xml` by sepecifying that it should be positive; the PR also checks whether the value is positive before it is used to initialize `addReplicaThreadPool`.