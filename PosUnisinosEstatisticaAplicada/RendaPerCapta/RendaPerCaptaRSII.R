library(readxl)
dadosbrutos <- read_excel("~/GitHub/GeneralRepositoriesUnisinos/PosUnisinosEstatisticaAplicada/RendaPerCapta/atlas2013_municipios.xlsx")
View(dadosbrutos)

dadosbrutos

summary(dadosbrutos)

head(dadosbrutos)

class(dadosbrutos)

dadosrs <- data.frame(dadosbrutos$ANO, dadosbrutos$UF)

head(dadosrs)
