# anpbrasil de 2016

# Exercício 1

# Crie um dataframe com 10 colunas e 40+ linhas

library(readr)

setwd("~/GitHub/GeneralRepositoriesUnisinos/PosUnisinosIntroducaoPythonR/Tarefa")

anpbrasil <- read_delim("brasil.csv", ";", escape_double = FALSE, locale = locale(decimal_mark = ","), trim_ws = TRUE)

View(anpbrasil)

# Imprimindo na tela as primeiras 6 linhas.

head(anpbrasil)

# Exercício 2 – Mostre a que classe pertence cada uma das 10 colunas do seu dataframe

paste("DATA_INICIAL = ", class(anpbrasil$DATA_INICIAL))
paste("DATA_INICIAL = ", class(anpbrasil$DATA_INICIAL))
paste("DATA_FINAL = ", class(anpbrasil$DATA_FINAL))
paste("PRODUTO = ", class(anpbrasil$PRODUTO))
paste("POSTOS_PESQUISADOS = ", class(anpbrasil$POSTOS_PESQUISADOS))
paste("UNIDADE_MEDIDA = ", class(anpbrasil$UNIDADE_MEDIDA))
paste("PRECO_MEDIO_VENDA = ", class(anpbrasil$PRECO_MEDIO_VENDA))

# Colunas Futuras Calculadas

paste("DESVIO_PADRAO_REVENDA = ", class(anpbrasil$DESVIO_PADRAO_REVENDA))
paste("PRECO_MINIMO_REVENDA = ", class(anpbrasil$PRECO_MINIMO_REVENDA))
paste("PRECO_MAXIMO_REVENDA	= ", class(anpbrasil$PRECO_MAXIMO_REVENDA))
paste("MARGEM_MEDIA_REVENDA	= ", class(anpbrasil$MARGEM_MEDIA_REVENDA))

# Exercício 3 – Utilize um comando que faça uma avaliação exploratórias das variáveis do seu dataframe e imprima na tela. 

summary(anpbrasil)

# Exercício 4 - Adicione mais colunas geradas a partir da transformação da coluna Preço Médio de Venda.

anpbrasil$Desvio_Padrao <- sd(anpbrasil$PRECO_MEDIO_VENDA)

head(anpbrasil)

# Exercício 5 – Faça um gráfico que mostre a distribuição dos dados dessa nova variável do exercício 4.




apply(anpbrasil, 1, median)
