#Intro to ggplot, ICIS Workshop 2018
#Elika Bergelson

# if you haven't already, install these packages (you don't have to do this every time)
# so if you need to, uncomment the line below and run it.
#install.packages(c("tidyverse","knitr", "Hmisc"))


#then you load them with the "library" command
#confusingly, when you load the tidyverse library, some of its sub-libraries
# automatically load, and others need to be separately loaded (e.g. broom)
library(tidyverse)
library(knitr)
library(broom)
library(Hmisc)
# some useful settings (options) ------------------------------------
options(tibble.width = 300,
        dplyr.width = 300)
# these make datasets easier to see when they get displayed on screen
# later, you can mess with them and see what they do if you want.

# reminder: how to get help from R --------------------------------------------
# put a question mark in front of a function or built-in/loaded dataset, and help will appear!
?mean
?diamonds
#(mean is a function, diamonds is a dataset)
# you can get in-line help by pressing tab as you go: R will autocomplete what you're typing
# within the function it will give you hints about the arguments the function takes
#try it out by typing 'mean(' (without quotes) in the console below and then hitting tab


# Reading in data! --------------------------------------------------------
#you probably already read in the data in the intro script, but if you're just jumping in 
ma_data <- read_csv("datasets/mental_abacus_data.csv")
ps_data <- read_csv("datasets/pragmatic_scales_data.csv")
#remember, you can use summary, glimpse, and View to remind yourself what these
# data files look like (always good to be very careful with that!)
summary(ma_data)
View(ps_data)
glimpse(ma_data)

#let's just make 2 simple aggregated version of this dataset, by subj & items
#review of tidyr
ps_data_bysubj_cond <- ps_data %>% #take your dataset
  group_by(subid, condition) %>% #retain subject and condition, collapse everything else, i.e. item 
  summarise(mean_corr = mean(correct, na.rm=T),#create mean for each subj,cond
            sum_corr = sum(correct, na.rm=T))# create sum for each subj,cond

ps_data_byitem_cond <- ps_data %>% #take your dataset
  group_by(item, condition) %>% #retain subject and item, collapse everything else, i.e. subj 
  summarise(mean_corr = mean(correct, na.rm=T),#create mean for each item,cond
            sum_corr = sum(correct, na.rm=T))# create sum for each item,cond

#protip: commenting what every single line does is great practice when you're stuck!

# on to graphing! first scatterplots ---------------------------------------------------------
?iris
 ggplot(data = iris)+
   geom_point(mapping = aes(x=Sepal.Length,
                            y =Species))

ggplot(data = ps_data_byitem_cond)+
  geom_point(mapping = aes(x=condition,
                           y =sum_corr))


#What's wrong with this graph?
ggplot(data = ma_data)+
  geom_point(mapping = aes(x=grade,
                           y =arithmeticAverage))

# jitter those points! ----------------------------------------------------
# one thing you should always ask yourself is: how many points,bars, lines should i be seeing?
ggplot(data = ma_data)+
  geom_jitter(mapping = aes(x=grade,
                            y =arithmeticAverage))
#hm, that's better, but now it feels a little TOO spread out, let's reign it in
ggplot(data = ma_data)+
  geom_jitter(mapping = aes(x=grade,
                            y =arithmeticAverage),
              width = .2,
              height = 0)

# graph task #1: first scatterplots -----------------------------------------------------------

#a) using the ps_data_byitem_cond, make a scatterplot of mean correct (x axis) by condition (y axis)
#b) using the built-in iris dataset, make a scatterplot of Sepal.Length by Petal.Width
#c) using ps_data_bysubj_condition, make a scatterplot of sum correct by condition where you can 
#appropriately see the dots

# aesthetics --------------------------------------------------------------

ggplot(data = iris)+
  geom_point(mapping = aes(x=Sepal.Length,
                           y =Petal.Width,
                           color = Species))

ggplot(data = iris)+
  geom_point(mapping = aes(x=Sepal.Length,
                           y =Petal.Width,
                           alpha = Species))

ggplot(data = iris)+
  geom_point(mapping = aes(x=Sepal.Length,
                           y =Petal.Width,
                           shape = Species,
                           alpha = Species))
ggplot(data = iris)+
  geom_point(mapping = aes(x=Sepal.Length,
                           y =Petal.Width,
                           size = Species))

ggplot(data = iris)+
  geom_point(mapping = aes(x=Sepal.Length,
                           y =Petal.Width),
             size = 4)

ggplot(data = iris)+
  geom_point(mapping = aes(x=Sepal.Length,
                           y =Petal.Width))+
  facet_wrap(facets = ~Species)


# graph task 2 ------------------------------------------------------------
#for task 2, use ma_data and a scatterplot of your choosing (jittered if needed!)
#a) set the shape of all the dots in a scatterplot to an asterisk
#b) map a continuous variable onto color (hint: use 'summary' to see what's continuous!)
#c) map a discrete variable (a factor or character) onto shape
#d) map a continuous variable (an integer or double) onto shape
#e) make a graph of your choosing using facet_wrap and one with facet_grid: what's the difference?


