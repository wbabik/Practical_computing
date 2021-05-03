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

## `echo`

## Shell scripts

## Setting permissions with `chmod`

## Shell variables

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

### Exercise xxx

In your home directory create gzipped `.tar` archive named `HIV_all.tar.gz` containing all `.fasta` files from `~/HIV`. List content of this archive.

## ?Searching and replacing with `sed`



