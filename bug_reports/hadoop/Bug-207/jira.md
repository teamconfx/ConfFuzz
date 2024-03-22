## Negative timeout in ZKFailovercontroller due to overflow

Graceful fence timeout of FailoverController in ZKFailovercontroller equals to `ha.failover-controller.graceful-fence.rpc-timeout.ms` * 2. Since users are unaware of this calculation, it thus has risks of overflowing to a negative number if users set `ha.failover-controller.graceful-fence.rpc-timeout.ms` to a large value.

To reproduce:
1. set `ha.failover-controller.graceful-fence.rpc-timeout.ms` to 1092752431
2. run `mvn surefire:test -Dtest=org.apache.hadoop.ha.TestZKFailoverController#testGracefulFailoverFailBecomingStandby`

This PR provides a fix by checking the timeout after multiplication is at least 0.
