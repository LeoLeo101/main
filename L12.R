rm(list=ls())

#coding 9

data(mtcars)

mycars<-mtcars[mtcars$cyl>4,]

mycars<-mycars[,c("mpg","cyl","hp","gear")]

colnames(mycars)<-c("kml","cyl","hp","gear")

mycars$kml<-mycars$kml*0.425144

write.csv(mycars,"mtcars2.csv",row.names = FALSE)


#coding 10

mycars2<-mtcars %>%
  
  filter(mpg >20)

mycars2


mycars2<-mycars2 %>%
  
  select(mpg,cyl,hp)

mycars2

mycars2<-mycars2 %>%
  
  mutate(hp_per_cyl= hp/cyl)

mycars2

mycars2<-mycars2 %>%
  
  group_by(cyl) %>%
  
  summarize(mean_mpg=mean(mpg))

mycars2




