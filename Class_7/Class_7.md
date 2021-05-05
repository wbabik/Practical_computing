
# Class 7

# R and RStudio basics

## What is R?

R is a powerful programming language, broadly used for:

-   data processing
-   statistical analysis
-   production of highly-customizable, publication quality graphs
-   computer simulations
-   … and much more

R is a particularly popular tool in biology, so knowing the basics of R
is an important asset of any bilogist

## Installation

To install R for Windows follow the
[link](https://cran.uni-muenster.de/bin/windows/base/) and then click on
“Download R – *version\_number* – for Windows”. As of the time of
writing the currect R version was 4.0.5.  
To install R for OS X (Macs) follow the
[link](https://cran.uni-muenster.de/) and then click on “Download R for
(Mac) OS X”  
To install R for Linux type the following lines in the terminal:

``` bash
sudo apt-get update
sudo apt-get install r-base
```

Run R. You should see a window similar to the one below. Your language
version may differ, below is the Polish one. Language version don’t
affect the commands of the R language itself

![R](R_GUI_PL.png)

It is so called R console. Anything written and executed within a
console will be interpreted (calculated) by R and usually R will print
out something in the console.

## R as a calculator

R understands standard mathematical operators: `+` (addition), `-`
(subtraction), `*` (multiplication), `/` (division) and `^` (raising to
a power).

### Exercise 1

Sum up all integers from 1 to 10 using the `+` operator.

Expected result:

    [1] 55

### Exercise 2

Raise the result of exercise 1 to the power of 5.

Expected result:

    [1] 503284375

> R also provides two additional operators:  
> `%%` - **modulus** - returns the remainder from the division of one
> number by another, e. g., `10 %% 3 = 1`
>
> `%/%` - **integer division** - returns how many times one number is
> contained in the other, e. g., `10 %/% 3 = 3`

### Exercise 3

For numbers 10, 156, 557, 777 and 1055, check which one are divisible by
7 (i.e., divisible without remainder)

Due to its enormous importance in science *π* value can be obtained just
by typing `pi`.

### Exercise 4

Calculate the area of circle which radius equals 40 meters.  
Expected result:

    [1] 5026.548

> #### Order of operations
>
> R uses the standard order of mathematical operations. However, it is
> usually a good practice to use parentheses to be explicit.

> #### Built-in functions
>
> R provides a number of commonly used mathematical functions, such
> as:  
> `log()` natural logarithm  
> `log10()` logarithm with base 10  
> `exp()` raises the Euler number (e, the base of the natural logarithm)
> to a given power  
> `sin()`, `cos()`, `tan()` trigonometric functions  
> `abs()` absolute value  
> The argument of the function is provided in parentheses, e.g.,
> exponent of e for \`exp() or the angle in radians for trigonometric
> functions.

### Exercise 5

Calculate the natural logarithm and logarithm with base 10 of 1000.  
Expected result:

    [1] 6.907755

    [1] 3

## R studio

RStudio is a shell and programming environment for the R language. It
makes working with R much easier and more intuitive by providing a user
interface to R features originally hidden behind R functions and R
console. However, remember that all actions can be also performed within
the classical R console, e. g. if you work on a remote server without
GUI.

### Installation and appearance

Follow the [link](https://rstudio.com/products/rstudio/download/),
choose the appropriate operating system and install R studio. Have in
mind that R needs to be installed first (as we did here).

R Studio has three major advantages over the classical R console:

-   you can easily save and edit your code as a text file (give it `.R`
    extension)  
-   running any piece of previously written code (reanalysis)
-   displaying all R objects and variables saved in your computer memory
    at any given moment - you can check whether R is doing behind the
    scenes what you think is doing

The R Studio workspace consists of four main panels:

![<https://sfg-ucsb.github.io/fishery-manageR/images/rstudio_ide.png>](https://sfg-ucsb.github.io/fishery-manageR/images/rstudio_ide.png)

1.  **Code editor** - write your code and save it in a text file (.R).
    You can run it anytime by highlighting aa given piece of code and
    clicking `Run` in right-top corner (or pressing
    <kbd>Ctrl</kbd>+<kbd>R</kbd>).
2.  **Console** - Exactly the same console as in standard R (see above).
    Note that any line of code run from *Code editor* will appear in the
    console. To recall the lastly run line of code use <kbd>↑</kbd> (it
    works as a general way of browsing through the history of the
    previously executed commands).
3.  **Environment / History**
    -   `Environment` - see all variables (including their current
        values) and functions present in your computer’s memory (RAM).
        Have in mind they will be lost as soon as you close RStudio.
    -   `History` - access to the entire code run in a given RStudio
        session.
4.  **Files / Plots / Help / Packages**
    -   `Files` - manage files on your computer.
    -   `Plots` - preview generated plots before saving them.
    -   `Help` - access help page (often with examples) for a given
        function.
    -   `Packages` - manage all additionally installed modules.

### Exercise 6

Create new script file `File -> New File -> R Script` and save it. Write
code for all subsequent exercises using Code editor and save it in the
script. Remember that to obtain any result you have to execute/run your
code first.

> #### Comments
>
> If you want to include some comments within a script file or “turn
> off” a chunk of code, type `#` hash before it, exactly as you’d do in
> a bash script. Anything written until the end of a given line will be
> ignored by R. To comment several lines highlight them and use
> <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>C</kbd>. To uncomment use the
> same keyboard shortcut once again.

### 4. Variables

Until you name something it does not exist in a computer memory! Any
outcome of the execution of a command within the console perishes when
the calculation is finished, unless it is assigned to a given name.
Named objects within the computer memory are called “variables”. You can
create one by using arrows (assignement symbol) in the following
manner:  
*chosen\_name &lt;- object\_to\_be\_saved*  
You can easily recall the value of the variable later on by typing its
name.

<span style="color: green;">**Ex 6. Try to save *5* as variable. Choose
a variable name on your own. Then, type your variable’s name and press
*Enter*.**</span>  
Expected result:

    [1] 5

**An advice**  
The variable name is case sensitive and cannot contain blank spaces or
start with a digit. When you want to combine several words into one name
use the underscore (\_). By convention dots are used for function names
and should be used with caution.

Since the variable is saved, its name can replace the actual value in
any R commands e.g. if *2* is assigned to *x*, both *2+3* and *x+3*
would result in *5*.

<span style="color: green;">**Ex 7. Using the table from exercise 5,
calculate the range of species frequencies for both populations and save
them as separate variables. Then using chosen names, calculate the
absolute difference between ranges. Save it to a variable called
*range\_diff* and call it.**</span>  
Expected result:

    [1] 0.3

Variables can also be overwritten. It is done by assigning a new object
to the already used variable’s name. Remember, however, that once you
overwrite the variable the old value disappears for good.

<span style="color: green;">**Ex 8. Change variable *range\_diff* by
increasing its value by 20%. Call it.**</span>  
Expected result:

    [1] 0.36

Variables can store not only numbers. The other very popular type of
data is *string*. It is a text which behaves as a single object
regardless of its length. To distinguish strings from variable names R
requires usage of quotation marks around them.

<span style="color: green;">**Ex 9. Save your name to the variable
*my\_name*. Call it.**</span>

### 5. Functions

One of the usual ways to deal with your data in R is to use functions.
They are simply lines of code saved in a computer memory that perform
desired operations and often return a result.  
Functions we used before take only a single argument e.g. log() takes a
number. However, it is rarely the case. List of function’s arguments and
the way of usage can be found in function’s manual. It can be reached by
typing *?* followed by the function’s name.\*\*

<span style="color: green;">**Ex 10. Open the manual for *paste()*
function.**</span>

<!--![](/home/tomek/Dropbox/Kurs_R/paste_manual.png)  -->

Usually the manual consists of 7 sections:  
- DESCRIPTION - the aim of the function  
- USAGE - the syntax  
- ARGUMENTS - arguments passed to the function and their meaning  
- DETAILS - detailed description of the function behaviour  
- VALUE - outcome of the function  
- REFERENCES - often the scientific article function is based on -
EXAMPLES

<span style="color: green;">**Ex 11. Use** *paste()* **function to stick
the following words together:** ‘I’m’, ‘using’ **and** ‘R’. **Don’t
forget about quotation marks.**</span>

Expected result:

    [1] "I'm using R"

Arguments passed to functions often have their own names.  
Distinctive names are crucial because many functions take multiple
arguments that need to be distinguished. Such named arguments are passed
in the following pattern: *argument\_name = argument\_value*.

<span style='color: green;'>**Ex 12. Use the same function as above but
set another argument called** *sep* **(separator) to** ’\_’</span>

Expected result:

    [1] "I'm_using_R"

Note that blank space was replaced with underscore. However, where did
the blank spaces come from at the first space? The answer is that some
arguments have their default values that would be taken if no value is
put into function.  
In the above case the default value for *sep* argument is a blank space
(" ").

**An advice**  
It is a good practice to use argument names while calling a function.
Although, R can “guess” the argument name by the order in which
arguments are typed, it can work improperly when the number of arguments
is not strictly defined (“…” sign in function description).

### 6. Vectors

Vector is a series of numbers (or strings) that are saved as a single
variable. A new vector can be created with *c()* function in the
following manner: *c(value\_1,value\_2,value\_3,…)*.

<span style="color: green;">**Ex 13. Create a vector containing integers
from 5 to 10 and save it to a variable. Call it.**</span>  
Expected result:

    [1]  5  6  7  8  9 10

**To create a vector of consecutive integers you can type the limits of
the range separated by colon.**

<span style="color: green;">**Ex 14. Create a vector containing integers
from 1 to 100 and save it to a variable *one\_to\_hundred*. Call
it.**</span>  
Expected result:

      [1]   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18
     [19]  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34  35  36
     [37]  37  38  39  40  41  42  43  44  45  46  47  48  49  50  51  52  53  54
     [55]  55  56  57  58  59  60  61  62  63  64  65  66  67  68  69  70  71  72
     [73]  73  74  75  76  77  78  79  80  81  82  83  84  85  86  87  88  89  90
     [91]  91  92  93  94  95  96  97  98  99 100

**An advice**  
Note that concerning ranges, R is fully inclusive which means that both
limits of the range will be included in the final outcome.

To create a vector of consecutive numbers which differ by a given value,
use *seq()* function. Note that the function will return a vector so
there is no need to use *c()*.

<span style="color: green;">**Ex 15. Access *seq()* manual. Using
*seq()* function, create a vector of numbers between 0 and 1 that differ
by 0.1.**</span>

     [1] 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0

To create a vector of repeated values, use *rep()* function:

<span style="color: green;">**Ex 16. Access *rep()* manual by typing
*?rep* in console. Using *rep()* function, create a vector consisting of
1,2 and 3 repeated 20 times. Save it as a variable *repeated*.**</span>

     [1] 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2
    [39] 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3

All elements of a vector have to be of the same type. While trying to
combine different types, R will try to reformat some of them.

<span style="color: green;">**Ex 17. Create a vector from 1 to 4 with
odd numbers typed as digits and even numbers typed as words. What is the
outcome? Vector of integers or vector of strings? **</span>

### 6. Vector machinations

Useful functions:  
**min()** - minimum value  
**max()** - maximum value  
**sum()** - sum up all numbers in a vector  
**prod()** - multiply all numbers in a vector  
**mean()** - average value  
**median()** - central value  
**length()** - number of elements in a vector  
**sort()** - sort values (default is ascending order, use *decreasing*
argument to sort in descending order)  
**unique()** - return unique values  
**round()** - round numbers (to integers by default)

<span style="color: green;">**Ex 18. Having a vector *one\_to\_hundred*
calculate its mean and median**</span>  
Expected results:

    [1] 50.5

    [1] 50.5

<span style="color: green;">**Ex 19. Having a vector *repeated* sort it
and return unique values.**</span>  
Expected results:

     [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
    [39] 2 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3

    [1] 1 2 3

Vectors can be also used in typical mathematical operations. However
there is one important rule: shorter vector will be repeated until it
reaches length of longer one (single number is treated as vector of
length 1).

Examples:

``` r
c(1,2,3,4) + 5     # 5 is added to each element, the same as c(1,2,3,4) + c(5,5,5,5)
```

    [1] 6 7 8 9

``` r
c(1,2,3,4) + c(1,2)     # the same as c(1,2,3,4) + c(1,2,1,2)
```

    [1] 2 4 4 6

<span style="color: green;">**Ex 20. Having a vector *one\_to\_hundred*,
raise each element to the power of 3. Save it to a variable called
*power\_3*.**</span>  
Expected result:

      [1]       1       8      27      64     125     216     343     512     729
     [10]    1000    1331    1728    2197    2744    3375    4096    4913    5832
     [19]    6859    8000    9261   10648   12167   13824   15625   17576   19683
     [28]   21952   24389   27000   29791   32768   35937   39304   42875   46656
     [37]   50653   54872   59319   64000   68921   74088   79507   85184   91125
     [46]   97336  103823  110592  117649  125000  132651  140608  148877  157464
     [55]  166375  175616  185193  195112  205379  216000  226981  238328  250047
     [64]  262144  274625  287496  300763  314432  328509  343000  357911  373248
     [73]  389017  405224  421875  438976  456533  474552  493039  512000  531441
     [82]  551368  571787  592704  614125  636056  658503  681472  704969  729000
     [91]  753571  778688  804357  830584  857375  884736  912673  941192  970299
    [100] 1000000

### 7. Accessing elements of a vector

**Vector can be subsetted in the following manner:
*vector\_name\[element\_index\]***

<span style="color: green;">**Ex 21. Return 15<sup>th</sup> element of
the vector *power\_3*.**</span>  
Expected result:

    [1] 3375

**Colon can be used for ranges just as for vector creation.**

<span style="color: green;">**Ex 22. Return 2<sup>nd</sup> to
20<sup>th</sup> element of the vector *power\_3*.**</span>  
Expected result:

     [1]    8   27   64  125  216  343  512  729 1000 1331 1728 2197 2744 3375 4096
    [16] 4913 5832 6859 8000

**To obtain multiple values, put a vector instead single position
index.**

<span style="color: green;">**Ex 23. Return 15<sup>th</sup>,
30<sup>th</sup> and 45<sup>th</sup> element of the vector
*power\_3*.**</span>  
Expected result:

    [1]  3375 27000 91125

<span style="color: green;">**Ex 24. Create a vector consisting of
indexes () used in exercises 22 and 23. Save it to a variable. Return
elements of the vector *power\_3* with the use of previously created
vector.**</span>  
Expected result:

     [1]     8    27    64   125   216   343   512   729  1000  1331  1728  2197
    [13]  2744  3375  4096  4913  5832  6859  8000  3375 27000 91125

**An advice**  
While creating a vector you can combine both ranges and single indexes
with *c()* function.

### 9. Before leaving - IMPORTANT!!!

**If you want me to check your code written during the class, type the
commands below to save the R history. Change file’s name to include your
surname and send it to me via email.**

``` r
savehistory(file = "my_history.txt")     # saves your R history to the file "my_history.txt"
getwd()                                  # displays where the file was saved
```

### 8. Next classes

In the following classes you will learn how to use R studio, save your
code, rerun analysis and work with tables.

### 9. Homework

**Please, save all your commands in a text file (.txt) and email the
file to me before the next class.**

1.  Create a vector with 12 elements which will correspond to the number
    of days each month has. Call it *days*.
2.  Modify vector *days* to obtain a vector of unique possible months’
    lengths. Call it *months\_length*.
3.  Calculate mean number of days in a month.
4.  Modify vector *days* and create a vector with the number of hours
    each month has. Call it *hours*.
