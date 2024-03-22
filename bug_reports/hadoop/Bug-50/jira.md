## NegativeArraySizeException thrown in FSOutputSummer.java given large file.bytes-per-checksum


Buffer size of FSOutputSummer equals to `file.bytes-per-checksum` times `BUFFER_NUM_CHUNKS`. A large `file.bytes-per-checksum` causes buffer size to overflow and crash with NegativeArraySizeException.

To reproduce:
1. set `file.bytes-per-checksum` to 238609295
2. `mvn surefire:test -Dtest=org.apache.hadoop.hdfs.TestDecommissionWithStriped#testFileSmallerThanOneStripe`

We linked this issue to a PR that provides a fix which checks the buffer size is positive after multiplying `file.bytes-per-checksum` with `BUFFER_NUM_CHUNKS`
