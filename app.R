library(shiny)
library(shinythemes)
source("writing.R")


ui<- fluidPage(
  theme= shinytheme("united"),
  tags$img(src="https://static1.squarespace.com/static/ta/5384da9ce4b0f219e1fa3aa9/122/assets/ellington_lab_logo.svg", width = "400px", height = "200px", align="right"),  
  tags$h1(style="font-family:Ubuntu","Optimized Oligonucleotide Design for PCR-based Gene Synthesis \n\n"),
  tags$br(),
  tags$br(),
  fluidRow(
  column(3,textInput(inputId="email", label= "E-mail Adress: ")),
  column(3,textInput(inputId="titl", label= "Job title: "))
  ),
  checkboxInput(inputId="Tbio", label= "TBIO Mode"),
  checkboxInput(inputId="ngia", label="No gaps in assembly"),
  fluidRow(
  column(3,textInput(inputId="aT", label= "Annealing Temperature: ", value="62")),
  column(3,textInput(inputId="oL", label= "Oligo Length: ", value="70")),
  tags$br(),
  column(3,checkboxInput(inputId="lRandom", label="RANDOM"))
  ),
  fluidRow(
  column(3,textInput(inputId="cft", label="Codon Frequency Threshold: ", value="10")),
  tags$br(), tags$br(),
  column(3,checkboxInput(inputId="cftRandom", label="RANDOM")),
  column(3,checkboxInput(inputId="cftStrict", label="STRICT")),
  column(3,checkboxInput(inputId="cftScored", label="SCORED")),
  tags$br(), tags$br(), tags$br(), tags$br(),
  column(3,textAreaInput(inputId="cod", label= "Enter Custom Codon Frequency Table manually: ", width = "500px"))
  ),
  fluidRow(
  column(3, textInput(inputId="oC", label="Oligo Concentration: ", value= "1E-7")),
  column(3,textInput(inputId="sC", label="Sodium Concentration: ", value= "0.05")),
  column(3,textInput(inputId="mC", label="Magnesium Concentration: ", value= "0.002"))
  ),
  textAreaInput(inputId="pat", label="**OPTIONAL** Input your own site to be excluded from the protein coding region(s) of the synthetic gene:", width="500px"),
  selectInput(inputId="typeOfSeq", label="Sequence(s): ", choices=c("protein", "nucleotide") ),
  
  checkboxInput(inputId="reverseS", label="Reverse Sequence"),
  checkboxInput(inputId="seqGap", label="Fix Sequence in Gap"),
  textAreaInput(inputId="sequence", label="Enter sequence manually: ", width= "500px"),
  actionButton(inputId = "input_action", label = "SUBMIT"))


#textInput()
#submitButton()
#radioButtons()
#textOutput()


server<- function(input, output){
  

  email <- eventReactive( input$input_action, {
    input$email})
  titl <- eventReactive( input$input_action, {
    input$titl})
  TBIOMode <- eventReactive( input$input_action, {
    input$Tbio})
  NONGAPSINASSEMBLY <- eventReactive( input$input_action, {
    input$ngia})
  annealingTemp <- eventReactive( input$input_action, {
    input$aT})
  oligoLength <- eventReactive( input$input_action, {
    input$oL})
  lengthRandom <- eventReactive( input$input_action, {
    input$lRandom})
  codonFrequencyThreshold <- eventReactive( input$input_action, {
    input$cft})  
  cftRandom <- eventReactive( input$input_action, {
    input$cftRandom})
  cftStrict <- eventReactive( input$input_action, {
    input$cftStrict})
  cftScored <- eventReactive( input$input_action, {
    input$cftScored})
  oligoConcentration <- eventReactive( input$input_action, {
    input$oC})
  sodiumConcentration <- eventReactive( input$input_action, {
    input$sC})
  magnesiumConcentration <- eventReactive( input$input_action, {
    input$mC})
  cod <- eventReactive( input$input_action, {
    input$cod})
  pat <- eventReactive( input$input_action, {
    input$pat})
  typeOfSeq <- eventReactive( input$input_action, {
    input$typeOfSeq})
  reverse <- eventReactive( input$input_action, {
    input$reverseS})
  gapfix <- eventReactive( input$input_action, {
    input$seqGap})
  sequence <- eventReactive( input$input_action, {
    input$sequence})
  observeEvent(input$input_action, {generatingInput( email(), titl(), TBIOMode(), NONGAPSINASSEMBLY(), annealingTemp(), oligoLength(), lengthRandom(), codonFrequencyThreshold(), cftRandom(), cftStrict(), cftScored(), oligoConcentration(), sodiumConcentration(), magnesiumConcentration(), cod(), pat(), typeOfSeq(), reverse(), gapfix(), sequence())})
  
  }

shinyApp(ui=ui, server=server)
