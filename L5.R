#sempre file lezione 2


#se do un info parziale ovvero un valore meno lungo del dovuto, R ripete l'operazione
#AKA meccanismo del riciclo in R


nomi <- c("Matteo", "Cristina", "Andrea")
eta <- c(25, 30, 35)
dati <- list(nomi = nomi, eta = eta)
nuovo_nome <- "Davide"
nuova_eta <- 40
dati$nomi <- c(dati$nomi, nuovo_nome)
dati$eta <- c(dati$eta, nuova_eta)
print(dati)


dati2 <- list(n = nomi, e = eta)

listone<-c(nomi,eta)
listone

rm(list = ls())

lista <- list(a = 1, b = 2, c = 3)

v <- c(a = 1, b = 2, c = 3)
lista <- lista[-which(names(lista) == "b")]
v <- v[-which(names(v) == "b")]




