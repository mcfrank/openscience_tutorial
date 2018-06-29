#some answers to intro_to_ggplot2.r tasks
#1a
ggplot(data = ps_data_byitem_cond)+
  geom_point(mapping = aes(x=condition,
                           y =mean_corr))

#1b
ggplot(data = iris)+
  geom_point(mapping = aes(x=Species,
                           y =Sepal.Length))

#1c
ggplot(data = ps_data_bysubj_cond)+
  geom_jitter(mapping = aes(x=condition,
                           y =sum_corr),
              width = .2,
              height = .1)
#1d
ggplot(data = ma_data, aes(x=gonogo))+
  geom_histogram(binwidth=.10)+facet_wrap(~year)

#2a
ggplot(data = ma_data)+
  geom_jitter(mapping = aes(x=grade,
                            y =arithmeticAverage),
              width = .2,
              height = 0,
              shape = 8)

#2b
ggplot(data = ma_data)+
  geom_jitter(mapping = aes(x=grade,
                            y =arithmeticAverage,
                            color = swm),
              width = .2,
              height = 0)

#2c
ggplot(data = ma_data)+
  geom_jitter(mapping = aes(x=grade,
                            y =arithmeticAverage,
                            shape = group),
              width = .2,
              height = 0)

#2d
ggplot(data = ma_data)+
  geom_jitter(mapping = aes(x=grade,
                            y =arithmeticAverage,
                            shape = swm),
              width = .2,
              height = 0)
#2e
ggplot(data = mpg)+geom_point(aes(x=cty, y=hwy))+facet_wrap(~drv+cyl)
ggplot(data = mpg)+geom_point(aes(x=cty, y=hwy))+facet_grid(~drv+cyl)

#3b
ggplot(ma_data, aes(woodcockTotal, swm, group = woodcockTotal))+geom_boxplot()
#3c
ggplot(data = ma_data, aes(x= factor(year),#this just makes it treat year as a factor
                           y= arithmeticAverage, 
                           group = subid))+# this keeps the 'unit' at subid
  geom_point()+
  geom_line()+facet_wrap(~grade)

#4b
ggplot(data=ps_data_byitem_cond, aes(condition, mean_corr, fill=item))+geom_bar(position="dodge", stat="identity")

#5: Graph Wishes,
#a) Group A: Distribution-based Wishes
ggplot(data = ma_data, aes(x= factor(year),#this just makes it treat year as a factor
                           y= arithmeticAverage, 
                           group = subid,
                           linetype= grade))+# this keeps the 'unit' at subid
  geom_point()+
  geom_line(aes(color = grade))+
  stat_summary(color = "red", size = 3, geom="line", fun.y=mean, aes(group =grade))


#b) Group B: Time-course graph based wishes
ggplot(subset(coart, Nonset<5000 & Nonset>-1500),
       aes(Nonset, propt, linetype= TrialType, shape=TrialType))+
  geom_hline(yintercept=.5)+
  ylab("proportion of target looking")+
  xlab("time from target onset")+
  geom_vline(xintercept=0)+
  stat_smooth(geom="errorbar")+
  theme_bw(base_size=18)


#c) Group C: Individual datapoints + summary stats
ggplot(data = ps_data_bysubj_cond, aes(x=condition, y = mean_corr))+
  geom_flat_violin(position = position_nudge(x = .2, y = 0), alpha = .8)+
  geom_point(position = position_jitter(width = .15))+
  geom_boxplot(width = .1, guides = FALSE, outlier.shape = NA, alpha = 0.5)

