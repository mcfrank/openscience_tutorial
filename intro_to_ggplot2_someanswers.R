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

#3: Graph Wishes,
#a) Group A: Distribution-based Wishes

#b) Group B: Time-course graph based wishes

#c) Group C: Individual datapoints + summary stats