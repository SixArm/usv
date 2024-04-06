# Microsoft Excel (XLSX)

Microsoft Excel (XLSX) is among the world's most popular spreadsheet programs. It uses a data format called "XLSX" which in turn uses XML and binary compression.

* Has spreadsheet sheets. Each sheet is called a "Worksheet", and can contain columns and rows.

* Has spreadsheet folios. Each folio is called a "Workbook", and can contain one or more sheets.

* Does not have a greater hierarchy, such as a collection of folios.

* Can import/export data in many formats, such as CSV and TSV, but not yet USV.


## Custom delimiters

Microsoft Excel enables the user to import/export using a wide range of custom delimiters, such as column separators and row separators.


## In our experience

In our experience, the XLSX is great for primarily reading and editing by using Microsoft Excel or a compatible spreadsheet program. We had some success using decompression software then a XML editor, but this process and the XML tooling is harder for end users to do.


### Workbooks and Worksheets

We work with spreadsheets that are folios a.k.a. workbooks, that each contain multiple sheets a.k.a. worksheets.

```txt
my-workbook-1.xlsx
my-workbook-2.xlsx
my-workbook-3.xlsx
```

Or if we export data to CSV or similar format then we have even more files:

```txt
my-workbook-1-worksheet-1.csv
my-workbook-1-worksheet-2.csv
my-workbook-1-worksheet-3.csv
my-workbook-2-worksheet-1.csv
my-workbook-2-worksheet-2.csv
my-workbook-2-worksheet-3.csv
my-workbook-3-worksheet-1.csv
my-workbook-3-worksheet-2.csv
my-workbook-3-worksheet-3.csv
```

To send all the data to another team, we have tried a variety of combiner tools, such as `tar` and `zip`.

For comparison, USV can contain all the data, because a USV file is equivalent to a spreadsheet folio, and USV group is equivalent to a spreadsheet sheet.

Thus our export uses one filesystem file:

```txt
my.usv
```
