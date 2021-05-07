# Class 5

# Working in Linux shell II

## Copying files to and from remote server with `scp`

If you work on Windows, you can use to copy files between your computer and remote server using WinSCP which you can download it [here](https://winscp.net/eng/download.php).

After downloading and installing open WinSCP, in the Login window in the field `Host name:` enter IP address of our server, in the field `User name` enter your user id, don't fill in password. Save your session as `thor` or another name.  By clicking `Login` you will start connection with the server, you'll be asked for your password and after verifying your credentials you'll see in one panel your local computer and in the other your home directory on the remote server.  You can now copy or move files between machines.

> #### `scp` on Linux or Mac
>
> If your computer works under Linux or macOS, you don't need to install anything to copy files between your computer and remote server. You just open terminal and use `scp` (secure copy) program with the following syntax:
>
> `scp [WHAT] [WHERE]`
>
> For example, `scp user102@149.156.165.xxx:/home/user102/*.txt /home/mary` will copy all `.txt` files from user102 home directory on the remote server to home directory of user `mary` on your local computer.
>
> `scp` can be also used to copy files between different remote servers



## MobaXterm combo (optional)

So far we have been using `PuTTY` to connect to remote server and above we introduced `scp` for transferring files between computers. An interesting alternative is `MobaXterm` which you can download [here](https://mobaxterm.mobatek.net/download.html). MobaXterm has all functionality of PuTTY, allows opening multiple connections to remote servers in separate tabs, has some `scp` functionality, so allows copying files between your local machine and remote server, and even provides Linux shell on Windows computer.

We encourage you to explore `MobaXterm` on your own,  and if you like it you can use it instead of PuTTY in the class, but we leave this decision to you.

## Shell scripts and `echo`

Shell commands do not need to be typed directly into a terminal. You can save them in a text file and have them executed, line by line. Such files with a set of commands to be executed are called (shell) scripts. We usually use the .sh extension when naming shell scripts.
The first line of the script should contain: 

`#!/bin/bash`

This line is used by the system to find the script interpreter (shell, or more precisely one of shell types - bash).

Following lines contain commands to execute:

```
#!/bin/bash
echo My script works!
```

The script above will display in the terminal `My script works!`

`echo` prints in the terminal text in the current line, following the first whitespace.

#### Exercise 1

In `nano` write a script that will save the list of `.fasta` files in the directory `~/HIV` to the file `List_of_fasta_files.txt` in your home directory, and then will print in the terminal sentence `Task completed!`. Please name script `script1.sh1` and save it in your home directory.

---

## Setting permissions with `chmod`

To run a script you have to set appropriate **permissions** so that the script can be **executed** by the user.

> #### Permissions in Linux
>
> In Linux users have three types of permissions for accessing files:
>
> * `r` user can read file
> * `w` user can write to file
> * `x` user can execute file
>
> Each files has defined three groups of users:
>
> * `u` owner or user
> * `g` owner's group - all users that are in the same group as the owner
> * `o` others - all users that do not belong to the owner's group
>
> To see permissions of a file use `ls -l [FILENAME]`
>
> ![permissions](permissions.png)
>
> * three first positions - owner's permissions (here: `r` and `w`)
> * three next positions - owner's group members permissions (here: only `r`)
> * three last positions - other users (here: only `r`)

#### Exercise 2

What are permissions for `script1.sh` in your home directory? Who is its owner?

---

You can change permissions with `chmod` (change file mode)

> #### `chmod` syntax
>
> `chmod [PERMISSIONS] [FILENAME]`
>
> Syntax of permissions consists of three parts:
>
> 1. Whose permissions to change `[ugoa]` (`u`: owner, `g`: group, `o`: others, `a`: all)
> 2. How to change them `[+-]` (`+`: add permission, `-`: remove permission)
> 3. Which permission to change `[rwx]` (`r`: to read, `w`: to write, `x`: to execute)
>
> Non-privileged user (not administrator) can change permission for his/her own files.

> #### `chmod` examples
>
> `chmod u+x file.txt` gives the owner permission to execute the file
>
> `chmod a-r file.txt` removes permission to read the file for all
>
> `chmod o+rw file.txt` gives others permission to read and write the file

#### Exercise 3

Give all users permissions to read and execute file `script1.sh`. Noe, list all files in your home directory. What's the font color in your script name? Use `ls -l` to check whether your script has indeed the permissions you wanted it to have. What's in the permissions field?

Now you can run the script typing: `./filename.sh`  (what's the meaning of the dot at the beginning of the command?)

----

#### Exercise 4

Run `script1.sh` and check whether it's worked. Did file `List_of_fasta_files.txt` appear in your home directory. Did the message `Task completed!` appear in the terminal?

---

## Shell variables

Imagine the following situation. You need to do some analysis that involves a series of operations on a text file (say 30). You are writing a script containing 30 needed commands. The script works fine. However, you expect that you will want to perform the same analysis with other files in the future. You could, of course, give the same name to every file you want to analyse - but that way it's easy to get confused with your own data. Is it possible to write a script in some clever way so that in the future you won't have to rename the file in 30 command lines? This can be done by defining a **variable**.

A variable can be defined inside script, it can also be defined directly in terminal.

> #### Defining variable
>
> `variable=value`
>
> To the left of the equal sign (`=`) is the name of variable, to the right of the equal sign is the value of variable. **Important!** no spaces are allowed before and after `=`.
>
> Valid variable names contain letters, digits and underscores, and must start with a letter or underscore. 
>
> Examples of valid variable names:
>
> * `my_variable`
> * `_myvariable`
> * `MyVariable1`
>
> Examples of invalid variable names:
>
> * `1st_variable` (starts with digit)
> * `vari#able` (contains `#`)
> * `my variable` (contains space)
>
> The rules for the values of variables are a bit complex. For now, remember that if the value of your variable contains spaces or some complex characters, it's a good idea to enclose it quotes. If you want the value of variable to be treated literally, it's a good idea to enclose it in single quotes 
> `'  '`, e. g. `my_variable='This is the content of the variable'`

> #### Referring to variable
>
> Wherever you want to use the value of variable you refer to it by adding `$` in front of its name. For example, if you want to print in the terminal the value of `my_variable` defined above you'll use the command `echo $my_variable`. Try it!
>
> Imagine that we want to write a script in which we take first two lines from a file and save it in file with (almost) the same name, just adding `L2_` as prefix. To do that you can use the following code - you can run it directly from the terminal or as a shell script
>
> ``` 
> my_file='HIV/KT183271.fasta'
> head -2 $my_file > L2_"$my_file"
> ```
>
> **Note!** Because we wanted the value of the variable `my_file` to be a part of the name of a new file, we enclosed it in double quotes `""`.  This is related to a complex topic of shell expansion, discussed in many places on the web, for example [here](https://mywiki.wooledge.org/Quotes).

## Shell scripts continued

We can wrap the commands from the previous section into a script. Use `nano` to create `script2.sh`:

``` 
#!/bin/bash
my_file=KT183271.fasta
cd HIV
echo $my_file
head -2 $my_file > L2_"$my_file"
cd ..
```

Note, that in this script we entered directory `HIV` where fasta files are located, and at the end of the script we moved one directory up, back to the home directory. In this way we can refer to the files in this directory directly, without specifying path. 
Save `script2.sh`, exit `nano` and run script in terminal `./script2.sh`. **Tip**: when writing a script it's a good idea to test individual commands in terminal. To do that, it's handy to have another PuTTY session open - you can open as many terminal windows as you want.

A script can be written in such a way that we pass variables (for example, names of files on which the script operates) to the script. One of the ways of passing variables is to use command line arguments. In bash variable names `1` to `9` are reserved for command line arguments. You refer to these command line arguments inside your script by typing `$1`, `$2` etc.

Armed with this knowledge we can modify `script2.sh` and save the modified version as `script3.sh`:

``` 
#!/bin/bash
cd HIV
echo $1
head -2 $1 > L2_"$1"
cd ..
```

The script is now a bit shorter and we run it providing file name as command line argument: `./script3.sh KT183271.sh`

#### Exercise 5

Write script `script4.sh` and save it in your home directory. Within the script define variable `n` and assign to it an integer from the range 1 to 20. Script should:

1. Print number `n` in terminal.
2. Print in terminal `n` first nucleotides from each of `n`lines at the end of the file `KT183271.fasta` which is in directory `HIV`. **Tip1**: use pipe. **Tip2** `-c` option of `cat` may be useful.

Set appropriate permissions and run the script in terminal.

----

> #### Comments inside shell scripts
>
> Inside a script you can include comments that will not be interpreted by shell. They can, for example, explain its operation for other users (or the future you!). Comments start with `#`, can be in separate lines or can follow shell comments in the same line. Comments can be included anywhere in the script **except first line**, where `#` has a special meaning.

#### Exercise 6

Write script `script5.sh` and save it in your home directory. This script should do the same operations as `script3.sh` from Exercise 5, but `n` should be the first command line argument (`$1`), and the name of the file from which parts of the last lines will be printed should be the second command line argument (`$2`). Within the script include comments explaining the meaning of the two command line arguments. As previously, set permissions and run the script in terminal.

---

## Compressing with `gzip` and archiving with `tar`

To save space and speed up transfer via network files are often **compressed**. This is particularly important for large text files, as their size can be reduced several-fold. Some types of files, such as many audio/video files, jpeg images or pdf files are already compressed, so further compression doesn't reduce their size.

The standard compression and decompression utility in Linux in `gzip`.  Its basic usage is extremely simple: `gzip [FILENAME]` will create file with the name identical to the original file with `.gz` suffix added. 

> #### `gzip` useful options
>
> You can compress (or decompress - see below) multiple files by specifying their names as `gzip` arguments, explicitly, or using wildcards. 
>
> `-k` keep the original file. By default the original version will be replaced with gzipped `.gz` file
>
> `-r directory` compress all the files within the directory and all its subdirectories
>
> `-d [FILENAME]` decompress file. Decompressed file will replace the `.gz` file

> #### `.zip` archives in Linux
>
> `gzip` is not able to work with `.zip` files popular under Windows. Many Linux systems include `zip` and `unzip` programs.

`gzip` operates only on single files, it doesn't create multifile archives.  There's another standard tool for creating and working with multifile archives - `tar`. Often, files are first added to a `.tar` archive and the archive is then compressed with `gzip`. Note that when you have to copy or transfer via network many (hundreds, thousands) small files, the process will be slow, because most of the time is used up on opening and closing connections for individual files. If you combine all files into a single `.tar` archive, copying or transferring will be much faster, even if you don't compress the archive.

> #### `tar` useful options
>
> `tar` is an old (but up-to-date and widely used) utility, therefore it has several ways of specifying its options.  The one we'll use below starts with `-` , then options follow, with `f` as the last one followed by the name of the `.tar` or `.tar.gz` archive.
>
> `-cvf [FILENAME] [WHAT]` create (`c`), verbosely show progress (`v`) and save to file (`f`)  `[FILENAME]` content of `[WHAT]` (can be directory or list of files specified using their names or wildcards. This archive will not be compressed
>
> `-cvzf [FILENAME] [WHAT]` as above but the archive will be gzipped
>
> `-xvf [FILENAME]` extract content of the archive to the current directory (works also for gzipped `.tar` archives)
>
> `-xvf [FILENAME] -C [DIRCTORY]` extract content of the archive to the specified directory
>
> `-tvf [FILENAME]` list content of the archive (works also for gzipped `.tar` archives)
>
> `-xvf [FILENAME] [FILE-TO-EXTRACT]` extracts single file form `.tar` archive`

#### Exercise 7

In your home directory create gzipped `.tar` archive named `HIV_all.tar.gz` containing all `.fasta` files from `~/HIV`. List content of this archive.

---

## ?Searching and replacing with `sed`



