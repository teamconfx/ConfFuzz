# Guide of Bug Report

In this project we have found many (170+) bugs. We plan to submit bug reports for every one of them, starting from the serious ones to the trivial ones.
To try to report a bug, you should
1. Select an unreported Bug from the [Bug Tracker](https://github.com/xlab-uiuc/confuzz/issues/32)
2. Verify the Bug can be reproduced on your machine
3. Prepare the Bug Report
4. Submit the Bug Report on JIRA/Github
5. Record the Link to the Bug Report in the [Bug Tracker](https://github.com/xlab-uiuc/confuzz/issues/32)
6. Follow Up and Provide Patch if Needed

We have prepared some draft bug reports in the [issues](https://github.com/xlab-uiuc/confuzz/issues). Next, I'll use [#101](https://github.com/xlab-uiuc/confuzz/issues/101) as an example to guide you through the process of opening a bug report.

At the end of this guide you'll find all the details you need, including:
- which project and which module you should work on
- the configuration file to inject parameter *value* 
- the format of the configuration file
- the SHA of the released version to try
for each bug.

If you encountered any problem, send an email to @hwang-pku and I'll help you out.

## Bug Selection
In the [Bug Tracker](https://github.com/xlab-uiuc/confuzz/issues/32) you could see that we've clustered the bugs using severity and bug type. You should select the bugs that
- have not been reported
- are not being reported
- either are verified or have not been verified (ignore the bugs that cannot be verified)
- are the most severe
In theory when it comes to severity we would have `High` > `State Polluter` > `Null Pointer` > `Division By 0` > `Medium` > `OOM` > `No Msg` = `Low`. 

After selection, either change the seriousness of the bug to _WIP_ or add another column and write _WIP_ in it. **Please remember to put WIP** since we have multiple people working asynchronously and it would be hard to sync the progress without adding "locks".

## Bug Verification
If you have selected a bug that has been verified, jump right next to the next step.

First, you should verify that that the bug can be reproduced on the **latest commit** of the project.
The reproduction comprises two steps: injection and running.
We next show the process using the [selected bug](https://github.com/xlab-uiuc/confuzz/issues/101).

### Injection
Note that some of the bugs does not provide configs. **You don't need to inject if no config is provided**.

For injection you need to put the recorded config into a file.
The example bug is in `HCommon`, which is the `hadoop-common-project/hadoop-common` module in `apache/hadoop`.
From the draft bug report, we know that we need to inject `ipc.client.connection.idle-scan-interval.ms: -1` to the project.
Thus, we first clone the project from Github (you can google and find the Github link) and run `mvn install -DskipTests -pl -am hadoop-common-project/hadoop-common` in the root directory of the project `apache/hadoop`.
We then `cd hadoop-common-project/hadoop-common` into the module, and put
```xml
    <property>
        <name>ipc.client.connection.idle-scan-interval.ms</name>
        <value>-1</value>
    </property>
```
into the end of the file `target/test-classes/core-site.xml` before `</configuration>`.
And that finishes the injection.
Please notice that the file in `target` might be changed if you run `mvn install` again, so make sure you have the correct injected file when you try to reproduce the bug.

### Running the Test

Run `mvn surefire:test -Dtest=org.apache.hadoop.ipc.TestIPC#testSocketLeak` in the module and see if you can reproduce the failure recorded in the draft bug report. (Here the command is `mvn surefire:test` but not `mvn test`, you do not need to recompile it with `test` goal.)

### What if I cannot verify the bug?

You then need to try verify it on the released version specified by us. You could find the corresponding commit SHAs at the end of this guide. Then do the `git clone`, `git checkout` and do the verification again.

### What to do after verification?

After verification, you need to put labels on the bug issue. Put
- `verified` if verified on the latest commit
- `verified-latest` if verified on the given released version
- `unable-to-verify` if cannot verify on both commits

Please find another bug to work on if the status of the bug is not `verified`.

## Prepare the Bug Report

We have prepared a draft bug report for each bug. However, they are missing some key pieces.
Basically you need to prepare a script such that on running the script the failure can be reproduced.
We have prepared templates for the scripts.
For bugs in `HCommon` and `HDFS`, use [this script](https://github.com/xlab-uiuc/confuzz/blob/master/scripts/repro/need-inject.sh) since new configs need to be appended after the old configs.
For other bugs, use [this script](https://github.com/xlab-uiuc/confuzz/blob/master/scripts/repro/new-conf.sh).
You would need to change the parameters like `repo`, `sha`, `module`, `test`, `file` (to inject). You also need to modify the `inject` function if you want to inject multiple config parameters or in anothe r format.

After preparing the script, put the script at the end of the bug issue. You also need to add something like "Run the reproduce.sh in the attachment for a easy reproduction" and "We are happy to provide a patch if this issue is confirmed". Check [this issue](https://github.com/xlab-uiuc/confuzz/issues/101) as an example.

## Submit the Bug Report
Use the account
Username: ...
Password: ...
on JIRA to submit your reports. 
When submitting you need to remove the scripts in the bug issue and upload it as an attachment called `reproduce.sh`.
Note that the md format on JIRA is **very different** from github markdown, so **please double check** after submission.

## Record the Bug Report
Change the WIP you put before in the [Bug Tracker](https://github.com/xlab-uiuc/confuzz/issues/32) to Opened with hyperlink to the JIRA bug report.

## Provide Patches
Keep an eye on the JIRA report. Developers would potentially ask for patches, which you might need to report to us and them draft a patch. Providing patches is a very important part in contributing to the open-source community!

## Detailed infos
Check for the **label** for each issue. The label should be in [hcommon, hdfs, yarn, mapreduce, kylin, hive, flink, zeppelin, alluxio, hbase]. Find the detailed infos in the tables below for the info.

|label|repo|module|inject-file|format|release-commit|
|---|---|---|---|---|---|
|hcommon|apache/hadoop|hadoop-common-project/hadoop-common|target/test-classes/core-site.xml(append)|XML|d37586cbda38c338d9fe481addda5a05fb516f71|
|hdfs|apache/hadoop|hadoop-hdfs-project/hadoop-hdfs|target/test-classes/hdfs-site.xml(append) or target/classes/core-site.xml|XML|d37586cbda38c338d9fe481addda5a05fb516f71|
|yarn|apache/hadoop|hadoop-yarn-project/hadoop-yarn/hadoop-yarn-common|target/classes/core-site.xml or target/classes/yarn-site.xml|XML|d37586cbda38c338d9fe481addda5a05fb516f71|
|mapreduce|apache/hadoop|hadoop-mapreduce-project/hadoop-mapreduce-client/hadoop-mapreduce-client-core|target/classes/core-site.xml or target/classes/mapred-site.xml or target/classes/yarn-site.xml|XML|d37586cbda38c338d9fe481addda5a05fb516f71|
|hbase|apache/hbase|hbase-server|target/classes/hbase-site.xml or target/test-classes/hbase-site.xml(append if exists)|XML|d385524561f771dcb402905c2bdcaeb4a8fecbdb|
|kylin|apache/kylin|core-cube|target/classes/kylin.properties|CFG|322ab6e5ee9738c5a07165af398c1faeeeacb079|
|hive|apache/hive|ql|target/classes/hive-site.xml|XML|29c6bd9813edd43f6151b025295637858c3869f4|
|flink|apache/flink|flink-core||||
|zeppelin|apache/zeppelin|zeppelin-zengine|target/classes/zeppelin-site.xml|XML|c927e677466ee4917de73fee88acb6db733c692b|
|alluxio|apache/alluxio|core/common||||

XML:
```xml
<configuration>
    <property>
        <name>name1</name>
        <value>value1</value>
    </property>
    <property>
        <name>name1</name>
        <value>value2</value>
    </property>
</configuration>
```
CFG:
```
name1=value1
name2=value2
```
