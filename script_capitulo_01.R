################################################################################
## CAPITULO 01 - Introducao a linguagem R
## jean resende
################################################################################
print('Ola Mundo!')   # impressao na tela
paste('amostra', 1:5) # impressao na tela
mean(1:15)   # media do conjunto de dados de 1 a 15
?mean        # o que a funcao faz - forma 1
??plotting   # busca por topicos que contenham "plotting" - forma 2
help("mean") # o que a funcao faz - forma 2 
help.search("plotting") # busca por topicos que contenham "plotting" - forma 2
example(plot)           # exemplo do uso da funcao

install.packages("installr") # instalacao do pacote do CRAN

# instalacao do pacote DESeq2
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("DESeq2")

library(installr) # carregando pacote

vignette("dplyr") # vinheta do dplyr
################################################################################