
# Class 9

# Subsetting, working with data frames and `dplyr` verbs

## Subsetting

Data frame can be subsetted with the use of coordinates (indexes)
enclosed within the square brackets. In case of data frames there are
always 2 coordinates: `[row_number,column_number]`.  
Note that vectors have only a single coordinate, the position, so they
are one-dimensional objects. Data frames have two dimensions: rows and
columns.

#### Exercise 1

Return the value from 49<sup>th</sup> row and 4<sup>th</sup> column of
`my_data` from Class 8 (use your script/history to get this variable)

Expected result:

    [1] 1000

------------------------------------------------------------------------

You can call multiple values at the same time. To define a range of
coordinates, use colon to separate range limits:
`[row_number_1:row_number_2, column_number]`.

#### Exercise 2

Return first 5 rows of the last 3 columns of `my_data`. To check the
number of rows and columns use `str()`, which will give you also extra
info about the data frame or `dim()` which will return just the number
of rows and columns

Expected result:

       Treatment conc uptake
    1 nonchilled   95   16.0
    2 nonchilled  175   30.4
    3 nonchilled  250   34.8
    4 nonchilled  350   37.2
    5 nonchilled  500   35.3

------------------------------------------------------------------------

If you want to call for all rows or columns it is enough to put nothing
instead of the respective coordinate, e. g. `[,column_number]`

#### Exercise 3

Now, save the 5<sup>th</sup> column of `my_data` as a variable called
`my_column_5`. Call call the variable, so its content is displayed in
your console.

Expected result:

     [1] 16.0 30.4 34.8 37.2 35.3 39.2 39.7 13.6 27.3 37.1 41.8 40.6 41.4 44.3 16.2
    [16] 32.4 40.3 42.1 42.9 43.9 45.5 14.2 24.1 30.3 34.6 32.5 35.4 38.7  9.3 27.3
    [31] 35.0 38.8 38.6 37.5 42.4 15.1 21.0 38.1 34.0 38.9 39.6 41.4 10.6 19.2 26.2
    [46] 30.0 30.9 32.4 35.5 12.0 22.0 30.6 31.8 32.4 31.1 31.5 11.3 19.4 25.8 27.9
    [61] 28.5 28.1 27.8 10.5 14.9 18.1 18.9 19.5 22.2 21.9  7.7 11.4 12.3 13.0 12.5
    [76] 13.7 14.4 10.6 18.0 17.9 17.9 17.9 18.9 19.9

------------------------------------------------------------------------

Note that the result is no longer a table. As we asked for just one
column, a series of numbers (vector) was returned. Let’s recall vector
subsetting.

#### Exercise 4

Return 3<sup>rd</sup>, 4<sup>th</sup> and 5<sup>th</sup> value from
`my_column_5`.

Expected result:

    [1] 34.8 37.2 35.3

------------------------------------------------------------------------

> #### Important
>
> Pulling one row from the data frame will not result in a vector. It’s
> because a row can contain elements of different types, which is not
> allowed for vectors.

Table can be also subsetted with the use of column (or row, if they
exist) names.

#### Exercise 5

Return the same column as in Ex. 4, but use column name instead of its
number. Don’t forget about quotation marks.

Another way of obtain an entire column is to use dollar sign between
data frame and column names `dataframe_name$column_name`. Such
expression is automatically treated as a vector, so it can be directly
subsetted to get a particular row:
`dataframe_name$column_name[row_number]`.

#### Exercise 6

Return values of rows 15<sup>th</sup> to 30<sup>th</sup> of `conc`
column from `my_data`. Use `$` sign.

Expected result:

     [1]   95  175  250  350  500  675 1000   95  175  250  350  500  675 1000   95
    [16]  175

------------------------------------------------------------------------

If desired rows (or columns) do not follow each other and the range
option cannot be used, vector of coordinates should be provided.

#### Exercise 7

Create a vector of integers with values 3, 5, 7, 9 and 12 and save it to
a variable. Call it.

Expected result:

    [1]  3  5  7  9 12

------------------------------------------------------------------------

#### Exercise 8

Return rows of `my_data` `uptake` column corresponding to the numbers in
the vector created in the previous exercise.

Expected result:

    [1] 34.8 35.3 39.7 27.3 40.6

------------------------------------------------------------------------

You can also select everything except specified columns (or rows), i.
e., drop rows or columns. To do this, put minus (-) before an index or
vector of indexes.

#### Exercise 9

Return all columns of `my_data` except 5<sup>th</sup>.

First 10 output lines are shown below:

       Plant   Type  Treatment conc
    1    Qn1 Quebec nonchilled   95
    2    Qn1 Quebec nonchilled  175
    3    Qn1 Quebec nonchilled  250
    4    Qn1 Quebec nonchilled  350
    5    Qn1 Quebec nonchilled  500
    6    Qn1 Quebec nonchilled  675
    7    Qn1 Quebec nonchilled 1000
    8    Qn2 Quebec nonchilled   95
    9    Qn2 Quebec nonchilled  175
    10   Qn2 Quebec nonchilled  250

------------------------------------------------------------------------

## Simple operations on data frames

### Replacement

Assign a particular value to a specific position in your your data frame
with the use of the assignment arrow `<-`. It works just as with
variable assignment: `data_frame[row_number,column_number] <- new_value`

#### Exercise 10

Replace 5<sup>th</sup> value in the column `Type` of `my_data` with the
label ‘Unknown’. Check whether this was indeed replaced.

------------------------------------------------------------------------

### Mathematical operations

You can use classical mathematical operators: `+`, `-`, `*` and `/`.
Remember, however, that mathematical operations make sense only for
`numeric` data types.

#### Exercise 11

