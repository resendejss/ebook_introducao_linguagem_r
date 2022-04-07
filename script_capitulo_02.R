################################################################################
## CAPITULO 02 - Principais objetos no R
## jean resende
################################################################################
# exemplos
a <- 4              # a recebe 4
x <- c(1,3,5,7,9)   # x recebe 1, 3, 5, 7 e 9
x                   # mostra os valores dentro de x

# criando o vetor
amostras <- c("a1","a2","a3","a4","a5")

# mostrando os valores dentro do vetor
amostras

# criando vetor
genes <- c("TP53", "KRAS", "BRAF", "PIK3CA", "APC")

# mostrando os valores dentro do vetor
genes

fumantes <- c(TRUE,FALSE,TRUE)
mutacao <- c(T,F,T)

# vetores
a <- c(1,3,5,7)
b <- c(2,4,6,8)

# soma de vetores
soma_V <- a+b
soma_V

# subtracao_V de vetores
subtacao_V <- b-a
subtacao_V

# produtos escalares
produto_V <- a*b
produto_V

# divisao
divisao_V <- b/a
divisao_V

# potenciacao
potenciacao <- a^b
potenciacao

# vetores
prostate <- c(65,58,59,63,78,67)

# valor maximo
max(prostate)

#valor minimo
min(prostate)

# minimo e maximo
range(prostate)

# soma dos valores
sum(prostate)

# numero de observacoes
length(prostate)

# media
mean(prostate)

# mediana
median(prostate)

# quartis
quantile(prostate)

# resumo
summary(prostate)

# acessando o segundo valor do objeto prostate
prostate[2]

# acessando mais de uma posicao
prostate[c(3,4,5)]

# acessando todos os valores exceto o primeiro
prostate[-1]

# se o primeiro valor estivesse errado e quisessemos 
# retifica-lo com o valor correto:
prostate[1] <- 66
prostate

# listando objetos
ls()

# removendo objetos
rm(prostate)

# gerando sequencias com seq(from, to, by)
a <- seq(2,10,2)
a

# gerando sequencias com :
b <- c(1:10)
b

# vetores sequenciais de caracteres
alfabeto <- letters[1:26] # letras minusculas
alfabeto

ALFABETO <- LETTERS[1:26] # letras maiusculas
ALFABETO

# gerando sequencias com rep ()
c <- rep(2,3)
c

prostate <- c(65,58,59,63,78,67)
d <- rep(prostate, 2)
d

# gerando dados
e <- runif(15, 10, 20) # gera 15 valores de 10 a 20 com dados uniformes
e
hist(e) # histograma de "e"

f <- rnorm(15, 5, 6)
f
hist(f)

# sem reposicao
sample(x = 1:15, size = 7)

# com reposicao
sample(x = 1:5, size = 7, replace = TRUE)

# ordem crescente
sort(prostate)

# ordem decrescente
sort(prostate, decreasing = TRUE)

order(prostate)

rank(prostate)

# exemplo 01
mat <- matrix(c(1,2,3,4,5,6,7,8,9), ncol = 3)
mat

# exemplo 02
x <- 1:8
x
mat_2 <- matrix(x, ncol = 2)
mat_2

# criando os vetores
a <- 1:5
b <- seq(from = 12,
         to = 20,
         by = 2)

# unindo vetores (colunas)
mat_3 <- cbind(a, b)
mat_3

# unindo vetores (linhas)
mat_4 <- rbind(a, b)
mat_4

# acessando o elemento da terceira linha e segunda coluna
mat_3[3, 2]

# acessando a primeira coluna e todas as linhas
mat_3[, 1]

# acessando as duas primeiras linhas e todas as colunas
mat_3[1:2, ]

# consultando os bancos de dados disponiveis
data()

# acessando um banco de dados
data("iris")

# colocando os dados "iris" dentro de um objeto
dados <- iris

# remove iris, evitando dados duplicados na "workspace"
rm(iris)

# construindo uma tabela de metadados de pacientes
metadados_pac <- data.frame(
  paciente = c("A01", "A02", "B03", "B05", "C01"),
  idade = c(45, 48, 65, 54, 72),
  sexo = c("masculino", "masculino", "feminino", "masculino", "feminino"),
  fumante = c(TRUE, FALSE, FALSE, FALSE, TRUE)
)

# visualizando o data frame no console
metadados_pac

# acessando informacoes sobre o banco de dados
?iris

# visualizando 5 linhas e 5 colunas
dados[1:5, 1:5]

# nome das variaveis
names(dados)

# acessando uma variavel
dados$Species

# criando vetores
x <- c(1:10)
y <- letters

# criando um lista
a <- list(metadados_pac, x, y)

# acessando elementos em uma lista
a[[3]]
################################################################################