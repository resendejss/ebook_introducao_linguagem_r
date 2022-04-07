################################################################################
## CAPITULO 03 - Manipulacao de dados no R
## jean resende
################################################################################
# -- TIPOS DE VARIAVEIS --
## tipo caracter
caracter <- "string"

## tipo numerico inteiro
inteiro <- 7L

## tipo numerico decimal
decimal <- 7.5

## tipo logico
logico <- TRUE

# -- VERIFICACAO DE VARIAVEIS --

## funcao class()
class(caracter)
class(inteiro)
class(decimal)
class(logico)

## funcao is.
is.double(caracter)
is.numeric(caracter)
is.character(caracter)

is.double(decimal)
is.numeric(decimal)
is.integer(decimal)

# -- CONVERSAO DE VARIAVEIS --
## alguns exemplos de transformacoes
conv_decimal <- as.double(inteiro) # convertendo para decimal
conv_inteiro <- as.integer(decimal) # convertendo para inteiro
conv_caracter <- as.character(inteiro) # convertendo para caracter

# -- TRABALHANDO COM VALORES FALTANTES --
## Trabalhando com banco de dados do R
### verificar os bancos de dados
data ()  # disponiveis no R

### escolher o banco de dados iris para tralhar
data("iris")

### fazer uma copia do banco de dados
data_iris <- iris 

### remover o banco de dados do ambiente de trabalho
rm(iris) 

### estudar o banco de dados
?iris

### verificar o tipo do objeto
class(data_iris)

### "sentindo os dados" - resumo estatistico
summary(data_iris)

### verificar a ocorrencia de NA
all(is.na(data_iris$Sepal.Length)) == FALSE
all(is.na(data_iris$Sepal.Width)) == FALSE

### verificar se todo o objeto esta preenchido
all(complete.cases(data_iris$Sepal.Length)) == TRUE
all(complete.cases(data_iris$Sepal.Width)) == TRUE


## Trabalhando com seus dados (exemplo)
### criando banco de dados
coorte <- data.frame(
  barcode = c("A01B1", "A01B2", "A02B3"),
  sexo = as.factor(c("Feminino", "Feminino", "na")),
  fumante = as.factor(c(T, F, "")),
  idade = c(65, 68, 79)
)

### visualizar os dados
View(coorte)

### "sentindo os dados" - resumo estatistico
summary(coorte)

### vericar o conteudo de NA
is.na(coorte$sexo)== TRUE

### preencher com NA os valores faltantes
coorte$sexo[coorte$sexo == "na"] <- NA

### verificar se o objeto esta preenchido
complete.cases(coorte$fumante)

# -- DIRETORO DE TRABALHO --
## Verificar o diretorio de trabalho
getwd()

## Definir diretorio de trabalho
#setwd("caminho/onde/se/encontra/o/arquivo")

## Verificar quais arquivos estao no mesmo diretorio
dir()

# -- IMPORTACAO DE ARQUIVOS PARA O AMBIENTE R --
input_1 <- read.table(file = "ChickWeight.csv", header = T, sep = ",")
input_2 <- read.csv(file = "arquivo(,).csv", header = T)
input_3 <- read.csv2("arquivo(;).csv", header = T)

# -- IMPORTACAO DE ARQUIVOS COMPACTADOS PARA O AMBIENTE R --
library(readr)
input_zip <- read_delim("arquivo.zip", delim = ";")

# -- IMPORTACAO DE PARTES DE UM ARQUIVO PARA O AMBIENTE R --
## Vamos importar as quatro primeiras linhas de um arquivo
input_txt_4l <- read_delim("arquivo(;).csv",
                           delim = ";",
                           n_max = 4)
# -- IMPORTACAO DE ARQUIVOS DO EXCEL --
input_xlsx <- readxl::read_xlsx("arquivo.xlsx")

# -- EXPORTACAO DE ARQUIVOS DO AMBIENTE R PARA O UM DIRETORIO NO COMPUTADOR
## Exportando arquivo no diretorio de trabalho
write.csv(input_txt_4l, file = "teste.csv", row.names = F, quote = F)
write.csv2(input_txt_4l, file = "teste2.csv", row.names = F, quote = F)

## Exportando arquivo em um dirtorio especifico
#write.csv2(input_txt_4l, file = "~/caminho/do/diretorio/desejado/teste.csv, 
#           row.names = F, quote = F)

# -- MANIPULACAO DE DADOS --
## - FILTRAR DADOS -

### Criando banco de dados
alunos <- data.frame(
  nome = c("Jean", "Dan", "Pepe", "Bruna", "Rafaela"),
  altura = c(1.74, 1.70, 1.73, 1.65, 1.68),
  massa = c(69, 66, NA, 55, 53),
  sexo = c("masculino", "masculino", "masculino", "feminino", "feminino")
)

### Filtrar dados
library(dplyr)

#### filtrar observacoes com altura maior que 1.7
filter(alunos, altura >= 1.7)

#### filtrar observacoes com altura maior ou igual a 1.68 sendo do sexo feminino
filter(alunos, altura >= 1.68 & sexo == "feminino")

#### filtrar observacoes com altura maior ou igual a 1.68, sendo do sexo feminino e com massa maior que 50
filter(alunos, altura >= 1.68 & sexo == "feminino" & massa > 50)

