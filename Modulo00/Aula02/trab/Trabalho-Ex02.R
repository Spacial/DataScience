# Code licensed under GPL 3 or superior
# spacial_AT@gmail_DOT_com

# install.packages("viridis")
library(viridis)
# install.packages("hnp")
library(hnp)
# install.packages("patchwork")
library(patchwork)
library(ggplot2)
# install.packages("latticeExtra")
# library(latticeExtra)
# library(MASS)
# install.packages("GGally")
# install.packages("astrolibR")
library(astrolibR)
# library(GGally)
# install.packages("broom")
# library(broom)
# install.packages("astroFns")
library(astroFns)
# manipular dataframes
library(data.table)
library(forecast)
# install.packages("MLmetrics")
library(MLmetrics)
# install.packages("xts")
library(xts)
library("TTR")
library("forecast")
# install.packages("timeSeries")
library(timeSeries)
library(tidyr)
library(dplyr)
# install.packages("ggpmisc")
library(ggpmisc)

# antes da leitura
aavso_data <- read.csv2("aavso_ao_data_clean.csv", sep= ",")
# aavso_data <- scan("aavso_ao_data_clean.csv", sep=",")
head(aavso_data)

Dados_preNA <- data.frame(date=as.Date(jd2ymd(as.double(aavso_data$Date))))
Dados_preNA$magnitude <- as.double(aavso_data$Magnitude)
Dados <- Dados_preNA[complete.cases(Dados_preNA),]

summary(Dados)
attach(Dados)

ggplot(Dados,
       aes(x= date,
           y= magnitude,
           color= (magnitude),
           alpha= 0.5),
       ylim= c(-10, 14)) +
  geom_point(shape= 16,
             size= 2,
             show.legend= FALSE,
             alpha= 0.6) +
  theme_minimal() +
  theme(axis.title= element_text(color= "black",
                                  size= 15,
                                  face= 2))

attach(Dados)
mag_out_rm <- magnitude[!magnitude %in% boxplot.stats(magnitude)$out]    # Remove outliers
length(magnitude)
length(mag_out_rm)
outlierReplace <- function(dataframe, cols, rows, newValue= NA) {
  if (any(rows)) {
    set(dataframe, rows, cols, newValue)
  }
}
outlierReplace(Dados,
               c("magnitude"),
               which(Dados$magnitude > 3),
               NA)
deattach(Dados)

ggplot(Dados,
       aes(x= date,
           y= magnitude,
           color= (magnitude),
           alpha= 0.5))+
  geom_point(shape= 16,
             size= 2,
             show.legend= FALSE,
             alpha= 0.6) +
  theme_minimal() +
  theme(axis.title= element_text(color= "black",
                                  size= 15,
                                  face= 2))

ggplot(Dados)+
  geom_line(aes(x= date,
                y= magnitude,
                color= (magnitude),
                alpha= 0.5)) +
  theme_minimal() +
  theme(axis.title= element_text(color= "black",
                                  size= 15,
                                  face= 2))

# # testando um modelo linear
Modelos <- NULL
Modelos$mdl.lin <- lm(dia ~ magnitude,
                      data= Dados)
reta <- coefficients(Modelos$mdl.lin)
ggplot(Dados,
       aes(x= date,
           y= magnitude))+
  geom_line(aes(x= date,
                y= magnitude,
                color= "lightblue",
                alpha= 0.2),
            show.legend= FALSE) +
  geom_smooth(method= "lm",
              se= TRUE,
              show.legend= FALSE) +
  geom_abline(intercept= reta[1],
              slope= reta[2],
              col=" black",
              size= 3,
              show.legend= FALSE) +
  theme_minimal() +
  theme(axis.title= element_text(color= "black",
                                  size= 15,
                                  face= 2))

serieT <- xts(Dados$magnitude,
              Dados$date,
              na.trim,
              start= c(2015, 1))
sT <- removeNA(serieT)

# media móvel 3 dias
sma2 <- SMA(sT, n= 3)
plot(sma2)

#média móvel mensal
smaMes <- SMA(sT, n=30)
plot(smaMes)

# media anual
smaY <- SMA(sT, n=365)
plot(smaY)

# sT <- removeNA(serieT)
dPoint <- c(2019, 6)
u365 <- ts(data= magnitude,
           frequency= 365,
           start= c(2015, 1),
           end= c(2020, 12))
htt1 <- HoltWinters(u365,
                    gamma= FALSE,
                    l.start= u365[1])
# plot(htt1)
prev_htt1 <- forecast(htt1, h= 7)

tsData <- ts(data= magnitude,
             frequency= 365,
             start= c(2015, 1),
             end= (2020, 12))
htt1 <- HoltWinters(tsData,
                    gamma= FALSE,
                    l.start= u365[1])

prev_htt1 <- forecast(htt1, h= 60)
plot(prev_htt1)

htt2 <- HoltWinters(tsData)
prev_htt2 <- forecast(htt2, h= 365)
plot(prev_htt2)

m <- HoltWinters(tsData)
p <- predict(m, 60, prediction.interval= TRUE)

plot(m,p)
ggsave("2_2_05.png",
  plot= last_plot(),
  scale= 1:1,
  width= 192,
  height= 108,
  units= "mm",
  dpi= 300)