# Text files, text editors and regular expressions

## Text vs binary files

At the very basic level there are two types of computer files: text files and everything else, usually called binary files. Loosely speaking text files contain lines of text and very little else and are human readable, while the content of binary files is not human readable, but it has to be interpreted by a dedicated program to convey meaningful information for the user. The distinction between text and binary files may, at the beginning, seem a bit unclear, but hopefully things will become clearer as we move on.

Text files (sometimes called also plain text) are commonly used for storing and exchanging various types of information. Therefore an understanding of their structure and quirks is essential for any biologist.

We'll start with an example.
To make things confusing, files we usually open and save in one of the most popular text editing program, MS Word, are actually not text files, but rather binary files containing text. When open in MS Word the file looks like this:

![Word-in-Word](text_Word_in_Word.png)

When we open the same file in Windows Notepad, dedicated for plain text, we see this:

![Word-in-Notepad](text_Word_in_Notepad.png)

Not really useful, huh?
Only when we ask MS Word to save this file as text (try it under Save As...)
Interesting things appear when we ask Word to save this as text file - there are a few questions to answer, some choices related to encoding and end of lines. Obviously there's something more to learn about text files. After saving the file as text, we can see its content in Notepad:

![Text-in_Notepad](text_Text_in_Notepad.png)

## Notepad ++
To explore text files in more detail we need an appropriate tool. In the class we'll use Notepad++ for Windows. If you use Mac or Linux you should contact your course instructure for alternatives. For the rest of the class we'll assume that you have Notepad++ installed on your system. You can get it [here](https://notepad-plus-plus.org/downloads/), you will probably want to install the newest 64-bit version. Please install the English language version.

Notepad++ is a plain text editor with many features, today we will use only a few to learn more about the nature of text files.

Download file from [here](https://www.dropbox.com/s/stfdyaudt0dg0lb/Text_file_01.txt?dl=0), save it in your course directory, run Notepad++ and open the file. You should see something like this:

There are two lines of text in the file. When you select `View -> Show Symbol -> Show All Characters`, you will see, in addition to text some extra symbols. These are small dots in place of whitespaces between words and letters `CR` and `LF` on black background at the end of the lines. Actually these are two normally invisible characters that are inserted into a text file when you press <kbd>Enter</kbd> to end a line of text. Unfortunately ends of line symbols are system-specific, in Windows they are `CR``LF`, in Mac `LF``CR` and in Linux `LF`.
