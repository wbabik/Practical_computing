
# Class 11

# `dplyr`
  * [dplyr and tidyverse](#dplyr-and-tidyverse)
  * [Six dplyr verbs](#six-dplyr-verbs)
      * [Exercise 1](#exercise-1)
      * [Exercise 2](#exercise-2)
    * [Filtering rows with filter()](#filtering-rows-with-filter)
      * [filter() examples](#filter-examples)
      * [Exercise 3](#exercise-3)
    * [Ordering rows with arrange()](#ordering-rows-with-arrange)
      * [arrange() example](#arrange-example)
      * [Exercise 4](#exercise-4)
    * [Picking, dropping and re-ordering columns with select()](#picking-dropping-and-re-ordering-columns-with-select)
      * [select() examples](#select-examples)
      * [Exercise 5](#exercise-5)
      * [Exercise 6](#exercise-6)
    * [Creating new variables as functions of the existing ones with mutate()](#creating-new-variables-as-functions-of-the-existing-ones-with-mutate)
      * [mutate examples](#mutate-examples)
      * [Exercise 7](#exercise-7)
    * [Grouping cases by variable(s) with group_by()](#grouping-cases-by-variables-with-group_by)
      * [group_by() examples](#group_by-examples)
      * [Exercise 8](#exercise-8)
      * [The pipe operator (%>%)](#the-pipe-operator-)
    * [Summarising with summarise()](#summarising-with-summarise)
  * [Practical dplyr](#practical-dplyr)
    * [Puting the code together.](#puting-the-code-together)
  
***  
  

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

#### Exercise 1

Display structure and summary of `iris` dataset using `str()` and
`summary()`. Answer the following questions:

-   which traits were measured?
-   how many flowers were measured in total?
-   which *Iris* species were studied?
-   what were sample sizes of particular species?

Here’s a schematic view of a flower with the most important structures
labeled:

![flower](flower.png)

------------------------------------------------------------------------

All six functions work similarly:

1.  The first argument is always a data frame.
2.  Subsequent arguments describe what the function is supposed to do
    with the data frame. You can refer to the columns of the data frame
    without using quotation marks.
3.  The result is a data frame.

#### Exercise 2

Load `dplyr` package

------------------------------------------------------------------------

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

-   we used double equal sign (`==`) to specify a comparison
-   the column name was not enclosed in quotation marks, while the value
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
    ## x operacje są możliwe jedynie dla typów liczbowych, logicznych oraz zespolonych
    ## i Input `..1` is `(Species == "versicolor" | "virginica")`.

#### Exercise 3

Select all observations, regardless of species, that have sepal length
smaller than 6 cm or petal length smaller than 5 cm, and sepal width
larger than 4 cm.

Expected result:

    ##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    ## 1          5.7         4.4          1.5         0.4  setosa
    ## 2          5.2         4.1          1.5         0.1  setosa
    ## 3          5.5         4.2          1.4         0.2  setosa

------------------------------------------------------------------------

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

#### Exercise 4

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

------------------------------------------------------------------------

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

#### Exercise 5

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

------------------------------------------------------------------------

#### Exercise 6

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

------------------------------------------------------------------------

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

#### Exercise 7

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

------------------------------------------------------------------------

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

#### Exercise 8

Group `iris` by species, assign the grouped dataset to variable, and use
mutate to add column `Mean.Sepal.Length`, which would contain the mean
value of sepal length. Are all values in this column identical? Why?

------------------------------------------------------------------------

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
data frame is passed by `%>%`!

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

## Practical `dplyr`

In the remaining part of the class we’ll illustrate the practical use of
`dplyr` with a real life example. Our task will be to summarize data on
MHC class I genotypes from many populations of several *Triturus* newt
species. These genes are duplicated (with different number of genes in
different individual) and highly polymorphic, so each individual has
several alleles, and the total number of alleles in a species go into
hundreds.

We will calculate:

-   For each population:
    -   number of analysed individuals (`n_ind`)
    -   total number of MHC alleles (`n_all`)
    -   mean number of MHC alleles per individual (`mean_n_all_ind`)
-   For each species you will calculate the same three summaries and
    additionally also:
    -   number of sampled populations (`n_pop`)

We’ll use the names indicated above as column names of your final result
data frame.

-   **Download data**  
    [Here](https://www.dropbox.com/sh/6s60oyt4snc8fgj/AAAyR9wv3t9hWUah2bq_aNtwa?dl)
    is the folder with the data we will use. Please download the files
    to your computer. All files are encoded in UTF-8. Have a look at the
    content of the files in Notepad++:

    -   `genotypes.txt` - tab-delimited file, 1st row contains column
        names, the remaining rows contain individual IDs and genotypes
        encoded as presence (`1`) or absence (`0`) of each allele.
        Allele names are provided in the 1st row.
    -   `ID_locality_species.txt`- tab-delimited file containing
        individual IDs (as in `genotypes.txt` but more), locality name,
        and species designation. There is also an additional column
        `transctiptome` that we will not use. Note that locality names
        contain characters outside the standard Latin character set.
    -   `localities.txt`- tab-delimited file containing various
        information about localities. We’ll need only a subset of
        localities and a subset of columns.

    Organisation of these data into the three files emphasizes the
    concepts we learned during this course:

    -   genotype file contains only information about individual IDs and
        genotypes.
    -   further information about each individual is contained in
        another file, and can be linked with genotypes when needed using
        the column `ID` which is shared between the files.
    -   another file contains information about localities, which can be
        linked with information about individuals using the shared
        `locality` column.
    -   `ID_locality_species.txt` and `localities.txt` contain more rows
        and columns than needed. This is not a problem, because we will
        extract only the information we need from these files.

-   **Set up new project in RStudio**  
    Within the project folder create new directory named `data`. Copy
    the three previously downloaded files to `data`

-   **Create new R script**  
    Make sure it’s in you project folder (NOT in `data`). In this script
    you’ll save all the commands we’ll use below.

-   **Load `tidyverse`**

``` r
library(tidyverse)
```

We’re loading the entire `tidyverse` collection, because we’ll need some
functions that are in packages other than `dplyr`

-   **Read genotypes**

``` r
gen <- read.table("data/genotypes.txt", header = TRUE, sep = "\t", encoding = "UTF-8")
head(gen[,1:10])
```

    ##      ID i_0003 i_0005 i_0010 i_0008 i_0024 i_0004 i_0007 i_0001 i_0017
    ## 1 13155      0      0      0      0      0      0      0      1      0
    ## 2 13156      0      0      0      0      0      0      0      1      0
    ## 3 13157      0      0      0      0      0      0      0      1      0
    ## 4 13163      0      0      0      0      0      0      0      1      0
    ## 5 13164      0      0      0      0      0      0      0      1      0
    ## 6 13170      0      0      0      0      0      0      0      1      0

We used several options to modify the default behaviour or
`read.table()`:

-   column names to be taken from the 1st row,

-   columns are separated by tabs

-   text is encoded as UTF-8

-   **Check whether any individual IDs are duplicated**

``` r
nrow(gen)
```

    ## [1] 348

``` r
gen %>% select(ID) %>% distinct() %>% nrow()
```

    ## [1] 348

Here we counted the number of rows in the original dataframe and the
dataframe containing only unique IDs

-   **Filter out missing data**  
    The way genotypes were obtained ensures that if information for an
    individual is missing for any allele, it’s actually mising for all.
    So it’s enough to filter out rows that contain `NA` for the first
    allele.

``` r
gen_noNA <- gen %>% filter(!is.na(i_0003))
```

Note that we used a dedicated function `is.na()` to identify `NA`
values.

-   **Read information about each individual’s locality and species**  
    We’ll need only two columns, so we drop `transcriptome` on the way

``` r
ID_info <- read.table("data/ID_locality_species.txt", header = TRUE, sep = "\t", encoding = "UTF-8") %>% 
  select(-transcriptome)
head(ID_info)
```

    ##      ID    locality     species
    ## 1 14465 Mollafeneri  anatolicus
    ## 2 14466 Mollafeneri  anatolicus
    ## 3 14467     Kethüda  anatolicus
    ## 4 14468 Fushë-Krujë macedonicus
    ## 5 14469 Fushë-Krujë macedonicus
    ## 6 14470 Fushë-Krujë macedonicus

-   **Read information about localities**  
    We’ll need just the locality name, country and geographic
    coordinates, so we select only these four columns:

``` r
localities <- read.table("data/localities.txt", header = TRUE, sep = "\t", encoding = "UTF-8") %>% 
  select(locality, country, latitude, longitude)
head(localities)
```

    ##        locality  country latitude longitude
    ## 1   Abanta Gölu   Turkey   40.612    31.288
    ## 2     Adapazari   Turkey   40.799    30.440
    ## 3 Aghios Kosmas   Greece   41.084    24.671
    ## 4         Alepu Bulgaria   42.348    27.714
    ## 5   Alexandrovo Bulgaria   42.602    25.099
    ## 6   Alibahadir2   Turkey   41.187    29.205

-   **Reshape the genotype data into the “long” format**  
    In this step we will radically reshape our data, which will simplify
    further tasks. Instead of having each allele as a separate column,
    we’ll collapse these columns into two: i) allele name, ii)
    information about presence (`1`) or absence (`0`) in a given
    individual.  
    So, we take our data frame that looks like this:

``` r
head(gen[,1:20], n = 20)
```

    ##       ID i_0003 i_0005 i_0010 i_0008 i_0024 i_0004 i_0007 i_0001 i_0017 i_0012
    ## 1  13155      0      0      0      0      0      0      0      1      0      0
    ## 2  13156      0      0      0      0      0      0      0      1      0      0
    ## 3  13157      0      0      0      0      0      0      0      1      0      0
    ## 4  13163      0      0      0      0      0      0      0      1      0      0
    ## 5  13164      0      0      0      0      0      0      0      1      0      0
    ## 6  13170      0      0      0      0      0      0      0      1      0      0
    ## 7  13171      0      0      0      0      0      0      0      1      0      1
    ## 8  13174      0      0      0      0      0      0      0      1      0      0
    ## 9  13175      0      0      0      0      0      0      0      1      0      1
    ## 10 13178      0      0      0      0      0      0      0      1      0      0
    ## 11 14465      0      1      1      0      0      0      1      1      1      0
    ## 12 14466      0      0      0      0      0      0      1      0      1      0
    ## 13 14467      0      0      0      0      0      0      1      0      1      0
    ## 14 14468      0      0      0      1      0      0      0      1      0      0
    ## 15 14469      0      0      0      1      0      0      0      1      0      0
    ## 16 14470      0      0      0      1      0      0      0      1      0      0
    ## 17 14471      0      0      0      1      0      0      1      0      0      1
    ## 18 14472      0      0      0      1      0      0      0      1      0      1
    ## 19 14473      0      0      0      1      0      0      1      0      0      1
    ## 20 14474      0      1      1      0      1      0      0      1      0      1
    ##    i_0045 i_0025 i_0036 i_0013 i_0018 i_0033 i_0023 i_0002 i_0048
    ## 1       0      0      0      0      0      0      0      0      0
    ## 2       0      0      0      0      0      0      0      0      0
    ## 3       0      0      0      0      0      0      0      0      0
    ## 4       0      0      0      0      0      0      0      0      0
    ## 5       0      0      0      0      0      0      0      0      0
    ## 6       0      0      0      0      0      0      0      0      0
    ## 7       0      0      0      0      0      0      0      0      0
    ## 8       0      0      0      0      0      0      0      0      0
    ## 9       0      0      0      0      0      0      0      0      0
    ## 10      0      0      0      0      0      0      0      0      0
    ## 11      0      1      0      1      0      1      0      1      0
    ## 12      0      1      0      0      0      1      0      0      0
    ## 13      0      1      0      1      0      0      0      0      0
    ## 14      0      0      0      0      0      0      0      0      0
    ## 15      0      0      0      0      0      0      0      0      0
    ## 16      0      0      0      0      0      0      0      0      0
    ## 17      0      0      0      0      0      0      1      1      1
    ## 18      0      0      0      0      0      0      0      1      0
    ## 19      0      0      0      0      0      0      1      0      1
    ## 20      0      0      1      0      1      0      0      1      0

And reshape it using the following command:

``` r
gen_long <- gen_noNA %>% pivot_longer(-ID, names_to = "allele", values_to = "present_absent")
head(gen_long, n = 20)
```

    ## # A tibble: 20 x 3
    ##       ID allele present_absent
    ##    <int> <chr>           <int>
    ##  1 13155 i_0003              0
    ##  2 13155 i_0005              0
    ##  3 13155 i_0010              0
    ##  4 13155 i_0008              0
    ##  5 13155 i_0024              0
    ##  6 13155 i_0004              0
    ##  7 13155 i_0007              0
    ##  8 13155 i_0001              1
    ##  9 13155 i_0017              0
    ## 10 13155 i_0012              0
    ## 11 13155 i_0045              0
    ## 12 13155 i_0025              0
    ## 13 13155 i_0036              0
    ## 14 13155 i_0013              0
    ## 15 13155 i_0018              0
    ## 16 13155 i_0033              0
    ## 17 13155 i_0023              0
    ## 18 13155 i_0002              0
    ## 19 13155 i_0048              0
    ## 20 13155 i_0027              1

We called `pivot_longer()`, informing the function that we want to
reshape all the columns except `ID`, that names of the columns should go
the new `allele` column, and that values from these columns should go to
the `present_absent` column. Let’s compare the number of rows in the
original and reshaped data frame:

``` r
nrow(gen_noNA)
```

    ## [1] 344

``` r
nrow(gen_long)
```

    ## [1] 379432

In the long format, the information that an individual doesn’t have a
particular allele is not really useful, so we can just get rid of the
rows with (`0`) in `present_absent`. Then, `present_absent` column would
not be informative anymore, so we can drop it:

``` r
gen_long <- gen_long %>% filter(present_absent == 1) %>% select(-present_absent)
nrow(gen_long)
```

    ## [1] 6779

It’s much shorter now!

-   **Add information about populations and species to the genotype
    table**  
    We start be adding information about locality and species:

``` r
gen_long <- gen_long %>% left_join(ID_info, by = "ID")
head(gen_long, n = 15)
```

    ## # A tibble: 15 x 4
    ##       ID allele locality species   
    ##    <int> <chr>  <chr>    <chr>     
    ##  1 13155 i_0001 Ecka     dobrogicus
    ##  2 13155 i_0027 Ecka     dobrogicus
    ##  3 13155 i_0021 Ecka     dobrogicus
    ##  4 13155 i_0039 Ecka     dobrogicus
    ##  5 13155 i_0099 Ecka     dobrogicus
    ##  6 13155 i_0046 Ecka     dobrogicus
    ##  7 13155 i_0147 Ecka     dobrogicus
    ##  8 13155 i_0053 Ecka     dobrogicus
    ##  9 13155 i_0100 Ecka     dobrogicus
    ## 10 13155 i_0095 Ecka     dobrogicus
    ## 11 13155 i_0149 Ecka     dobrogicus
    ## 12 13155 i_0115 Ecka     dobrogicus
    ## 13 13155 i_0151 Ecka     dobrogicus
    ## 14 13155 i_0076 Ecka     dobrogicus
    ## 15 13155 i_0152 Ecka     dobrogicus

Here we used `left_join()` to add columns from `ID_info` data frame to
`gen_long` data frame. Left join means that in the resulting data frame
all rows from the left (i.e., `gen_long`) data frame will be retained,
and only these rows from `ID_info` data frame will be added, which match
a value of `ID` column in any row of `gen_long` data frame. If multiple
rows from `ID_info` match a single row of `gene_long`, the resulting
data frame will have more rows than `gen_long`.

And now we’ll add information about localities:

``` r
gen_long <- gen_long %>% left_join(localities, by = "locality")
head(gen_long, n = 15)
```

    ## # A tibble: 15 x 7
    ##       ID allele locality species    country latitude longitude
    ##    <int> <chr>  <chr>    <chr>      <chr>      <dbl>     <dbl>
    ##  1 13155 i_0001 Ecka     dobrogicus Serbia      45.3      20.4
    ##  2 13155 i_0027 Ecka     dobrogicus Serbia      45.3      20.4
    ##  3 13155 i_0021 Ecka     dobrogicus Serbia      45.3      20.4
    ##  4 13155 i_0039 Ecka     dobrogicus Serbia      45.3      20.4
    ##  5 13155 i_0099 Ecka     dobrogicus Serbia      45.3      20.4
    ##  6 13155 i_0046 Ecka     dobrogicus Serbia      45.3      20.4
    ##  7 13155 i_0147 Ecka     dobrogicus Serbia      45.3      20.4
    ##  8 13155 i_0053 Ecka     dobrogicus Serbia      45.3      20.4
    ##  9 13155 i_0100 Ecka     dobrogicus Serbia      45.3      20.4
    ## 10 13155 i_0095 Ecka     dobrogicus Serbia      45.3      20.4
    ## 11 13155 i_0149 Ecka     dobrogicus Serbia      45.3      20.4
    ## 12 13155 i_0115 Ecka     dobrogicus Serbia      45.3      20.4
    ## 13 13155 i_0151 Ecka     dobrogicus Serbia      45.3      20.4
    ## 14 13155 i_0076 Ecka     dobrogicus Serbia      45.3      20.4
    ## 15 13155 i_0152 Ecka     dobrogicus Serbia      45.3      20.4

-   **Calculate summaries we want**  
    First, we calculate for each population:
    -   sample size
    -   the number of distinct alleles
    -   mean number of alleles per individual

``` r
pop_sum <- gen_long %>% group_by(locality, species) %>% summarise(n_ind = n_distinct(ID),
                                                                  n_all = n_distinct(allele),
                                                                  mean_n_all_ind = n()/n_ind)
head(pop_sum)
```

    ## # A tibble: 6 x 5
    ## # Groups:   locality [6]
    ##   locality      species      n_ind n_all mean_n_all_ind
    ##   <chr>         <chr>        <int> <int>          <dbl>
    ## 1 Abanta Gölu   anatolicus       2    29           18  
    ## 2 Adapazari     anatolicus       3    36           19.3
    ## 3 Aghios Kosmas ivanbureschi     2    19           16  
    ## 4 Alepu         ivanbureschi     3    32           24  
    ## 5 Alexandrovo   ivanbureschi     2    22           17.5
    ## 6 Alibahadir2   anatolicus       2    32           20.5

`n_distinct()` calculates the number of different values in a data frame
column **within each group**, as defined in `group_by()`  
`n()` counts the number of rows in each group.  
Please stop here to make sure that you understand what and how was
calculated here.

In principle, it’s posible that more than one species occurs in a
locality, let’s check it!

``` r
nrow(pop_sum)
```

    ## [1] 121

``` r
pop_sum %>% distinct(locality) %>% nrow()
```

    ## [1] 121

Then, we calculate the same statistics, but with data grouped by
species:

``` r
spec_sum <- gen_long %>% group_by(species) %>% summarise(n_ind = n_distinct(ID),
                                                         n_all = n_distinct(allele),
                                                         mean_n_all_ind = n()/n_distinct(allele),
                                                         n_pop = n_distinct(locality))
head(spec_sum)
```

    ## # A tibble: 5 x 5
    ##   species      n_ind n_all mean_n_all_ind n_pop
    ##   <chr>        <int> <int>          <dbl> <int>
    ## 1 anatolicus      54   306           3.38    19
    ## 2 cristatus       57   306           3.89    18
    ## 3 dobrogicus      10   108           2.26     2
    ## 4 ivanbureschi   111   316           6.43    41
    ## 5 macedonicus    112   261           8.72    41

We’re done now! But, perhaps, you’d like to have a single table with all
your summaries, so that the species summary is below the list of
populations of each species for the ease of inspection.

-   **Combine the two result data frames into one**

``` r
sum_sum <- pop_sum %>% bind_rows(spec_sum) 
sum_sum
```

    ## # A tibble: 126 x 6
    ## # Groups:   locality [122]
    ##    locality      species      n_ind n_all mean_n_all_ind n_pop
    ##    <chr>         <chr>        <int> <int>          <dbl> <int>
    ##  1 Abanta Gölu   anatolicus       2    29           18      NA
    ##  2 Adapazari     anatolicus       3    36           19.3    NA
    ##  3 Aghios Kosmas ivanbureschi     2    19           16      NA
    ##  4 Alepu         ivanbureschi     3    32           24      NA
    ##  5 Alexandrovo   ivanbureschi     2    22           17.5    NA
    ##  6 Alibahadir2   anatolicus       2    32           20.5    NA
    ##  7 Alistrati     ivanbureschi     2    29           18      NA
    ##  8 Ano Kalliniki macedonicus      2    17           16      NA
    ##  9 Aranđelovac   ivanbureschi     3    25           15      NA
    ## 10 Avdancik      anatolicus       3    37           20.3    NA
    ## # ... with 116 more rows

`bind_rows()` added rows from `spec_sum` to the end of `pop_sum`.
Because the data frames differed in the number of columns, i.e., `n_pop`
was missing from `pop_sum` and `locality` was missing from `spec_sum`,
the columns from both data frames were combined and filled with `NA`
where needed.  
Have a look at the entire data frame in RStudio viewer (`View()`).

Now, we’ll make use of the fact that `NA` values are put at the end of a
column sorted with `arrange()`, to place summary for each species under
the summaries of its populations:

``` r
sum_sum <- sum_sum %>% arrange(species, locality)
sum_sum
```

    ## # A tibble: 126 x 6
    ## # Groups:   locality [122]
    ##    locality    species    n_ind n_all mean_n_all_ind n_pop
    ##    <chr>       <chr>      <int> <int>          <dbl> <int>
    ##  1 Abanta Gölu anatolicus     2    29           18      NA
    ##  2 Adapazari   anatolicus     3    36           19.3    NA
    ##  3 Alibahadir2 anatolicus     2    32           20.5    NA
    ##  4 Avdancik    anatolicus     3    37           20.3    NA
    ##  5 Çakirli     anatolicus     3    33           18      NA
    ##  6 Çibanköy    anatolicus     3    28           16.7    NA
    ##  7 Gölköy      anatolicus     3    25           17      NA
    ##  8 Gürbulak    anatolicus     2    24           17      NA
    ##  9 Hanköy      anatolicus     3    40           19.7    NA
    ## 10 Karakoç     anatolicus     3    42           22.3    NA
    ## # ... with 116 more rows

And finally, we’d like to replace `NA` in the `Locality` column with the
word “Overall”

``` r
sum_sum <- sum_sum %>% 
  mutate(locality = ifelse(is.na(locality), "Overall", locality))
sum_sum
```

    ## # A tibble: 126 x 6
    ## # Groups:   locality [122]
    ##    locality    species    n_ind n_all mean_n_all_ind n_pop
    ##    <chr>       <chr>      <int> <int>          <dbl> <int>
    ##  1 Abanta Gölu anatolicus     2    29           18      NA
    ##  2 Adapazari   anatolicus     3    36           19.3    NA
    ##  3 Alibahadir2 anatolicus     2    32           20.5    NA
    ##  4 Avdancik    anatolicus     3    37           20.3    NA
    ##  5 Çakirli     anatolicus     3    33           18      NA
    ##  6 Çibanköy    anatolicus     3    28           16.7    NA
    ##  7 Gölköy      anatolicus     3    25           17      NA
    ##  8 Gürbulak    anatolicus     2    24           17      NA
    ##  9 Hanköy      anatolicus     3    40           19.7    NA
    ## 10 Karakoç     anatolicus     3    42           22.3    NA
    ## # ... with 116 more rows

`ifelse()` is a function that operates on each row of the data frame, so
its useful together with mutate. If the logical condition is met, i.e.,
if there is `NA` in the `loaclity` column of a given row, the value of
the new column `locality` in this row will be `"Overall"`, otherwise,
the value will just be taken from the eisting `locality` column.

-   **Save the resulting table into a text file**  
    We want tab-delimited text file without enclosing any values in
    quotes

``` r
write.table(sum_sum, "MHC_summary.txt", quote = FALSE, sep = "\t")
```

The same can be done by using `dplyr` function `write_tsv()` called with
default options:

``` r
write_tsv(sum_sum, "MHC_summary.txt")
```

### Puting the code together.

Let’s see now how much code was actually needed to accomplish our task.
Below is the code streamlined a little bit by a more extensive use of
`%>` and skipping commands that print intermediate results. Copy this
code to your script and write comments (comment lines start with `#`)
explaining what particular commands do.

``` r
library(tidyverse)

gen <- read.table("data/genotypes.txt", header = TRUE, sep = "\t", encoding = "UTF-8")

nrow(gen)
gen %>% select(ID) %>% distinct() %>% nrow()

gen_noNA <- gen %>% filter(!is.na(i_0003))

ID_info <- read.table("data/ID_locality_species.txt", header = TRUE, sep = "\t", encoding = "UTF-8") %>% select(-transcriptome)

localities <- read.table("data/localities.txt", header = TRUE, sep = "\t", encoding = "UTF-8") %>% 
  select(locality, country, latitude, longitude)

gen_long <- gen_noNA %>% pivot_longer(-ID, names_to = "allele", values_to = "present_absent") %>% 
  filter(present_absent == 1) %>% select(-present_absent)

gen_long <- gen_long %>% left_join(ID_info, by = "ID") %>% 
  left_join(localities, by = "locality")

pop_sum <- gen_long %>% group_by(locality, species) %>% summarise(n_ind = n_distinct(ID),
                                                                  n_all = n_distinct(allele),
                                                                  mean_n_all_ind = n()/n_ind)
                                                
spec_sum <- gen_long %>% group_by(species) %>% summarise(n_ind = n_distinct(ID),
                                                         n_all = n_distinct(allele),
                                                         mean_n_all_ind = n()/n_distinct(allele),
                                                         n_pop = n_distinct(locality))

sum_sum <- pop_sum %>% bind_rows(spec_sum) %>% arrange(species, locality) %>% 
  mutate(locality = ifelse(is.na(locality), "Overall", locality))

write_tsv(sum_sum, "MHC_summary.txt")
```
