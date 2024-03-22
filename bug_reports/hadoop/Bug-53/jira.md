## GcTimeMonitor crashes with NegativeArraySizeException during initialization

The garbage collection data buffer size equals to `dfs.namenode.gc.time.monitor.observation.window.ms` divided by `dfs.namenode.gc.time.monitor.sleep.interval.ms` plus 2. When the observation window is a large value, the caculation overflows, resulting in a negative buffer size.

To reproduce:
1. set `dfs.namenode.gc.time.monitor.observation.window.ms` to 945099495m
2. run `mvn surefire:test -Dtest=org.apache.hadoop.hdfs.TestHDFSFileSystemContract#testWriteReadAndDeleteHalfABlock`

We link this issue to the PR that provides a fix by checking the computed buffer size is not only within `128 * 1024` but also greater than 0.