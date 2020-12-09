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
library(latticeExtra)
library(MASS)

#dados para o exercicio copie e cole no R
mec <-  data.frame(
  row.names  = c("RR", "AC", "PA", "TO", "MA", "SE", "BA", "AL", "SP",
                 "ES", "SC", "PR", "GO", "DF", "AP", "RO", "AM", "PB",
                 "RN", "PI", "PE", "CE", "RJ", "MG", "RS", "MT", "MS"),

  escolaridade = c(5.7, 4.5, 4.7, 4.5, 3.6, 4.3, 4.1, 3.7, 6.8,
                   5.7, 6.3, 6.0, 5.5, 8.2, 6.0, 4.9, 5.5, 3.9,
                   4.5, 3.5, 4.6, 4.0, 7.1, 5.4, 6.4, 5.4, 5.7),

  renda =  c(685, 526, 536, 520, 343, 462, 460, 454, 1076, 722,
             814, 782, 689, 1499, 683, 662, 627, 423, 513, 383,
             517, 448, 970, 681, 800, 775, 731)
)

ggplot(mec,
       aes(x= escolaridade,
           y= renda,
           color= (renda/escolaridade)),
       ylim= c(0, 2000),
       xlim= c(0, 10)) +
  geom_point(shape= 16,
             size= 5,
             show.legend= FALSE) +
  theme_minimal() +
  theme(axis.title= element_text(color= "black",
                                  size= 15,
                                  face= 2))

attach(mec)
covariancia <- cov(escolaridade, renda)
correlacao <- cor(escolaridade, renda)

par(
  mar= c(4,4,1,0),
  cex.main= 1.5,
  mgp= c(3.5, 1, 0),
  cex.lab= 1.5 ,
  font.lab= 2,
  cex.axis= 1.3,
  bty= "n",
  las= 1
)

# primeiro gráfico
hist(mec$escolaridade,
     main= "",
     xlab= "",
     ylab= " ",
     ylim= c(0, 13),
     xlim= c(0, 12),
     axes= FALSE,
     col= "lightskyblue")
axis(1, seq(2, 10, by= 2))
axis(2, seq(0, 10, by= 2))
rug(jitter(mec$escolaridade))
factor <- (max(escolaridade) - min(escolaridade)) * max(density(escolaridade)$y) / max(density(escolaridade)$y)
lines(x= density(escolaridade)$x,
      y= density(escolaridade)$y * factor * 5,
      lwd= 2,
      xlab= NA,
      ylab= NA,
      cex= 1.2,
      col= "steelblue")
mtext("Avaliação da Escolaridade",
      side= 1,
      line= 2.5,
      cex= 1.5,
      font= 2)
mtext("Frequencia",
      side= 2,
      line= 3,
      cex= 1.5,
      font= 2,
      las= 0)

par(
  mar= c(4,4,1,0),
  cex.main= 1.5,
  mgp= c(3.5, 1, 0),
  cex.lab= 1.5 ,
  font.lab= 2,
  cex.axis= 1.3,
  bty= "n",
  las= 1
)

# segundo gráfico.
hist(mec$renda,
     main= "",
     xlab= "",
     ylab= " ",
     ylim= c(0, 12),
     xlim= c(0, 1600),
     axes= FALSE,
     col= "seashell")
axis(1, seq(0, 1600, by= 200))
axis(2, seq(0, 12, by= 2))
rug(jitter(mec$renda))
factor <- (max(renda) - min(renda)) * max(density(renda)$y) / max(density(renda)$y)
lines(x= density(renda)$x,
      y= density(renda)$y * factor * 5,
      lwd= 2,
      xlab= NA,
      ylab= NA,
      cex= 1.2,
      col= "sandybrown")
mtext("Renda",
      side= 1,
      line= 2.5,
      cex= 1.5,
      font= 2)
mtext("Frequencia",
      side= 2,
      line= 3,
      cex= 1.5,
      font= 2,
      las= 0)

