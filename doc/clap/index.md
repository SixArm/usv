# Command line argument parsing (CLAP) 

USV tools should enable users to choose their preferred output style.

USV tools for terminals should enable options with these settings.

Options for USV separators and modifiers:

* -u, --unit-separator : Set the unit separator string.

* -r, --record-separator : Set the record separator string.

* -g, --group-separator : Set the group separator string.

* -f, --file-separator : Set the file separator string.

* --escape : Set the escape string.

* --end-of-transmission : Set the end-of-transmission string.

Options for USV style sets:

* --style-braces : Set the style to use braces, such as "{US}" for Unit Separator.

* --style-controls : Set the style to use controls, such as "\u{001F}" for Unit Separator.

* --style-symbols : Set the style to use symbols, such as "␟" for Unit Separator.

* --style-liners : Set the style to use liners wrapping every symbol, such as "\n␟\n" for Unit Separator.

* --style-sheets : Set the style similar to spreadsheet sheets, such as "␟" for Unit Separator and "␟\n" for Record Separator.

Options for command line tools:

* -h, --help : Print help

* -V, --version : Print version

* -v, --verbose... : Set the verbosity level: 0=none, 1=error, 2=warn, 3=info, 4=debug, 5=trace. Example: --verbose …

* --test : Print test output for debugging, verifying, tracing, and the like. Example: --test
