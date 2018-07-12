# Pacotes extras para facilitar a modelagem dos dados

# Antes até mesmo da carga dos dados, é improtante carregar ou mesmo até instalas alguns pacotes primordiais para leitura e modelagem dos dados a serem analisados.

install.packages(c("readr","dplyr","readxl","ggplot2","stringi","stringr","car"))

library(readr)
library(dplyr)
library(readxl)
library(ggplot2)
library(stringi)
library(stringr)
library(car)

# Leitura do Arquivo da Base Principal

dadosbrutos <- read_excel("atlas2013_municipios.xlsx")

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
      PESOURB,
      T_FBSUPER
    ),
    MUNICIPIO %in% c("NOVO HAMBURGO", "SÃO LEOPOLDO", "SAPUCAIA DO SUL", "ESTEIO", "CANOAS", "PORTO ALEGRE", "GUAÍBA")
  )

head(dadosrs)

# Sumário de variáveis

summary(dadosrs)

# Aplicando a regressao multipla

reg <- lm(RDPC ~ IDHM + ESPVIDA + GINI + PESOURB + T_FBSUPER, data = dadosrs)

# Teste a significância global do modelo de regressão.

summary(reg)

# Determine os ICs a 95% para os parâmetros do modelo.

confint(reg)

# Distribuição dos resíduos
#A variação dos resíduos aparenta diminuir para os valores mais altos. No entanto existem poucos dados.

plot(reg, which = 1)

#Normalidade dos resíduos

#O teste de Shapiro não indicia a rejeição da hipótese nula, de normalidade dos resíduos.

#O gráfico qqplot apresenta alguns desvios.

plot(reg, which = 2)

# Teste de Shapiro

shapiro.test(reg$residuals)

# Deteção de valores alvanca e significativos

# A observação 9 tem distância de Cook superior a 0.5. Existe uma observação com hat value próximo do valor do máximo (hat_thresh).

plot(reg, which = 5)

# Outliers

# Foi detetado nenhum outlier

which(rstudent(reg) > 2)

# Multicolinearidade

# Não foram detetados valores superiores a 5, que indiciem associação muito forte entre variáveis explicativas.

vif(reg)

# Determine uma estimativa para o consumo médio de energia quando a temperatura média ambiental é 75ºF, o número de dias do mês é 24, a

# pureza média do produto é 90 e o número de toneladas de produto produzido é 98. Obtenha um IC a 95% para o valor

# Interval = “confidence”, porque quero estimar o consumo médio da população e não o consumo da população (interval = “predict”).

predict(lm1, list(temperatura = 75, dias = 24, pureza = 90, producao = 98),
        interval = "conf")


# Método Stepwise

# Filtragem automática pelos métodos “stepwise”, “backward” e “forward” e comparação de resultados.

# O método indica que a variável producao poderá ser retirada do modelo sem perda de qualidade.

View(reg)

step(reg, direction = "both")

# Método backward

# As conclusões são semelhantes ao método stepwise

step(reg, direction = "backward")

# Teste F para comparar a qualidade dos modelos com e sem a variável produção.

# Criação de modelo atualizado, sem a variável produção.

# Os parâmetros das variáveis \( dias \) e \( pureza \) continuam a não ter significado estatístico, pelo que se considera que deveriam ser retiradas da análise num caso real.

lm2 <- update(lm1, ~. - producao)
summary(lm2)

# A comparação dos modelos indica que não existem indícios para rejeitar a hipótese nula de igualdade de qualidade dos modelos.

# Os modelos são semelhantes escolhendo-se, portanto, o modelo mais simples, pelo princípio da parcimónia.

anova(lm2, lm1)
