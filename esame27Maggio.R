rm(list=ls())

library(ggplot2)
library(dplyr)

#Esercizio 1-----------------------------------------------------------------

analizza_nomi_base<- function(nomi){
  
  nomi_lunghi<-nomi[nchar(nomi)>5]
  iniziali <-substring(tolower(nomi_lunghi),1,1)
  frequenze<-table(iniziali)
  frequenze_ordinate <-sort(frequenze,decreasing = TRUE)
  return(frequenze_ordinate)
  
 
}


analizza_nomi_dplyr<-function(nomi){

nomi<-as.data.frame(nomi)
  frequenze_ordinate<-nomi %>%
    filter(nchar(nomi)>5) %>%
    mutate(iniziali =substring(tolower(nomi),1,1))%>%
    count(iniziali,sort = TRUE)%>%
    rename(frequenzeAssolute = n)

  return(frequenze_ordinate)
  
}
nomi <- c("Anna", "Giacomo", "Giovanni", "Lucia", "Marco", "Francesco", "Alessio")

analizza_nomi_base(nomi)
analizza_nomi_dplyr(nomi)


#Esercizio 2-----------------------------------------------------------------

applica_floor<-function(v){
  
  risultato<-numeric(length(v))
  for (i in seq_along(v)) {
    risultato[i]<-floor(v[i])
    
  }
  
  return(risultato)

}


v1 <- runif(10^4, min=0, max=100)
v2 <- runif(10^6, min=0, max=100)
v3 <- runif(10^8, min=0, max=100)

applica_floor(v1)


#1) la funzione applica floor prender un vettore di valori numerici e applica la funzione floor.
#la funzione floor prende in input un valore numerico e restituisce il valore arrotondato per difetto al numero intero più vicino
# se per esempio applichiamo floor al valore 5.9 il risultato sarà 5

system.time(applica_floor(v1))
system.time(applica_floor(v2))
system.time(applica_floor(v3))

#2) il tempo di esecuzione per i 3 diversi vettori della funzione applica_floor equivale a
#v1 (10.000 valori) -> 0 secondi
#v2 (1.000.000 valori)-> 0.13 secondi
#v3 (100.000.000 valori)-> 16.38 secondi

system.time(floor(v1))
system.time(floor(v2))
system.time(floor(v3))

#il tempo di esecuzione per i 3 diversi vettori della funzione floor equivale a
#v1 (10.000 valori) -> 0 secondi
#v2 (1.000.000 valori)-> 0.02 secondi
#v3 (100.000.000 valori)-> 0.73 secondi

#da questi valori deduciamo che l'aggiunta di un ciclo for rallenta drasticamente il calcolo e quindi è
#preferibile utilizzare direttamente la funzione vectorized floor(v)


#Esercizio 3-----------------------------------------------------------------

vettore<-c(2, 3.5, 4, 4, 8, 8,100,100,10, 11.1, 12, 4)
filtra_pari_ordinati<-function(vet,ord=0){ 

  if(is.numeric(vet)==FALSE){
    
    stop("Il vettore contiene dati non numerici")
  }
  
v<- as.data.frame(vet)%>%
  mutate(intero = as.integer(vet))%>%
  filter(vet==intero)%>%
  select(intero)%>%
  mutate(pari = intero%%2)%>%
  filter(pari ==0) %>%
  select(intero) %>%
  count(intero) %>%
  mutate(duplicati = intero*n)%>%
  select(duplicati)



if(ord==1){
  
  v<-v%>%
    arrange(v)
  
  return(as.vector(v))
  
}else{
  
  v<-v%>%
    arrange(desc(v))
  
  return(as.vector(v))
}
}

  
filtra_pari_ordinati(vettore)




#Esercizio 4-----------------------------------------------------------------

rm(list=ls())

mycars<-mtcars%>%
  filter(hp>100,am==0)%>%
  group_by(cyl)%>%
  summarise(MediaMpg=as.numeric(mean(mpg)))

mycars2<-mtcars%>%
  filter(hp>100,am==0)%>%
  select(cyl,mpg)

ggplot(mycars,aes(x=cyl,y=MediaMpg,fill=factor(cyl)))+
  geom_bar(stat = "identity")+
  scale_x_continuous(breaks = pretty(mycars$cyl, n = 1)) +
  geom_text(aes(label=round(MediaMpg,2)),size = 5,vjust =2)+
  geom_jitter(data = mycars2,aes(x=cyl,y=mpg,fill="Osservazioni (jittered)"),color="blue",alpha = 0.3)+
  labs(title = "Media Mpg per numero di cilindri",
       x="Numero di cilindri",
       y="Mpg medio",
       fill="Cilindri")+
  theme_minimal()















