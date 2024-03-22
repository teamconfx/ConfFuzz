## NullPointerException in DataXceiver when `dfs.encrypt.data.overwrite.downstream.derived.qop` is true

### Description of PR

When `dfs.encrypt.data.overwrite.downstream.derived.qop` is true, `org.apache.hadoop.hdfs.server.datanode.DataXceiver#writeBlock` crashes with NullPointerException. This is because when the configuration is true, the block key is being obtained from a `datanode.blockPoolTokenSecretManager` that could still be null. 

To reproduce:
1. set `dfs.encrypt.data.overwrite.downstream.derived.qop` to true
2. run `org.apache.hadoop.hdfs.server.datanode.TestDataXceiverBackwardsCompat#testBackwardsCompat`

We link this issue to a PR that provides a fix by making sure the blockPoolTokenSecretManager is not null while `dfs.encrypt.data.overwrite.downstream.derived.qop` is true.
