rm(list = ls()) #elimina i valori presenti nella lista ls()


a<-5
b<-7

somma <- a+b
differenza <- a-b
prodotto <- a*b
divisione <- a/b
resto <- a%%b
esponente <- a^b

ls() # lista dei nomi delle variabili nell'ambiente


casuale <- sample(1:100,2) #estrae 2 numeri casuali da 1 a 100 senza ripetizione
casuale_rip <- sample(1:100,200,replace =TRUE) #estrae 200 numeri casuali da 1 a 100 con ripetizione


valore_fisso <- 9L #con la L sto dicendo che il valore 9 è intero 
valore_fisso/2L #da comunque un valore decimale 


arrotondato <- round(divisione,2)

#FACCIAMO LE STRINGHE

nome <- "Mario"

lunghezza <- nchar(nome) #lunghezza stringa

NomeMaiuscolo <- toupper(nome)
NomeMinuscolo <- tolower(nome)


#CONCATENIAMO STRINGHE

saluto <- "ciao"

paste(saluto,nome) #concatena stringhe con spazio
paste0(saluto,nome) #concatena stringhe 
paste(saluto,nome,saluto,nome, sep= "-") #concatena stringhe separate da -

#ESTRARRE SOTTOSTRINGHE

substr(nome,2,3)

#DIVIDERE LA STRINGA

parola <- "banana"
lettera <- "a"

strsplit(parola,lettera) #usa lettera per dividere la stringa parola


testo <- "Richiedi l’ISEE universitario per essere inserita/o nelle fasce contributive 
sulla base delle tue condizioni economiche e risparmiare sulla contribuzione universitaria.
L'ISEE deve recare la validità per le prestazioni agevolate per il diritto allo studio
universitario per il tuo codice fiscale. Se lo richiedi entro il 28 febbraio 2025 ti sarà
addebitata un’indennità di mora di € 150 (la scadenza entro la quale richiedere
l'ISEE universitario senza indennità di mora era il 22 novembre 2024)."

separatore <- ","

strsplit(testo,separatore)


occorrenze <- sum(strsplit(parola, "")[[1]] == lettera)
occorrenze

strsplit(parola, "") #separa tutte le lettere della parola singolarmente

# [[1]] primo elemento della lista dentro la lista quidni sarebbero le lettere singole.
#== lettera confronto con le lettere della parola la lettera che selezioniamo e trasforma in true o false la lista delle lettere
# sommando tutto sommo true e false quindi somma tutti i true trovando il numero di caratteri lettera


#ELIMINARE SPAZI

trimws("CIAO ")


#RICERCA E SOSTITUZIONE DI SOTTOSTRINGHE 



testo <- "ecco qui un bel testo"
sottostringa <- "bel"

risultato <- grepl(sottostringa, testo)
risultato1 <- grep(sottostringa, testo)


nuovotesto <- gsub("bel", "brutto", testo) # in testo cerca "bel" e lo sostituisce con "brutto"

#ESERCIZIO FINALE
rm(list = ls())

#1)
alfa <- paste0(letters,sep="",collapse="")

#2)
stringa <- "if the arguments are vectors, they are concatenated term-by-term to give a character vector result"
primi10<-substr(stringa,1,10)

#3)
primi10nonvuoti<-substr(gsub(" ","",stringa),1,10)



