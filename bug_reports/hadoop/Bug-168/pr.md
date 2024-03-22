## [ISSUE_KEY] NullPointerException in DataXceiver when `dfs.encrypt.data.overwrite.downstream.derived.qop` is true

### Description of PR

When `dfs.encrypt.data.overwrite.downstream.derived.qop` is true, `org.apache.hadoop.hdfs.server.datanode.DataXceiver#writeBlock` crashes with NullPointerException. This is because when the configuration is true, the block key is being obtained from a `datanode.blockPoolTokenSecretManager` that could still be null. 

To reproduce:
1. set `dfs.encrypt.data.overwrite.downstream.derived.qop` to true
2. run `org.apache.hadoop.hdfs.server.datanode.TestDataXceiverBackwardsCompat#testBackwardsCompat`

This PR provides a fix by making sure the blockPoolTokenSecretManager is not null while `dfs.encrypt.data.overwrite.downstream.derived.qop` is true.

### How was this patch tested?

Unit test

### For code changes:

- [x] Does the title or this PR starts with the corresponding JIRA issue id (e.g. 'HADOOP-17799. Your PR title ...')?
- [ ] Object storage: have the integration tests been executed and the endpoint declared according to the connector-specific documentation?
- [ ] If adding new dependencies to the code, are these dependencies licensed in a way that is compatible for inclusion under ASF 2.0?
- [ ] If applicable, have you updated the LICENSE, LICENSE-binary, NOTICE-binary files?

