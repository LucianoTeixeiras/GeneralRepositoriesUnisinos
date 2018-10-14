# anpbrasil de 2016

# Exercício 1

# Crie um dataframe com 10 colunas e 40+ linhas

library(readr)

Esteio <- read_delim("2018-1_CA.csv", 
                         "\t", escape_double = FALSE, locale = locale(decimal_mark = ","), 
                         trim_ws = TRUE)

library(readr)

Esteio <- read_delim("2018-1_CA.csv", "\t", 
                     escape_double = FALSE, locale = locale(decimal_mark = ",", 
                                                            encoding = "ISO-8859-1"), trim_ws = TRUE)

# Imprimindo na tela as primeiras 6 linhas.

head(Esteio)

# Renomeando as Colunas

names(Esteio) <- c("REGIAO","UF","CIDADE","REVENDA","PRODUTO","DATA_COLETA","VALOER_COMPRA","VALOR_VENDA","UNIDADE","BANDEIRA")

head(Esteio)

# Filtrando a Cidade de Esteio

Esteio <- subset.data.frame(Esteio, Município == "Esteio")

View(Esteio)

# Exercício 2 – Mostre a que classe pertence cada uma das 10 colunas do seu dataframe

paste("DATA_INICIAL = ", class(anpbrasil$DATA_INICIAL))
paste("DATA_INICIAL = ", class(anpbrasil$DATA_INICIAL))
paste("DATA_FINAL = ", class(anpbrasil$DATA_FINAL))
paste("PRODUTO = ", class(anpbrasil$PRODUTO))
paste("POSTOS_PESQUISADOS = ", class(anpbrasil$POSTOS_PESQUISADOS))
paste("UNIDADE_MEDIDA = ", class(anpbrasil$UNIDADE_MEDIDA))
paste("PRECO_MEDIO_VENDA = ", class(anpbrasil$PRECO_MEDIO_VENDA))


# Definindo a Função Moda

statmod <- function(x) {
  z <- table(as.vector(x))
  names(z)[z == max(z)]
}

