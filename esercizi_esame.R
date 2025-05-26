rm(list = ls())

alfa<-""

for (l in letters) {
  alfa<-paste0(alfa,l)
}

substr(alfa,1,10)


frase<-"ah si buonissimo il cu"

a<-strsplit(frase," ")[[1]]
nospazi<-""

for (l in a) {
  nospazi<-paste0(nospazi,l)
}

substr(nospazi,1,10)
#--------------------------------------------------------------------------------

rm(list = ls())
mail<-"andrea,leonardi@redivivus.it"


nominativo<-strsplit(mail,"@")[[1]][1]
nome<-strsplit(nominativo,",")[[1]][1]
cognome<-strsplit(nominativo,",")[[1]][2]

paste0(nome,".",cognome,"@edu.unito.it")

#--------------------------------------------------------------------------



studenti<- c("giulia","marco","andrea", "giovanni")
voti<-c(29,23,27,18)

libro<-list(nomi = studenti, voto = voti)
head(libro)


# esercizi grafici

rm(list = ls())


mtcars

table(mtcars$mpg)

hist(mtcars$hp, probability = TRUE, col = "lightblue",border = "white",xlab="Cavalli vapore")
lines(density(mtcars$hp),lwd=2)
abline(v=mean(mtcars$hp),lty = 3,col= "blue",lwd=2)
text(mean(mtcars$hp),0.001,c("Media: ", round(mean(mtcars$hp),1)),pos = c(2,4),col = "blue")
text(190,0.004,"Densità",pos = 4,col = "black")


library(splines)

model1<-splinesmodel1<-lm(mtcars$mpg ~ bs(mtcars$hp,df=2))
plot(mtcars$hp,mtcars$mpg,pch=19)
abline(model1,lwd=2)
text(250,30,model1[[1]],pos=c(2,4))


summary(model1)
