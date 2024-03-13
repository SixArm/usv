# End of Transmission Block (ETB)

The End of Transmission Block (ETB) symbol tells any reader that it can stop reading, and is especially useful for streaming data, such as to close a connection. ETB can also be useful for providing data files that contain USV data, then ETB, then extra non-USV information such as comments, images, attachments, etc.

* ETB tells the data reader that data streaming is done.

* ETB has no effect on the output content.

Example of a unit then an End of Transmission Block:

```usv
abc␞␗
```
