## org.apache.hadoop.mapred.SpillRecord crashes due to overflow in buffer size computation

A large `mapreduce.job.reduces` can cause overflow while computing the byte buffer in `org.apache.hadoop.mapred.SpillRecord#SpillRecord(int)`, since the byte buffer size equals to `mapreduce.job.reduces` * MapTask.MAP_OUTPUT_INDEX_RECORD_LENGTH


To reproduce:
1. set `mapreduce.job.reduces` to 509103844
2. run `mvn surefire:test -Dtest=org.apache.hadoop.mapred.TestMapTask#testShufflePermissions`


We link this issue to a PR that provides a fix by checking the computed buffer size is positive.