# r can’t read your mind --------------------------------------------------
# what's odd about the code below? what will r do to resolve the issue?
ggplot(data = iris, size =2)+
  geom_point(mapping = aes(x=Sepal.Length,
                           y =Petal.Width),
             size = 4)

# other geoms -------------------------------------------------------------
#geom_line
ggplot(data = ma_data, aes(x= factor(year),#this just makes it treat year as a factor
                           y= arithmeticAverage, 
                           group = subid))+# this keeps the 'unit' at subid
  geom_point()+
  geom_line()

#geom_hline
#geom_text
ggplot(data = ps_data_byitem_cond, mapping = aes(x=condition,
                                                 y=mean_corr))+
  geom_point()+

  geom_hline(yintercept = .5)+ #hey, this adds a line!
  geom_text(label = "1b", x = .7, y= .2)# this but '1b' in the corner!
#the x and y tell it where to put the text, here 'label' is 1 on the x axis


# visualizing distributions -----------------------------------------------
#in 1d
ggplot(data = ma_data, aes(x=gonogo))+
  geom_histogram(binwidth=.10)
# in 2d
ggplot(data = ps_data_bysubj_cond, aes(x=condition, y = mean_corr))+
  geom_boxplot()
# with density info:
ggplot(data = ps_data_bysubj_cond, aes(x=condition, y = mean_corr))+
  geom_violin()

#with density AND dots!
ggplot(data = ps_data_bysubj_cond, aes(x=condition, y = mean_corr))+
  geom_violin()+
  geom_jitter(width=.1, height=.01, shape =1)# i like shape #1 for overlap


# statistical transformation: smoothers ----------------------------------------------

#some stat_smooth examples
#and examples of 'local' vs. 'global' variable setting
#global x and y, color just for geom_point
ggplot(data = ma_data, mapping = aes(x = arithmeticTotal, y = gonogo)) + 
  geom_point(mapping = aes(color = grade)) + 
  stat_smooth()

#all vars global: what's the difference?
ggplot(data = ma_data, mapping = aes(x = arithmeticTotal, y = gonogo, color = grade)) + 
  geom_point() + 
  stat_smooth()

#filter the data for a layer
ggplot(data = ma_data, mapping = aes(x = arithmeticTotal, y = gonogo, color = grade)) + 
  geom_point() + 
  stat_smooth(data = filter(ma_data,grade=="first grade"))# the smoother only gets grade 1 data!

# take out a class, remove confidence bnd
ggplot(data = ma_data, mapping = aes(x = arithmeticTotal, y = gonogo, color = grade)) + 
  geom_point() + 
  stat_smooth(data = filter(ma_data,group=="MA"), se=F)# the smoother doesn't see MA group

#stat_smooth default is loess (local estimator)
ggplot(data = ma_data, mapping = aes(x = arithmeticTotal, y = gonogo)) + 
  geom_point(aes(color = grade)) + 
  stat_smooth()

#you can make it fit a line
ggplot(data = ma_data, mapping = aes(x = arithmeticTotal, y = gonogo)) + 
  geom_point(aes(color = grade)) + 
  stat_smooth( method="lm")

# Task 3 geoms, distributions, and smoothers-------------------------------------------
#a: go back to one of the scatter plots from #1 and add a loess smooth, and a line
#b: using ma_data, make a boxplot of swm for every value of woodcockTotal
#c: go back to the geom_line graph above and separate the data by grade (multiple solutions!)

# adding error bars -------------------------------------------------------
#mean by condition
ggplot(data = ps_data, aes(x = condition, y = correct)) + 
  stat_summary(fun.y=mean, na.rm=T, geom = "bar")


#95% confidence interval
ggplot(data = ps_data, aes(x = condition, y = correct)) + 
  stat_summary(fun.data = mean_cl_boot, geom = "pointrange") #fun.data, not fun.y!
#mean_cl_boot is boostrapped confidence intervals,you can google what regular normal CIs would be!

#both
ggplot(data = ps_data, aes(x = condition, y = correct)) + 
  stat_summary(fun.y = mean, na.rm=T, geom = "bar")+
  stat_summary(fun.data = mean_cl_boot, geom = "pointrange")

# errors bars with violins ------------------------------------------------
# same as violin plot above, but now with an errorbar!
ggplot(data = ps_data_bysubj_cond, aes(x=condition, y = mean_corr))+
  geom_violin()+
  stat_summary(fun.data=mean_cl_normal, geom = "pointrange")


# stack and dodge ------------------------------------------------

#protip: use fill with bars not colour
## bonus question: what does colour do for bars?
ggplot(data = ma_data) + 
  geom_bar(mapping = aes(x = woodcockTotal, fill = grade), position = "fill")