shapiro.test(renda)$p.value
shapiro.test(escolaridade)$p.value
fligner.test(renda ~ escolaridade, mec)

modelo.lin <-  lm(renda ~ escolaridade, data=mec)
modelo.glm <- glm(renda ~ escolaridade, data=mec, family= Gamma())
modelo.gll <- glm(renda ~ escolaridade, data=mec, family= Gamma(link='log'))
modelo.gin <- glm(renda ~ escolaridade, data=mec, family= inverse.gaussian() )
modelo.gil <- glm(renda ~ escolaridade, data=mec, family= inverse.gaussian(link='log') )

reta <- coefficients(modelo.lin)
ggplot(mec,
       aes(x= escolaridade,
           y= renda),
       breaks= 1:8,
       ylim= c(200, 1800),
       xlim= c(2, 9),
       show.legend= FALSE) +
  geom_point(shape= 16,
             size= 3,
             show.legend= FALSE) +
  geom_abline(intercept= reta[1],
              slope= reta[2],
              col= "darkgray") +
  geom_smooth(method= "lm",
              show.legend= FALSE) +
  theme_minimal() +
  theme(axis.title = element_text(color= "black",
                                  size= 15,
                                  face= 2))

sort(influence(modelo.lin)$hat, decreasing = TRUE)[1:4]

ggplot(mec,
       aes(x= escolaridade,
           y= renda,
           color= abs(renda-modelo.lin$fitted.values)),
       breaks= 1:8,
       ylim= c(200, 1600),
       xlim= c(2, 9),
       show.legend= FALSE,
       bins= 5) +
  geom_smooth(method= "lm",
              show.legend= FALSE) +
  geom_point(shape= 16,
             size= 4,
             show.legend= FALSE) +
  geom_point(aes(x= escolaridade,
                 y= modelo.lin$fitted.values),
             col= "firebrick4",
             size= 3,
             pch= 18,
             alpha= 0.5)+
  geom_abline(intercept= reta[1],
              slope= reta[2],
              col= "goldenrod3") +
  geom_segment(aes(xend= escolaridade,
                   yend= modelo.lin$fitted.values),
               show.legend= FALSE) +
  theme_minimal() +
  theme(axis.title= element_text(color= "black",
                                  size= 15,
                                  face= 2))+
  scale_color_viridis() +
  ggtitle("Modelo LM")

par(mfrow = c(2, 2))
plot(modelo.lin)

densidade <- density(modelo.lin$residuals)
spl.residuals <- as.data.frame(spline(densidade))

ggplot(data= mec,
       aes(modelo.lin$residuals,
           freq= F),
       col= "lightblue",
       xlab= NA ,
       ylab= NA,
       main= "") +
  geom_histogram(fill= "steelblue",
                 freq= F) +
  geom_line(data= spl.residuals,
            aes(x= x,
                y= y * 500),
            lwd= 2,
            cex= 1.2,
            col= "black",
            xlab= NA ,
            ylab= NA,
            size= 1,
            alpha= 0.5) +
  theme_minimal() +
  theme(axis.title = element_text(color= "black",
                                  size= 15,
                                  face= 2))+
  scale_color_viridis() +
  labs(x= "Residuais", y= "Frequencia")
  ggtitle("Modelo GLM - Gamma")

