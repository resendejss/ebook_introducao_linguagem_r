################################################################################
## CAPITULO 05 - Funcoes no R
## jean resende
################################################################################
# funcao que calcula area de um quadrado
area_qud <- function(x, y) {
  x * y
}

# testes
area_qud(2,4)
area_qud(3,7)
area_qud(9,9)

# funcao do calculo do ph
ph <- function(h) {
  -log10(h)
}

# testes
ph(0.001)
ph(0.00001)

# funcao que calcula area de um quadrado
area_qud <- function(x, y) { # inicia o algoritmo da funcao
  x * y # calculo
} # fim do algoritmo

# criando um objeto vazio
test_01 <- numeric(0)

# vamos utilizar for para printar na tela
for(i in 1:5){
  test_01[i] <- print(i)
}

# outra forma de printar na tela
for(letras in letters[1:10]){
  print(letras)
}

contagem_10s <- 1
while (contagem_10s <= 10) {
  print(contagem_10s)
  contagem_10s <- contagem_10s + 1
  Sys.sleep(1)
}

j <- 10
repeat{
  print(j)
  j <- j+10
  if(j>100) break()
}


njogos <- 15
numeros <- matrix(NA,6,njogos)
numeros

for (i in 1:njogos) {
  numeros[,i] <- sample(1:60,6)
}
numeros

# construindo a funcao
megsen <- function(njogos){
  numeros <- matrix(NA,6,njogos)
  for(i in 1:njogos){
    numeros[,i]<-sample(1:60,6)
  }
  return(numeros)
}

# testando a funcao
megsen(20)
megsen(5)
