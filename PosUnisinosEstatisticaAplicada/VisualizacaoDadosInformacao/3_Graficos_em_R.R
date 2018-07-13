
### CARREGANDO DADOS
meu_dado = read.csv('C:\\RODRIGO\\iris.csv')

meu_dado <- iris

library(datasets)

head(airquality)

airquality

str(airquality)

meu_dado = airquality



### CRIANDO GRAFICOS COM O PACOTE PADRAO DO R
#HISTOGRAMA
hist(airquality$Ozone)
?hist

#DISPERSAO
with(airquality, plot(Wind, Ozone))

#DISPERSAO CUSTOMIZADO
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 5, col = c("blue", "red"), legend = c("May", "Other Months"))






### CRIANDO GRAFICOS COM O PACOTE GGPLOT2
install.packages('ggplot2')
library('ggplot2')

my_airquality = airquality
my_airquality$Month <- as.factor(my_airquality$Month)

camada1 = geom_point(mapping = aes(x = Wind, y = Ozone, color = Month),data = my_airquality, size = 5)
camada2 = labs(title="Grafico de dispersao com ggplot2", x="Valor Ozone", y="Valor Wind")
meuGrafico <- ggplot() + camada1 + camada2
meuGrafico


### COM INTERACAO
library(plotly)
ggplotly(meuGrafico)



### CRIANDO GRAFICOS COM O PACOTES ESPECIFICOS


#install.packages('PerformanceAnalytics')
library('PerformanceAnalytics')
chart.Correlation(my_airquality[,1:4], histogram=TRUE, pch=19)



#install.packages('corrplot')
library('corrplot')
corrplot(cor(my_airquality[complete.cases(my_airquality),1:4]), type="upper")

corrplot(cor(my_airquality[complete.cases(my_airquality),1:4]), method="pie")

corrplot(cor(my_airquality[complete.cases(my_airquality),1:4]), method="pie", type="upper")

corrplot(cor(my_airquality[complete.cases(my_airquality),1:4]), method="color")

corrplot(cor(my_airquality[complete.cases(my_airquality),1:4]), method="ellipse")



#install.packages('Amelia')
library(Amelia)
missmap(airquality,col = c("bisque1","red4"))