ggplot(data = ma_data) + 
  geom_bar(mapping = aes(x = woodcockTotal, fill = grade), position = "stack")

ggplot(data = ma_data) + 
  geom_bar(mapping = aes(x = woodcockTotal, fill = grade), position = "dodge")

# task 4: error bars, and stack & dodge------------------------------------------------------------------
#4a: using the ps dataset, graph means for each item & add error bars
#4b: make a bargraph of the ps_data_byitem_cond showing the mean_corr for each condition using geom_bar 
#(hint, you'll need to use "stat=" insde your geom_bar() call
#4c: when would it be most appropriate to use fill, stack, or dodge?

# task 5 ------------------------------------------------------------------
#Split into groups for task wishes
#a) Group A: Distribution-based Wishes

#b) Group B: Time-course graph based wishes

#c) Group C: Individual datapoints + summary stats
#hint for group c
ggplot(data = ma_data, aes(x= factor(year),#this just makes it treat year as a factor
                           y= arithmeticAverage, 
                           group = subid))+# this keeps the 'unit' at subid
  geom_point()+
  geom_line()+facet_wrap(~grade)+
  stat_summary(color = "red", size = 3, geom="line", fun.y=mean, aes(group =grade))
# saving your graph  -------------------------------------------------------
?ggsave()

#ggsave will save your *last* plot by default, but you can also tell it save a plot you've assigned
mygraph <- ggplot(data = iris)+
  geom_point(mapping = aes(x=Sepal.Length,
                           y =Petal.Width,
                           color = Species))

mygraph
ggsave("mygraph.pdf",plot = mygraph,dpi = 100)

# even better than saving your graph: add it to your R Markdown!------------
# the awesome thing about using your .rmd file is that you can render graphs there, and they get saved for you!
# there are LOTS of settings you can muck with (details here https://yihui.name/knitr/options/#plots)
# we'll do this back in our .rmd file










#time permitting, we can talk about  the following (using some base datasets)

# adding regression line --------------------------------------------------
# if all we wanted to do was add a regression line, we'd just use stat_smooth:
# note this is like the graph we did with the errorbars above, just edited a little
ggplot(ToothGrowth, aes(x=dose, y=len, colour=supp)) + 
  stat_summary(fun.y = mean, geom = "point",  size = 4) +
  geom_point( size = 1)+
  stat_smooth(method="lm")

# but if we want to know what the actual formula for that line is, we have to calculate some things:
#first we need a linear model
ourmodel <- lm(data = ToothGrowth, len~dose*supp)

#if you want to know more about the results you do a summary of the model
summary(ourmodel)

#if you want the summary results to look prettier you tidy the model
tidy(ourmodel)

#in our case, we can use the results of the model to manually put in a line
## there are fancier ways to do this that are beyond the scope of this tutorial
ggplot(ToothGrowth, aes(x=dose, y=len, colour=supp)) + 
  stat_summary(fun.y = mean, geom = "point",  size = 4) +
  geom_point( size = 1)+
  stat_smooth(method="lm")+
  annotate(x = 1, y = 30, "text", label = "y = 11.55 + 7.8 *dose + -8.26*suppVC + 3.9 * dose * suppVC")
# note: for annotate, the x and y is where on the graph you want your text to go

# if you want to check this formula, you can plug in some values:
#11.55 + 7.8 *dose + -8.26*suppVC + 3.9 * dose * suppVC
11.55 + 7.8*0 + -8.26*0 + 3.9*0*0 # dose of 0 for oj
11.55 + 7.8*1 + -8.26*0 + 3.9*1*0# dose of 1 for oj
11.55 + 7.8*2 + -8.26*0 + 3.9*2*0# dose of 2 for oj

11.55 + 7.8*0 + -8.26*1 + 3.9*0*1# dose of 0 for vc
11.55 + 7.8*1 + -8.26*1 + 3.9*1*1# dose of 1 for vc
11.55 + 7.8*2 + -8.26*1 + 3.9*2*1# dose of 1 for vc


## manually specified errorbars ---------------
#http://www.cookbook-r.com/Graphs/Plotting_means_and_error_bars_(ggplot2)/
tgc <- ToothGrowth%>%
  group_by(supp, dose)%>%
  summarise(n = n(),
            mean_len = mean(len),
            sd_len = sd(len),
            se_len = sd_len/sqrt(n),
            ci_len = qt((.95/2 +.5),
                        df= n-1)*se_len) # looking up 95%'s 2 tails in t-dist

ggplot(tgc, aes(x=dose, y=mean_len, colour=supp)) + 
  geom_errorbar(aes(ymin=mean_len - ci_len, ymax = mean_len + ci_len)) +
  geom_line() +
  geom_point()

ggplot(ToothGrowth, aes(x=dose, y=len, colour=supp)) + 
  stat_summary(fun.data = mean_cl_normal, geom = "errorbar") +
  stat_summary(fun.y = mean, geom = "point") +
  stat_summary(fun.y = mean, geom = "line") 