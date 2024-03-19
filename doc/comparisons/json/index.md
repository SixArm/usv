# JavaScript Object Notation (JSON)

JavaScript Object Notation (JSON) is an open standard file format and data interchange format that uses human-readable text to store and transmit data objects consisting of attribute–value pairs and arrays (or other serializable values). It is a commonly used data format with diverse uses in electronic data interchange, including that of web applications with servers. - Wikipedia ([Source](https://en.wikipedia.org/wiki/JSON))

JSON is more flexible and more powerful than USV because JSON can have infinite nesting and also data types.

Example JSON:

```json
[
    ["a","b"],
    ["d","e"]
]
```

Equivalent USV:

```usv
a␟b␟␞
c␟d␟␞
```

## In our experience

We use JSON in many web applications, API endpoints, data transformations, and the like. It works very well for these purposes.

In our experience JSON is harder to edit by hand than USV, and harder to teach to novices who want to view and edit data. USV tends to be easier for these use cases because USV is simpler.
