## [ISSUE_KEY] org.apache.hadoop.mapred.SpillRecord crashes due to overflow in buffer size computation

### Description of PR

A large `mapreduce.job.reduces` can cause overflow while computing the byte buffer in `org.apache.hadoop.mapred.SpillRecord#SpillRecord(int)`, since the byte buffer size equals to `mapreduce.job.reduces` * MapTask.MAP_OUTPUT_INDEX_RECORD_LENGTH


To reproduce:
1. set `mapreduce.job.reduces` to 509103844
2. run `mvn surefire:test -Dtest=org.apache.hadoop.mapred.TestMapTask#testShufflePermissions`


This PR provides a fix by checking the computed buffer size is positive.

### How was this patch tested?

Unit test

### For code changes:

- [x] Does the title or this PR starts with the corresponding JIRA issue id (e.g. 'HADOOP-17799. Your PR title ...')?
- [ ] Object storage: have the integration tests been executed and the endpoint declared according to the connector-specific documentation?
- [ ] If adding new dependencies to the code, are these dependencies licensed in a way that is compatible for inclusion under ASF 2.0?
- [ ] If applicable, have you updated the LICENSE, LICENSE-binary, NOTICE-binary files?

