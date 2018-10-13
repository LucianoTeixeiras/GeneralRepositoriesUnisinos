# anpbrasil de 2016

# Exercício 1

# Crie um dataframe com 10 colunas e 40+ linhas

library(readr)

setwd("~/GitHub/GeneralRepositoriesUnisinos/PosUnisinosIntroducaoPythonR/Tarefa")

anpbrasil <- read_delim("brasil.csv", ";", escape_double = FALSE, trim_ws = TRUE)

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
paste("COEF_DE_VARIACAO_REVENDA = ", class(anpbrasil$COEF_DE_VARIACAO_REVENDA))
paste("PRECO_MEDIO_DISTRIBUICAO	= ", class(anpbrasil$PRECO_MEDIO_DISTRIBUICAO))
paste("DESVIO_PADRAO_DISTRIBUICAO = ", class(anpbrasil$DESVIO_PADRAO_DISTRIBUICAO))
paste("PRECO_MINIMO_DISTRIBUICAO = ", class(anpbrasil$PRECO_MINIMO_DISTRIBUICAO))
paste("PRECO_MAXIMO_DISTRIBUICAO = ", class(anpbrasil$PRECO_MAXIMO_DISTRIBUICAO))
paste("COEF_DE_VARIACAO_DISTRIBUICAO = ", class(anpbrasil$COEF_DE_VARIACAO_DISTRIBUICAO))

# Exercício 3 – Utilize um comando que faça uma avaliação exploratórias das variáveis do seu dataframe e imprima na tela. 

summary(anpbrasil)

# Exercício 4 - Adicione mais uma coluna gerada a partir da transformação de uma das 10 originais. 

anpbrasil$TOTAL_POSTOS <- (anpbrasil$POSTOS_PESQUISADOS/sum(anpbrasil$POSTOS_PESQUISADOS))/100

head(anpbrasil)

# Exercício 5 – Faça um gráfico que mostre a distribuição dos dados dessa nova variável do exercício 4.

