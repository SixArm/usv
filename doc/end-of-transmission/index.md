# End of Transmission (EOT)

The End of Transmission (EOT) symbol tells any reader that it can stop reading, and is especially useful for streaming data, such as to close a connection. EOT can also be useful for providing data files that contain USV data, then EOT, then extra non-USV information such as comments, images, attachments, etc.

* EOT tells the data reader that data streaming is done.

* EOT has no effect on the output content.

Example of a unit then an End of Transmission:

```usv
abc␞␄
```
