# Tools for Open Science: Reproducible Data Analysis and Paper Writing in R
## ICIS 2018 Pre-Conference Workshop

*Time*: 8:30AM - 4:30PM

*Place*: Commonwealth AB (2nd floor)

### Instructors

[Michael C. Frank](https://web.stanford.edu/~mcfrank/), Stanford University

Jessica Kosie U. Oregon

[Elika Bergelson](http://bergelsonlab.com/), Duke

[Melissa Kline](http://melissakline.net), MIT

### Pre-workshop Setup

This workshop will be hands-on throughout! That means you need to install some software: 

* [This link](http://swirlstats.com/students.html) goes to a tutorial program (Swirl) which begins by walking you through the process of downloading R and RStudio. If you have never interacted with a terminal/command line before, you might find it helpful to go through just the first few lessons of the 'Basics of R Programming' series, as well. If you have difficulty getting these installed on your laptop, we'll be on hand right before the workshop for troubleshooting!

* Make an account on the [Open Science Framework](http://osf.io).   

### Schedule (subject to change)

*8:00 - 8:30 - Installation troubleshooting (Melissa)*

8:30 - 8:45 - Getting Started (Mike) 

8:45 - 11:00 - Introducing R and the Tidyverse (Jessica and Mike)

11:00 - 12:00 - Lunch Break (on your own)

12:00 - 1:15 - Reproducible Reports in RMarkdown (Mike)

1:15 - 2:30 - Intro to GGPlot (Elika)
<https://docs.google.com/presentation/d/1nzqs7sKOr4LWIJC6y15PLWA93zrY6jlF3xqA68frQ9A/edit#slide=id.g3a3b804d26_0_12>

2:30 - 2:45 - Mid-afternoon break

2:45 - 4:00 - Sharing and managing data using the Open Science Framework (Melissa)

4:00 - 4:30 - Open Science Panel and Q&A

### How to use this repository

To download a copy of this repository (containing all the files above), click the green button at the top right that says "Clone or Download" and choose "Download Zip" to download a copy to your laptop. We recommend waiting to do this until the workshop itself so you have the most up-to-date versions of everything! 

### Troubleshooting `tidyverse` installs

If `tidyverse` doesn't install, try these things:

+ Check if you have the most recent version of R (at time of writing, 3.5). If not, get it from CRAN (google "R CRAN download"), restart, try again. 
+ See if `tidyverse` is trying to "build from source." If it is, try saying "no" to this question and see if that works. 
+ If that doesn't work and you have to install from source, errors may come from not having the appropriate compiler installed on your system. For a mac, this is XCode, which you will need to install from the app store. 
+ If all else fails, try installing an earlier version of tidyverse, e.g. via the package `devtools`. Try `install.packages("devtools")` then `devtools::install_version("tidyverse", version = "1.0.0", repos = "http://cran.us.r-project.org")`. if that works, you will still find that library("tidyverse") won't work, but you can do the libraries one at a time to get the ones that do, e.g.
library(readr)
library(tidyr)
library(dplyr)

### Troubleshooting `knit` and Rmd

[An overview of R and non-western characters (Cyrillic, Chinese, etc.)](https://www.r-bloggers.com/r-and-foreign-characters/)

If you have non-Latin characters in your path (eg your username), the button that says `knit` won't work for you. Instead, type the following in the console (not in your `.Rmd` document):

`knit("mydocument.Rmd", encoding = "utf-8")`

You may find that you have this trouble in other contexts - things are getting better, but in general (for other programming languages too, not just R) if you see messages saying that a program cannot find a file or that a path doesn't exist, it may be this problem happening again!
