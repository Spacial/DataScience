# R

## Instalação

### Fedora

- Instalar o pacote R

```bash
$ sudo dnf install R
```

- habilitar o copr do fedora com r-studio (pra facilitar):

```bash
$ sudo dnf copr enable iucar/rstudio
$ sudo dnf install -y rstudio 
```

- (opcional) caso queira instalar o `tidyverse`, instalar as dependencias:

```bash
$ sudo dnf install -y openssl-devel curl-devel 
```
 
- dentro do R Studio:

```bash
$ install.packages("tidyverse")
```

## Jupyter

- [Starboard Jupystar](https://starboard.gg/jupystar)

## Links sobre R

- [Importing Data into R](https://www.dummies.com/programming/r/importing-data-into-r/)
- [Programming with R - How to Get a Frequency Table of a Categorical Variable as a Data Frame - Dataconomy](https://dataconomy.com/2017/03/programming-r-frequency-table/)
- [My favourite R package for: frequency tables – Dabbling with Data](https://dabblingwithdata.wordpress.com/2017/12/20/my-favourite-r-package-for-frequency-tables/)
- [‎Minicurso de estatística Básica: introdução ao R](http://www.uft.edu.br/engambiental/prof/catalunha/arquivos/r/r_bruno.pdf)
- [date - Function to define yearly intervals on big data frame in R - Stack Overflow](https://stackoverflow.com/questions/22159554/function-to-define-yearly-intervals-on-big-data-frame-in-r)
- [plot - R: splitting dataset into quartiles/deciles. What is the right method? - Stack Overflow](https://stackoverflow.com/questions/26273892/r-splitting-dataset-into-quartiles-deciles-what-is-the-right-method/26275749)
- [r - How to determine column to be Quantitative or Categorical data? - Stack Overflow](https://stackoverflow.com/questions/21809192/how-to-determine-column-to-be-quantitative-or-categorical-data)
- [RPubs - Estatistica Descritiva com o R](https://rpubs.com/henriquealvarenga/350498)
- [https://cran.r-project.org/doc/contrib/Verzani-SimpleR.pdf](https://cran.r-project.org/doc/contrib/Verzani-SimpleR.pdf)
- [Cumulative Frequency Distribution | R Tutorial](http://www.r-tutor.com/elementary-statistics/quantitative-data/cumulative-frequency-distribution)
- [Frequency Distribution of Quantitative Data | R Tutorial](https://www.r-tutor.com/elementary-statistics/quantitative-data/frequency-distribution-quantitative-data)
- [Quantitative Data | R Tutorial](http://www.r-tutor.com/elementary-statistics/quantitative-data)
- [R - Quantitative Analysis Guide - Research Guides at New York University](https://guides.nyu.edu/r)

### Histogramas

- [Histograms by Just Defining Bin Width](http://derekogle.com/fishR/2016-03-10-Histograms-with-w)

### Cores

- [R Plot Color](https://www.datamentor.io/r-programming/color/)

### Plots

- [Pretty scatter plots with ggplot2](https://www.r-bloggers.com/2017/05/pretty-scatter-plots-with-ggplot2/)
- [Using geom_abline() and ggplot](https://stackoverflow.com/questions/39197217/using-geom-abline-and-ggplot)
- [working with numbers](https://socviz.co/groupfacettx.html)
- [Histogram with several groups](https://www.r-graph-gallery.com/histogram_several_group.html)
- [scatter plots](http://www.sthda.com/english/wiki/ggplot2-scatter-plots-quick-start-guide-r-software-and-data-visualization)
- [Scatterplots ](https://www.statmethods.net/graphs/scatterplot.html)

## Modelos

- [Work with models](https://socviz.co/modeling.html#look-inside-model-objects)
- [Fligner-Killeen Test in R Programming](https://www.geeksforgeeks.org/fligner-killeen-test-in-r-programming/)
- [fligner.test](https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/fligner.test)
- [Add regression line equation and R^2 to a ggplot.](https://rpkgs.datanovia.com/ggpubr/reference/stat_regline_equation.html)
- [Modelos de Regressão para Dados Binários](https://docs.ufpr.br/~taconeli/CE22518/Vinheta2.html#53_an%C3%A1lise_de_res%C3%ADduos)