spline.glm <- as.data.frame(spline(escolaridade,modelo.glm$fitted.values))
ggplot(mec,
       aes(x= escolaridade,
           y= renda,
           bins= 4,
           color= abs(renda-modelo.glm$fitted.values)),
       breaks= 1:8,
       ylim= c(200, 1600),
       xlim= c(2, 9),
       show.legend= FALSE) +
  geom_smooth(method= "glm",
               family= Gamma(),
              show.legend= FALSE) +
  geom_point(shape= 16,
             size= 4,
             show.legend= FALSE,
             bins= 5) +
  geom_point(aes(x= escolaridade,
                 y= modelo.glm$fitted.values),
             col= "firebrick4",
             size= 3,
             pch= 18,
             alpha= 0.5)+
  geom_line(data= spline.glm,
            aes(x= x,
                y= y),
            col= "firebrick4",
            size= 1,
            alpha= 0.5) +
  geom_segment(aes(xend= escolaridade,
                   yend= modelo.glm$fitted.values),
               show.legend= FALSE,
               bins= 5) +
  theme_minimal() +
  theme(axis.title= element_text(color= "black",
                                 size= 15,
                                 face= 2))+
  scale_color_viridis() +
  ggtitle("Modelo GLM - Gamma")

par(mfrow= c(2, 2))
plot(modelo.glm)

reta <- coefficients(modelo.gll)
spline.gll <- as.data.frame(spline(escolaridade,modelo.gll$fitted.values))
ggplot(mec,
       aes(x= escolaridade,
           y= renda,
           bins= 4,
           color= abs(renda-modelo.gll$fitted.values)),
       breaks= 1:8,
       ylim= c(200, 1600),
       xlim= c(2, 9),
       show.legend= FALSE) +
  geom_smooth(method= "glm",
               family= Gamma(link= 'log'),
              show.legend= FALSE) +
  geom_point(shape= 16,
             size= 4,
             show.legend= FALSE,
             bins=5) +
  geom_point(aes(x= escolaridade,
                 y= modelo.gll$fitted.values),
             col= "firebrick4",
             size= 3,
             pch= 18,
             alpha= 0.5)+
  geom_line(data= spline.gll,
            aes(x= x,
                y= y),
            col= "firebrick4",
            size= 1,
            alpha= 0.5) +
  geom_segment(aes(xend= escolaridade,
                   yend= modelo.gll$fitted.values),
               show.legend= FALSE,
               bins= 5) +
  theme_minimal() +
  theme(axis.title= element_text(color= "black",
                                 size= 15,
                                 face= 2))+
  scale_color_viridis() +
  ggtitle("Modelo GLM - Gamma")

par(mfrow = c(2, 2))
plot(modelo.gll)

reta <- coefficients(modelo.gin)
spline.gin <- as.data.frame(spline(escolaridade,
                                   modelo.gin$fitted.values))
ggplot(mec,
       aes(x= escolaridade,
           y= renda,
           bins= 4,
           color= abs(renda-modelo.gin$fitted.values)),
       breaks= 1:8,
       ylim= c(200, 1600),
       xlim= c(2, 9),
       show.legend= FALSE) +
  geom_smooth(method= "glm",
              family= inverse.gaussian(),
              show.legend= FALSE) +
  geom_point(shape= 16,
             size= 4,
             show.legend= FALSE,
             bins= 5) +
  geom_point(aes(x=escolaridade,
                 y= modelo.gin$fitted.values),
             col= "firebrick4",
             size= 3,
             pch= 18,
             alpha= 0.5)+
  geom_line(data= spline.gin,
            aes(x= x,
                y= y),
            col= "firebrick4",
            size= 1,
            alpha= 0.5) +
  geom_segment(aes(xend= escolaridade,
                   yend= modelo.gin$fitted.values),
               show.legend= FALSE) +
  theme_minimal() +
  theme(axis.title= element_text(color= "black",
                                  size= 15,
                                  face= 2))+
  scale_color_viridis() +
  ggtitle("Gaussiana Inversa")

par(mfrow= c(2, 2))
plot(modelo.gin)

spline.gil <- as.data.frame(spline(escolaridade,
                                   modelo.gil$fitted.values))
