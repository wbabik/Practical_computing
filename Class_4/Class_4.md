# Class 4

# Working in Linux shell I

## Wildcards and operations on many files

Linux provides an easy way to process at once a large number of files. For this purpose, you can use wildcards. These are characters with a special meaning that allow the user to refer to the entire set of files or directories on a single command . 

> ### The most commonly used wildcards
>
> `*` nothing or any character(s), their number is unlimited
>
> `?` any single character
>
> `[]` a set, or range of characters, e. g., `gr[ae]y` matches `gray` or `grey`, `[a-z]` matches all lowercase letters
>
> ### Examples
>
> `cp * /home/student02` will copy all files / directories from the current directory to the home directory of `student02` 
> `rm * .jpg` will remove all files with the extension `.jpg` from the current directory
> `mv A * directory1` will move all files starting with `A` to `directory1`
> `ls A???` will show all files / directories whose names are only 4 characters long and start with `A`

The principle of wildcard characters is quite similar to that of regular expressions. However, wildcards are used to search for a pattern in file and directory names, not inside text files. They are interpreted directly by the shell (and not by any particular program), therefore the meaning of the characters is slightly different than in regular expressions! Wildcards can be used in most programs that operate on files and directories  (`ls`, `cp`, `mv`, `rm` etc.)

### HIV and SIV sequences

During today's class we'll use genomic sequences of various lentiviruses (HIV and SIV) isolated from several hosts (designations of hosts are in file `/data/hiv/hiv_species.txt`). Virus sequences are in `/data/hiv`.

> ### FASTA format
>
> One of the simples and widely used formats for storing sequences of nucleic acid and protein sequences is FASTA, often saved in files with extensions `.fa`, `fas` or `fasta` . These are plain text files, each sequence has a title line starting with `>`, which can contain any description you want, and in next line or lines is the actual sequence. Sequences are separated by lines staring with `>` and each sequence can be written in a single or multiple lines:
>
> ```
> >seq1
> ACTGATAGTAGATTAGGATTGAGTTGACCCATCAACTCATAGATCGTACGCAGTCAGCTCAGACGAGACGACGACAGCAGACGAAGAATAGCAGACGACGACAGCAGCAGACGACAGAAGATAGATGGCAGAGAAGATGAAGAG
> >SEQ2 with a long title name containing # special % chracters
> ACTGATAATGTATGATATGAGTA
> >seq3 written in multiple short lines
> ACTG
> ATGACTAGTA
> ACTAGG
> ```
>
> An easy way to count the number of sequences in FASTA file is to count the number of lines starting with `>`

## Exercise 1

Sequences of viruses in `/data/hiv` are in separate files, each of them with extension `.fasta`.
Do all files in the directory have extension `.fasta`? 
Please copy from `/data/hiv` to the `~/hiv` directory only files containing sequences, i. e. with extension `.fasta`. 

## Editing text files with Nano

## Downloading files from the Internet

When working in terminal, you can easily download files from the Internet using `wget`. The basic usage is just:

`wget URL` where URL is the web address of the file you want to download.

For example, to download the readme file explaining a part NCBI genomic resources  called RefSeq type:

`wget https://ftp.ncbi.nih.gov/genomes/refseq/README.txt`

`wget` is an advanced tool, allowing you to download files over unstable internet connections, recursive download of entire web pages and repositories and downloading in the background, when you're disconnected from the server. Consult the manual for additional information.

## Standard input, output, redirection and pipe

Each program that you run in the terminal takes input data, analyses it and returns its result and possibly an error message. To put it in other words, each program has three **data streams**. These streams have their names and numbers:

![stdin](Stdinout.png)

- STDIN (standard input) is the input provided by the user or by another program
- STDOUT (standard output) is the result of the program operation, by default displayed in the terminal window. 
- STDERR (standard error) is a message about possible errors, it is also by default displayed in the terminal

### Redirection

Data streams can be redirected to files (effectively: saved to files) or to other programs. This technique is commonly used and extremely powerful, as it allows to combine several tools, each performing a simple task, into **pipelines**, together performing complex tasks

> #### Redirection examples
>
> `ls > list.txt` will write a list of files/directories in the current directory (i. e., the output from `ls` program) to the file `list.txt` (in which directory will this file be created? Why? Which path we used here?). **Caution!** If file `list.txt` already exists, its content will be overwritten.
>
> `ls >> list.txt` works similar to the previous command. The difference is that if `list.txt` already exists, using `>>` will **append** new data to the end of the file. 
>
> `ls 2> error.txt` will write any error message produced by `ls` to file `error.txt`
>
> `ls | less`  pipe symbol `|`  will send the output  of `ls` program, i. e.,  the list of files/directories in the current directory , to `less` program.  What will happen then? Why would you like to do something like this? In this way we constructed our first pipeline! More on pipe and pipelines later.

## Looking inside text files with `cat`, `head`, `tail` and `less`

Basically each computer running Linux has several tools to work with text files. These tools allow you to work with text files of unlimited size, which is not the case with standard office applications. Even opening a modest 100 MB text file in MS Word or MS Excel is slow and often causes the programs to crash. The Linux text viewing tools are very fast and provide many functionalities.

