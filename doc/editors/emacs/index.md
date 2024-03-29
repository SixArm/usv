# Emacs notes

C-x = shows a summary about the character at point.

C-u C-x = shows details about the character at point.

The rest of this page is from the emacs manual:

https://www.gnu.org/software/emacs/manual/html_node/emacs/International-Chars.html


## 23.1 Introduction to International Character Sets

The users of international character sets and scripts have established many more-or-less standard coding systems for storing files. These coding systems are typically multibyte, meaning that sequences of two or more bytes are used to represent individual non-ASCII characters.

Internally, Emacs uses its own multibyte character encoding, which is a superset of the Unicode standard. This internal encoding allows characters from almost every known script to be intermixed in a single buffer or string. Emacs translates between the multibyte character encoding and various other coding systems when reading and writing files, and when exchanging data with subprocesses.

The command C-h h (view-hello-file) displays the file etc/HELLO, which illustrates various scripts by showing how to say “hello” in many languages. If some characters can’t be displayed on your terminal, they appear as ‘?’ or as hollow boxes (see Undisplayable Characters).

Keyboards, even in the countries where these character sets are used, generally don’t have keys for all the characters in them. You can insert characters that your keyboard does not support, using C-x 8 RET (insert-char). See Inserting Text. Shorthands are available for some common characters; for example, you can insert a left single quotation mark ‘ by typing C-x 8 [, or in Electric Quote mode, usually by simply typing `. See Quotation Marks. Emacs also supports various input methods, typically one for each script or language, which make it easier to type characters in the script. See Input Methods.

The prefix key C-x RET is used for commands that pertain to multibyte characters, coding systems, and input methods.

The command C-x = (what-cursor-position) shows information about the character at point. In addition to the character position, which was described in Cursor Position Information, this command displays how the character is encoded. For instance, it displays the following line in the echo area for the character ‘c’:

```
Char: c (99, #o143, #x63) point=28062 of 36168 (78%) column=53
```

The four values after ‘Char:’ describe the character that follows point, first by showing it and then by giving its character code in decimal, octal and hex. For a non-ASCII multibyte character, these are followed by ‘file’ and the character’s representation, in hex, in the buffer’s coding system, if that coding system encodes the character safely and with a single byte (see Coding Systems). If the character’s encoding is longer than one byte, Emacs shows ‘file ...’.

On rare occasions, Emacs encounters raw bytes: single bytes whose values are in the range 128 (0200 octal) through 255 (0377 octal), which Emacs cannot interpret as part of a known encoding of some non-ASCII character. Such raw bytes are treated as if they belonged to a special character set eight-bit; Emacs displays them as escaped octal codes (this can be customized; see Customization of Display). In this case, C-x = shows ‘raw-byte’ instead of ‘file’. In addition, C-x = shows the character codes of raw bytes as if they were in the range #x3FFF80..#x3FFFFF, which is where Emacs maps them to distinguish them from Unicode characters in the range #x0080..#x00FF.

With a prefix argument (C-u C-x =), this command additionally calls the command describe-char, which displays a detailed description of the character:

* *The character set name, and the codes that identify the character within that character set; ASCII characters are identified as belonging to the ascii character set.
* The character’s script, syntax and categories.
* What keys to type to input the character in the current input method (if it supports the character).
* The character’s encodings, both internally in the buffer, and externally if you were to save the buffer to a file.
* If you are running Emacs on a graphical display, the font name and glyph code for the character. If you are running Emacs on a text terminal, the code(s) sent to the terminal.
* If the character was composed on display with any following characters to form one or more grapheme clusters, the composition information: the font glyphs if the frame is on a graphical display, and the characters that were composed.
* The character’s text properties (see Text Properties in the Emacs Lisp Reference Manual), including any non-default faces used to display the character, and any overlays containing it (see Overlays in the same manual).

Here’s an example, with some lines folded to fit into this manual:

```
             position: 1 of 1 (0%), column: 0
            character: ê (displayed as ê) (codepoint 234, #o352, #xea)
    preferred charset: unicode (Unicode (ISO10646))
code point in charset: 0xEA
               script: latin
               syntax: w        which means: word
             category: .:Base, L:Left-to-right (strong), c:Chinese,
                       j:Japanese, l:Latin, v:Viet
             to input: type "C-x 8 RET ea" or
                       "C-x 8 RET LATIN SMALL LETTER E WITH CIRCUMFLEX"
          buffer code: #xC3 #xAA
            file code: #xC3 #xAA (encoded by coding system utf-8-unix)
              display: by this font (glyph code)
    xft:-PfEd-DejaVu Sans Mono-normal-normal-
        normal-*-15-*-*-*-m-0-iso10646-1 (#xAC)

Character code properties: customize what to show
  name: LATIN SMALL LETTER E WITH CIRCUMFLEX
  old-name: LATIN SMALL LETTER E CIRCUMFLEX
  general-category: Ll (Letter, Lowercase)
  decomposition: (101 770) ('e' '^')
```
