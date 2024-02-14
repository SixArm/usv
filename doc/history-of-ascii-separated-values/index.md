# History of ASCII separated values (ASV)

➤ <https://www.lammertbies.nl/comm/info/ascii-characters>


## ASCII 28 = FS = File separator

The file separator FS is an interesting control code, as it gives us insight in the way that computer technology was organized in the sixties. We are now used to random access media like RAM and magnetic disks, but when the ASCII standard was defined, most data was serial. I am not only talking about serial communications, but also about serial storage like punch cards, paper tape and magnetic tapes. In such a situation it is clearly efficient to have a single control code to signal the separation of two files. The FS was defined for this purpose.


## ASCII 29 = GS = Group separator

Data storage was one of the main reasons for some control codes to get in the ASCII definition. Databases are most of the time setup with tables, containing records. All records in one table have the same type, but records of different tables can be different. The group separator GS is defined to separate tables in a serial data storage system. Note that the word table wasn't used at that moment and the ASCII people called it a group.


## ASCII 30 = RS = Record separator

Within a group (or table) the records are separated with RS or record separator.


## ASCII 31 = US = Unit separator

The smallest data items to be stored in a database are called units in the ASCII definition. We would call them field now. The unit separator separates these fields in a serial data storage environment. Most current database implementations require that fields of most types have a fixed length. Enough space in the record is allocated to store the largest possible member of each field, even if this is not necessary in most cases. This costs a large amount of space in many situations. The US control code allows all fields to have a variable length. If data storage space is limited—as in the sixties—this is a good way to preserve valuable space. On the other hand is serial storage far less efficient than the table driven RAM and disk implementations of modern times. I can't imagine a situation where modern SQL databases are run with the data stored on paper tape or magnetic reels.


## ASCII 14 = Shift Out & ASCII 15 = Shift In

The original purpose of these characters was to provide a way to shift a coloured ribbon, split longitudinally usually with red and black, up and down to the other color in an electro-mechanical typewriter or teleprinter, such as the Teletype Model 38, to automate the same function of manual typewriters. Black was the conventional ambient default color and so was shifted "in" or "out" with the other color on the ribbon.

➤ <https://wikipedia.org/wiki/Shift_Out_and_Shift_In_characters>

