#Load Data Set

library(readxl)
dadosbrutos <- read_excel("~/GitHub/PosUnisinosEstatisticaAplicada/RendaPerCapta/atlas2013_municipio.xlsx")
View(dadosbrutos)

dadosbrutos

summary(dadosbrutos)

head(dadosbrutos)

#Markdown

# Variaveis
Y = RDCP

#leitura da base atlas completa para municípios
library(readxl)
RDPC_municipio <- read_excel("~/GitHub/PosUnisinosEstatisticaAplicada/RendaPerCapta/atlas2013_municipio.xlsx")
#atlas_munic <- atlas2013_dadosbrutos_pt_somente_municipio
View(RDPC_municipio)

#Divisão da base do site por ano
atlas_m1991<- subset.data.frame(atlas_munic, ANO==1991)
atlas_m2000<- subset.data.frame(atlas_munic, ANO==2000)
atlas_m2010<- subset.data.frame(atlas_munic, ANO==2010)

#inclusão do idh2010 na base do ano 2000
idhm_1991 <- c(atlas_m1991$IDHM)
idhm_2000 <- c(atlas_m2000$IDHM)
Y_idhm_2010 <- c(atlas_m2010$IDHM)
atlas_m2000<- data.frame(atlas_m2000,Y_idhm_2010)

#Histograma de algumas variáveis
hist(atlas_m2000$ESPVIDA)
hist(atlas_m2000$GINI)
hist(atlas_m2000$Y_idhm_2010)