> #### Basic text viewing tools
>
> `cat` (concatenate) displays the content of the file (or multiple files) in the terminal. This basic function is quite versatile, and we'll see the use of `cat` in several contexts during this course.  
> What happens if you use `cat` to display the content of `README.txt` file you downloaded earlier? To see type: `cat README.txt`
> A useful option of `cat` command is `-T`, which displays `tab` in terminal as `^I` . With this option you can easily check whether the file is `tab`-delimited.
>
> `head` often we just want to have a quick look at the content of the file, and we can learn what we want from a few first lines. `head` is just for that - it displays by default 10  lines starting from the **beginning** of the file n the terminal. The number of lines to display can be changed using `-[number]` or `-n [number]`. 
> Display first 12 lines of `README.txt`
>
> `tail` as above, but displays lines from the **end** of the file. Sometimes we want to display the entire content of a file, skipping just first line, this can be done using `tail -n +2 [FILE]`, the command instructs `tail ` to start from the line number 2.
>
> `less` displays the content of a file in portions that fit the screen; you can move to another screen using <kbd>Space</kbd> or <kbd>PgDn</kbd>.  `less` allows also searching the content of a file by preceding the phrase to find with `/` and pressing <kbd>Enter</kbd>; pressing <kbd>n</kbd> finds another occurrence of the phrase.  You can quit `less` by pressing <kbd>q</kbd>. 

## Searching for patterns with `grep`

`grep` is the Linux utility that made regular expressions popular. `grep` searches for patterns in text files and displays lines containing the pattern. 

> #### Useful `grep` options
>
> The basic syntax of`grep` is as follows:
>
> `grep [OPTIONS] 'pattern'[FILE]`
>
> Below several useful options:
>
> `-n` displays also line numbers where the pattern occurred
>
> `-c` instead of displaying the lines where the pattern occurred, counts the lines and displays the count
>
> `-v` inverts the search, i. e., displays only lines that did not contain the pattern
>
> `-E` **extended** grep. `grep` by default supports only basic regular expressions. Using `grep` with `-E` options gives access to the full set of regular expressions. Also, syntax is then a bit simpler, for example to search for alternative, with basic syntax you have to use `\|` to look for alternative, while with `-E` it's enough to type `|`.  It's a good idea to use `grep -E` by default.
>
> `-P` use Perl dialect of regular expressions.  It's useful because it allows to search for `tab` characters, which are, unfortunately not implemented in basic and extended grep. With `-P` you can search for `tab` using `\t`.

> #### `grep` patterns
>
> There are two basic forms of patterns for `grep`:
>
> 1. Plain text, e. g., 'new' - `grep` will print lines containing **new**, **new**t or sto**new**ork. Plain text pattern can contain whitespaces 'This is a valid pattern to search' 
> 2. Regular expressions as explained in Class 2.

### Exercise 2

TODO use grep to search for pattern

## Extracting information from structured text files with `cut`, `sort` and `uniq`

As we saw in Class 2, text files are often structured into columns. Similarly, file names often consist of several fields containing information about various aspects of file content. Such columns/fields can be easily cut, sorted and unique items can be extracted using `cut`, `sort` and `uniq`. These three commands are often used together, with information passed between them with pipe `|`.

> #### Syntax
>
> `cut [OPTIONS] [FILE]`  cuts fragments from a text file. 
> `-c n1-n2` cuts from each line in the file characters from n1 to n2, counting from the beginning of the line
> `-f columns`  cuts particular columns from the file; if multiple columns are specified, they should either be separated by `,` or, if you want a range of consecutive columns, by `-`.  For example:  `cut -f 2` extracts the second column, `cut -f 2,4,6` extracts columns two, four and six, and `cut -f 2-5` extracts columns from two to five.
> By default, `cut` assumes that columns are separated by `tab`, but any delimiter can be used, by setting it with option `-d 'sep'`. For example to use underscore (`_`) as separator and extract columns from two to five you type `cut -f 2-5 -d '_'`.
>
> `sort [OPTIONS] [FILE]` sorts lines of a text file alphabetically (by default)
> `-n` allows sorting numerically
> `-k column,column` allows sorting according to a given column. By default columns are assumed to be separated by `tab`. If you want to sort by a particular column, remember to use its number twice, e. g., `sort -k 2,2`, if you use just `sort -k 2` sorting will be done according to the all columns starting from 2 concatenated together. You can easily sort by multiple columns, e. g., to sort numerically by column 3 and then by column 5 use `sort -n -k 3,3 -k 5,5.`
> `-t` sets the field/column separator, e. g., `-t  '_'` will use underscore as field separator.
>
> `uniq` outputs only **unique** lines if identical lines are adjacent, i. e., if the files was **sorted** first. `uniq` is used to filter out duplicates. Similar effect can be obtained with using `sort -c`, but using `unique` is more explicit and thus recommended.