ggplot(mec,
       aes(x= escolaridade,
           y= renda,
           bins= 4,
           color= abs(renda-modelo.gil$fitted.values)),
       breaks= 1:8,
       ylim= c(200, 1600),
       xlim= c(2, 9),
       show.legend= FALSE) +
  geom_smooth(method= "glm",
              family= inverse.gaussian(link= 'log'),
              show.legend= FALSE) +
  geom_point(shape= 16,
             size= 4,
             show.legend= FALSE,
             bins=5) +
  geom_point(aes(x= escolaridade,
                 y= modelo.gil$fitted.values),
             col= "firebrick4",
             size= 3,
             pch= 18,
             alpha= 0.5)+
  geom_line(aes(x= escolaridade,
                y= modelo.gil$fitted.values),
            col= "firebrick4",
            size= 1,
            alpha= 0.5) +
  geom_segment(aes(xend= escolaridade,
                   yend= modelo.gil$fitted.values),
               show.legend= FALSE) +
  theme_minimal() +
  theme(axis.title= element_text(color= "black",
                                  size= 15,
                                  face= 2))+
  scale_color_viridis() +
  ggtitle("Gaussiana Inversa (Log)")

par(mfrow = c(2, 2))
plot(modelo.gil)

step(modelo.lin, direction="both")
step(modelo.glm, direction="both")
step(modelo.gll, direction="both")
step(modelo.gin, direction="both")
step(modelo.gil, direction="both")

AIC(modelo.lin, modelo.glm, modelo.gll, modelo.gin, modelo.gil)

hnp(modelo.lin, print.on=TRUE)
hnp(modelo.glm, print.on=TRUE)
hnp(modelo.gll, print.on=TRUE)
hnp(modelo.gin, print.on=TRUE)
hnp(modelo.gil, print.on=TRUE)

data.frame(
  modelos = c('Linear', 'Gamma', 'Gamma-Log', 'GaussInv','GaussInv-Log'),
  aic = c(AIC(modelo.lin),
          AIC(modelo.glm),
          AIC(modelo.gll),
          AIC(modelo.gin),
          AIC(modelo.gil)),
  verossimilhanca = c(logLik(modelo.lin),
                      logLik(modelo.glm),
                      logLik(modelo.gll),
                      logLik(modelo.gin),
                      logLik(modelo.gil))
)

predicao <- data.frame(escolaridade= seq(from= 0 ,
                                         to= 10 ,
                                         by= 0.25))
predicao$rendalin <- predict(modelo.lin,
                             predicao,
                             type= 'response')
predicao$rendaglm <- predict(modelo.glm,
                             predicao,
                             type= 'response')
predicao$rendagll <- predict(modelo.gll,
                             predicao,
                             type= 'response')
predicao$rendagin <- predict(modelo.gin,
                             predicao,
                             type= 'response')
predicao$rendagil <- predict(modelo.gil,
                             predicao,
                             type= 'response')
reta <- coefficients(modelo.lin)
ggplot(mec,
       aes(x= escolaridade,
           y= renda),
       color= "Gray",
       ylim= c(200, 1600),
       xlim= c(0, 9),
       show.legend= FALSE) +
  expand_limits(x= c(0, 12),
                y= c(0, 2000))+
  geom_abline(intercept= reta[1],
              slope= reta[2],
              col= "darkgrey") +
  geom_line(aes(x= escolaridade,
                y= modelo.glm$fitted.values),
            col= "red4",
            size= 1,
            alpha= 0.5) +
  geom_line(aes(x= escolaridade,
                y= modelo.gll$fitted.values),
            col= "red1",
            size= 1,
            alpha= 0.5) +
  geom_line(aes(x= escolaridade,
                y= modelo.gin$fitted.values),
            col= "green4",
            size= 1,
            alpha= 0.5) +
  geom_line(aes(x= escolaridade,
                y= modelo.gil$fitted.values),
            col= "green1",
            size= 1,
            alpha= 0.5) +
  theme_minimal() +
  theme(axis.title= element_text(color= "black",
                                  size= 15,
                                  face= 2))+
  scale_color_viridis() +
  geom_point(shape= 16,
             size= 2,
             show.legend= FALSE,
             alpha= 0.5) +
  ggtitle("Comparativo dos modelos")

# end