# -- MANIPULACAO DE DADOS --
## - FILTRAR DADOS -
dplyr::filter(alunos, altura > 1.68 & sexo == "feminino")

# -- MANIPULACAO DE DADOS --
## - SELECIONAR VARIAVEIS -

### selecionar as colunas: nomes, sexo, massa
select(alunos, nome, sexo, massa)

### selecionar as colunas que terminam com o caracter: "a"
select(alunos, ends_with("a"))

### selecionar as colunas que contêm a sequência de caracteres: "no"
select(alunos, contains("no"))

### selecionar as colunas: 2, 3 e 4
select(alunos, 2:4)

### visualizar todas as linhas e as colunas 1, 2 e 3
alunos[,1:3]

### visuzalizar todas as linhas e as colunas 1, 4 e 3
alunos[, c(1,4,3)]

# -- MANIPULACAO DE DADOS --
## - INSERIR UMA COLUNA NO CONJUNTO DE DADOS -
### inserir uma coluna nos conjunto de dados com o resultado do imc de cada aluno
alunos_2 <- mutate(alunos, imc = (massa/(altura)^2))

# -- MANIPULACAO DE DADOS --
## - RENOMEAR UMA COLUNA DO CONJUNTO DE DADOS-
### renomear as colunas: altura para altura.m e massa para massa.kg
alunos <- rename(alunos,
                 altura.m = altura,
                 massa.kg = massa
)

# -- MANIPULACAO DE DADOS --
## - USO DE PIPES -
### Sem pipes
select(filter(alunos_2, imc >= 21), nome, massa)

### Com pipes
alunos_2 %>%
  filter(imc >= 21) %>%
  select(nome, massa, imc)

#### a media das massas e o somatorio das massas separando por sexo
alunos_2 %>%
  group_by(sexo) %>%
  summarise(media = mean(massa),
            somatorio = sum(massa))

#### a media, desvio padrao e quantidade das massas separando por sexo
alunos_2 %>%
  group_by(sexo) %>%
  summarise(media = mean(massa),
            sd.massa = sd(massa),
            total.massa = n())

#### a media, desvio padrao e quantidade das massas separando por sexo
alunos %>%
  group_by(sexo) %>%
  summarise(media = mean(massa.kg, na.rm = TRUE),
            sd.massa = sd(massa.kg, na.rm = T),
            total.massa = n())
# -- MANIPULACAO DE DADOS --
## - ORDENAR DADOS -
### ordenando de forma decrescente o objeto "alunos" atraves da variavel massa 
alunos %>%
  arrange(desc(massa.kg))

### agrupando por sexo e ordenando pela massa
alunos %>%
  group_by(sexo) %>%
  arrange(desc(massa.kg), .by_group = TRUE)

#### ---- note que informei ".by_grupo = TRUE" para poder ordenar primeiro o "feminino" e depois o "masculino" ----

# -- MANIPULACAO DE DADOS --
## - COMBINAR VARIAVEIS -
### criar conjunto de dados para combinar
complemento <- data.frame(
  nome = c("Jean", "Dan", "Pepe", "Bruna", "Rafaela"),
  tipo.sang = c("A+", "A+", "B-", "B+","B-")
)

### combinando objetos
bind_cols(alunos, complemento)

# -- MANIPULACAO DE DADOS --
## - UNIR VARIAVEIS A ESQUERDA -
### criar conjunto de dados para combinar
complemento_1 <- data.frame(
  nome = c("Dan", "Pepe"),
  estado = c("PR", "SC")
)

### combinando objetos
left_join(alunos, complemento_1)

# -- MANIPULACAO DE DADOS --
## - UNIR VARIAVEIS A DIREITA -
### criar conjunto de dados para combinar
alunos_4 <- data.frame(
  aluno = c("Jean", "Tamara", "Rafaela"),
  cid.natal = c("Umuarama-PR", "Curitiba-PR", "Maringa-PR")
)

### unindo o objeto da direita ao da esquerda considerando que as variaveis nome e aluno sao as mesmas
right_join(alunos_4, alunos, by = c("aluno" = "nome"))

# -- MANIPULACAO DE DADOS --
## - UNIR VARIAVEIS INTERNAMENTE -
### unindo objetos considerando que as variaveis nome e aluno sao as mesmas
inner_join(alunos_4, alunos, by = c("aluno" = "nome"))

# -- MANIPULACAO DE DADOS --
## - UNIR TODAS AS VARIAVEIS -
### unindo objetos considerando que as variaveis nome e aluno sao as mesmas
full_join(alunos_4, alunos, by = c("aluno" = "nome"))

# -- MANIPULACAO DE DADOS --
## - MESMAS CORRESPONDENCIAS -
### criar um novo conjunto de dados.
alunos_5 <- left_join(complemento_1, alunos)

### verificar observacoes de "alunos" que possuem correspondencias com observacoes com "alunos.5".
semi_join(alunos, alunos_5)

# -- MANIPULACAO DE DADOS --
## - CORRESPONDENCIAS DIFERENTES -
### verificar observacoes de "alunos" que nao possuem correspondencias com observacoes de "alunos.5"
anti_join(alunos, alunos_5)

# -- MANIPULACAO DE DADOS --
## - SEPARAR EM GRUPOS -
### exemplo 01
lista.1 <- list(alunos_5, alunos)
names(lista.1) <- c("A", "B")
lista.1

### exemplo 02
bind_rows(lista.1, .id = "turma")