> #### Example
>
> Let's use `wget` to download a file from the Internet to the home directory:
>
> `wget https://www.dropbox.com/s/foigp257imlrejc/Exons.bed` 
>
> **Remember!** To paste text in PuTTY terminal use <kbd>Shift</kbd> + <kbd>Ins</kbd>
>
> Now, let's have a look at the file content:
>
> `head Exons.bed`
>
> the beginning of the file is:
>
> ```PSMB8a_c112196_g1_i1    51      229     5end_incomplete
> PSMB8a_c112196_g1_i1    229     374     complete
> PSMB8a_c112196_g1_i1    374     486     complete
> PSMB8a_c112196_g1_i1    486     616     complete
> PSMB8a_c112196_g1_i1    616     821     complete
> PSMB8a_c112196_g1_i1    821     955     3end_incomplete
> PSMB9a_c109577_g1_i1    168     240     3end_incomplete
> PSMB9a_c109577_g1_i1    240     308     complete
> PSMB9a_c109577_g1_i1    308     440     complete
> PSMB9a_c109577_g1_i1    440     570     complete
> ```
>
> We see that the file contains four columns:
>
> - gene name
> - start 
> - stop
> - feature name
>
> We want to have a list of all gene names, and a list of all feature names, both including only unique names.
>
> To get the gene names we'll first `cut` the first column, then we'll `sort` this column, and then we'll use `uniq` to remove duplicates. The entire task will be done in a single line, using pipe `|` to use output from one program as input for another:
>
> `cut -f 1 Exons.bed | sort | uniq`
>
> produces the following output:
>
> ```AGPAT1_c248472_g1_i1_cds
> BRD2_c757_g1_i1_cds
> DAXX_c114877_g1_i1_cds
> KIFC1_c139688_g1_i1_cds
> PBX2_c2881_g1_i1_cds
> PSMB8a_c112196_g1_i1
> PSMB9a_c109577_g1_i1
> RGL2_c153162_g1_i1_cds
> RNF5_c3067_g1_i1_cds
> RXRBA_c149444_g1_i1_cds
> TAP1_c2675_g1_i1
> TAP2_c150845_g1_i1
> TAPBP_c134883_g1_i1
> ```
>
> Now, use a similar technique to get the list of feature names.

### Exercise 3

Download file `Ex_02_2.txt` from the Internet using `wget` and the link: `https://www.dropbox.com/s/gruaw8vqgnwas8l/Ex_02_2.txt`. We used this file already in Class 2. 

* How many lines are in the file?

* Display the first few lines of the file with `head`. Is the output easy to read? Why? 

* Use `cat` to verify whether the file is `tab` delimited text.

* Use `cut ` together with head (and `|`) to display the first 5 columns and 30 lines. You should get something like this:
  ```
   ID      info    a0001   a0002   a0003
  3038    Visui_R_vul_1   0       0       0
  3039    Visui_R_vul_1   1       0       0
  3040    Visui_R_vul_1   1       0       0
  3041    Visui_R_vul_1   0       1       1
  3042    Visui_R_vul_1   0       1       1
  3043    Visui_R_vul_1   0       0       1
  3044    Visui_R_vul_1   1       1       0
  3045    Visui_R_vul_1   0       0       1
  3046    Visui_R_vul_1   0       0       0
  3047    Visui_R_vul_1   0       0       0
  3048    Visui_R_vul_1   0       1       0
  3049    Visui_R_vul_1   1       1       0
  3050    Visui_R_vul_1   0       1       1
  3051    Visui_R_vul_1   1       0       1
  7319    Solo2_R_vul_2   1       1       0
  7320    Solo2_R_vul_2   0       1       0
  7321    Solo2_R_vul_2   0       0       0
  7322    Solo2_R_vul_2   0       0       1
  7323    Solo2_R_vul_2   1       0       0
  7238    Solo1_R_vul_3   1       0       0
  7239    Solo1_R_vul_3   1       0       0
  7240    Solo1_R_vul_3   1       0       0
  7241    Solo1_R_vul_3   0       0       1
  7242    Solo1_R_vul_3   1       1       0
  7243    Solo1_R_vul_3   1       1       0
  7324    Paul1_R_vul_4   1       0       0
  7325    Paul1_R_vul_4   0       0       0
  7326    Paul1_R_vul_4   0       0       0
  7327    Paul1_R_vul_4   1       1       0
  ```

* The second column contains several fields delimited with underscore (`_`). Its first field contains population acronym (`Visui`, `Solo2` etc.).  Using  `tail`, `cut`, `sort`, `uniq` and `|` print the list of unique population acronyms. Then modify the command to save the list to the file `Population_acronyms.txt`. **Tip1**:  `tail` can be used to skip the first line, which is of no interest for you. **Tip2:** you can pipe output from `cut` to `cut` to divide a single column into multiple columns using a different delimiter.

## Merging files with `cat` 

`cat` concatenates all files provided as arguments and by default prints them to the terminal. By redirecting output to a file we can easily merge multiple files into one.

### Exercise 4

* Use `ls` with `wc` and `|` to count  `.fasta` in `~/hiv`
* Use `cat` with redirection to concatenate all `.fasta` files from your `~/hiv` directory into file `hiv_all.fasta` in your home directory.

