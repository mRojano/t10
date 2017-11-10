#function List

funcionLista <- function(matriz)
{
n<-1
lista2<-list(rep(0,25))
lista<<-mapply(lista2, FUN = as.numeric) 

{
while (n<=25)
{
if (matriz[10,n]==12)
{lista[n]<<- lista[n]+12000}
if(matriz[12,n]==0)
{lista[n]<<- lista[n]+8000}
if(matriz[8,n]>15)
{lista[n]<<-lista[n]+((5000/15)*matriz[8,n])}
if(matriz[7,n]<3)
{lista[n]<<- lista[n]+(7000*(3/matriz[7,n]))}
lista[n]<<-lista[n]+((1000/10000)*matriz[6,n])
n=n+1
}
  
#while (n>99 & n<294)
#{

  #if (matriz[9,n]==12)
  #{lista[n]<<- lista[n]+12000}
  #if (matriz[11,n]==0)
  #{lista[n]<<-lista[n]+8000}
  #if(matriz[7,n]>15)
  #{lista[n]<<-lista[n]+((5000/15)*matriz[7,n])}
  #if(matriz[6,n]<3)
  #{lista[n]<<- lista[n]+(7000*(3/matriz[6,n]))}
 #lista[n]<<-lista[n]+((1000/10000)*matriz[5,n])
 # n<-n+1
#}
}
print(lista)
return(lista)
}

