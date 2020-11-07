#código fonte

#script

install.packages("tidyverse")

library(tidyverse)

ls()

variavel <- 10
numero <- 20
letra <- "Z"
ls()

print("Olá Mundo!!!")

runif(100)

help(runif)

runif(10,min=1, max=6)

round(
  runif(10,min=1, max=6),
  digits = 0
  )

?runif


apropos("unif")

?punif


apropos("pois")
?poisson.test


a <- 2
b <- 3

c <- a + b
c

ls()

?rm

rm(letra)
ls()
rm(list = c("numero","variavel"))
ls()


rm(list = ls())

funcao <- function(){
  print("minha função")
}

funcao()

funcao

funcao_arg <- function(texto){
  print(texto)
}

funcao_arg("meu texto")


soma <- function(a,b){
  return(a+b)
}

soma(3,5)

soma(a=3,b=5)

quadrado <- function(x){
  x^2
}

quadrado(2)
quadrado(4)
x <- 9
quadrado(4)

typeof(x)
x <- "a"
typeof(x)

x <- 8
x <- as.character(x)
x
x <- "9"

if(x=="9" & is.numeric(x)){
  print("x é 9")
} else{
  print("x Não é número 9")
}



##### Comentario

### vetores


vet <- c(1,2,3,4,5,6)
vet

typeof(vet)

length(vet)


quadrado(vet)

vet <- c(1,2,3,4,5,6,"a")
typeof(vet)
vet
quadrado(vet)

vet <- c(1,2,3,4,5,6)
vet
vet
vet + vet


vet
vet + 10
vet * 10

outro_vet <- c(20, 100, 300, 4000)
vet
outro_vet
vet + outro_vet



?seq()

seq(from=0, to=10, by=100)
seq(from=0, to=10, by=0.05)

1:100

1:length(outro_vet)


#lacos de repetição
variavel <- 10
i <- 0
while (i < variavel) {
  i <- i + 1
  print(paste("o valor de i é ", i ))
}
i





LETTERS
vetor <- LETTERS
i <- 1
while(i <= length(vetor)) {
  print(vetor[i])
  i <- i + 1
}

for(v in vetor){
  print(v)
}


vet
vet <- as.character(vet)
as.numeric(vet)



vetor <- seq(from=1, to =12)


matrix(vetor, nrow=4, ncol=3, byrow = TRUE)

matrix(vetor, nrow=4, ncol=5, byrow = TRUE)

matriz <- matrix(vetor, nrow=4, ncol=3, byrow = TRUE)

vet <- c(100,200,300)
vet
matriz

matriz <- rbind(matriz, vet)
matriz

matriz <- cbind(matriz, vet)

matriz[3,2]

matriz[2,]

matriz[,3]

matriz[3:5,3]


vet <- 1:100


vet[-c(50,60:70)]

vet[c(50,60:70)]




typeof(vet)


lista <- list(1:10,"um texto", matriz)
lista[2]
lista[[3]][,4]

lista <- list(n=1:10,
              texto="um texto",
              m=matriz)

lista$texto
lista$m[2,3]
lista$n

lista["texto"]
lista["m"]

lista$m

#Data frame

df <- data.frame(
  nome = c("Luis","João","Arnaldo","Ana"),
  sexo = c("M","M","M","F"),
  idade = c(12,34,35,18)
)


df
dim(df)
nrow(df)
ncol(df)

length(df)

df[,2]
df[,"sexo"]
df$sexo

lista

df


colnames(df)
colnames(df) <- c("nome","genero","idade")
df

rownames(df)

?str

str(df)

summary(df)

head(mtcars, n = 2)
tail(mtcars, n=5)

str(mtcars)
summary(mtcars)

df
as.matrix(df)

df
df <- cbind(df, altura=c(1.90, 1.75, 1.65, 1.70))

df <- rbind(df, list(nome="Maria", genero="F", idade=42, altura=1.55))

df <- rbind(df, list("Joana", "F", 37, 1.62))

runif(10, 0, 5)
runif(10, max=5, min=0)


## Importando dados

dados <- scan()
dados

write.csv2(mtcars,
           file = "~/Desktop/mtcars.csv",
           row.names = F,
           fileEncoding = "UTF-8")


mtc2 <- read.csv2(file = "~/Desktop/mtcars.csv")

mtc3 <- read.table(file = "~/Desktop/mtcars.csv",
                   sep=";",
                   quote = "\"",
                   header = TRUE,
                   dec=",")
mtc3


?read.csv

library(xlsx)
xlsx::read.xlsx(file = "caminho do arquivo",
                sheetName ="Notas" )


write.table(mtc2,
            file = "~/Desktop/mtcars-e.txt",
            sep = "|",
            dec = ",",
            na = "NULL",
            row.names = FALSE)


mmm <- read.table(
            file = "~/Desktop/mtcars-e.txt",
            sep = "|",
            dec = ",",
            na = "NULL",
            header = TRUE)
mmm


getwd()
setwd("~/Desktop/HD750/Documentos/Estudos/Itaipu/EDA")

ls()
dir()

dir.create("teste")
dir()

setwd("teste")

getwd()


dput(quadrado, file = "qq.R")

qq <- dget(file = "qq.R")
qq(10)


qq

mmm
save(mmm,  file = "mmm.rda")
mmm <- load("mmm.rda")

saveRDS(mtc2, file = "mmm.rda.gzip", compress = "gzip")
readRDS("mmm.rda.gzip")

#
set.seed(123)
x <- runif(20, min = 10, max = 20)
x

x[15]
x[15:19]

x[x > 17]
x[x < 12]


x[x < 17 & x > 12]

x[x > 17 | x < 12]



l <- LETTERS[1:10]
l[ l=="F" ]



which(l=="F" | l=="G" )

which(l %in% c("E", "F", "G"))



df[df$idade > 20 & df$genero=="M",  ]

df[-2,-1]


df[df$idade >= 18 & df$genero == "F", c("nome","idade") ]

#dplyr


l <- data.frame(id=1:26 , minusculas = letters[1:26])
l <- l[-c(1,10,15,20),]
l

L <- data.frame(indice = 26:1, maiusculas = LETTERS[26:1])
L <- L[-c(2,11,16,21),]
L

str(l)
str(L)
# inner join
merge(L, l , by.x = "indice", by.y = "id")

# left join
merge(L, l , by.x = "indice", by.y = "id", all.x = T)

# right join
mm <- merge(L, l , by.x = "indice", by.y = "id", all.y = T)
mm
mm[ is.na(mm$maiusculas), ]
mm[ !is.na(mm$maiusculas), ]

# full join
mm <- merge(L, l , by.x = "indice", by.y = "id",all.x = T, all.y = T)
mm










hist(mtcars$mpg, main="", freq = T, xlab="Milhas por galão", ylab="Frequência")
