#iniziamo coding 8
rm(list=ls())

v<- c("A","B","C","B","C")
f<-factor(v)

vettore <- c(3, 2, 5, 1, 4, 3, 1, 2, 5)
livelli <- c(1, 2, 3, 4, 5)
etichette <- c("Insufficiente", "Sufficiente", "Buono","Ottimo", "Eccellente")
fattore <- factor(vettore, levels = livelli, labels = etichette)
print(fattore)

data(mtcars)

myCars<-mtcars

myCars$wt<-round(myCars$wt*0.453592*1000)

hpf<-cut(myCars$hp,breaks = 5,labels = c("debolissima","debole", "normale", "potente","potentissima"))
qsecf<-cut(myCars$qsec,breaks = 5,labels = c("velocissima","Veloce", "normale", "lenta","lentissima"))
wtf<-cut(myCars$wt,breaks = 5,labels = c("leggerissima","leggera", "normale", "pesante","pesantissima"))

KgHp<-round(myCars$wt/myCars$hp,digits=1)

myCars<-cbind(myCars,KgHp)
myCars<-cbind(myCars,hpf)
myCars<-cbind(myCars,qsecf)
myCars<-cbind(myCars,wtf)



table(myCars$hpf)
table(hpf,qsecf)
table(wtf,qsecf)

