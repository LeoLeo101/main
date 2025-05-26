
library(dplyr)

mycars<- mtcars %>%
  
  mutate(disp_to_hp_ratio=disp/hp)

mycars


mycars<-mycars %>%
  
  filter(gear>3) %>%
  group_by(cyl) %>%
  summarise(mean_hp = mean(hp),max_hp=max(hp), min_hp=min(hp))
  
mycars
