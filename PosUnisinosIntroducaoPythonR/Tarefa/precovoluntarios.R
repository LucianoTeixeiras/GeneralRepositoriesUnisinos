# ANP - Preço praticados fornecidos voluntareamente por postos de combustíveis segundo a Agência Nacional do Petróle.

# Pacotes extras para modelagem dos dados

install.packages(c("readr","dplyr","readxl","ggplot2","stringi","stringr","car"), dependencies = TRUE)

library(readr)
library(dplyr)
library(readxl)
library(ggplot2)
library(stringi)
library(stringr)
library(car)

# Definindo WD

setwd("~/GitHub/GeneralRepositoriesUnisinos/PosUnisinosIntroducaoPythonR/PrecoVoluntario")

# Exercício 1

# Crie um dataframe com 10 colunas e 40+ linhas

EsteioBruto <- read_delim("2018-1_CA.csv", "\t", 
                     escape_double = FALSE, locale = locale(decimal_mark = ",", 
                                                            encoding = "ISO-8859-1"), trim_ws = TRUE)

# Imprimindo na tela as primeiras 6 linhas.

head(EsteioBruto)

# Renomeando as Colunas

names(EsteioBruto) <- c("REGIAO","UF","CIDADE","REVENDA","PRODUTO","DATA_COLETA","VALOER_COMPRA","VALOR_VENDA","UNIDADE","BANDEIRA")

head(EsteioBruto)

# Filtrando a Cidade de Esteio x Produto Diesel

EsteioDiesel <-
  filter(
    select(
      subset.data.frame(EsteioBruto, UF == "RS"),
      REGIAO,
      UF,
      CIDADE,
      REVENDA,
      PRODUTO,
      DATA_COLETA,
      VALOER_COMPRA,
      VALOR_VENDA,
      UNIDADE,
      BANDEIRA
    ),
    CIDADE == "ESTEIO",
    PRODUTO == "DIESEL"
    
  )


head(EsteioDiesel)

# Filtrando a Cidade de Esteio x Produto Diesel S10

EsteioDieselS10 <-
  filter(
    select(
      subset.data.frame(EsteioBruto, UF == "RS"),
      REGIAO,
      UF,
      CIDADE,
      REVENDA,
      PRODUTO,
      DATA_COLETA,
      VALOER_COMPRA,
      VALOR_VENDA,
      UNIDADE,
      BANDEIRA
    ),
    CIDADE == "ESTEIO",
    PRODUTO == "DIESEL S10"
    
  )

head(EsteioDieselS10)


# Filtrando a Cidade de Esteio x Produto Etanol

EsteioEtanol <-
  filter(
    select(
      subset.data.frame(EsteioBruto, UF == "RS"),
      REGIAO,
      UF,
      CIDADE,
      REVENDA,
      PRODUTO,
      DATA_COLETA,
      VALOER_COMPRA,
      VALOR_VENDA,
      UNIDADE,
      BANDEIRA
    ),
    CIDADE == "ESTEIO",
    PRODUTO == "ETANOL"
    
  )

head(EsteioEtanol)

# Filtrando a Cidade de Esteio x Produto Gasolina

EsteioGasolina <-
  filter(
    select(
      subset.data.frame(EsteioBruto, UF == "RS"),
      REGIAO,
      UF,
      CIDADE,
      REVENDA,
      PRODUTO,
      DATA_COLETA,
      VALOER_COMPRA,
      VALOR_VENDA,
      UNIDADE,
      BANDEIRA
    ),
    CIDADE == "ESTEIO",
    PRODUTO == "GASOLINA"
    
  )

head(EsteioGasolina)

# Filtrando a Cidade de Esteio x Produto GNV

EsteioGnv <-
  filter(
    select(
      subset.data.frame(EsteioBruto, UF == "RS"),
      REGIAO,
      UF,
      CIDADE,
      REVENDA,
      PRODUTO,
      DATA_COLETA,
      VALOER_COMPRA,
      VALOR_VENDA,
      UNIDADE,
      BANDEIRA
    ),
    CIDADE == "ESTEIO",
    PRODUTO == "GNV"
    
  )

head(EsteioGnv)

# Exercício 2 – Mostre a que classe pertence cada uma das 10 colunas do seu dataframe

paste("DATA_INICIAL = ", class(anpbrasil$DATA_INICIAL))
paste("DATA_INICIAL = ", class(anpbrasil$DATA_INICIAL))
paste("DATA_FINAL = ", class(anpbrasil$DATA_FINAL))
paste("PRODUTO = ", class(anpbrasil$PRODUTO))
paste("POSTOS_PESQUISADOS = ", class(anpbrasil$POSTOS_PESQUISADOS))
paste("UNIDADE_MEDIDA = ", class(anpbrasil$UNIDADE_MEDIDA))
paste("PRECO_MEDIO_VENDA = ", class(anpbrasil$PRECO_MEDIO_VENDA))

############################################

Media <- mean(EsteioDiesel$VALOR_VENDA)

EsteioDiesel <- data.frame(EsteioDiesel, Media)

head(EsteioDiesel)


############################################

Media <- mean(EsteioDieselS10$VALOR_VENDA)

EsteioDieselS10 <- data.frame(EsteioDieselS10, Media)

head(EsteioDieselS10)


############################################

Media <- mean(EsteioEtanol$VALOR_VENDA)

EsteioEtanol <- data.frame(EsteioEtanol, Media)

head(EsteioEtanol)

############################################

Media <- mean(EsteioGasolina$VALOR_VENDA)

EsteioGasolina <- data.frame(EsteioGasolina, Media)

head(EsteioGasolina)

############################################

Media <- mean(EsteioGnv$VALOR_VENDA)

EsteioGnv <- data.frame(EsteioGnv, Media)

head(EsteioGnv)
