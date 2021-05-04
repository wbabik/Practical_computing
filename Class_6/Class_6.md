

# Automation with shell scripts

## `if` conditional

The `if` statement is used to construct commands that will be executed only if some extra conditions are fulfilled. The general syntax is:

``` bash
if [ condition ]	# Condition has to be enclosed in square braces [] and separated from braces with spaces 
then
	command1		#The commands will be executed only if the condition is TRUE
	command2
	...
fi
```

A bit more complex case:

``` bash
if [ condition1 ]
then
	command1		#commands 1 and 2 will be executed only if condition1 is fulfilled (TRUE)
	command2
elif [ condition2 ]
then
	command3		#command 3 will be executed if condition2 is TRUE (and condition1 is FALSE)
else
	command4		#command 4 will be executed if conditions 1 and 2 are FALSE
fi
	
```

> #### Conditions
>
> Conditions for text strings
>
> |    Condition     |            Meaning             | Example (condition is TRUE) |
> | :--------------: | :----------------------------: | :-------------------------: |
> |    `-n TEXT`     |     text string length > 0     |         `[ -n cat]`         |
> |    `-z TEXT`     |  text string length equals 0   |          `[ -z ]`           |
> | `TEXT1 = TEXT2`  | two text strings are identical |      ` [ cat = cat ] `      |
> | `TEXT1 != TEXT2` | two text strings are different |       `[ Cat = cat ]`       |
>
> Conditions for integers
>
> |       Condition       |        Meaning        | Example (condition is TRUE) |
> | :-------------------: | :-------------------: | :-------------------------: |
> | `NUMBER1 -eq NUMBER2` | numbers are identical |       `[ 10 -eq 10]`        |
> | `NUMBER1 -gt NUMBER2` |  `NUMBER1 > NUMBER2`  |       `[ 10 -gt 5 ]`        |
> | `NUMBER1 -lt NUMBER2` |  `NUMBER1 < NUMBER2`  |       `[ 5 -lt 10 ]`        |
>
> Conditions for files
>
> |     Condition      |                       Meaning                        |
> | :----------------: | :--------------------------------------------------: |
> |     `-d FILE`      |            file exists and is a directory            |
> |     `-e FILE`      |                     file exists                      |
> |     `-s FILE`      |             file exists and is not empty             |
> | `-r (-w, -x) FILE` | file exists and has read (write, execute) permission |
>
> Condition can also take a form of equation, which is then enclosed in double braces:
>
> ``` bash
> if (( 10 % 2 == 0))		#if remainder from dividing 10 by 2 is 0, then..
> then ...				
> ```
>
> Note the double equals sign (`==`) in the above.
>
> **Combining conditions**
>
> If two conditions are to be met simultaneously we join them with `&&`:
>
> ``` bash
> if [ condition1 ] && [ condition2 ]
> then...
> ```
>
> If at least one of the conditions is to be met, we join them with `||`
>
> ``` bash
> if [ condition1 ] || [ condition2 ]
> then...
> ```

### Exercise 1

All exercises in this class will use files in directory `/data/epidemy`. Copy this directory and its entire content into your home directory (`cp -r` ). The directry contains 20,112 text files. Each of these files describes a single case of hemorrhagic fever in Poland from summer 2021 (therefore file names start with `pacjent`, which is `patient` in Polish). All files have the following format (below file for patient1 is shown):

``` 
nr 1
Rzeszów
19.07.2021
comment
```

Line 1: patient number (id) - the same as in the file name

Line 2: town where the case was diagnosed

Line 3: data when the case was diagnosed

Line 4: comment - this line can be missing, can be present but empty, or can contain information about complications

Write script `epidemy1.sh`. This script should take as command line arguments ids (numbers) of two patients. If both were diagnosed the same day, then the script should print in terminal : `Diagnosed on the same day`. If the dates were different the script should print: `Diagnosed on different days`. Please test the script on patients 10015 and 1196 (the same date) and 10113 and 1595 (different dates).

**Tips (you don't have to use them, there's several ways of writing this script)**

1. Define variable with the name of the file for the first patient
2. Define variable with the name of the file for the second patient
3. Define two variables which will contain the third line of each file (use `sed -n` or `head` and `tail`)
4. Write `if` statement that will compare the values of the third lines assigned to the variables from p. 3 and, based on the result of this comparison, print the appropriate message.

> #### Testing condition in terminal
>
> Before entering a condition into your script, you can test it in terminal using `test`command.
>
> Condition in script: `[ 001 = 1 ]`
>
> Test in terminal: `test 001 = 1`
>
> `echo $?` will print the exit status of the last command: `0` for TRUE, `1` for FALSE.
>
> Is the above condition TRUE? Please check quickly in terminal.

### Exercise 2

Doctors suspect that as the epidemy progressed, the symptoms were becoming milder. Write script `epidemy2.txt`, which takes patients number as command line argument and checks whether this patient experienced serious complications or died (nonempty comment line) and whether the patient was diagnosed at the early stage of epidemy (June). If both conditions are fulfilled the script should print `A serious case diagnosed in June 2021`, otherwise print `exiting...`

**Tips:**

1. Regular expression pattern for an empty line is `^$`
2. To get the month you can use `cut` with an appropriate column delimiter.

Please test your script on patients 9633 (conditions fulfilled) and 1 (conditions not fulfilled)







