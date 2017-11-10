library(stringr)
library(mailR)

topsolutions<- function(Jfile, JfileU, Joutput,email,titl)

{
  while (!file.exists(Jfile)) {
    Sys.sleep(1)
  }  
system2('./dnaworks', args =JfileU)
print(Joutput)
 
  text<-readLines(Joutput)
  source("List.R")
  
  #codigo Principal
  match<-"\\d+\\s\\s\\s\\s\\d+\\s\\s\\s\\s\\d+\\s\\s|\\s\\s\\s\\d+.\\d+\\s\\s\\s\\s\\s\\s\\s\\d+.\\d+\\s\\s\\s\\s\\s\\s\\d+\\s\\s\\s\\s\\s\\s\\d+\\s\\s\\s\\s\\s\\s\\d+\\s\\s\\s\\s\\s\\s\\d+\\s\\s\\s\\s\\s\\s\\s\\d+"
  (dplyr_file<- grep(match,text,value=TRUE))
  y<-str_split(dplyr_file, "\n", simplify=TRUE)
  y2<-str_split(y,"\\s+", simplify=TRUE)
  y3<-as.matrix(y2)
  y4<-t(y3)
  y5<-mapply(y4, FUN = as.numeric)
  y5<-matrix(data=y5,ncol=25, nrow=12)
  matriz<-y5
  funcionLista(matriz)
  #EXTRAER MEJORES SOLUCIONES
  anexo<-t(lista)
  matrizTemp<-t(rbind(matriz,anexo))
  matrizTemp<-cbind(matrizTemp,1:nrow(matrizTemp))
  matrizTemp<-matrizTemp[order(matrizTemp[,13],decreasing=TRUE),]
  top10<-matrizTemp[1:10,14]
  
  for(i in 1:10)
  {
    if (top10[i]<9)
    {
      answer<-str_c("The DNA sequence #   ",top10[i]," is:")
      stop<-str_c("The DNA sequence #   ",top10[i]+1," is:")
    }
    else if (top10[i]==9)
    {
      answer<-str_c("The DNA sequence #   ",top10[i]," is:")
      stop<-str_c("The DNA sequence #  ",top10[i]+1," is:")
    }   
    else if (top10[i]<99 && top10[i]>=10)
    {
      answer<-str_c("The DNA sequence #  ",top10[i]," is:")
      stop<-str_c("The DNA sequence #  ",top10[i]+1," is:")
    }
    else if (top10[i]==99)
    {
      answer<-str_c("The DNA sequence #  ",top10[i]," is:")
      stop<-str_c("The DNA sequence #  ",top10[i]+1," is:")
    }
    else{  answer<-str_c("The DNA sequence # ",top10[i]," is:")
    stop<-str_c("The DNA sequence # ",top10[i]+1," is:")}
    
    x<-grepl(answer, text)
    x2<-which(x,arr.ind=TRUE)
    print(x2)
    x3<-grepl(stop, text)
    x4<-which(x3, arr.ind=TRUE)
    print(x4)
    label <- paste("solucion", i, sep="_")
    assign(label, text[x2:x4-19])
  }
  
  write("Your top 10 solutions are: \n", file="finaltest6.txt", append=TRUE)
  write(top10, file="finaltest6.txt", append=TRUE)
  write(solucion_1, file="finaltest6.txt", append=TRUE)
  write(solucion_2, file="finaltest6.txt", append=TRUE)
  write(solucion_3, file="finaltest6.txt", append=TRUE)
  write(solucion_4, file="finaltest6.txt", append=TRUE)
  write(solucion_5, file="finaltest6.txt", append=TRUE)
  write(solucion_6, file="finaltest6.txt", append=TRUE)
  write(solucion_7, file="finaltest6.txt", append=TRUE)
  write(solucion_8, file="finaltest6.txt", append=TRUE)
  write(solucion_9, file="finaltest6.txt", append=TRUE)
  write(solucion_10, file="finaltest6.txt", append=TRUE)
  
  
  send.mail(from = "amatsuri.mr@gmail.com",
            to = email,
            subject = "Oligo Design Results!",
            body = "   ",
            attach.files = "finaltest6.txt",
            smtp = list(host.name = "aspmx.l.google.com", port = 25),
            authenticate = FALSE,
            send = TRUE)
}