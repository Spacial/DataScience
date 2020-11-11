# Exercício prático de R
# Aluno: Spacial

## Liste o diretório corrente
getwd()

## Liste os arquivos do diretorio
list.files(getwd())

## Pesquise uma função para criar um diretório
?dir

## pesquise o manual para essa funçao
?dir.create

## Crie um diretório com o nome "exercicioR"
dir.create("exercicioR")

## Entre no diretório criado
setwd("exercicioR")

## crie uma função que multiplique dois valores
multivec <- function(vec1, vec2){
    return(vec1 * vec2)
}

## crie uma funcçao que subtraia dois valores
subtrair <- function (x, y){
  return(x-y)
}

## crie uma funcao que eleve um valor ao quadrado
quadr <- function(x){
  return(x^2)
}

## pesquise uma função que copie os arquivos e consulte a sua utilização
?file.copy 

copiaArq <- function(arqOrigem, dirDestino){
  file.copy(arqOrigem, dirDestino)
}

## copie o arquivo carros.csv da area de trabalho para a pasta.
copiaArq("carros.csv", "exercicioR")

#Objetivo: fazer a regressão linear de mpg em relaçao a hp
#Há relaçao entre as variáveis?
#-- tem que investigar, mas parece que sim
## qual o sentido?
#-- maior o hp, maior o consumo

## carregue o arquivo para um data frame
carros <- read.csv("carros.csv", sep=";", dec=",")

## veja o resumo do data frame
summary(carros)

## os dados OK?
#-- nao

#por que?
#-- mpg ta como string (usar dec="," para ler como numero) e temos NaN 

#se não estiver ok, remova os dados inconsistentes do data frame
carros_clean <- na.omit(carros)

#plote os gráficos de dispersão e os histogramas das variáveis hp e mpg
#input<- carros_clean[,c('mpg','hp')]
plot(x=carros_clean$mpg, y=carros_clean$hp, main="mpg x hp")
hist(carros_clean$mpg)
hist(carros_clean$hp)

#calcule a media da coluna mpg e atribua a uma variável mean_y
mean_y <- mean(carros_clean$mpg)

#calcule a media da coluna hp e atribua a uma variável mean_x
mean_x <- mean(carros_clean$hp)

#crie um vetor com a diferenca entre o valor e sua média (xi - mean_x) utilizando a funcao de diferenca criada
media_hp <- subtrair(carros_clean$hp, mean_x)

#crie um vetor com a diferenca entre o valor e sua média (yi - mean_y) utilizando a funcao de diferenca criada
media_mpg <- subtrair(carros_clean$mpg, mean_y)

#crie um vetor com o quadrado da diferenca de x criado utilizando a funcao de quadrado criada
quadiff_hp <- quadr(media_hp)

#crie um vetor com o produto das diferenca de x e y criado utilizando a funcao de subtração criada
#quadiff_hpmpg <- sum(media_hp)*sum(media_mpg)/sum(quadr(media_hp))
prod_dif_xy <- prod(media_hp, media_mpg)

#concatene os vetores criados com o data frame
carros_clean$mpg_media <- media_mpg
carros_clean$hp_media <- media_hp
carros_clean$mpg_quad <- quadiff_mpg
carros_clean$hp_quad <- quadiff_hp
carros_clean$prod_hpmpg <- prod_dif_xy

## agora calcule os coeficientes b e a para a reta de regressão com os vetores calculados
#b <- sum_prod_dif_xy/sum_dif_x2
#a <- y_bar- b*x_bar
#b <- sum(carros_clean$hp_media-carros_clean$mpg_media)
b <- sum(carros_clean$prod_hpmpg)/sum(carros_clean$hp_quad)
#a <- sum(carros_clean$mpg_media)/sum(carros_clean$mpg_quad)
a <- mean_y - b*mean_x
## Com os coeficientes criados crie uma função que estime o valor de mpg dado um valor de hp
## y = a + bx
fy <- function(x){
  return(a+b*x)
}

curve(fy(x), from = 40, to = 400, add = T, col = "red")
## crie um vetor com os valores preditos f(x) os valores de hp
carros_clean$predicao <- fy(carros_clean$hp)

## concatene os valores preditos no data frame
# já estã

## calcule os as variaçoes explicada, nao explicada e total

## Calcule o coeficiente de Determinação

## Calcule a Covariancia

## Calcule a Correlação

## Plote a curva no gráfico de dispersao. Dica: utilize a funcao curve( add = TRUE)

## Plote um histograma com os RESÍDUOS não explicados

## Escreva sobre o que encontrou e seus resultados obtidos

## salve o data frame como csv com o nome resultado_carros.csv

## salve a funcao de regressao para o arquivo linear_carros.R

## salve o script dentro da pasta.
