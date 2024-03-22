## Overflow during getDatanodeReadTimeout

Datanode read timeout equals to READ_TIMEOUT_EXTENSION * numNodes + `dfs.client.socket-timeout`. A large dfs.client.socket-timeout/numNodes/READ_TIMEOUT_EXTENSION will cause overflow.

To reproduce:
1. set `dfs.client.socket-timeout` to 2147483646
2. run `mvn surefire:test -Dtest=org.apache.hadoop.hdfs.server.namenode.ha.TestHASafeMode#testBlocksRemovedWhileInSafeModeEditsArriveFirst`

We link this issue to a PR that provides a fix by checking the read timeout calculation is at least 0.
