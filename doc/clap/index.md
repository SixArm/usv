# Command line argument parsing (CLAP)

USV tools should enable users to choose their preferred output style.

USV tools for terminals should enable options with these settings.

Options for USV separators and modifiers:

* -u, --us : Set the unit separator string.

* -r, --rs : Set the record separator string.

* -g, --gs : Set the group separator string.

* -f, --fs : Set the file separator string.

* -e, --esc : Set the escape string.

* -z, --eot : Set the end-of-transmission string.

Options for USV marks:

* --style-symbols : Show marks as symbols, such as "␟" for Unit Separator.

* --style-controls : Show marks as controls, such as "\u001F" for Unit Separator. This is most like ASCII Separated Values (ASV).

* --style-braces : Show marks as braces, such as "{US}" for Unit Separator. This is to help plain text readers, and is not USV output.

Options for USV layout:

* --layout-0: Show each item with no line around it. This is no layout, in other words one long line.

* --layout-1: Show each item with one line around it. This is like single-space lines for long form text.

* --layout-2: Show each item with two lines around it. This is like double-space lines for long form text.

* --layout-units: Show each unit on one line. This can be helpful for line-oriented tools.

* --layout-records: Show each record on one line. This is like a typical spreadsheet sheet export.

* --layout-groups: Show each group on one line. This can be helpful for folio-oriented tools.

* --layout-files: Show one file on one line. This can be helpful for archive-oriented tools.

Options for command line tools:

* -h, --help : Print help

* -V, --version : Print version

* -v, --verbose... : Set the verbosity level: 0=none, 1=error, 2=warn, 3=info, 4=debug, 5=trace. Example: --verbose …

* --test : Print test output for debugging, verifying, tracing, and the like. Example: --test
