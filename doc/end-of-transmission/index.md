# End of Transmission (EOT)

The End of Transmission (EOT) mark tells any reader that it can stop reading.

* EOT tells the data reader that data is done.

* EOT has no effect on the output content.

Example of a unit "abc" then EOT then extra data "xxx" that is ignored.

```usv
abc␞␄xxx
```

EOT can be useful for a variety of use cases:

* Streaming data, such as to signal that the reader can close a connection.

* Appending data, such as USV content, then extra information such as comments.
    
* Attaching data, such as a USV spreadsheet that has MIME attachments.
