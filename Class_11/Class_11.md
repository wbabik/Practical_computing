
# Class 11

# Operations on data frames, `dplyr`
  * [Operations on data frames, part 2](#operations-on-data-frames-part-2)
    * [Subsetting data frames with logical expressions](#subsetting-data-frames-with-logical-expressions)
      * [Exercise 1](#exercise-1)
      * [Exercise 2](#exercise-2)
    * [Adding new column or row](#adding-new-column-or-row)
      * [Exercise 3](#exercise-3)
      * [Exercise 4](#exercise-4)
      * [Exercise 5](#exercise-5)
      * [Exercise 6](#exercise-6)
    * [Saving data frame](#saving-data-frame)
      * [Exercise 7](#exercise-7)
  * [dplyr and tidyverse](#dplyr-and-tidyverse)
  * [Six dplyr verbs](#six-dplyr-verbs)
      * [Exercise 8](#exercise-8)
      * [Exercise 9](#exercise-9)
    * [Filtering rows with filter()](#filtering-rows-with-filter)
      * [filter() examples](#filter-examples)
      * [Exercise 10](#exercise-10)
    * [Ordering rows with arrange()](#ordering-rows-with-arrange)
      * [arrange() example](#arrange-example)
      * [Exercise 11](#exercise-11)
    * [Picking, dropping and re-ordering columns with select()](#picking-dropping-and-re-ordering-columns-with-select)
      * [select() examples](#select-examples)
      * [Exercise 12](#exercise-12)
      * [Exercise 13](#exercise-13)
    * [Creating new variables as functions of the existing ones with mutate()](#creating-new-variables-as-functions-of-the-existing-ones-with-mutate)
      * [mutate examples](#mutate-examples)
      * [Exercise 14](#exercise-14)
    * [Grouping cases by variable(s) with group_by()](#grouping-cases-by-variables-with-group_by)
      * [group_by() examples](#group_by-examples)
      * [Exercise 15](#exercise-15)
      * [The pipe operator (%>%)](#the-pipe-operator-)
    * [Summarising with summarise()](#summarising-with-summarise)
  
***  
  

## Operations on data frames, part 2

### Subsetting data frames with logical expressions

The logic of subsetting vector with logical expressions can be easily
extended to data frames. Note, that if you want to obtain a logical
vector with one element for each row (i.e, to subset rows), you need to
specify which column you want to use. For instance, if you have data
frame `my_data` and you want to get all rows with the value of variable
`my_column` different from 5, you would use the following expression
`my_data[my_data$my_column !=5,]`. This expression will return all
columns (note blank after the comma)

#### Exercise 1

Using built-in dataset `CO2`, return observation for `Qn2` plant.

Expected result:

``` 
   Plant   Type  Treatment conc uptake
8    Qn2 Quebec nonchilled   95   13.6
9    Qn2 Quebec nonchilled  175   27.3
10   Qn2 Quebec nonchilled  250   37.1
11   Qn2 Quebec nonchilled  350   41.8
12   Qn2 Quebec nonchilled  500   40.6
13   Qn2 Quebec nonchilled  675   41.4
14   Qn2 Quebec nonchilled 1000   44.3
```

-----

#### Exercise 2

Using built-in dataset `CO2`, return observation from Mississippi
chilled plant with an uptake higher than 0.02 mmol/m<sup>2</sup> x s.

Expected result:

``` 
   Plant        Type Treatment conc uptake
69   Mc1 Mississippi   chilled  675   22.2
70   Mc1 Mississippi   chilled 1000   21.9
```

### Adding new column or row

Adding **new column** is relatively **simple**. All you need to have is
a vector. However, remember three things:

  - length of vector must equal the number of rows of the data frame
  - order of values within a vector corresponds to the row numbers
  - name of the vector will become the name of the added column

We are going to add a column with IDs of observations. Note that column
with IDs is often necessary in statistical analysis. It is also inherent
to the data in [long
format](https://www.theanalysisfactor.com/wide-and-long-data/) which is
strongly advised (see class 1 and next class).

#### Exercise 3

Create vector with ID numbers starting from 100. Use one of the
functions introduced above to determine what should be the length of the
vector. Name the vector `ID`.  
Expected result:

``` 
 [1] 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118
[20] 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137
[39] 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156
[58] 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175
[77] 176 177 178 179 180 181 182
```

-----

You can combine data frames with the use of `cbind()` function in the
following manner: `cbind(data_frame1, data_frame2)`. Note that a vector
can be considered a data frame with a single column.

#### Exercise 4

Place created IDs at the beginning (as first column) of `my_dat`.
Overwrite `my_data` variable.

-----

Adding **new row** is more **complicated** as you cannot create a vector
with different types of data. Firstly you need to create a new data
frame (similar to the old one) consisting of only new row (or rows). To
do this use `data.frame()` function in the following manner:
`data.frame(columnName1 = value1, columnName2 = value2,...)`.

#### Exercise 5

Create data frame with a single row and the following values:
`1,'Kr1','Krakow',unknown',1000,20`. Column names should correspond to
these of `my_data`. Name the newly created data frame `Added_rows`.

Expected result:

``` 
  ID Plant   Type Treatment conc uptake
1  1   Kr1 Krakow   unknown 1000     20
```

-----

To create a data frame with multiple rows, replace the value for each
column with a vector.

To combine data frames by rows use `rbind()` function in the following
manner: `rbind(data_frame1, data_frame2)`

#### Exercise 6

Add the row created in Ex. 5 at the end of `my_data`. Overwrite
`my_data` variable.

-----

### Saving data frame

To save your data frame into a text file use `write.table()` function.

#### Exercise 7

Save the modified `my_data` int a `.csv` file. Consult `write.table()`
manual to set the arguments. Include your surname in the file name.

-----

## `dplyr` and `tidyverse`

`dplyr` is a package from `tidyverse` ecosystem (a set of packages
sharing a common philosophy), which has been enjoying an enormous
popularity in recent years. Sometimes even one has an impression that
people equate R with `tidyverse`. The main purpose of `dplyr` is to
simplify work with data frames. In this course we first introduced base
R, because we are convinced that its understanding is critical for
efficient work in R. During this class you’ll learn how to use `dplyr`
and we’ll go through a real-life example of filtering and summarizing a
complex, “real”, data. For more info on `tidyverse` see
[webpage](https://www.tidyverse.org/) and [free
book](https://r4ds.had.co.nz/)

## Six `dplyr` verbs

We’ll illustrate the basic `dplyr` functions (verbs) using the built-in
`iris` dataset that contains measurements (in cm) of several flower
traits of several *Iris* species.

#### Exercise 8

Display structure and summary of `iris` dataset using `str()` and
`summary()`. Answer the following questions:

  - which traits were measured?
  - how many flowers were measured in total?
  - which *Iris* species were studied?
  - what were sample sizes of particular species?

Here’s a schematic view of a flower with the most important structures
labeled:

![flower](flower.png)

-----

All six functions work similarly:

1.  The first argument is always a data frame.
2.  Subsequent arguments describe what the function is supposed to do
    with the data frame. You can refer to the columns of the data frame
    without using quotation marks.
3.  The result is a data frame.

#### Exercise 9

Load `dplyr` package

-----

### Filtering rows with `filter()`

`filter()` returns rows that fulfill a logical condition. You can
combine any number of conditions.

#### `filter()` examples

Display data for *Iris setosa*

``` r
filter(iris, Species == "setosa")
```

    ##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    ## 1           5.1         3.5          1.4         0.2  setosa
    ## 2           4.9         3.0          1.4         0.2  setosa
    ## 3           4.7         3.2          1.3         0.2  setosa
    ## 4           4.6         3.1          1.5         0.2  setosa
    ## 5           5.0         3.6          1.4         0.2  setosa
    ## 6           5.4         3.9          1.7         0.4  setosa
    ## 7           4.6         3.4          1.4         0.3  setosa
    ## 8           5.0         3.4          1.5         0.2  setosa
    ## 9           4.4         2.9          1.4         0.2  setosa
    ## 10          4.9         3.1          1.5         0.1  setosa

**Note:**

  - we used double equal sign (`==`) to specify a comparison
  - the column name was not enclosed in quotation marks, while the value
    (species name, character string) was.

Display all observations for *Iris setosa* that have sepal length at
least 5.5 cm:

``` r
filter(iris, Species == "setosa", Sepal.Length >= 5.5)
```

    ##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    ## 1          5.8         4.0          1.2         0.2  setosa
    ## 2          5.7         4.4          1.5         0.4  setosa
    ## 3          5.7         3.8          1.7         0.3  setosa
    ## 4          5.5         4.2          1.4         0.2  setosa
    ## 5          5.5         3.5          1.3         0.2  setosa

If both conditions are to be met, they can be separated by comma (`,`)
or by the AND sign (`&`):

``` r
filter(iris, Species == "setosa" & Sepal.Length >= 5.5)
```

    ##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    ## 1          5.8         4.0          1.2         0.2  setosa
    ## 2          5.7         4.4          1.5         0.4  setosa
    ## 3          5.7         3.8          1.7         0.3  setosa
    ## 4          5.5         4.2          1.4         0.2  setosa
    ## 5          5.5         3.5          1.3         0.2  setosa

You can use alternatives and group conditions using parentheses. To
display all observations of *I. versicolor* and *I. virginica* that have
petal length at least 5 cm:

``` r
filter(iris, (Species == "versicolor" | Species == "virginica"), Petal.Length >=5)
```

or

``` r
filter(iris, (Species == "versicolor" | Species == "virginica") & Petal.Length >=5)
```

    ##    Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
    ## 1           6.7         3.0          5.0         1.7 versicolor
    ## 2           6.0         2.7          5.1         1.6 versicolor
    ## 3           6.3         3.3          6.0         2.5  virginica
    ## 4           5.8         2.7          5.1         1.9  virginica
    ## 5           7.1         3.0          5.9         2.1  virginica
    ## 6           6.3         2.9          5.6         1.8  virginica
    ## 7           6.5         3.0          5.8         2.2  virginica
    ## 8           7.6         3.0          6.6         2.1  virginica
    ## 9           7.3         2.9          6.3         1.8  virginica
    ## 10          6.7         2.5          5.8         1.8  virginica

Note, that the following doesn’t work:

``` r
filter(iris, (Species == "versicolor" | "virginica"), Petal.Length >=5)
```

    ## Error: Problem with `filter()` input `..1`.
    ## x operations are possible only for numeric, logical or complex types
    ## i Input `..1` is `(Species == "versicolor" | "virginica")`.

#### Exercise 10

Select all observations, regardless of species, that have sepal length
smaller than 6 cm or petal length smaller than 5 cm, and sepal width
larger than 4 cm.

Expected result:

    ##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    ## 1          5.7         4.4          1.5         0.4  setosa
    ## 2          5.2         4.1          1.5         0.1  setosa
    ## 3          5.5         4.2          1.4         0.2  setosa

-----

### Ordering rows with `arrange()`

`arrange()`returns data frame sorted according to a column or a
combination of columns. If you provide more than one column, each
additional column will be used to break the ties. If you want to sort
according to a column in descending order, use `desc()`. Note, that
numbers stored as character are sorted differently than numbers stored
as numeric, and when sorting logical values `FALSE` (`0`) comes before
`TRUE` (`1`).

#### `arrange()` example

Sort the `iris` dataset according to species in alphabetical (ascending)
order and within the species from the longest to the shortest sepal

``` r
arrange(iris, Species, desc(Sepal.Length))
```

#### Exercise 11

Sort species in descending order, and observations within each species
according to the increasing petal length.

Expected result:

    ##    Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
    ## 1           4.9         2.5          4.5         1.7 virginica
    ## 2           6.2         2.8          4.8         1.8 virginica
    ## 3           6.0         3.0          4.8         1.8 virginica
    ## 4           5.6         2.8          4.9         2.0 virginica
    ## 5           6.3         2.7          4.9         1.8 virginica
    ## 6           6.1         3.0          4.9         1.8 virginica
    ## 7           5.7         2.5          5.0         2.0 virginica
    ## 8           6.0         2.2          5.0         1.5 virginica
    ## 9           6.3         2.5          5.0         1.9 virginica
    ## 10          5.8         2.7          5.1         1.9 virginica

-----

### Picking, dropping and re-ordering columns with `select()`

Select selects, drops or re-arranges columns of a data frame. Columns
can be referred to by name, position in the data frame or by an
expression.

> #### `select` helpers
> 
> The following helper functions can be used to select columns that
> match a pattern:
> 
> `starts_with()` selects columns that start with a string  
> `ends_with()` selects columns that end with a string  
> `contains()` selects columns that contain a string  
> `matches()` selects columns matching a regular expression
> 
> There are also useful helpers that allow to select column on the basis
> of a character vector containing names. See `?select` for more
> details.

#### `select()` examples

Select `iris` columns 1, 2, 3 and 5:

``` r
select(iris, 1:3, 5)
```

or, just drop column 4:

``` r
select(iris, -4)
```

    ##    Sepal.Length Sepal.Width Petal.Length Species
    ## 1           5.1         3.5          1.4  setosa
    ## 2           4.9         3.0          1.4  setosa
    ## 3           4.7         3.2          1.3  setosa
    ## 4           4.6         3.1          1.5  setosa
    ## 5           5.0         3.6          1.4  setosa
    ## 6           5.4         3.9          1.7  setosa
    ## 7           4.6         3.4          1.4  setosa
    ## 8           5.0         3.4          1.5  setosa
    ## 9           4.4         2.9          1.4  setosa
    ## 10          4.9         3.1          1.5  setosa

Select species name and petal measurements:

``` r
select(iris, Species, starts_with("Petal"))
```

    ##    Species Petal.Length Petal.Width
    ## 1   setosa          1.4         0.2
    ## 2   setosa          1.4         0.2
    ## 3   setosa          1.3         0.2
    ## 4   setosa          1.5         0.2
    ## 5   setosa          1.4         0.2
    ## 6   setosa          1.7         0.4
    ## 7   setosa          1.4         0.3
    ## 8   setosa          1.5         0.2
    ## 9   setosa          1.4         0.2
    ## 10  setosa          1.5         0.1

The example above shows that `select()` can be used to reorder
variables. A useful trick to move a single column (here `Species`) to
the beginning of the data frame:

``` r
select(iris, Species, everything())
```

    ##    Species Sepal.Length Sepal.Width Petal.Length Petal.Width
    ## 1   setosa          5.1         3.5          1.4         0.2
    ## 2   setosa          4.9         3.0          1.4         0.2
    ## 3   setosa          4.7         3.2          1.3         0.2
    ## 4   setosa          4.6         3.1          1.5         0.2
    ## 5   setosa          5.0         3.6          1.4         0.2
    ## 6   setosa          5.4         3.9          1.7         0.4
    ## 7   setosa          4.6         3.4          1.4         0.3
    ## 8   setosa          5.0         3.4          1.5         0.2
    ## 9   setosa          4.4         2.9          1.4         0.2
    ## 10  setosa          4.9         3.1          1.5         0.1

#### Exercise 12

Select width measurements and species from `iris`, at the same time
relocating species to the beginning of the data frame.  
Expected result:

    ##    Species Sepal.Width Petal.Width
    ## 1   setosa         3.5         0.2
    ## 2   setosa         3.0         0.2
    ## 3   setosa         3.2         0.2
    ## 4   setosa         3.1         0.2
    ## 5   setosa         3.6         0.2
    ## 6   setosa         3.9         0.4
    ## 7   setosa         3.4         0.3
    ## 8   setosa         3.4         0.2
    ## 9   setosa         2.9         0.2
    ## 10  setosa         3.1         0.1

-----

#### Exercise 13

Drop petal measurements from `iris` data frame.  
Expected result:

    ##    Sepal.Length Sepal.Width Species
    ## 1           5.1         3.5  setosa
    ## 2           4.9         3.0  setosa
    ## 3           4.7         3.2  setosa
    ## 4           4.6         3.1  setosa
    ## 5           5.0         3.6  setosa
    ## 6           5.4         3.9  setosa
    ## 7           4.6         3.4  setosa
    ## 8           5.0         3.4  setosa
    ## 9           4.4         2.9  setosa
    ## 10          4.9         3.1  setosa

-----

### Creating new variables as functions of the existing ones with `mutate()`

`mutate()` adds a new column at the end of the data frame. The value of
this column can be a single element vector provided by the user or,
usually more usefully, a formula that uses values of other variables.
Once you create the new column, you can immediately use it in the same
`mutate()` call.

#### `mutate` examples

Add to `iris`a new variable called `One` with the value `1` and the data
type character for all observations.

``` r
mutate(iris, One = "1")
```

    ##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species One
    ## 1           5.1         3.5          1.4         0.2  setosa   1
    ## 2           4.9         3.0          1.4         0.2  setosa   1
    ## 3           4.7         3.2          1.3         0.2  setosa   1
    ## 4           4.6         3.1          1.5         0.2  setosa   1
    ## 5           5.0         3.6          1.4         0.2  setosa   1
    ## 6           5.4         3.9          1.7         0.4  setosa   1
    ## 7           4.6         3.4          1.4         0.3  setosa   1
    ## 8           5.0         3.4          1.5         0.2  setosa   1
    ## 9           4.4         2.9          1.4         0.2  setosa   1
    ## 10          4.9         3.1          1.5         0.1  setosa   1

Create new variable named `Petal.Ratio`, the value of which will be the
ratio of petal length to petal width:

``` r
mutate(iris, Petal.Ratio = Petal.Length/Petal.Width)
```

    ##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species Petal.Ratio
    ## 1           5.1         3.5          1.4         0.2  setosa    7.000000
    ## 2           4.9         3.0          1.4         0.2  setosa    7.000000
    ## 3           4.7         3.2          1.3         0.2  setosa    6.500000
    ## 4           4.6         3.1          1.5         0.2  setosa    7.500000
    ## 5           5.0         3.6          1.4         0.2  setosa    7.000000
    ## 6           5.4         3.9          1.7         0.4  setosa    4.250000
    ## 7           4.6         3.4          1.4         0.3  setosa    4.666667
    ## 8           5.0         3.4          1.5         0.2  setosa    7.500000
    ## 9           4.4         2.9          1.4         0.2  setosa    7.000000
    ## 10          4.9         3.1          1.5         0.1  setosa   15.000000

#### Exercise 14

Create, using a single `mutate()` call, two new variables:
Petal.Length.Squared, Sepal.Length.Squared, containing the squared
length of petal and sepal, respectively.  
Expected result:

    ##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    ## 1           5.1         3.5          1.4         0.2  setosa
    ## 2           4.9         3.0          1.4         0.2  setosa
    ## 3           4.7         3.2          1.3         0.2  setosa
    ## 4           4.6         3.1          1.5         0.2  setosa
    ## 5           5.0         3.6          1.4         0.2  setosa
    ## 6           5.4         3.9          1.7         0.4  setosa
    ## 7           4.6         3.4          1.4         0.3  setosa
    ## 8           5.0         3.4          1.5         0.2  setosa
    ## 9           4.4         2.9          1.4         0.2  setosa
    ## 10          4.9         3.1          1.5         0.1  setosa
    ##    Petal.Length.Squared Sepal.Length.Squared
    ## 1                  1.96                26.01
    ## 2                  1.96                24.01
    ## 3                  1.69                22.09
    ## 4                  2.25                21.16
    ## 5                  1.96                25.00
    ## 6                  2.89                29.16
    ## 7                  1.96                21.16
    ## 8                  2.25                25.00
    ## 9                  1.96                19.36
    ## 10                 2.25                24.01

-----

### Grouping cases by variable(s) with `group_by()`

You could (rightly) consider some of the preceding examples and
exercises boring, so let’s move to something more exciting. `group_by()`
creates a **grouped data frame**, that is a data frame which rows are
assigned to various groups based on the value of one or more grouping
variables. The data frame itself is not changed, but the way operations
on the data frame are performed is. For example, if you use a function,
such as `mean()` with `mutate()`, the mean of the group to which a row
belongs will be used for this row.

#### `group_by()` examples

Group `iris` by species

``` r
group_by(iris, Species)
```

When you execute the command above, you’ll see that the object is not
anymore `data.frame`, but now it’s called `tibble` and you’ll find
information about grouping added, though no information in the table was
altered:

    ## # A tibble: 150 x 5
    ## # Groups:   Species [3]
    ##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    ##           <dbl>       <dbl>        <dbl>       <dbl> <fct>  
    ##  1          5.1         3.5          1.4         0.2 setosa 
    ##  2          4.9         3            1.4         0.2 setosa 
    ##  3          4.7         3.2          1.3         0.2 setosa 
    ##  4          4.6         3.1          1.5         0.2 setosa 
    ##  5          5           3.6          1.4         0.2 setosa 
    ##  6          5.4         3.9          1.7         0.4 setosa 
    ##  7          4.6         3.4          1.4         0.3 setosa 
    ##  8          5           3.4          1.5         0.2 setosa 
    ##  9          4.4         2.9          1.4         0.2 setosa 
    ## 10          4.9         3.1          1.5         0.1 setosa 
    ## # ... with 140 more rows

#### Exercise 15

Group `iris` by species, assign the grouped dataset to variable, and use
mutate to add column `Mean.Sepal.Length`, which would contain the mean
value of sepal length. Are all values in this column identical? Why?

-----

#### The pipe operator (`%>%`)

Usually, when you want to use several functions in sequence, you
repeatedly assign the result to a variable, which is fine, but a bit
inconvenient:

``` r
a <- select(iris, Species, starts_with("Sepal"))
a <- mutate(a, Sepal.Ratio = Sepal.Length/Sepal.Width)
head(a)
```

    ##   Species Sepal.Length Sepal.Width Sepal.Ratio
    ## 1  setosa          5.1         3.5    1.457143
    ## 2  setosa          4.9         3.0    1.633333
    ## 3  setosa          4.7         3.2    1.468750
    ## 4  setosa          4.6         3.1    1.483871
    ## 5  setosa          5.0         3.6    1.388889
    ## 6  setosa          5.4         3.9    1.384615

Here’s where the **pipe** `%>%` comes handy. Although the symbol used is
different, its behaviour is similar to the pipe operator `|` of the
Linux shell. In conjunction with `dplyr` verbs it allows creating
pipelines without the need of assigning intermediate results to
variables. Note, that when a `dplyr` function is used following `%>%`,
you don’t specify the data frame the function operates on - because the
data frame is passed by `%>%`\!

So, instead of the code above you can use:

``` r
a <- select(iris, Species, starts_with("Sepal")) %>% mutate(Sepal.Ratio = Sepal.Length/Sepal.Width)
head(a)
```

    ##   Species Sepal.Length Sepal.Width Sepal.Ratio
    ## 1  setosa          5.1         3.5    1.457143
    ## 2  setosa          4.9         3.0    1.633333
    ## 3  setosa          4.7         3.2    1.468750
    ## 4  setosa          4.6         3.1    1.483871
    ## 5  setosa          5.0         3.6    1.388889
    ## 6  setosa          5.4         3.9    1.384615

or

``` r
a <- iris %>% select(Species, starts_with("Sepal")) %>% mutate(Sepal.Ratio = Sepal.Length/Sepal.Width)
head(a)
```

    ##   Species Sepal.Length Sepal.Width Sepal.Ratio
    ## 1  setosa          5.1         3.5    1.457143
    ## 2  setosa          4.9         3.0    1.633333
    ## 3  setosa          4.7         3.2    1.468750
    ## 4  setosa          4.6         3.1    1.483871
    ## 5  setosa          5.0         3.6    1.388889
    ## 6  setosa          5.4         3.9    1.384615

Using `%>%` not only eliminates the need for intermediate variables, but
also makes code more **readable**. In this case, you first take `iris`,
then select some columns and then add a column based on the values of
the existing columns. The way your code is written reflects the sequence
of steps.

Before we move on, we’ll show a useful technique that allows, for
example, easy standardization. Our task is to standardize the values of
sepal length by subtracting each from the species mean and dividing the
result by the species standard deviation (this is called
Z-standardization). Here’s the code:

``` r
iris %>% select(Species, Sepal.Length) %>%  group_by(Species) %>%
  mutate(sp.Mean = mean(Sepal.Length),
         sp.SD = sd(Sepal.Length),
         Zstand.Sepal.Length = (Sepal.Length - sp.Mean)/sp.SD)
```

    ## # A tibble: 150 x 5
    ## # Groups:   Species [3]
    ##    Species Sepal.Length sp.Mean sp.SD Zstand.Sepal.Length
    ##    <fct>          <dbl>   <dbl> <dbl>               <dbl>
    ##  1 setosa           5.1    5.01 0.352              0.267 
    ##  2 setosa           4.9    5.01 0.352             -0.301 
    ##  3 setosa           4.7    5.01 0.352             -0.868 
    ##  4 setosa           4.6    5.01 0.352             -1.15  
    ##  5 setosa           5      5.01 0.352             -0.0170
    ##  6 setosa           5.4    5.01 0.352              1.12  
    ##  7 setosa           4.6    5.01 0.352             -1.15  
    ##  8 setosa           5      5.01 0.352             -0.0170
    ##  9 setosa           4.4    5.01 0.352             -1.72  
    ## 10 setosa           4.9    5.01 0.352             -0.301 
    ## # ... with 140 more rows

we could use `select()` again to drop the intermediate variables we no
longer need:

``` r
iris %>% select(Species, Sepal.Length) %>%  group_by(Species) %>%
  mutate(sp.Mean = mean(Sepal.Length),
         sp.SD = sd(Sepal.Length),
         Zstand.Sepal.Length = (Sepal.Length - sp.Mean)/sp.SD) %>% select(-c(sp.Mean, sp.SD))
```

    ## # A tibble: 150 x 3
    ## # Groups:   Species [3]
    ##    Species Sepal.Length Zstand.Sepal.Length
    ##    <fct>          <dbl>               <dbl>
    ##  1 setosa           5.1              0.267 
    ##  2 setosa           4.9             -0.301 
    ##  3 setosa           4.7             -0.868 
    ##  4 setosa           4.6             -1.15  
    ##  5 setosa           5               -0.0170
    ##  6 setosa           5.4              1.12  
    ##  7 setosa           4.6             -1.15  
    ##  8 setosa           5               -0.0170
    ##  9 setosa           4.4             -1.72  
    ## 10 setosa           4.9             -0.301 
    ## # ... with 140 more rows

Note, that the columns to drop were passed as a vector of column names
not enclosed in quotation marks (quotation marks are allowed, but not
necessary).

### Summarising with `summarise()`

When used on a data frame that is not grouped `summarise` just applies a
function to a column and returns a small data frame containing the
result:

``` r
summarise(iris, mean.Sepal.Length = mean(Sepal.Length))
```

    ##   mean.Sepal.Length
    ## 1          5.843333

This may be useful, but rather not terribly so.

Things change when you use summarise with a grouped data frame. Then,
writing very little code you can get lots of useful results:

``` r
iris %>% select (Species, Petal.Length) %>% group_by(Species) %>% 
  summarise(min.Petal.Length = min(Petal.Length),
            mean.Petal.Length = mean(Petal.Length), 
            max.Petal.Length = max(Petal.Length))
```

    ## `summarise()` ungrouping output (override with `.groups` argument)

    ## # A tibble: 3 x 4
    ##   Species    min.Petal.Length mean.Petal.Length max.Petal.Length
    ##   <fct>                 <dbl>             <dbl>            <dbl>
    ## 1 setosa                  1                1.46              1.9
    ## 2 versicolor              3                4.26              5.1
    ## 3 virginica               4.5              5.55              6.9
