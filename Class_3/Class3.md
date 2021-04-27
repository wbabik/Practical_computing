# Class 3 Introduction to Linux command line, connecting to a remote Linux machine, moving around in the Linux system


## Working with a terminal in Linux
Linux is a free operating system that, apart from working in a graphical environment (GUI), allows very efficient work in the command line mode (in a terminal) using the Shell. The Shell is the part of the operating system that is responsible for how the terminal looks and functions. The most commonly used type of Shell is bash (Bourne again shell). Linux and Linux-like systems are ubiquitous in scientific computing, in particular, on most large computer clusters. The working knowledge of Linux is thus an important part of a biologist's toolbox.

So:
- The Terminal is a window where you can enter commands to be executed by the computer.
- Shell (in our case bash) is a program that executes given commands.

**One of the most important goals of this course is to teach you to work in a terminal.**

How is it working?
In the terminal, type a command that has a specific syntax, e.g .:

`ls -l`

We check if we typed what we wanted (or correct the entered text - to navigate within the line use the arrows <kbd>→</kbd> <kbd>←</kbd>, a wrongly inserted letter can be removed with the <kbd>Delete</kbd> or <kbd>Backspace</kbd> key).
And then hit the <kbd>ENTER</kbd> key - only now is the command executed.

Let's break down the above command into its component parts:
- `ls`: what Shell is supposed to do for us. This is the name of the program that takes the action in the Shell. In the example, `ls` will show you the content of a directory.
- `-l`: how the task is to be performed. In the example, the `-l` option tells `ls` to give not only the names of files and directories, but also some additional information about them (who owns them, what is their size when they were last modified).
- We could add, as the third part of the command, the name of the diurectory which content should be listed. As we did not do it, the conent of the current working directory will be listed.

After pressing the <kbd>Enter</kbd> key, the required information will be displayed in the terminal.

## Why is it worth learning to work with the command line?

For a computer user accustomed to working in the graphical mode, (that is, almost every user), the ability to work in text mode may seem superfluous. It is not so. First, many programs used in bioinformatics (and not only) do not work in a graphic environment. Equally importantly, many taksts that are simple to do in the command line, are very difficult to do in the point-and-click Graphical User Interface (GUI). Think how would you carry out the following tasks?:

1. We collected 20,112 text files in the epidemia2021 directory on the remote server you will connect to in a couple of minutes. Each of the files contains information on one of the recent cases of hemorrhagic fever in Poland. The second line of each file contains the name of the city where the patient was diagnosed. The next line contains the date of diagnosis. It is your job to analyze the spread of the disease. In the first stage, information about the place and time of infection of all patients should be collected into one file, so that the origin of the epidemic could be identified.   
Please think how many steps you need to take to copy the second and third lines from the file obtained for a single patient to one line of the summary file? How much time would it take for a very skilled person? How much time would such a person need to complete the entire task, working 8 hours a day?  
One solution to this task takes you to type about 6 short lines of text in the terminal and an average computer will complete the tast for you in acouple of seconds.  We will return to this task at the end of the course.
2. **This needs to be modified** On the desktop you can find the file: GCF_000001405.33_GRCh38.p7_genomic.fna. This is a text file containing the latest version of the human genome reference sequence (what does that mean?). How big is this file? How many characters does it contain? If you wanted to print it, how many sheets of paper would be needed (a standard typescript page contains 1800 characters). Can you open this file in any text editor (Word, Notepad, Notepad)?
In today's class, I will ask you to copy the V chromosome sequence to a separate file. Next, we'll use the tools from the EMBOSS suite to find out what the content of GC bases on this chromosome is. In addition, I would like to ask you to obtain the sequence of the second strand of this chromosome.

