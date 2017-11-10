library(stringr)
source("b1.R")

generatingInput<- function (email,titl,TBIOMode,NONGAPSINASSEMBLY,annealingTemp,oligoLength,lengthRandom,codonFrequencyThreshold,cftRandom,cftStrict,cftScored,oligoConcentration,sodiumConcentration,magnesiumConcentration,cod,pat,typeOfSeq,reverse,gapfix,sequence)

  
  { Jfile<-paste('input_',titl,'.txt')
    Joutput<-paste('output_',titl,'.txt')
    JoutputU<-paste('LOGFILE "output_',titl,'.txt" \n')
  
write(" timelimit 7200 \n", file=Jfile, append=TRUE)
write(JoutputU, file=Jfile, append=TRUE)

ad<-paste( 'EMAIL  "', email,'" ' )
write(ad, file=Jfile, append=TRUE)

if (TBIOMode==TRUE)
{write("tbio \n", file=Jfile, append=TRUE)}

if (NONGAPSINASSEMBLY==TRUE)
{write("nogaps \n", file=Jfile, append=TRUE)}

dt<-"melting low "
tLow<-paste(dt, annealingTemp)
write(tLow, file=Jfile, append=TRUE)


if (lengthRandom==FALSE)
{
  dl<-"length low "
  lLow<-paste(dl, oligoLength)
  write(lLow, file=Jfile, append=TRUE)
} else {
  dl<-"length low "
  lLow<-paste(dl, "random")
  write(lLow, file=Jfile, append=TRUE)}

# Adding high will result in a range for both of the previous parameters


ft<-"frequency threshold "
th<-paste(ft, codonFrequencyThreshold)

if (cftRandom==TRUE)
{th<-paste(th," random")}
if (cftStrict==TRUE)
{th<-paste(th," strict")}
if (cftScored==TRUE)
{th<-paste(th," scored")}
write(th, file=Jfile, append=TRUE)

concentrations <- paste("concentration oligo ",oligoConcentration," sodium ",sodiumConcentration," magnesium ")
write(concentrations, file=Jfile, append=TRUE)

sol <- paste("solutions ","25")
write(sol, file=Jfile, append=TRUE)


firstLineCod="CODOn \n"
write(firstLineCod,file=Jfile, append=TRUE)
write(cod, file=Jfile, append=TRUE)
endLineCod="//"
write(endLineCod, file=Jfile, append=TRUE)

#Pattern

if (is.null(pat)==FALSE)
{
  firstLinePat="PATTern \n"
  write(firstLinePat,file=Jfile, append=TRUE)
  write(pat, file=Jfile, append=TRUE)
  endLinePat="//"
  write(endLinePat, file=Jfile, append=TRUE)
}

#Protein Sequence
if (typeOfSeq=="protein")
{
  if ((reverse==FALSE) & (gapfix==FALSE)) {firstLineProt="PROTein \n"}
  if((reverse==TRUE) & (gapfix==TRUE)) {firstLineProt="PROTein REVERSE GAPFIX \n"}
  if((reverse==TRUE) & (gapfix==FALSE)) {firstLineProt="PROTein REVERSE \n"}
  if((reverse==FALSE) & (gapfix==TRUE)) {firstLineProt="PROTein GAPFIX \n"}
  
  write(firstLineProt,file=Jfile, append=TRUE)
  write(sequence, file=Jfile, append=TRUE)
  endLineProt="//"
  write(endLineProt, file=Jfile, append=TRUE)
}

#cat("World",file="outfile.txt",append=TRUE)
#writeLines(txt, "outfile.txt")


#Nucleotide Sequence

if (typeOfSeq=="nucleotide")
{
  if ((reverse==FALSE) & (gapfix==FALSE)) {firstLineNucl="NUCLeotide \n"} 
  if((reverse==TRUE) & (gapfix==TRUE)) {firstLineNucl="NUCLeotide REVERSE GAPFIX \n"}
  if((reverse==TRUE) & (gapfix==FALSE)) {firstLineNucl="NUCLeotide REVERSE \n"}
  if((reverse==FALSE) & (gapfix==TRUE)) {firstLineNucl="NUCLeotide GAPFIX \n"}
  
  write(firstLineNucl,file=Jfile, append=TRUE)
  write(sequence, file=Jfile, append=TRUE)
  endLineNucl="//"
  write(endLineNucl, file=Jfile, append=TRUE)
  print(Jfile)
  JfileU<-paste('"./',Jfile,'"',sep="")
  print(JfileU)

}
#system2('./dnaworks', input=readLines(Jfile))
topsolutions(Jfile, JfileU, Joutput,email,titl)


}

