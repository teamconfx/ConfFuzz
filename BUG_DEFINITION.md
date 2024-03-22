# What kind of failures should be a configuration-related bug found by Confuzz?

For a quick view of what kind of bugs Confuzz have found, please check this [issue](https://github.com/xlab-uiuc/confuzz/issues/32).

## Type1: No useful message or no parameter value checker

This type of failure is due to two reasons:
(1) the system does not provide enough information
when there is *invalid* configuration that crashes the system.

Example [issue](https://github.com/xlab-uiuc/confuzz/issues/116)

(2) the lack of configuration parameter checker, such that
bad configuration value will be directly used by the system and causes system failure.
(e.g. one parameter should require a positive number, but the system does not check the
actual value and directly use it).

Example [issue](https://github.com/xlab-uiuc/confuzz/issues/122)

## Type2: Others:

For example: logic related bug / incorrect behavior / system crash (e.g. Null Pointer Exception)

# What kind of failures are false positives (FP)?

## Assertion Failure

When a test assert some configuration parameter to be some specific value, any fuzzing
on such parameter with a different value would fail the test and cause failure.

Example:
```java
public void test() {
	Configuration conf = new Configuration();
	String name = conf.get("confuzz.author"); // <--- Get the value of configuration paraemter "confuzz.author"
	Assert.assertEquals(name, "shuai"); // <--- have assertion that the value should be "shuai" instead of any other value
}
```

With the above example, if you fuzz any other value than "shuai", the test will fail. This failure
is a false positive since it just simply breaks the test assumption but does not have any other logic bug or
parameter related bug.


## Test failure with exact parameter / value pointed out

When a test failed with a very clear information printed, for example, which parameter or what value causing the 
failure, then we treat this failure as a false positive.
