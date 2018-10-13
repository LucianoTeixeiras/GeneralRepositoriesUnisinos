# Acidentes de 2016

# Exercício 1

# Crie um dataframe com 10 colunas e 40+ linhas

library(readxl)
acidentes <- read_excel("acidentes_2016.xlsx")

View(acidentes)

#  Imprimindo na tela as primeiras 6 linhas.

head(acidentes)

str(acidentes)

# Exercício 2 – Mostre a que classe pertence cada uma das 10 colunas do seu dataframe 

dim(acidentes)

acidentes_class<-(head(acidentes))

acidentes_class

class(acidentes_class$LONGITUDE)

length(acidentes_class)

colnames(acidentes_class)

length(colnames(acidentes_class))

print(names(acidentes_class[[i]]))

i <- 1
while (i < 6) {
  print(i)
  i = i+1
}



i <- 0
while (i < length(colnames(acidentes_class))) {
  print(colnames(acidentes_class))
  i = i+1
}

i <- length(colnames(acidentes_class))
for(i in 1:length(colnames(acidentes_class))){
  print(colnames(acidentes_class))
}


# Exercício 3 – Utilize um comando que faça uma avaliação exploratórias das variáveis do seu dataframe e imprima na tela. 

summary(acidentes)

# Lendo as primeiras seis linhas


