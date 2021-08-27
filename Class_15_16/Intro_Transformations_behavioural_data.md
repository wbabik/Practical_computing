Introduction to behavioral dataset
================
Joanna Rutkowska
21 05 2021

### The effects of short- and long-term changes in ambient temperature on learning performance in a model songbird

#### ChuChu Lu, Maëlle Lefeuvre, Joanna Rutkowska

#### Institute of Environmental Sciences, Jagiellonian University, Kraków, Poland

------------------------------------------------------------------------

The aim of the project is to study the effects of temperature
fluctuations on learning efficiency and potential for its modulation at
early life stages in a model bird species, the zebra finch. The
experimental treatment applied in the study was manipulation of ambient
temperature, that was either STABLE (21°C) or VARIABLE (randomly
changing everyday between in the rage of 11-31°C). Initially, breeding
pairs were assigned to one of the two conditions, and this is indicated
by the variable `Origin`. After hatching, half of the offspring in each
clutch was cross-fostered to the pair breeding in the other condition,
while half reminded in the original nest. Conditions or rearing are
indicated by the variable `Rearing`.

## Read before the first class

In the first part of the class, we will check how did breeding went on
in the two experimental conditions experienced by the pairs. To do so,
we will summarize the information regarding breeding performance of the
pairs, which is gathered in the breeding data sheet. The key variables
of interest are: `Origin`, `box`, `startd`, `eggno`, `ldate`, `eggw`,
`ring`.

Load the data from [here:](https://www.dropbox.com/s/vhnigrp94tgys3o/2020-09-30-Learning-finches-database.xlsx?dl=0)

Read metadata sheet to find out more what those variables are. Look at
the **breeding** data sheet and note the following information:

1.  There are two levels of `Origin` (STABLE and VARIABLE).

2.  In each `Origin`, there are several breeding pairs, indicated by
    unique identifier `box`. A given box is only in one `Origin`.

3.  Some information for a given `box` is repeated several times,
    e.g. `startd`, which indicates date of pairing the birds.

4.  Some information for a given `box` appears only once, e.g. variable
    `eggno` has natural numbers reflecting egg position in the laying
    sequence, always starting from 1.

5.  Some information, e.g. `eggw` and is specific for a given egg laid
    in a given `box`.

6.  Some information is missing, e.g. if a given pair did not produce
    any eggs, there is no `ldate`.

------------------------------------------------------------------------

## Read before the second class

In the first part of the class, we found that breeding outcome of pairs
in STABLE and VARIABLE conditions was quite similar. In the second part
of the class, we will focus on the offspring of those pairs and work
with data on the learning test carried out when the birds were 55-65
days old. For two weeks prior to testing the birds were learning which
of the two color feeders is rewarded with seeds, and which one is always
empty. In the test itself, each bird had two trials during which it had
a chance to select one of the color feeders. To enhance motivation of
choosing a feeder, the birds were deprived of food since the morning,
until the time of testing. Data gathered in during testing is in the
learning data sheet. The key variable of interest are: `BirdID`,
`Time_transfer`, `Score_1`, `Time_1`, `Score_2`, `Time_2`.

Read metadata sheet to find out more what those variables are. Look at
the **learning** data sheet and note the following information:

1.  In this data set, there is no information about the experimental
    conditions of the birds. This is because at the time of testing, we
    carried it out blind with respect to the experimental condition.

2.  Each individual is identified by variable `BirdID`, and it has one
    row of data.

3.  Each individual has its own value of `Time_transfer`, which
    indicates the time at which its test started. The later it started,
    the longer a given bird was deprived of food, which presumably
    increased its motivation for eating.

4.  Variables `Score_1` and `Score_2` indicate the outcomes of two
    trials, carried out one after the other, after flipping the sides of
    colour feeders.

5.  Variables `Time_1` and `Time_2` indicate how long it took a bird in
    each of the two trials to make a choice of a feeder.

6.  Lack of value in a given Time column means that the choice was not
    made within 10 minutes.

When visualizing results of the learning test, we will simultaneously
take into account experimental conditions experience by the bird before
hatching (`Origin`) and during rearing period (`Rearing`), which will
have to be retrieved from the **breeding** dataset.
