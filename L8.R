
#fatto slide coding 5 dove parla di variabili accessibili dentro e fuori funzioni
#se devfinisco una variabile dentro una funzione quella non è accessibile fuori
#se definisco una variabile fuori da una funzione posso accedere a quella variabile dentro la funzione

x<- 10
f1<-function(x){
  
  function(){
    
  x+10  
  }
}

f1(1)()
#f1 restituisce una funzione che aggiunge 10 a x, f1 non restituisce il valore di 10+x ma la funzione 10+x
#la seconda parentesi dice che la funzione interna non ha bisogno di parametri

f1<-function(x){
  
  function(y,z){
    
    x+y+z  
  }
}

f1(1)(3,4)

#non metto la return perchè se non la metto ritorna l'ultima istruzione ovvero x+10+y.


#cominciamo coding 6

#un oggetto atomico contiene dati dello stesso tipo.


#le matrici
matrice1<- matrix(1:9,nrow=3,ncol=3,byrow=FALSE)
matrice2<- matrix(1:9,nrow=3,ncol=3,byrow=TRUE)
matrice1
matrice2




matrice1<- matrix(1:9,nrow=3,ncol=3,byrow=FALSE)
matrice1


c<-1:6
dim(c)





m1<-matrix(1:21,nrow=7,byrow = FALSE)
m1

m1[,2]
m1[3,]
m1[1:3,2] #prime 3 righe della seconda colonna
m1[1:3,2:3]
m1[,3:1] #inverto le colonne




rm(list=ls())

v10 = 1:10
righe = c("AAA", "BBB")
colonne = c("V", "W", "X", "Y", "Z")
rc = list(righe, colonne)
m5<-matrix(v10, nrow=2, ncol=5, byrow=TRUE, dimnames=rc)


m5
rownames(m5)<-c("aaa","bbb") #cambio etichette di riga
colnames(m5)<-c("x","y","z","w","k") #cambio etichette di colonna
m5

#esercizi

sample()
