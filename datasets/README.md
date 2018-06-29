There are 3 datasets stored here that we use in the tutorial:

## `mental_abacus_data.csv`

These are data from [Barner et al. (2017), JNC](https://jnc.psychopen.eu/article/view/106), a classroom-randomized controlled trial of an elementary math intervention. The design was a simple pre-post assessment at the beginning and end of the school year. The primary question was whether assignment to group (control vs. mental abacus) produced differences in any of the outcomes (`ravens`:`woodcockTotal`). A secondary question was about the role of grade level and baseline math knowledge in the success of the intervention. 

Variables:
* `subid` - subject identifier
* `class_num` - class number
* `grade`	- school grade
* `group`	- condition: mental abacus vs. control
* `year` - Test year (pre vs. post)
* `ravens` - Raven's progressive matrices (actually a knock-off version)
* `gonogo` - Go/no-go average
* `swm`	- Spatial working memory
* `pvAvg`	- place value average performance
* `arithmeticTotal`	- total arithmetic problems correct
* `arithmeticAverage`	- average arithmetic performance
* `woodcockTotal`- Woodcock Johnson III math concepts

## `pragmatic_scales_data.csv` 

These are data from [Stiller, Goodman, & Frank (2015), LLD](http://langcog.stanford.edu/papers_new/stiller-2015-lld.pdf), a study of preschooler's pragmatic inferencing abilities. The primary question here was whether children were able to make correct pragmatic inferences A) above chance and B) above control condition performance. A secondary question was about developmental change in this ability.

Variables:
* `subid` - subject identifier
* `item` - base object for the inference, e.g. "my HOUSE has flowers"
* `correct` - whether the pragmatic inference was made correctly 
* `age` - age in years
* `condition` - experimental Label (pragmatic inference) or No Label control (puppet has peanut butter in mouth)

## `coart_test`
This is a (very) in-prep dataset in the Bergelson lab (h/t grad student Charlotte Moore), but a useful adult eyetracking dataset to play with for graphing some of your graph wishes.
These are some adult controls for a baby study we're still sorting out about coarticulation effects in word comp.
This is your usual 2 pictures on the screen, one gets named, with different conditions setup
All you need to know is that this is eyetracking data that's been binned into 20ms bins in a preprocessing pipeline

Variables:
* `Nonset`- the onset of the Noun in the carrier phrase eg. 'look at the X', i.e. time 0
* `propt` - is a 1 or a 0 in every 20ms bin for whether child was looking at target or distractor
* `TrialType` - is our condition variable, there are 3 conditions, cross, same, unfam; details irrelevant
 
