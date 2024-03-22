## [ISSUE_KEY] GcTimeMonitor crashes with NegativeArraySizeException during initialization


### Description of PR

The garbage collection data buffer size equals to `dfs.namenode.gc.time.monitor.observation.window.ms` divided by `dfs.namenode.gc.time.monitor.sleep.interval.ms` plus 2. When the observation window is a large value, the caculation overflows, resulting in a negative buffer size.

To reproduce:
1. set `dfs.namenode.gc.time.monitor.observation.window.ms` to 945099495m
2. run `mvn surefire:test -Dtest=org.apache.hadoop.hdfs.TestHDFSFileSystemContract#testWriteReadAndDeleteHalfABlock`

This PR provides a fix by checking the computed buffer size is not only within `128 * 1024` but also greater than 0.

### How was this patch tested?

Unit test

### For code changes:

- [x] Does the title or this PR starts with the corresponding JIRA issue id (e.g. 'HADOOP-17799. Your PR title ...')?
- [ ] Object storage: have the integration tests been executed and the endpoint declared according to the connector-specific documentation?
- [ ] If adding new dependencies to the code, are these dependencies licensed in a way that is compatible for inclusion under ASF 2.0?
- [ ] If applicable, have you updated the LICENSE, LICENSE-binary, NOTICE-binary files?

