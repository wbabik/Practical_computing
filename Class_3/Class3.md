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

