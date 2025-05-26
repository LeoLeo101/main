

numeri <- c(1, 3, 5, 7, 9)
numeri <- c(numeri, 10)
print(numeri)


somma <- sum(numeri)


vettore <- c(5, 3,3,3,3, 8, 1, 9, 12)
ordinato <- sort(vettore)

mean(unique(vettore))




# Creare un vettore con min, max e step: la funzione seq
vettore <- seq(1, 100, by=5)
# Creare un vettore con min, max e step di 1 (numero intero):
v <- 1:100

# Filtrare un vettore con una condizione
# Esempio di filtro sui valori > 10
v1 <- v[v > 10]


# Filtrare un vettore con degli indici
# Esempi di filtro su indici
v <- v[1]           #primo elemento del vettore
v <- v[c(1,2)]      #primi 2 elementi v[1,2] fa un altra cosa che centra con le matrici
v <- v[2:5]         #i valori dal secondo al quinto


#provo esercizi vettori
rm(list = ls())

#1)

v<-seq(-100,100,by=0.25)

#2)

vpiu<-v[v>0]
rad<- sqrt(vpiu)

#3)

v50 <- rad[1:50]

#4)

interi<- round(v50,digits=0)

#5)

intpos<- unique(interi[interi>0])









#lezione 2 versione 3 slide 20 "altri esercizi"

#1)


frase <- "Benvenuto a casa!"
Nlettere <- sum(strsplit(frase, "")[[1]] %in% letters)+sum(strsplit(frase, "")[[1]] %in% LETTERS)

#2)

FRASE <- toupper(frase)

#3)

frase2 <- "oggi piove"
p1 <- strsplit(frase2," ")
P1<- toupper(p1[[1]][1])

#4)

#è un po' ambiguo

#5)

parola <- "Fantastico"

divisa<- strsplit(parola, "")

l<-nchar(parola)

ultime<- paste0(c(divisa[[1]][1],divisa[[1]][l-2],divisa[[1]][l-1],divisa[[1]][l]),sep="",collapse="")

ultime

#6)



frase <- "buona notte"

corretta<- sub(substr(frase,1,4),"Sweet",frase)

#7)

rm(list = ls())

mail<-"contatto.persona@mail.it"

a<- strsplit(mail,"@")

miamail<- paste0("andrea",".","leonardi632","@","edu.unito.it")

#8) 


