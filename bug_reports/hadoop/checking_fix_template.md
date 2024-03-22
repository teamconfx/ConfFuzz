```java
    if (byteAm > BYTES_PER_LONG) {
      throw new IllegalArgumentException(
          "Partial bytes must be less or equal to " + BYTES_PER_LONG);
    }
```

```java
    Preconditions.checkArgument(fileStatusLength >= 0,
        "Negative content length");
```