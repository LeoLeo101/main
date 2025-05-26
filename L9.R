rm(list=ls())


#1)
quadrato<- function(x){
  return(x^2)
}

#2)

somma<-function(x,y){

  return(sum(x,y))
  
}



#3)


lunghezza<-function(a)
{
  b<-strsplit(a,"")[[1]]
  b<-b[b!=" "]

return(length(b))

}

#4)


dev_std<-function(x){
  
  media<- sum(x)/length(x)
  dev<-0
  
  for (c in x) {
    
    dev<-dev+((c-media)^2)
  }
  
  dev<-sqrt(dev/(length(x)-1))
  return(dev)
}
  


#5)

massimo<-function(x,y){
  
  if(x>y){
    
    return(x)
  }else if(y>x){
    
    return(y)
  }else{
    print("uguali")
  }
}


#6)


parola_piu_lunga<-function(a){
return(unlist(a[nchar(a)==max(nchar(a))]))
}


a<-list("amore", "sole", "ombrellone", "ombrello", "acido", "allunaggio")
parola_piu_lunga(a)

