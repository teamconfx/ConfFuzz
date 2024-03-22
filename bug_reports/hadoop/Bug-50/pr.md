## [ISSUE_KEY] NegativeArraySizeException thrown in FSOutputSummer.java given large file.bytes-per-checksum


### Description of PR

Buffer size of FSOutputSummer equals to `file.bytes-per-checksum` times `BUFFER_NUM_CHUNKS`. A large `file.bytes-per-checksum` causes buffer size to overflow and crash with NegativeArraySizeException.

To reproduce:
1. set `file.bytes-per-checksum` to 238609295
2. run `mvn surefire:test -Dtest=org.apache.hadoop.hdfs.TestDecommissionWithStriped#testFileSmallerThanOneStripe`


This PR provides a fix which checks the buffer size is positive after multiplying `file.bytes-per-checksum` with `BUFFER_NUM_CHUNKS`


### How was this patch tested?

Unit test

### For code changes:

- [x] Does the title or this PR starts with the corresponding JIRA issue id (e.g. 'HADOOP-17799. Your PR title ...')?
- [ ] Object storage: have the integration tests been executed and the endpoint declared according to the connector-specific documentation?
- [ ] If adding new dependencies to the code, are these dependencies licensed in a way that is compatible for inclusion under ASF 2.0?
- [ ] If applicable, have you updated the LICENSE, LICENSE-binary, NOTICE-binary files?

