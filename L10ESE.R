#esercitazione L10

rm(list=ls())

nomi<-read.table("https://gist.githubusercontent.com/pdesterlich/2562329/raw/7c09ac44d769539c61df15d5b3c441eaebb77660/nomi_italiani.txt", header = FALSE, sep = "\t")
nomi<-nomi[-c(1:7),]

cognomi<-read.table("https://gist.githubusercontent.com/pdesterlich/2562407/raw/9fbc510830f1a65a7103742aeed30c0422590ec1/cognomi.txt", header = FALSE, sep = "\t")
cognomi<-cognomi[-c(1:7),]

df<-data.frame(nome="",cognome="",PunteggioTitoli=0,PunteggioColloquio=0)


AddRow<-function(df,nome,cognome,punteggiotitoli,punteggiocolloquio){
  
  df[nrow(df)+1,]=c(nome,cognome,punteggiotitoli,punteggiocolloquio)
  
  return(df)
  
  }


for (i in 1:100) {
  
  df<-AddRow(df=df,nome=sample(nomi,1,replace = TRUE),cognome=sample(cognomi,1,replace = TRUE),punteggiotitoli=sample(1:100,1,replace = TRUE),punteggiocolloquio=sample(1:100,1,replace = TRUE))
  
}

df
mean(as.integer(df$PunteggioTitoli))aqqw
mean(as.integer(df$PunteggioColloquio))


#soluzione prof



aggiungiRiga<-function(dframe,x){
  
  return(rbind(dframe,x))
}


nuovaRiga<- c("vittoria",32,"alto")
df<-aggiungiRiga(df,nuovaRiga)
df$eta<- as.integer(df$eta)


aggiungiColonna<-function(dframe,x){
  
  return(cbind(dframe,x))
}

aggiungiColonna(df,sample(1:800, 101, replace=FALSE))

