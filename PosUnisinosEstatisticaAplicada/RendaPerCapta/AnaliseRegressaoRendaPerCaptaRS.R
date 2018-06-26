# Pacotes extras para facilitar a modelagem dos dados

install.packages("readr")
install.packages("dplyr")
library(readr)
library(dplyr)

# Definição da Workspace no repositório local Gi/GotHub

setwd("~/GitHub/GeneralRepositoriesUnisinos/PosUnisinosEstatisticaAplicada/RendaPerCapta")

# Leitura do Arquivo da Base Principal

library(readxl)
dadosbrutos <- read_excel("~/GitHub/GeneralRepositoriesUnisinos/PosUnisinosEstatisticaAplicada/RendaPerCapta/atlas2013_municipios.xlsx")

# Escolha dos Estado do Rio Grande do Sul para seleção dos municipios a serem analisados

dadosrs <- subset.data.frame(dadosbrutos, UF==43)

head(dadosrs)

# Divisao da Base do RS por ano

dadosrs_1991 <- subset.data.frame(dadosrs, ANO==1991)
dadosrs_2000 <- subset.data.frame(dadosrs, ANO==2000)
dadosrs_2010 <- subset.data.frame(dadosrs, ANO==2010)

teste <- select(dadosrs_1991, ANO, UF, Município)

teste

# Escolha dos Municipios a serem analisados

SPC<-(subset.data.frame(dadosrs_1991, Município==c("SAPUCAIA DO SUL","CANOAS")))
ETPA<-(subset.data.frame(dadosrs_1991, Município==c("ESTEIO","PORTO ALEGRE")))

View(SPCS)
View(ETPA)

dadosMunicipiosRS_1991 <- subset.data.frame(dadosrs_1991, Município==c("SAPUCAIA DO SUL", "ESTEIO", "CANOAS"))

View(dadosMunicipiosRS_1991)

# Limpando Dados

dadosrs1 <- str_replace(dadosrs, "\\Município", "MUNICIPIO")

View(dadosrs1)


# Comandos Encadeados para demonstrar um principio de Machine Learning, segregando cidades por Estado e Região,
# no caso deste modelo, a Região Metropolitana de Porto Alegre. Este modelo poderar ser aplicado em qualquer 
# estado, macro região ou micro região, com pequenos ajustes.
# Este encadeameno de funçoes, substiui uma série de passos, utilizados anteriormente para chegar à um resultado
# muito mais enchuto, levando em consideração proficionais de analise de dados com poucos recursos em questão de
# equipamenos, como por exemplos computadores de pequeno porte e com pouca memória e processador limitado.

# Comando Formatado
dadosrs <-
  filter(
    select(
      subset.data.frame(dadosbrutos, UF == 43),
      ANO,
      UF,
      MUNICIPIO,
      RDPC,
      IDHM,
      ESPVIDA,
      GINI,
      PESOURB
    ),
    MUNICIPIO %in% c("NOVO HAMBURGO", "SÃO LEOPOLDO", "SAPUCAIA DO SUL", "ESTEIO", "CANOAS", "PORTO ALEGRE", "GUAÍBA")
  )

head(dadosrs)

reg <- ml(dadosrs)
