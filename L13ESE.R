rm(list=ls())
data(mtcars)
library(ggplot2)



ggplot(mtcars,aes(x=mpg,y=cyl))+geom_point()

ggplot(mtcars,aes(x = factor(gear), y = wt, fill = factor(gear))) +
  geom_boxplot() +
  scale_fill_manual(values = c("3" = "beige", "4" = "lightblue", "5" = "darkolivegreen1")) + 
  labs(x = "Gear", y = "Weight", fill = "Gear", title = "Boxplot del peso per gear") +
  theme_minimal()

