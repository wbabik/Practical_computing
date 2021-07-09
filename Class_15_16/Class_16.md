Transformations of behavioural datasets
================
Joanna Rutkowska
2021 05 18

# Instructions for the class – part 2

### Loading the data

#### 1. Load the data from learning sheet to RStudio and name it **learning\_ZF**.

#### 2. Visually inspect the data.

You will notice that columns which in Excel had the hour:minute or
minute:second format have additional, ridiculous date in front. We will
deal with this problem later.

    ## # A tibble: 6 x 14
    ##   Test_date           CageID BirdID Sex   Colour_filled Colour_empty
    ##   <dttm>              <chr>  <chr>  <chr> <chr>         <chr>       
    ## 1 2020-07-03 00:00:00 B01    G391   M     Burgundy      Blue        
    ## 2 2020-07-03 00:00:00 B01    G389   F     Burgundy      Blue        
    ## 3 2020-07-03 00:00:00 B01    G390   M     Burgundy      Blue        
    ## 4 2020-07-03 00:00:00 B02    G388   F     Green         Burgundy    
    ## 5 2020-07-03 00:00:00 B02    G385   M     Green         Burgundy    
    ## 6 2020-07-03 00:00:00 B02    G387   F     Green         Burgundy    
    ## # ... with 8 more variables: Time_transfer <dttm>, Score_1 <dbl>, Time_1 <dbl>,
    ## #   Side_1 <chr>, Score_2 <dbl>, Time_2 <dbl>, Side_2 <chr>, Note <chr>

------------------------------------------------------------------------

### Adding information on the experimental treatment to the learning dataset

Learning dataset has one row of results of the behavioural observations,
which were carried out blind with respect to the experimental group of a
given individual. The information on experimental group can be retrieved
from the breeding dataset. More specifically, each individual is
characterized by two treatments: variable `Origin` denotes environmental
conditions its parents experienced during breeding while variable
`Rearing` denotes environmental conditions experienced since hatching.

#### 3. Load the breeding dataset again and inspect it.

You will easily see `Origin` and `Rearing` variables, that you need to
add to the **learning\_ZF** data frame. But you also need individual
identifier. In the breeding dataset, it is denoted by variable `ring`.

1.  Add new column to the **breeding** data frame. It should be called
    `BirdID` and should have the same values as variable `ring`.
    Alternatively, rename() the column `ring` into `BirdID`.

2.  From the **breeding** data frame select a subset consisting only of
    three columns: `BirdID`, `Origin` and `Rearing`

3.  Join the above data frame to the **learning\_ZF** data frame

4.  Depending on the method you’ve used, the resulting data frame might
    contain some empty cells, which should be removed based e.g. on
    whether `Test_date` in a given row is not empty.

As a result, you will get data frame with 209 rows and `Origin` and
`Rearing` columns at the end.

    ## # A tibble: 6 x 14
    ##   Test_date           CageID BirdID Sex   Colour_filled Colour_empty
    ##   <dttm>              <chr>  <chr>  <chr> <chr>         <chr>       
    ## 1 2020-07-03 00:00:00 B01    G391   M     Burgundy      Blue        
    ## 2 2020-07-03 00:00:00 B01    G389   F     Burgundy      Blue        
    ## 3 2020-07-03 00:00:00 B01    G390   M     Burgundy      Blue        
    ## 4 2020-07-03 00:00:00 B02    G388   F     Green         Burgundy    
    ## 5 2020-07-03 00:00:00 B02    G385   M     Green         Burgundy    
    ## 6 2020-07-03 00:00:00 B02    G387   F     Green         Burgundy    
    ## # ... with 8 more variables: Time_transfer <dttm>, Score_1 <dbl>, Time_1 <dbl>,
    ## #   Side_1 <chr>, Score_2 <dbl>, Time_2 <dbl>, Side_2 <chr>, Note <chr>

------------------------------------------------------------------------

### Calculation and visualization of number of individuals participating in the learning test

Information on whether a given individual took part in the test can be
retrieved from two variables indicating how long it took to make a
choice. We will consider that a given individual made a choice if at
least one of the variables `Time_1` and `Time_2` contains numerical
value (is different than NA).

#### 4. Create new variable called `Choice` that will have “0” if individual did not make any choices or “1” if it made at least one choice.

If performed correctly, the end-side of the data frame will look like
that: ![](table_w_choice.png)

------------------------------------------------------------------------

#### 5. Visualize number of individuals that made a choice and those that did not, taking into account their `Origin` and `Rearing` experimental conditions.

The graph can be made in several different ways, the one below is an
example using geom\_bar. Suggestion: in the code for figure indicate
that `Choice` is a factor, or character, or has logical value.
![](Class_2_files/figure-gfm/visulaisation%20of%20the%20above-1.png)<!-- -->

------------------------------------------------------------------------

### Calculations on variables in time format

Individual performance in the learning test could be affected by its
motivation that presumably increased with time of food deprivation. For
each individual, the beginning of the test is denoted by variable
`Time_transfer`, which has additional, unnecessary date in front. We
would like to have new variable called `Start_time` which would be
expressed in minutes passed since 7 am.

#### 6. Take the following steps:

1.  change the variable `Time_transfer` using strftime() function into
    format %H:%M:%S. As a result you will get character variable.

2.  change this variable using as.POSIXct() function again into format
    %H:%M:%S. This time a current date will be attached (ignore that).

3.  add new variable called `Lights_on`, in which all rows will be
    filled with 07:00:00.

4.  Change `Lights_on` into time format using as.PSIXct() function.

5.  Make a new column called `Start_time`, which will show the
    difference between `Lights_on` and `Time_transfer`. The value should
    be expressed in minutes or be numeric.

The above steps can be executed separately, or can be joined in one
command using pipe.

------------------------------------------------------------------------

### Visualization of data using scatterplot

#### 7. Create new variable `Score`, which will be the mean of `Score_1` and `Score_2` variables.

Suggestion: use function rowMeans() with na.rm=TRUE argument.

#### 8. Make a scatter plot showing `Score` as a function of `Start_time`, separately for each combination of `Origin` and `Rearing` treatments.

The graph can be made in several different ways, the one below is an
example using geom\_point and geom\_smooth with “lm” method.

![](Class_2_files/figure-gfm/Scatter%20plot%20showing%20outcome%20of%20the%20test%20over%20the%20time%20of%20test%20initiation-1.png)<!-- -->

### Optional homework for students
