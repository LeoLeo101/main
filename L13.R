

applica_se_trovi<- function(matrice, valore, oper){
  
  lista<-character(0)

  for (var in matrice) {
    
    if(var==valore){
      
      var<-oper(var)
    }
    
    lista<-c(lista,round(var,digits = 2))
    
  }
  matriceMOD<-matrix(lista,ncol = ncol(matrice))
  return(matriceMOD)
  
}


m <- matrix(1:100, nrow = 10)
m1<-applica_se_trovi(m,70,log10)

m1

#View(m1)


rm(list=ls())
#coding12

library(ggplot2)

#hist(x, breaks = 100, col = "darkorange2", border = "white", main = "Istogramma", xlab = "Valori", ylab = "Frequenza")

# Carica il dataset Titanic
data(Titanic)
titanic_df <- as.data.frame(Titanic)

# Barplot: sopravvivenza per classe 
classi <- unique(titanic_df$Class)
sopravvissuti <- numeric(length(classi))
non_sopravvissuti <- numeric(length(classi))
for (i in seq_along(classi)) {
  c <- classi[i]
  # Subset per classe e stato di sopravvivenza
  sopravvissuti[i] <- sum(titanic_df$Freq[titanic_df$Class == c & titanic_df$Survived == "Yes"])
  non_sopravvissuti[i] <- sum(titanic_df$Freq[titanic_df$Class == c & titanic_df$Survived == "No"])
}

# Costruzione del barplot
barplot(
  rbind(non_sopravvissuti, sopravvissuti),
  beside = TRUE,
  names.arg = classi,
  col = c("tomato", "lightgreen"),
  main = "Sopravvivenza per Classe",
  xlab = "Classe",
  ylab = "Numero di persone"
)


dati<-data.frame(
  x = rnorm(10),
  y=rnorm(10)
)

grafico <- ggplot(data=dati,aes(x=x,y=y))+geom_point()

graficoPer<- grafico + labs(title = "scatter plot", x = "Asse x", y = "Asse y")+theme_gray()

graficoPer<- graficoPer+geom_area()

graficoPer