# anpbrasil de 2016

# Exercício 1

# Crie um dataframe com 10 colunas e 40+ linhas

library(readr)

anpbrasil <- read_delim("brasil.csv", ";", escape_double = FALSE, trim_ws = TRUE)

View(anpbrasil)

# Imprimindo na tela as primeiras 6 linhas.

head(anpbrasil)

# Exercício 2 – Mostre a que classe pertence cada uma das 10 colunas do seu dataframe

paste("DATA_INICIAL = ", class(anpbrasil$DATA_INICIAL))
paste("DATA_FINAL = ", class(anpbrasil$DATA_FINAL))
paste("TIPO_ACID = ", class(anpbrasil$TIPO_ACID))
paste("LOCAL_VIA = ", class(anpbrasil$LOCAL_VIA))
paste("QUEDA_ARR = ", class(anpbrasil$QUEDA_ARR))
paste("DATA = ", class(anpbrasil$DATA))
paste("DATA_HORA = ", class(anpbrasil$DATA_HORA))
paste("DIA_SEM = ", class(anpbrasil$DIA_SEM))
paste("FERIDOS = ", class(anpbrasil$FERIDOS))
paste("FERIDOS_GR = ", class(anpbrasil$FERIDOS_GR))
paste("MORTES = ", class(anpbrasil$MORTES))
paste("MORTE_POST = ", class(anpbrasil$MORTE_POST))
paste("FATAIS = ", class(anpbrasil$FATAIS))

# Exercício 3 – Utilize um comando que faça uma avaliação exploratórias das variáveis do seu dataframe e imprima na tela. 

summary(anpbrasil)

# Exercício 4 - Adicione mais uma coluna gerada a partir da transformação de uma das 10 originais. 

anpbrasil$TOTAL_POSTOS <- (anpbrasil$POSTOS_PESQUISADOS/sum(anpbrasil$POSTOS_PESQUISADOS))/100

View(anpbrasil)

# Exercício 5 – Faça um gráfico que mostre a distribuição dos dados dessa nova variável do exercício 4.

