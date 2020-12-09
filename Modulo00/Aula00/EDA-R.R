set.seed(123)
?airquality

airquality

str(airquality)
#amostragem
?sample

sample(airquality$Temp, size=10, replace = TRUE )


sample(1:6, size=10, replace = TRUE )
sample(1:6, size=6, replace = F )

sample(1:3, size = 100, replace = TRUE, prob = c(0.7,0.2,0.1) )


i <- sample(1:nrow(airquality), size=25, replace = FALSE )
i
amostra<-  airquality[i, ]

amostra[ !is.na(amostra$Solar.R),]

str(amostra)

summary(amostra)




# Variáveis Categóricas

df <- mtcars

df$am <- factor(df$am,
                levels = c(0,1),
                labels = c("Automático", "Manual"))

df$vs <- factor(df$vs,
                levels = c(0,1),
                labels = c("V", "Linha"))

df$am_alt <- NULL
summary(df)

freq <- table(df$am)



v <- sample(1:5,size = 20, replace = T)


v[v>2] <- 8
v<- factor(v, levels=c(1,2,8),
           labels = c("C","E","O"))
table(v)


#### voltando
freq <- table(df$am)
rel <- prop.table(freq)

cbind(freq,rel)


barplot(freq, ylim=c(0,20), ylab = "frequencia" , main = "título"  )
barplot(rel, ylab = "frequencia relativa" , main = "título" , col=c(1,2) )



pie(freq, init.angle = 90, lty = 14, )

df$cyl <- factor(mtcars$cyl,
                 levels = c(4,6,8),
                 labels = c("4 cilindros", "6 cilindros", "8 cilindros"),
                 ordered = T)




pie(f, init.angle = 90)


freq <- table(df$cyl)
rel <- prop.table(freq)

tb <- cbind(freq, rel, Afreq=cumsum(freq), Arel=cumsum(rel))

View(tb)

addmargins(freq, FUN = median)

tb <- cbind(addmargins(freq),
            addmargins(rel),
            Afreq=c(cumsum(freq),NA),
            Arel=c(cumsum(rel),NA))

tb

table(df$carb)

plot(table(df$carb), ylab="frequencia", xlab="carburadores")


prop.table(table(df$cyl, df$am, df$vs))

freq <- table(df$carb)

plot(freq, ylab="frequencia", xlab="carburadores")

plot(cumsum(prop.table(freq)),
     type = "S",
     ylab="frequencia Acumulada",
     xlab="carburadores")

?plot



sort(df$mpg)

amp <- max(df$mpg) - min(df$mpg)
amp
n <- length(df$mpg)
n
k <- sqrt(n)
k
h <- amp/k
h
max(df$mpg)
min(df$mpg)

quebra <- seq(from=10 , to= 35, by=5 )
quebra

freq <- table(cut(df$mpg, breaks = quebra, right = F))
cbind(freq)
barplot(freq, space = 0)


hist(df$mpg, freq = T, main="", xlab = "mpg")
arrows(0,0,30,6)


median(airquality$Ozone)
summary(airquality$Ozone)

median(airquality$Ozone, na.rm = T)

mean(airquality$Ozone, na.rm = T)

AMP <- max(airquality$Temp) - min(airquality$Temp)

mt <- mean(airquality$Temp)

DVM <- sum(abs(airquality$Temp - mt)) / length(airquality$Temp)
DVM

mean(airquality$Temp)
sqrt(var(airquality$Temp, na.rm = T))

sd(airquality$Temp)

sd(airquality$Temp)/mean(airquality$Temp) * 100

sd (airquality$Ozone, na.rm = T) /
  mean(airquality$Ozone, na.rm = T) * 100




cbind(count=table(cut(df$mpg, breaks = quantile(df$mpg), right = F)))


cbind(count=table(
          cut(df$mpg,
              breaks =quantile(df$mpg, probs = seq(0,1,by=0.1)),
              right = F)))



freq <- table(
  cut(df$mpg,
      breaks =quantile(df$mpg, probs = seq(0,1,by=0.2)),
      right = F))

barplot(freq)


fivenum(df$mpg)

InsectSprays
fn <- rbind( A=fivenum(InsectSprays[InsectSprays[,2]=="A",1]),
             B=fivenum(InsectSprays[InsectSprays[,2]=="B",1]),
             C=fivenum(InsectSprays[InsectSprays[,2]=="C",1]),
             D=fivenum(InsectSprays[InsectSprays[,2]=="D",1]),
             E=fivenum(InsectSprays[InsectSprays[,2]=="E",1]),
             F=fivenum(InsectSprays[InsectSprays[,2]=="F",1]))

colnames(fn) <- c("Min","Q1","Q2","Q3","Max")
View(fn)


boxplot(airquality$Temp)

boxplot(mtcars$mpg ~ mtcars$carb)

freq <- table(df$cyl , df$am)
barplot(freq, col = c(1,4,3)   )

as.integer(factor(rownames(freq)))



boxplot(InsectSprays$count ~ InsectSprays$spray)


airquality


plot(airquality$Temp, type = "l")


ggplot(mtcars, mapping = aes(y=mpg, fill=cyl )) + geom_boxplot()
install.packages("tidyverse")
install.packages("ggplot2")
library(ggplot2)


DataExplorer::create_report(df)

library(tidyverse)

mtcars %>% summary()
summary(mtcars)

mtcars %>%
  mutate(wt = wt*1000) %>%
  filter(carb > 3) %>%
  group_by(gear) %>%
  summarise(count=n() , max(mpg), min(wt))

#install.packages("lubridate")
library(lubridate)
?lubridate::as_date()


data <- dmy("10-10-2018")
data
data <- dmy_hms("10-10-2018 10:24:12")
data


library(stringi)
library(stringr)

reticulate
stringr::str_replace_all()
stringi::stri_replace_all_fixed("uahushah","a", "#")
stringdist::stringdist("Danilo", "Danillo")
