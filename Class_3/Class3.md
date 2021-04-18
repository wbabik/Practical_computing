# Class 3 Introduction to Linux command line, connecting to a remote Linux machine, moving around in the Linux system


## Working with a terminal in Linux
Linux is a free operating system that, apart from working in a graphical environment (GUI), allows very efficient work in the command line mode (in a terminal) using the Shell. The Shell is the part of the operating system that is responsible for how the terminal looks and functions. The most commonly used type of Shell is bash (Bourne again shell).

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


