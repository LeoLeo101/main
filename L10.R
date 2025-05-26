

#esercizi della volta scorsa

#1
#Crea una matrice M 5x5 con valori casuali compresi tra 1 e 10.
#2 Calcola la media degli elementi della matrice M e crea una nuova
#matrice MM a cui si sottrae la media dagli elementi di M.
#3 Trova il massimo valore di ogni colonna della matrice MM (crea una
#funzione trovaMassimiColonna().
#4 Crea un array A tridimensionale 2x2x3 con numeri interi casuali
#compresi tra 1 e 20.
#5 Calcola la media degli elementi di ogni strato dell’array A. Crea una
#funzione calcolaMediaStrato().
#6 Trova il valore minimo di ogni riga dell’array A e sottrailo ad ogni riga
#di A, creando un nuovo array AA. Chiama la funzione sottraiMediaRighe().

#1
M<-matrix(sample(1:10,25, replace= TRUE), nrow=5)
#2
MM<- M - mean(M)
#3
trovaMassimiColonna<-function(M){
  
  max<- max(M[,1])
  for (col in 2:ncol(M)) {
    
    max<- c(max,max(M[,col]))
  }
  return(max)
}

MM
trovaMassimiColonna(MM)
#4

A<- array(data=sample(1:20,12,replace= TRUE), dim= c(2,2,3))

#5

calcolaMediaStrato<- function(A){
  
  media<-mean(A[,,1])
    
  for (i in 2:dim(A)[3]) {
    
    media<-c(media,mean(A[,,i]))
    
  }
  
  return(media)
}

A
calcolaMediaStrato(A)

#6

sottraiMediaRighe<-function(a){
  
  AA<-a
  nrighe<- dim(AA)[1]
  ncolonne<- dim(AA)[2]
  nstrati<- dim(AA)[3]
  
  for (i in 1:nrighe) {
    
    for (j in 1:nstrati) {
      
      AA[i,,j]<-AA[i,,j]-min(AA[i,,j])
      
    }
  }
  return(AA)
  
}

sottraiMediaRighe(A) #che poi è minimo righe non media righe ma va bene lo stessooo


#cominciamo slide coding7



# Creazione dei vettori per le colonne
nomi_italiani <-read.table("https://gist.githubusercontent.com/pdesterlich/2562329/raw/7c09ac44d769539c61df15d5b3c441eaebb77660/nomi_italiani.txt", header = FALSE, sep = "\t")
nomi_italiani<-nomi_italiani[-c(1:7),]
nomi <- sample(nomi_italiani, 100, replace = TRUE)
eta <- sample(18:80, 100, replace=TRUE)
redditi <- sample(c("basso", "medio", "alto"),100, replace=TRUE)
# Creazione del DataFrame
df <- data.frame(nome = nomi, eta = eta, reddito = redditi)

df[df$eta>30 & redditi=="medio",]
df[df$eta>30 & df$eta<60 | redditi=="alto",]


EtaMedia<-function(dati,LivReddito){
  
  
  dati<-dati[dati$reddito==LivReddito,]
  
  media<-mean(dati$eta)
  
  return(media)
}

EtaMedia(dati=df,LivReddito = "basso")


#passiamo a importare i dataframe da r


data("airquality")
airdata<-airquality

?airquality

luglio<-airquality[airquality$Month==7,]
luglio

media<-mean(luglio$Ozone, na.rm=TRUE)
media

