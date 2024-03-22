## [ISSUE_KEY] Negative timeout in ZKFailovercontroller due to overflow

### Description of PR

Graceful fence timeout of FailoverController in ZKFailovercontroller equals to `ha.failover-controller.graceful-fence.rpc-timeout.ms` * 2. Since users are unaware of this calculation, it thus has risks of overflowing to a negative number if users set `ha.failover-controller.graceful-fence.rpc-timeout.ms` to a large value.

To reproduce:
1. set `ha.failover-controller.graceful-fence.rpc-timeout.ms` to 1092752431
2. run `mvn surefire:test -Dtest=org.apache.hadoop.ha.TestZKFailoverController#testGracefulFailoverFailBecomingStandby`

This PR provides a fix by checking the timeout after multiplication is at least 0.

### How was this patch tested?

Unit test

### For code changes:

- [x] Does the title or this PR starts with the corresponding JIRA issue id (e.g. 'HADOOP-17799. Your PR title ...')?
- [ ] Object storage: have the integration tests been executed and the endpoint declared according to the connector-specific documentation?
- [ ] If adding new dependencies to the code, are these dependencies licensed in a way that is compatible for inclusion under ASF 2.0?
- [ ] If applicable, have you updated the LICENSE, LICENSE-binary, NOTICE-binary files?

