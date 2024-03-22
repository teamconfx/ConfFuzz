## [HADOOP-17106] NameNode can timeout during initialization with dfs.datanode.volumes.replica-add.threadpool.size being 0

### Description of PR

When `dfs.datanode.volumes.replica-add.threadpool.size` is 0, HDFS cluster is never able to start and gets timed out eventually.

To reproduce:
1. set `dfs.datanode.volumes.replica-add.threadpool.size` to 0
2. run `mvn surefire:test -Dtest=org.apache.hadoop.hdfs.server.namenode.metrics.TestNameNodeMetrics#testExcessBlocks`

This PR improves the description of `replica-add.threadpool.size` in `hdfs-default.xml` by sepecifying that it should be positive; the PR also checks whether the value is positive before it is used to initialize `addReplicaThreadPool`.

### How was this patch tested?

Unit test

### For code changes:

- [x] Does the title or this PR starts with the corresponding JIRA issue id (e.g. 'HADOOP-17799. Your PR title ...')?
- [ ] Object storage: have the integration tests been executed and the endpoint declared according to the connector-specific documentation?
- [ ] If adding new dependencies to the code, are these dependencies licensed in a way that is compatible for inclusion under ASF 2.0?
- [ ] If applicable, have you updated the LICENSE, LICENSE-binary, NOTICE-binary files?

