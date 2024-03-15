# How to use split and regex

To use split and regex, rather than a specific USV parsing tool or library, then you have choices. 

If your split and regex have basic capabilities, then this pseudocode is mostly accurate but does not support escapes:

```regex
data = input split on "␄" first

files = data split on "[\n\r]*␜[\n\r]*"

groups = file split on "[\n\r]*␝[\n\r]*"

records = group split on "[\n\r]*␞[\n\r]*"

units = unit split on "[\n\r]*␟[\n\r]*"
```

If your split and regex have advanced capabilities including negative looks, then this pseudocode is even better, but has not yet been tests for full accuracy such as via a test suite or prover:

```regex
data = input split on "␄" first

files = data split on "[\n\r]*(?<!␛)␜[\n\r]*"

groups = file split on "[\n\r]*(?<!␛)␝[\n\r]*"

records = group split on "[\n\r]*(?<!␛)␞[\n\r]*"

units = unit split on "[\n\r]*(?<!␛)␟[\n\r]*"
```
