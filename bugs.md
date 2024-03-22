# No Checker / Missing(Wrong) Message
| Project | Config | Issue/Test | Status|
| --- | --- | --- | --- |
|HCommon|`hadoop.security.groups.cache.background.reload.threads`|#116|
|HCommon|`hadoop.http.authentication.token.validity`|#146|
| MapReduce-ClientCore | `mapreduce.output.fileoutputformat.compress.codec`, `mapreduce.output.fileoutputformat.compress` | #138 |
| MapReduce-Client-Core | `mapreduce.job.encrypted-intermediate-data.buffer.kb`, `mapreduce.job.encrypted-intermediate-data` | #137 |
|Hive-Common|`hive.service.metrics.file.frequency`|#124|
|Hive-Common|`hive.hashtable.initialCapacity`|#127|
|HDFS|`hadoop.security.groups.cache.background.reload`|#116|[Opened](https://issues.apache.org/jira/browse/HDFS-17100)|
|HDFS|`fs.permissions.umask-mode`|#120|[Opened](https://issues.apache.org/jira/browse/HDFS-17101)|
|Hive-Common|`hive.server2.wm.worker.threads`|#122|
|Hive-Common|`hive.trigger.validation.interval`|#123|
|Hive-Common|`hive.compactor.request.queue=1059293881`|org.apache.hadoop.hive.ql.txn.compactor.TestDeltaFilesMetricFlags#testDeltaFilesMetricFromInitiatorWithAcidMetricsThreadDisabled|
|Yarn-Common|`ipc.server.read.connection`|#112|
|Eclipse-Jetty||#108|
|HCommon|`ipc.server.read.connection-queue.size`=`-394668039`|`org.apache.hadoop.security.TestDoAsEffectiveUser#testRealUserIPNotSpecified`|
| HCommon | `hadoop.security.kms.client.failover.sleep.base.millis`=`-1135827770` | `org.apache.hadoop.crypto.key.kms.TestLoadBalancingKMSClientProvider#testTokenServiceCreationWithUriFormat`|
| HCommon | {\'ipc.maximum.data.length\': \'-92946211\'} | org.apache.hadoop.ipc.TestIPC#testIOEOnServerReadParam |
| HCommon | {'ipc.server.handler.queue.size': '-1277873265'} | org.apache.hadoop.ipc.TestProtoBufRPCCompatibility#testProtocolVersionMismatch |
| HCommon | {'hadoop.security.kms.client.failover.sleep.max.millis': '-1714757076'} | org.apache.hadoop.crypto.key.kms.TestLoadBalancingKMSClientProvider#testClientRetriesIdempotentOpWithSocketTimeoutExceptionFails |
| HCommon | {'ipc.client.connect.timeout': '-956117115'} | org.apache.hadoop.ipc.TestIPC#testInitialCallRetryCount |
| HCommon | {'hadoop.http.max.response.header.size': '-1218511957'} | org.apache.hadoop.http.TestHttpServerLogs#testLogsEnabled |
| HCommon | {'hadoop.http.max.threads': '0'} | org.apache.hadoop.http.TestHttpServerLifecycle#testCreatedServerIsNotAlive |
| Hive-Common | hive.trigger.validation.interval=0ms | org.apache.hadoop.hive.ql.exec.tez.TestWorkloadManager#testDestroyAndReturn |
| Hive-Common | hive.service.metrics.file.frequency=0ms | org.apache.hadoop.hive.ql.TestCompileLock#testParallelCompilationWithMultipleQuotas |
| Hive-Common |hive.compactor.cleaner.threads.num=2100425677| org.apache.hadoop.hive.ql.txn.compactor.TestCleaner2#nothing |
| Hive-Common | hive.hook.proto.rollover-interval=0ms | org.apache.hadoop.hive.ql.hooks.TestHiveProtoLoggingHook#testFailureEventLog|
|HCommon|zk-dt-secret-manager.token.seqnum.batch.size=0|org.apache.hadoop.security.token.delegation.TestZKDelegationTokenSecretManager#testRenewTokenSingleManager|
|MapReduce|**mapreduce.job.encrypted-intermediate-data=true, mapreduce.job.encrypted-intermediate-data.buffer.kb=632442548**|org.apache.hadoop.mapreduce.task.reduce.TestFetcher#testInterruptOnDisk|
|MapReduce|**mapreduce.client.submit.file.replication=33587967**|org.apache.hadoop.mapreduce.TestJobResourceUploaderWithSharedCache#testSharedCacheArchivesAndLibjarsEnabled|
|HDFS|**dfs.webhdfs.socket.read-timeout=377895d**|org.apache.hadoop.hdfs.web.TestWebHDFSAcl#testModifyAclEntriesOnlyAccess|
|HDFS|dfs.namenode.quota.init-threads=520060671|org.apache.hadoop.hdfs.server.namenode.TestFileContextAcl#testUMaskDefaultAclNewFile|
|HDFS|dfs.namenode.max.op.size=0|org.apache.hadoop.hdfs.server.namenode.snapshot.TestSnapshotDeletion#testDeleteSnapshot1|
|HDFS|**dfs.namenode.handler.count=2139792275**|org.apache.hadoop.hdfs.TestDecommission#testDecommission|
|HDFS|dfs.namenode.gc.time.monitor.observation.window.ms=6403d|org.apache.hadoop.hdfs.server.namenode.TestSnapshotPathINodes#testSnapshotPathINodes|
|HDFS|dfs.datanode.handler.count=167948301|org.apache.hadoop.hdfs.server.namenode.TestSnapshotPathINodes#testSnapshotPathINodes|
|HDFS|dfs.namenode.gc.time.monitor.sleep.interval.ms=2h|org.apache.hadoop.hdfs.server.namenode.TestSnapshotPathINodes#testSnapshotPathINodes|
|HDFS|dfs.datanode.ec.reconstruction.threads=0|org.apache.hadoop.hdfs.server.namenode.TestFileContextAcl#testSetAclOnlyAccess|
|HDFS|dfs.webhdfs.socket.connect-timeout=49677h, hadoop.security.authentication=kerberos|org.apache.hadoop.hdfs.web.TestWebHdfsUrl#testEncodedPathUrl|
|HBase|hbase.regionserver.wal.disruptor.event.count=301, hbase.wal.provider=multiwal|org.apache.hadoop.hbase.wal.TestWALMethods#testGetSplitEditFilesSorted|
|Hive|hive.metastore.fastpath=true, hive.direct.sql.max.query.length=515261603|org.apache.hadoop.hive.ql.lockmgr.TestDbTxnManager#testHeartbeaterReplicationTxn|
|HCommon|hadoop.service.shutdown.timeout=0m|org.apache.hadoop.util.TestShutdownHookManager#testDuplicateRegistration|

# Test Bug
|Project|Type|Config|Issue|Seriousness|
| --- | --- | --- | --- |---|
|HCommon|Wrong Message||#149|Low|
|HDFS|Timeout|`dfs.datanode.peer.metrics.min.outlier.detection.samples`|#115|[Opened](https://issues.apache.org/jira/browse/HDFS-17102)
|HDFS|Null Pointer| `dfs.namenode.maintenance.replication.min`|#118|[Opened](https://issues.apache.org/jira/browse/HDFS-17103)
|Yarn-Common|Incorrect File Path||#113|[Opened](https://issues.apache.org/jira/browse/YARN-11532)|
|Yarn-Common|Null Pointer|`yarn.node-labels.configuration-type`|#110|Low|
|HCommon|Wrong Casting||#100|[Opened](https://issues.apache.org/jira/browse/HADOOP-18803)|
|HCommon|Wrong Casting|`hadoop.security.authentication`|#106|[Opened](https://issues.apache.org/jira/browse/HADOOP-18814)|
|HBase|Null Pointer|`hfile.block.cache.size`|#155|[Opened](https://issues.apache.org/jira/browse/HBASE-27986)|
|HDFS|Cache Pollution|`fs.permissions.umask-mode`|`org.apache.hadoop.hdfs.TestDecommission#testDecommission2`|Medium|
|HDFS|Null Pointer|`dfs.namenode.replication.min`|#157|[Opened](https://issues.apache.org/jira/browse/HDFS-17110)
|HDFS|Null Pointer|`dfs.client.read.shortcircuit`|#159|[Opened](https://issues.apache.org/jira/browse/HDFS-17108)|
|HDFS|Flaky|`dfs.client.failover.random.order`|#170|[Opened](https://issues.apache.org/jira/browse/HDFS-17132)|
|HDFS|Null Pointer|`dfs.namenode.quota.init-threads`|#171|[Opened](https://issues.apache.org/jira/browse/HDFS-17133)|
|Kylin|Cast Exception|`kylin.cube.rowkey.max-size`|#173|Medium|
|HBase|Cast Exception|`hfile.block.cache.policy`|#175|Medium|
|HBase|Null Pointer|`hbase.lru.blockcache.hard.capacity.limit.factor`|#176|[Opened](https://issues.apache.org/jira/browse/HBASE-27995)|
|Hive|Class Cast Exception|hive.test.mode=true, hive.cbo.enable=false|org.apache.hadoop.hive.ql.hooks.TestQueryHooks#testAllQueryLifeTimeHooks||
|HCommon|No Message|hadoop.security.key.default.bitlength=12769|org.apache.hadoop.crypto.key.TestKeyProviderFactory#testJksProviderPasswordViaConfig||

there's another bug here regarding the state pollution of @Before.

# State Polluter
|Project|Config|Issue|Status|
|---|---|---|---|
|MapReduce-Client-Core|`fs.permissions.umask-mode`|#136|[Opened](https://issues.apache.org/jira/browse/MAPREDUCE-7443)
|HDFS|`dfs.namenode.storage.dir.perm`|#105|[Opened](https://issues.apache.org/jira/browse/HDFS-17104)
|Hive| hive.scratch.dir.permission|org.apache.hadoop.hive.ql.processors.TestSetProcessor#testHiddenConfig||


# Ad-hoc Ones
|Project|Type|Config|Issue|Seriousness|
|---|---|---|---|---|
|Flink-Core|YAML Parsing||#135|Low|
|JQF|Coverage Calculation||#134|[Opened](https://github.com/rohanpadhye/JQF/issues/234)|
|Hive-Common|Wrong Validator|`hive.hook.proto.rollover-interval`|#126|Low|
|Kylin-Cube|Misleading Inheritance|`kylin.cube.cuboid-scheduler`|#128|Medium|
|Hive-Common|Infinite Loop|`hive.mapjoin.optimized.hashtable.wbsize`|#132|[Opened](https://issues.apache.org/jira/browse/HIVE-27519)|
|MapReduce-Client-Core|Extra Line Read| `io.file.buffer.size`|#133|[Opened](https://issues.apache.org/jira/browse/MAPREDUCE-7444)|
|HDFS|Infinite Log Purge|`dfs.namenode.max.extra.edits.segments.retained`|#121|[Opened](https://issues.apache.org/jira/browse/HDFS-17105)
|Yarn-Common|Out of Reader|`ipc.server.read.threadpool.size`|#111|[Opened](https://issues.apache.org/jira/browse/YARN-11530)|
|HCommon|Config Key Collision|`fs.viewfs.mounttable.default.name.key`|#109|[Opened](https://issues.apache.org/jira/browse/HADOOP-18802)|
|HCommon|Null Pointer?|`hadoop.security.group.mapping.ldap.search.group.hierarchy.levels`|#107|[Opened](https://issues.apache.org/jira/browse/HADOOP-18821)|
|Hive-Common|Groupby Malfunction|`hive.vectorized.groupby.maxentries`|#102|[Opened](https://issues.apache.org/jira/browse/HIVE-27497)|
|HCommon|Socket Leak|`ipc.client.connection.idle-scan-interval.ms`|#101|[Opened](https://issues.apache.org/jira/browse/HADOOP-18800)|
|HDFS|Not Sure|`dfs.datanode.volumes.replica-add.threadpool.size`|#143|[Opened](https://issues.apache.org/jira/browse/HDFS-17106)
|HCommon|Casting Error|`fs.file.impl`|#154|[Opened](https://issues.apache.org/jira/browse/HBASE-27987)|
|JQF|Coverage Collector Infinite Loop ||#153|Medium|
|HBase|Test Failure|`hbase.ipc.server.callqueue.read.ratio`|#160|[Opened](https://issues.apache.org/jira/browse/HBASE-27985)|
|MapReduce|Inconsistent Behaviour|`mapreduce.fileoutputcommitter.cleanup.skipped`|#169|[Opened](https://issues.apache.org/jira/browse/MAPREDUCE-7448)|
|Zeppelin|Improper Handling|`zeppelin.interpreter.connection.poolsize`|#174|Medium|
|Hive|WIP|hive.txn.timeout=1ms|org.apache.hadoop.hive.ql.lockmgr.TestDbTxnManager#testSingleWritePartition|High|
|Hive|Inconsistent Behavior|hive.vectorized.groupby.flush.percent=0.2543964982032776|org.apache.hadoop.hive.ql.exec.vector.TestVectorGroupByOperator#testRollupAggregationWithBufferReuse|Medium|
|HCommon|Why?|file.bytes-per-checksum=7|org.apache.hadoop.fs.TestChecksumFileSystem#testVerifyChecksum|Medium|
|HDFS|Why?|dfs.encrypt.data.transfer=true|org.apache.hadoop.hdfs.TestFileAppend3#testAppendToPartialChunk|Medium|
|HDFS|Missing Check|dfs.datanode.directoryscan.threads=0|org.apache.hadoop.hdfs.server.datanode.TestDataXceiverBackwardsCompat#testBackwardsCompat|Medium|
|Yarn|Decompression Error|indexedFile.fs.input.buffer.size=7|org.apache.hadoop.yarn.logaggregation.filecontroller.ifile.TestLogAggregationIndexedFileController#testFetchApplictionLogsHar|Medium|
|HBase|Why?|hbase.ipc.server.callqueue.read.ratio=24103|org.apache.hadoop.hbase.ipc.TestSimpleRpcScheduler#testCallQueueInfo|Medium|
|Hbase|Why?|hbase.ipc.server.callqueue.read.ratio=26181375|org.apache.hadoop.hbase.ipc.TestSimpleRpcScheduler#testCoDelScheduling|Low|

