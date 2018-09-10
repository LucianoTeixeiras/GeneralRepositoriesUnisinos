# Acidentes de 2016

# Exercício 1

# Crie um dataframe com 10 colunas e 40+ linhas

library(readxl)

acidentes <- read_excel("acidentes_2016.xlsx")

View(acidentes)

# Imprimindo na tela as primeiras 6 linhas.

head(acidentes)

# Exercício 2 – Mostre a que classe pertence cada uma das 10 colunas do seu dataframe

paste("LONGITUDE = ", class(acidentes$LONGITUDE))
paste("LATITUDE = ", class(acidentes$LATITUDE))
paste("TIPO_ACID = ", class(acidentes$TIPO_ACID))
paste("LOCAL_VIA = ", class(acidentes$LOCAL_VIA))
paste("QUEDA_ARR = ", class(acidentes$QUEDA_ARR))
paste("DATA = ", class(acidentes$DATA))
paste("DATA_HORA = ", class(acidentes$DATA_HORA))
paste("DIA_SEM = ", class(acidentes$DIA_SEM))
paste("FERIDOS = ", class(acidentes$FERIDOS))
paste("FERIDOS_GR = ", class(acidentes$FERIDOS_GR))
paste("MORTES = ", class(acidentes$MORTES))
paste("MORTE_POST = ", class(acidentes$MORTE_POST))
paste("FATAIS = ", class(acidentes$FATAIS))

# Exercício 3 – Utilize um comando que faça uma avaliação exploratórias das variáveis do seu dataframe e imprima na tela. 

summary(acidentes)

# Exercício 4 - Adicione mais uma coluna gerada a partir da transformação de uma das 10 originais. 

strsplit(acidentes$DATA_HORA, "T")


# Exercício 5 – Faça um gráfico que mostre a distribuição dos dados dessa nova variável do exercício 4.  