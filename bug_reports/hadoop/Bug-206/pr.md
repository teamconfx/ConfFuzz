## [ISSUE_KEY] Overflow during getDatanodeReadTimeout

### Description of PR

Datanode read timeout equals to READ_TIMEOUT_EXTENSION * numNodes + `dfs.client.socket-timeout`. A large dfs.client.socket-timeout/numNodes/READ_TIMEOUT_EXTENSION will cause overflow.

To reproduce:
1. set `dfs.client.socket-timeout` to 2147483646
2. run `mvn surefire:test -Dtest=org.apache.hadoop.hdfs.server.namenode.ha.TestHASafeMode#testBlocksRemovedWhileInSafeModeEditsArriveFirst`

This PR provides a fix by checking the read timeout calculation is at least 0.

### How was this patch tested?

Unit test

### For code changes:

- [x] Does the title or this PR starts with the corresponding JIRA issue id (e.g. 'HADOOP-17799. Your PR title ...')?
- [ ] Object storage: have the integration tests been executed and the endpoint declared according to the connector-specific documentation?
- [ ] If adding new dependencies to the code, are these dependencies licensed in a way that is compatible for inclusion under ASF 2.0?
- [ ] If applicable, have you updated the LICENSE, LICENSE-binary, NOTICE-binary files?

