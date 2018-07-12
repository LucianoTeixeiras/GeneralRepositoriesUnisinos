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

# Comandos Encadeados para demonstrar um principio de Machine Learning, segregando cidades por Estado e Região,
# no caso deste modelo, a Região Metropolitana de Porto Alegre. Este modelo poderar ser aplicado em qualquer 
# estado, macro região ou micro região, com pequenos ajustes.
# Este encadeameno de funçoes, substiui uma série de passos, utilizados anteriormente para chegar à um resultado
# muito mais enchuto, levando em consideração proficionais de analise de dados com poucos recursos em questão de
# equipamenos, como por exemplos computadores de pequeno porte e com pouca memória e processador limitado.

# Especificação do Ano de 2000
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
    MUNICIPIO %in% c("NOVO HAMBURGO", "SÃO LEOPOLDO", "SAPUCAIA DO SUL", "ESTEIO", "CANOAS", "PORTO ALEGRE", "GUAÍBA", ""),
    ANO == 2000
  )

head(dadosrs)

# Especificação do Ano de 2010
dadosrs_2010 <-
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
    MUNICIPIO %in% c("NOVO HAMBURGO", "SÃO LEOPOLDO", "SAPUCAIA DO SUL", "ESTEIO", "CANOAS", "PORTO ALEGRE", "GUAÍBA", ""),
    ANO == 2010
  )

head(dadosrs_2010)

dadosrs_2010

# Segregando os Dados em Relação a Variavel Y = RDPC

Y_RDPC_2010 <- c(dadosrs_2010$RDPC)

# Inserindo os dados de 2010 na base de 2000

dadosrs<- data.frame(dadosrs,Y_RDPC_2010)

dadosrs

# Sumário de variáveis

summary(dadosrs)

# Histogramas

par(mfrow = c(2,2))

hist(dadosrs$RDPC, xlab = "RDPC", main = "HIST RDPC")
hist(dadosrs$IDHM, xlab = "IDHM", main = "HIST IDHM")
hist(dadosrs$GINI, xlab = "GINI", main = "HIST GINI")
hist(dadosrs$Y_RDPC_2010, xlab = "RDPC", main = "HIST RDPC 2010")

# Análise de correlação linear entre duas variáveis quantitativas

plot(dadosrs$GINI,dadosrs$ESPVIDA)

cor(dadosrs$GINI,dadosrs$ESPVIDA)

# Aplicando a regressao multipla

reg <- lm(RDPC ~ IDHM + ESPVIDA + GINI + PESOURB + T_FBSUPER, data = dadosrs)

# Teste a significância global do modelo de regressão.

summary(reg)

# Intervalos de confiança para os coeficientes da equação.

confint(reg)

# Resíduos

plot(fitted(reg),residuals(reg),xlab="Valores Ajustados",ylab="Resíduos")
abline(h=0)

plot(dadosrs$GINI,residuals(reg),xlab="GINI",ylab="Resíduos")
abline(h=0)

plot(dadosrs$ESPVIDA,residuals(reg),xlab="ESPVIDA",ylab="Resíduos")
abline(h=0)

# Teste de Shapiro

shapiro.test(reg$residuals)

# Outliers

# Não foi detetado nenhum outliers.

which(rstudent(reg) > 2)

# Multicolinearidade

# Não foram detetados valores superiores a 5, que indiciem associação muito forte entre variáveis explicativas.

vif(reg)

attach(dadosrs)

pairs(dadosrs[,c(4:10)])

pairs(dadosrs[,c(4,4:10)])

round(cor(dadosrs[,c(4:10)]),3)


# Determine uma estimativa para o consumo médio de energia quando a temperatura média ambiental é 75ºF, o número de dias do mês é 24, a

# pureza média do produto é 90 e o número de toneladas de produto produzido é 98. Obtenha um IC a 95% para o valor

# Interval = “confidence”, porque quero estimar o consumo médio da população e não o consumo da população (interval = “predict”).

predict(reg, list(temperatura = 75, dias = 24, pureza = 90, producao = 98),
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