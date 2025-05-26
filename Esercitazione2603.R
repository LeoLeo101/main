rm(list = ls())

v <-c(letters)

find_position <- function(target,vec){

  c<- 1
  
  while (c <= length(vec)) {
    
    if(vec[[c]]==target){
      
      return(c)
      
    }
    
    c<-c+1
  }
  
} 

hits_at_k<-function(target,vec,k){
  
  c<- 1
  
  while (c <= k) {
    
    if(any(vec[[c]]==target)){
      
      return(1)
      
    }
    c<-c+1
    } 
      
      return(0)
      
    }
  
  
reciprocal_rank<-function(target, vec){
  
  c<- 1
  
  while (c <= length(vec)) {
    
    if(any(vec[[c]]==target)){
      
      return(1/c)
      
    }
    
    c<-c+1
  }
  
}





Nomi_italiani<-readLines("https://gist.githubusercontent.com/pdesterlich/2562329/raw/7c09ac44d769539c61df15d5b3c441eaebb77660/nomi_italiani.txt")
Nomi_italiani<-data.frame(Nomi=Nomi_italiani)
Nomi_italiani<-Nomi_italiani[-c(1:7),, drop = FALSE]


  
random_names<-function(k){


  nomi<-sample(Nomi_italiani[,1],k, replace = TRUE)
  
}

Nomi_italiani<-cbind(Nomi_italiani,iniziale = substr(Nomi_italiani$Nomi,1,1))
get_names1<-function(k,first_letter){
  
  dfsub<- Nomi_italiani[Nomi_italiani$iniziale == first_letter,]
  
  sample(
    dfsub$Nomi,
    min(k,length(dfsub$Nomi)),
    replace = FALSE)
  
}

library(stringr)
library(dplyr)

get_names2<-function(k,freq_letter){
  
 dffreq<-Nomi_italiani[grepl(freq_letter,Nomi_italiani$Nomi),]

  dffreq<- cbind(dffreq,occorrenze = str_count(dffreq$Nomi,freq_letter))
 
  dffreq<-dffreq %>% arrange(desc(occorrenze))

  dffreq$occorrenze<-dffreq$occorrenze/sum(dffreq$occorrenze)

  sample(dffreq$Nomi,min(k,length(dffreq$Nomi)),prob = dffreq$occorrenze)


}



numkval<-40
kval <- round(seq(1, 200, length.out = numkval))



lettere <- c("b", "e", "s")
output <- data.frame()

for (k in kval) {
  for (l in lettere) {
    for (funzione in c("random_names", "get_names1", "get_names2")) {
      for (i in 1:20) { 
        if (funzione == "random_names") {
          names_selected <- random_names(k)
        } else if (funzione == "get_names1") {
          names_selected <- get_names1(k, l)
        } else {
          names_selected <- get_names2(k, l)
        }
        
        hits_k <- hits_at_k(names_selected,Nomi_italiani$Nomi, k)
        RR <- reciprocal_rank(names_selected,Nomi_italiani$Nomi)
        
        output <- rbind(output, data.frame(
          Funzione = funzione,
          k = k,
          Lettera = l,
          Hits_k = hits_k,
          RR = RR
        ))
      }
    }
  }
}


summary_results <- output %>%
  group_by(Funzione, k, Lettera) %>%
  summarise(
    Mean_Hits_k = mean(Hits_k),
    Mean_RR = mean(RR),
    .groups = "drop"
  )

View(summary_results)

library(ggplot2)


ggplot(summary_results, aes(x = as.factor(k), y = Mean_Hits_k, color = Funzione, group = Funzione)) +
  geom_line(size = 1) +
  facet_wrap(~ Lettera) +
  labs(title = "Mean Hits@k per Funzione", x = "k", y = "Mean Hits@k") +
  theme_minimal()+
  theme(axis.text.x = element_text(size = 8, angle = 90))

ggplot(summary_results, aes(x = as.factor(k), y = Mean_RR, color = Funzione, group = Funzione)) +
  geom_line(size = 1) +
  facet_wrap(~ Lettera, scales = "free_y") +
  labs(title = "Mean Reciprocal Rank (RR) per Funzione", x = "k", y = "Mean RR") +
  theme_minimal()+
  theme(axis.text.x = element_text(size = 8, angle = 90))
