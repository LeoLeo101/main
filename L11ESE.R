rm(list=ls())

Lsesso<-sample(0:1,100,replace = TRUE,prob = c(0.6,0.4))
Leta<-round(rnorm(100,45,10))
Listruzione<-sample(c("Elementari","Medie","Superiori","Laurea triennale","Laurea magistrale","Dottorato"),100,replace = TRUE,prob = c(0.1,0.15,0.25,0.25,0.15,0.1))

df<-data.frame(Sesso=Lsesso,Eta=Leta,Liv.Istruzione=Listruzione)

df$Sesso<-cut(df$Sesso,breaks = 2, labels = c("M","F"))

df

table(df$Liv.Istruzione,df$Sesso)