The `conc` column gives CO2 concentration in ul/L, recalculate
concentration to ml/L and modify the column. Display the modified
column.

Expected result:

     [1] 0.095 0.175 0.250 0.350 0.500 0.675 1.000 0.095 0.175 0.250 0.350 0.500
    [13] 0.675 1.000 0.095 0.175 0.250 0.350 0.500 0.675 1.000 0.095 0.175 0.250
    [25] 0.350 0.500 0.675 1.000 0.095 0.175 0.250 0.350 0.500 0.675 1.000 0.095
    [37] 0.175 0.250 0.350 0.500 0.675 1.000 0.095 0.175 0.250 0.350 0.500 0.675
    [49] 1.000 0.095 0.175 0.250 0.350 0.500 0.675 1.000 0.095 0.175 0.250 0.350
    [61] 0.500 0.675 1.000 0.095 0.175 0.250 0.350 0.500 0.675 1.000 0.095 0.175
    [73] 0.250 0.350 0.500 0.675 1.000 0.095 0.175 0.250 0.350 0.500 0.675 1.000

------------------------------------------------------------------------

Also, you can use simple summary functions from the previous class (see
Class 8).

#### Exercise 12

Calculate the mean value of the `uptake` column.

Expected result:

    [1] 27.2131

------------------------------------------------------------------------

### Simple summaries

-   `nrow()` - number of rows
-   `ncol()` - number of columns
-   `summary()` - descriptive statistics for each column

#### Exercise 13

Return the total number of cells within in `my_data`.

Expected result:

    [1] 420

#### Exercise 14

Display summary of `my_data`. Note the the type of summary depends on
the type of data in a column.

Expected result:

         Plant             Type         Treatment       conc           uptake     
     Qn1    : 7   Quebec     :42   nonchilled:42   Min.   :0.095   Min.   : 7.70  
     Qn2    : 7   Mississippi:42   chilled   :42   1st Qu.:0.175   1st Qu.:17.90  
     Qn3    : 7                                    Median :0.350   Median :28.30  
     Qc1    : 7                                    Mean   :0.435   Mean   :27.21  
     Qc3    : 7                                    3rd Qu.:0.675   3rd Qu.:37.12  
     Qc2    : 7                                    Max.   :1.000   Max.   :45.50  
     (Other):42                                                                   

### Deleting rows containing missing data

Missing data, as explained in the previous class, are represented as
`NA` (Not Available) in R. Many functions will raise an error every time
it encounters `NA` as their arguments or their parts. Many functions, on
the other hand, allow you to automatically discard `NA`. The default
behaviour of not ignoring `NA` is by design, as `NA` actually carry
important information about your data.

#### Exercise 15

Choose one cell of `my_data` and replace its value with `NA`. Do not add
quotation marks as `NA` is an internal R symbol (just as *π*). Print the
entire row.

------------------------------------------------------------------------

Rows with missing data can be removed with `na.omit()` function. To save
changes, the result of `na.omit()` function must be assigned to
variable. **In practice, as explained above, deleting missing data must
be well justified**.

#### Exercise 16

Remove the row with missing data created in the previous exercise.
Replace `my_data` with such modified table. Remember that this action
cannot be undone.

### Adding new column or row

Adding **new column** is relatively **simple**. All you need to have is
a vector. However, remember three things:

-   length of vector must equal the number of rows of a data frame
-   order of values within a vector corresponds to the row numbers
-   name of the vector will become the name of the added column

We are going to add a column with IDs of observations. Note that column
with IDs is often necessary in statistical analysis. It is also inherent
to the data in [long
format](https://www.theanalysisfactor.com/wide-and-long-data/) which is
strongly advised (see class 1 and next class).

#### Exercise 17

Create a vector with ID numbers starting from 100. Use one of functions
introduced above to determine what should be the length of the vector.
Name the vector `ID`.

Expected result:

     [1] 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118
    [20] 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137
    [39] 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156
    [58] 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175
    [77] 176 177 178 179 180 181 182

------------------------------------------------------------------------

You can combine data frames with the use of `cbind()` function in the
following manner: `cbind(data_frame1, data_frame2)`. Note that a vector
can be considered a data frame with a single column.

#### Exercise 18

Place created IDs at the beginning (as first column) of `my_dat`.
Overwrite `my_data` variable.

------------------------------------------------------------------------

Adding **new row** is more **complicated** as you cannot create a vector
with different types of data. Firstly you need to create a new data
frame (similar to the old one) consisting of only new row (or rows). To
do this use `data.frame()` function in the following manner:
`data.frame(columnName1 = value1, columnName2 = value2,...)`.

#### Exercise 19

Create data frame with a single row and the following values:
`1,'Kr1','Krakow',unknown',1000,20`. Column names should correspond to
these of `my_data`. Name the newly created data frame `Added_rows`.

Expected result:

      ID Plant   Type Treatment conc uptake
    1  1   Kr1 Krakow   unknown 1000     20

------------------------------------------------------------------------

To create a data frame with multiple rows, replace the value for each
column with a vector.

To combine data frames by rows use `rbind()` function in the following
manner: `rbind(data_frame1, data_frame2)`

#### Exercise 20

Add the row created in Ex. 19 at the end of `my_data`. Overwrite
`my_data` variable.

------------------------------------------------------------------------

### Saving data frame

To save your data frame into a text file use `write.table()` function.

#### Exercise 21

Save the modified `my_data` int a `.csv` file. Consult `write.table()`
manual to set the arguments. Include your surname in the file name.

------------------------------------------------------------------------

## Logical expressions and subsetting with logical vectors

## `dplyr` and `tidyverse`

### Selecting variables with `select()`

### Filtering rows with `filter()`

### Sorting with `arrange()`

### Creating new variables with `mutate()`
