There are two datasets here:

## `mental_abacus_data.csv`

These are data from [Barner et al. (2017), JNC](https://jnc.psychopen.eu/article/view/106), a classroom-randomized controlled trial of an elementary math intervention.

Variables:
* subid - subject identifier
* class_num - class number
* grade	- school grade
* group	- condition: mental abacus vs. control
* year - Test year (pre vs. post)
* ravens - Raven's progressive matrices (actually a knock-off version)
* gonogo - Go/no-go average
* swm	- Spatial working memory
* pvAvg	- place value average performance
* arithmeticTotal	- total arithmetic problems correct
* arithmeticAverage	- average arithmetic performance
* woodcockTotal

## `pragmatic_scales_data.csv` 

These are data from [Stiller, Goodman, & Frank (2015), LLD](http://langcog.stanford.edu/papers_new/stiller-2015-lld.pdf), a study of preschooler's pragmatic inferencing abilities. 

Variables:
* subid - subject identifier
* item - base object for the inference, e.g. "my HOUSE has flowers"
* correct - whether the pragmatic inference was made correctly 
* age - age in years
* condition - experimental Label (pragmatic inference) or No Label control (puppet has peanut butter in mouth)
