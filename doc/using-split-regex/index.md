# Split regex

If you prefer using split and regex on your own, rather than a specific USV library, then it's easy to get mostly-correct non-standard USV parsing.

If your split and regex have basic capabilities:

```regex
data = input split on "␗" first

files = data split on "[\n\r]*␜[\n\r]*"

groups = file split on "[\n\r]*␝[\n\r]*"

records = group split on "[\n\r]*␞[\n\r]*"

units = unit split on "[\n\r]*␟[\n\r]*"
```

If your split and regex have advanced capabilities including negative looks:

```regex
data = input split on "␗" first

files = data split on "[\n\r]*(?<!␛)␜[\n\r]*"

groups = file split on "[\n\r]*(?<!␛)␝[\n\r]*"

records = group split on "[\n\r]*(?<!␛)␞[\n\r]*"

units = unit split on "[\n\r]*(?<!␛)␟[\n\r]*"
```
