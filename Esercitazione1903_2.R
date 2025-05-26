rm(list=ls())



Lclass<-c("1st", "2nd", "3rd", "Crew")
Lsex<-c("Male", "Female")
Lage<-c("Child","Adult")
Lsur<-c("Yes","No")
Lembarked<-c("Southampton", "Cherbourg", "Queenstown")



generate_fantatitanic<-function(n){
  
  #genero il df vuoto
  
  df<-data.frame(Class = character(0),
                 Sex = character(0),
                 Age = character(0),
                 Survived = character(0),
                 Fare = numeric(0),
                 Embarked = character(0))
  
  
  
  for (reps in 1:n) { #ciclo la creazione di nuove righe un numero di volte n input della funzione
    
  #“Class": assegnata casualmente tra "1st", "2nd", "3rd", “Crew"
  NewClass<-sample(Lclass,1)
  
  #"Sex": assegnata casualmente tra "Male" e “Female".
  NewSex<-sample(Lsex,1)
  
  #"Age": assegnata casualmente tra "Child" e “Adult".
  NewAge<-sample(Lage,1)
  
  #"Survived": assegnata casualmente con una probabilità diversa per classi differenti: 
  #1st Class: 60% di sopravvivere, 2nd Class: 40% di sopravvivere, 
  #3rd Class: 25% di sopravvivere, Crew: 20% di sopravvivere
  
  
  if (NewClass==Lclass[[1]]){
    
    Psur<-0.6
  }else if(NewClass==Lclass[[2]]){
    
    Psur<-0.4
  }else if(NewClass==Lclass[[3]]){
    
    Psur<-0.25
  }else if(NewClass==Lclass[[4]]){
    
    Psur<-0.2
  }
  
  NewSur<-sample(Lsur,1,replace = FALSE,prob = c(Psur,1-Psur))
  
  #"Fare": prezzo del biglietto generato casualmente: 1st Class: 
  #tra 50 e 500, 2nd Class: tra 20 e 100, 3rd Class: tra 5 e 50, Crew: sempre 0
  
  if (NewClass==Lclass[[1]]){
    
    NewFare<-sample(50:200,1)
    
  }else if(NewClass==Lclass[[2]]){
    
    NewFare<-sample(20:100,1)
    
  }else if(NewClass==Lclass[[3]]){
    
    NewFare<-sample(5:50,1)
    
  }else if(NewClass==Lclass[[4]]){
    
    NewFare<-0
  }
  
  #"Embarked": porto di imbarco casuale tra "Southampton", "Cherbourg", “Queenstown".
  NewEmba<-sample(Lembarked,1)
  
  #creo la nuova riga e la aggiungo ad df
  NewRow<- data.frame(Class =NewClass,Sex =NewSex,Age =NewAge, Survived =NewSur,Fare =NewFare, Embarked =NewEmba)
  
  df<-rbind(df,NewRow)
  }
  
  return(df)
  
  }

#Creare una colonna "Fare_Category" che discretizzi il prezzo in "Low", "Medium" e "High" usando cut().

DF<-generate_fantatitanic(500)

Fare_Category<-cut(DF$Fare,breaks=3,c("Low","Medium","High"))

DF<-cbind(DF,Fare_Category)


#Creare una colonna "Survival_Probability" che calcoli la probabilità di sopravvivenza basata sulla classe

calcolatoreSURVPROB<-function(classe){
  
 a<-length(DF[DF$Class==classe & DF$Survived=="Yes",]$Survived)/length(DF[DF$Class==classe,]$Survived)
 return(round(a,digits = 3))
  
}

DF$Survival_Probability<- ifelse(
  
  DF$Class == Lclass[[1]],calcolatoreSURVPROB( Lclass[[1]]), ifelse(
    DF$Class ==  Lclass[[2]],calcolatoreSURVPROB( Lclass[[2]]), ifelse(
      DF$Class ==  Lclass[[3]],calcolatoreSURVPROB( Lclass[[3]]), ifelse(
        DF$Class ==  Lclass[[4]],calcolatoreSURVPROB( Lclass[[4]]), NA
          
  ))))

#Aggiungere una colonna "ID" univoca formata dall’iniziale della classe, un numero progressivo e l'iniziale del sesso (es. "1M_001" per un uomo in prima classe).

rownames(DF) <- sprintf("%03d", 1:nrow(DF))
DF$ID<-paste0(substr(DF$Class,1,1),substr(DF$Sex,1,1),"_",rownames(DF))


#Contare quanti passeggeri per ogni classe hanno un "Fare_Category" alto.

table(DF$Fare_Category,DF$Class)[3,]

#Calcolare il tasso di sopravvivenza medio per ogni classe e categoria di prezzo.
SurvPerClass<-data.frame(Class=character(0), Survival_Probability= numeric(0))

for (classe in Lclass) {

  SurvPerClass<-rbind(SurvPerClass,data.frame(
    
    Class=classe,
    Survival_Probability=as.double(round(mean(DF[DF$Class==classe,"Survival_Probability"]),digits = 3)))
    
    )

}

SurvPerFare<-data.frame(Fare=character(0), Survival_Probability= numeric(0))

for (FareCAT in levels(Fare_Category)) {
  
  SurvPerFare<-rbind(SurvPerFare,data.frame(
    
    Fare=FareCAT,
    Survival_Probability=as.double(round(mean(DF[DF$Fare_Category==FareCAT,"Survival_Probability"]),digits = 3)))
    
  )
  
}

#Estrarre solo i passeggeri che si sono imbarcati a Cherbourg e hanno pagato un biglietto “High".

DF[DF$Embarked=="Cherbourg" & DF$Fare_Category== "High",]


