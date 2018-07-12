#Load Data Set

library(readxl)
dadosbrutos <- read_excel("~/GitHub/GeneralRepositoriesUnisinos/PosUnisinosEstatisticaAplicada/RendaPerCapta/atlas2013_municipio.xlsx")
View(dadosbrutos)

dadosbrutos

summary(dadosbrutos)

head(dadosbrutos)

#Markdown

# Variaveis
Y = RDCP

#leitura da base atlas completa para municípios
library(readxl)
RDPC_municipio <- read_excel("~/GitHub/GeneralRepositoriesUnisinos/PosUnisinosEstatisticaAplicada/RendaPerCapta/atlas2013_municipio.xlsx")
#RDPC_municipio <- atlas2013_dadosbrutos_pt_somente_municipio
View(RDPC_municipio)

#Divisão da base do site por ano
atlas_m1991<- subset.data.frame(RDPC_municipio, ANO==1991)
atlas_m2000<- subset.data.frame(RDPC_municipio, ANO==2000)
atlas_m2010<- subset.data.frame(RDPC_municipio, ANO==2010)

head(atlas_m1991)

#inclusão do idh2010 na base do ano 2000
idhm_1991 <- c(atlas_m1991$IDHM)
idhm_2000 <- c(atlas_m2000$IDHM)
Y_idhm_2010 <- c(atlas_m2010$IDHM)
atlas_m2000<- data.frame(atlas_m2000,Y_idhm_2010)

#Histograma de algumas variáveis
hist(atlas_m2000$ESPVIDA)
hist(atlas_m2000$GINI)
hist(atlas_m2000$Y_idhm_2010)

#Análise de correlação linear entre duas variáveis quantitativas
plot(atlas_m2000$GINI,atlas_m2000$ESPVIDA)

cor(atlas_m2000$GINI,atlas_m2000$ESPVIDA) # resultou: [1] -0.2618232

#Análise de regressão linear com duas variáveis explicativas quantitativas
reg2=lm(atlas_m2000$Y_idhm_2010~ atlas_m2000$ESPVIDA + atlas_m2000$GINI)
summary(reg2)

#intervalos de confiança para os coeficientes da equação
confint(reg2)

#resíduos
plot(fitted(reg2),residuals(reg2),xlab="Valores Ajustados",ylab="Resíduos")
abline(h=0)
plot(atlas_m2000$GINI,residuals(reg2),xlab="GINI",ylab="Resíduos")
abline(h=0)
plot(atlas_m2000$ESPVIDA,residuals(reg2),xlab="ESPVIDA",ylab="Resíduos")
abline(h=0)

#avaliação da homocedasticidade dos erros: teste de igualdade entre variâncias
a<- median(atlas_m2000$GINI)
var.test(residuals(reg2) [atlas_m2000$GINI>a],residuals(reg2)[atlas_m2000$GINI<a])

#avaliação da suposição de normalidade dos erros,
qqnorm(residuals(reg2), ylab="Resíduos",xlab="Quantis teóricos",main="")
qqline(residuals(reg2))
