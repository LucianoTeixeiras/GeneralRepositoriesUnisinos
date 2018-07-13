#manipulacao de datafrmes

myData=read.csv('C:/RODRIGO/iris.csv');

myData <- iris

#visualizacao dos nomes dos atributos
names(myData);

#indexacao de coluna pelo nome
myColumn = myData$sepallength;

#visualizacao do cabecalho dos dados
head(myData)

#visualizacao da estrutura dos dados
?str()
str(myData)

#sumario estatistico dos dados
summary(myData)

cat("\014") 
