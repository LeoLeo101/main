rm(list=ls())

#Studiare il dataset con le funzioni head, summary ed help

data(Titanic)
head(Titanic)
summary(Titanic)
help(Titanic)

str(Titanic)

#Creare un vettore con i livelli della variabile "Class" e stamparlo

Lclassi<-dimnames(Titanic)$Class

Lclassi

#Creare una matrice con due colonne: la prima contenente i livelli della variabile "Sex" e la seconda con la variabile “Age"

Lsex<-dimnames(Titanic)$Sex
Lage<-dimnames(Titanic)$Age

SexAgeMatrix<-matrix(c(Lsex,Lage),ncol = 2)

#Creare una lista contenente: Un vettore con i livelli della variabile “Survived”, la matrice creata in precedenza e il numero totale di osservazioni nel dataset
Lsurv<-dimnames(Titanic)$Survived
Lista<-list(Lsurv,SexAgeMatrix,sum(Titanic))

#Creare un dataframe a partire dal dataset Titanic contenente le seguenti colonne: Classe (Class), Sesso (Sex), Età (Age), Sopravvivenza (Survived)

titanic_df <- as.data.frame(Titanic)

colnames(titanic_df) <- c("Classe", "Sesso", "Età", "Sopravvivenza", "Freq")

#Estrarre tutte le righe corrispondenti ai passeggeri di prima classe.

titanic_df[titanic_df$Classe=="1st",]

#Selezionare solo le colonne "Sex" e “Survived".

titanic_df[,c("Sesso","Sopravvivenza")]

#Creare una nuova colonna "SurvivalRate" che contenga il tasso di sopravvivenza per ogni categoria di classe e sesso.

sopravvissuti <- aggregate(Freq ~ Classe + Sesso, data = subset(titanic_df, Sopravvivenza == "Yes"), sum)


totale <- aggregate(Freq ~ Classe + Sesso, data = titanic_df, sum)

df_tasso <- merge(totale, sopravvissuti, by = c("Classe", "Sesso"), all.x = TRUE)


df_tasso$TassoSopravvivenza <- round(df_tasso$Freq.y / df_tasso$Freq.x,digits=3)


df_tasso_finale <- df_tasso[, c("Classe", "Sesso", "TassoSopravvivenza")]

#Rimuovere le righe relative ai membri dell’equipaggio (“Crew").

df_tasso_finale<-df_tasso_finale[df_tasso_finale$Classe!="Crew",]

#Creare una colonna "ClassShort" che contenga solo la prima lettera della classe di appartenenza.

classShort<- titanic_df$Classe

levels(classShort)<-c("1","2","3","C")

cbind(titanic_df,classShort)

#Creare una colonna "SurvivalScore" che assegni un valore numerico: 1 se il passeggero è sopravvissuto, 0 se non è sopravvissuto.

titanic_df$SurvivalScore <- ifelse(titanic_df$Sopravvivenza == "Yes", 1, 0)

#Calcolare la media del SurvivalScore per ogni classe.

mean_survival_by_class <- aggregate(SurvivalScore ~ Classe, data = titanic_df, FUN = mean)
