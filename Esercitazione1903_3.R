rm(list = ls())

nomi<-readLines("C:\\Users\\leoan\\OneDrive\\All\\Andrea\\UNITO\\primo_anno\\coding per la statistica\\nomi_italiani.txt")

nomi<-tolower(nomi)


alfabeto <- c(letters," ") #aggiungo spazio per nomi che lo contangono
n <- length(alfabeto)

# creo una matrice di occorrenza vuota
mat_occorrenza <- matrix(0, nrow=n, ncol=n, dimnames=list(alfabeto, alfabeto))



# riempio la matrice scorrendo ogni nome
for (nome in nomi) {

  for (i in 1:(nchar(nome))) {
    lettera1 <- substr(nome, i, i)
    lettera2 <- substr(nome, i+1, i+1)
    
    if (lettera1 %in% alfabeto & lettera2 %in% alfabeto) {
      mat_occorrenza[lettera1, lettera2] <- mat_occorrenza[lettera1, lettera2] + 1
    }
  }
}


# calcolo la matrice delle probabilità
mat_prob <- round(mat_occorrenza / rowSums(mat_occorrenza),digits = 3)

# sostituisco i NaN con 0
mat_prob[is.na(mat_prob)] <- 0

# stampo la matrice di probabilità
print(mat_prob)

# creo un array 3D per le probabilità delle sequenze di 3 lettere
prob_array <- array(0, dim = c(n, n, n), dimnames = list(alfabeto, alfabeto, alfabeto))

# riempio l'array con le frequenze
for (nome in nomi) {
  
  for (i in 1:(nchar(nome))) {
    lettera1 <- substr(nome, i, i)
    lettera2 <- substr(nome, i+1, i+1)
    lettera3 <- substr(nome, i+2, i+2)
    
    if (lettera1 %in% alfabeto & lettera2 %in% alfabeto & lettera3 %in% alfabeto) {
      prob_array[lettera1, lettera2, lettera3] <- prob_array[lettera1, lettera2, lettera3] + 1
    }
  }
}

# trovo le probabilità
prob_array <- prob_array / sum(prob_array)

# stampo un esempio di probabilità per "mar"
print(prob_array["m", "a", "r"])


#calcolo score unicità 

calcola_unicita <- function(nome) {
  score <- 0
  
  for (i in 1:(nchar(nome))) {
    lettera1 <- substr(nome, i, i)
    lettera2 <- substr(nome, i+1, i+1)
    lettera3 <- substr(nome, i+2, i+2)
    
    if (lettera1 %in% alfabeto & lettera2 %in% alfabeto & lettera3 %in% alfabeto) {
      prob <- prob_array[lettera1, lettera2, lettera3]
      score <- round(score + ifelse(prob > 0, -log(prob), 10),digits = 1)  # Più rara è la sequenza, più alto è il punteggio (funzione trovata su internet)
    }
  }
  
  return(score)
}

# calcolo lo score per tutti i nomi
score_nomi <- sapply(nomi, calcola_unicita)

# creo un dataframe con i nomi e il loro score
df_unicita <- data.frame(Nome = nomi, Unicita_Score = score_nomi)

# stampo i nomi più unici
df_unicita <- df_unicita[order(-df_unicita$Unicita_Score),]


head(df_unicita)