## How to open a terminal?
We assume that you work on the computer running Windows. If you are running Linux or MacOS, see below. Widnows uses differnt shell from Linux, we will not cover during our course. Our first task will be to connect to a remote computer that runs Linux and run a terminal session which we will use for the reminder of the class.  To do this, we will use the PuTTy program which you can downlowad [here](https://www.putty.org/).

Please open PuTTy.
In the `Host Name (or IP address)` field, please enter:
`149.156.165.xxx`
This is the IP number of the fsm server.
In the `Port` field, please leave `22`. We also do not change the connection type (`SSH`).
In the `Saved Sessions` field you can enter any name, this will be the name of your connection - please type the name `thor`.
Then please select `Translation` in the `Category` (left) and select
`UTF-8` in the `Remote character set` field.
Then press `Open`. Then you will be asked by the program to enter your username (e.g. user102 - **your username and password will be provided by the course instructor**) and your password (**Remember! uppercase letters are not the same as lowercase in Linux !!!**). Please enter your username and password carefully. Note: When typing the password, no characters appear in the terminal window!
You are now connected to the server and can work on it in the terminal. In the same way, you can connect to the server from any Windows computer connected to the Internet. PuTTy is free software.

If you have the Linux or MacOS operating system installed on your computer, you can open a terminal window like any other program. If you would like to connect to our server (to do your homework), use the ssh-client program. In the terminal enter:

`ssh 149.156.165.xxx -l user102`  149.156.165.xxx is the IP number our server and user102 is the user account name.


After pressing <kbd>Enter</kbd> you will be asked to enter your password.


## A few notes and useful commands to get you started. 
Please read the following text carefully, as it will facilitate further work.

> ### Files, directories (folders) and paths
> If the terms 'file' or 'directory' appears in the commands below, it will really mean the path to that file or directory. You can use both absolute and relative paths. Let's imagine we have the following directory system and we are currently in the user102 directory:
> HERE FIG
> The absolute path to the ref directory is then:
> 
> `/home/user102/ngs/ref`
> 
> Such a path always starts at the very top of the directory tree, with the so-called "root" symbolized by the `/` character.
> The relative path provides the path from your current directory:
> 
> `ngs/mother`
> 
> Likewise, the absolute path to the data1.txt file in the ref directory is:
> 
> `/home/user102/ngs/ref/dane1.txt`
> 
> The relative path is:
> 
> `ngs/ref/data1.txt`

### Exercise 1
Please write down the absolute path to the `genome` directory and the relative path from the `user102` directory to the `data2.txt` file in the `ngs` directory.

> The following shortcuts can be used in paths:
> 
> `~` (tilde) is the home directory symbol (can be used instead of `/home/user102` here)
> 
> `.` (period) is the symbol of the current directory
> 
> `..` (two dots) is the parent directory symbol (one level higher than the directory we are currently in)
> 

### Exercise 2
Please use the appropriate symbols from the box above and write the relative path from the `ref` directory to the `ngs` directory.

> ### Commands and their options
> **Important!** If something in the commands typed below is enclosed in `[]`, it means that it is not an obligatory part of the command syntax, but rather it's optional. Do not type parentheses in the terminal! For example, the command:
>
> `ls [options] [directory]`
> Means we can type in the terminal:
> 
> `ls`
> 
> Content of the current directory will then be displayed. Whereas the command:
>
> `ls -l`
> 
> will display content of the current directory in so-called long format. In turn, the command:
>
> `ls -l /home/user102/genome`
> 
> will display the contents of the genom directory, also in long format.
> 

> ### Spaces are important
> The command will not be understood by the shell if we enter a space where it shouldn't be (e.g. by typing `- l` instead of `-l` or `/ home / user102 / genome` instead of `/hime/user2012/genome`). Spaces, however, are necessary between the components of the command:
> 
> `ls -l /home/user102/genome` will work, while `ls-l/home/user102/genome` will throw an error
>
> **Important**
> Usually, an incorrectly typed command only results in a message that shell did not understand and did not carry out the command. If you accidentally type a command that causes the terminal to hang (no prompt, can't type anything), press <kbd>Ctrl</kbd> and <kbd>C</kbd> at the same time - this should end the  process.

> ### Useful commands and utilities part 1
> `pwd` </br> 
> (print working directory) - displays path to the current directory, starting with root
> 
> `cd [directory]`
> (change directory) - go to the directory. cd without target directory gets the user to its home directory, in the case of user102 this will be `/home/user102` 
> 
> `mkdir [options] directory`
> (make directory) Create a new directory called directory. By using the -p option, we can create the given directory and parent directories (if they do not already exist) with one command.
>
> `rmdir [options] directory`
> (remove directory) Removes an empty directory named `directory`.
>
> `touch [options] filename`
> Creates an empty file named `filename`.
>
> `rm [options] file`</br>
> `rm -r directory`
> (remove) Removes a file with the given name.
> `rm` with the -r option removes the directory and its contents. Attention! Please be careful when deleting files and full directories. The rm command does not move them to the trash. Files and directories are finally removed from the computer's memory!
>
> `cp [options] filename directory`
> `cp -r directory1 directory2`
> (copy). Copies the file named `filename` to a directory named `directory`.
> The command with the `-r` option copies `directory1` and its content to directory named `directory2`.
>
> `mv [options] filename directory`
> `mv [options] file1 file2`
> (move) Moves the file named `filename` to the directory named `directory`. The command is also used to rename a file (file1 → file2)
> 
> `wc [options] file`
> (word count) Returns the number of lines, words and characters contained in the file. The `-l` option gives only the number of lines, `-w` only the number of words, `-c` only the number of characters.
> 
> `man [options] command`
> (manual) Opens the manual for the command. Man displays comprehensive documentation of the command/program, which may be quite technical. To get more limited, but often more accessible help, many programs support `--help` option
>
> `less [options] file`
> Allows you to browse the content of a file in the terminal and search its contents.
>
> `passwd`
> (password) Allows the user to change his password.
> 
> `exit`
> Ends the session and closes the terminal.

### Exercise 3
Please change your password - in the terminal type:

`passwd` and press <kbd>Enter</kbd>.

You will be guided through the program by following the steps of changing your password. Please enter your passwords carefully! Please remember that a capital letter is not the same as a lower case letter! The new password should be hard to crack. Please make it 8 characters long, including a capital letter and a number.
Please remember or write down the new password!

### Exercise 4
What is the path to the current directory, i.e., to the dirrectory you're in now? This is your home directory.


### Exercise 5
*Please create directories and subdirectories in your home directory to recreate the tree shown above (below the user102 directory).*

> ### History
> Typing commands can be tiresome, but you can reuse the commands you typed previously. The commands that were typed in the terminal are remembered as **History**. To recall them, you can use the <kbd>↑</kbd> <kbd>↓</kbd> arrows, and then change only part of the command (arrows <kbd>→</kbd> <kbd>←</kbd>, <kbd>Backspace</kbd>, <kbd>Delete</kbd> keys).
> 

Exercise 6
Please display content of directory `/data`. How do files and directories look like?

Exercise 7
Please copy the file `GCF_000001405.33 ...` from the directory `/data` to the `genome` directory you created. This is a file containing the reference human genome sequence. You will work with it later in the class.

> ### Autocompletion
> The file has a long name that is difficult to type. Please check what happens when you enter just the first few letters of its name and press the <kbd>TAB</kbd> key. This is called the Tab completion or autocompletion feature. Use it as often as possible to do less typing avoid typos. After completing the file name, you can go to the end of the line and finish typing the command (you can also continue to use Tab completion!)

Exercise 8
Please view the manual pages for the `ls` command. Which `ls` option will show all files, including hidden files (hidden filenames start with a period on Linux)?</br>

When you are inside the manual, you can search its contents by typing:

`/phrase`
and then pressing the <kbd>Enter</kbd> key. Pressing the <kbd>n</kbd> key will allow you to go to the place of the next occurrence of the searched phrase in the manual.

Search the manual for `size` and answer the question, what ls command option should you use to list files and directories sorted by size?


To exit the manual, press q.


















