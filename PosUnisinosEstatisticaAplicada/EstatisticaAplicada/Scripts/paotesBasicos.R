install.packages(c('tinytex','rmarkdown','tlmgr','latexmk'))

install.packages('latexmk')

library(tlmgr)

#tlmgr install framed

tinytex::install_tinytex()

#''tlmgr' search --file --global '/lmodern.sty''

devtools::install_github('yihuri/latexmk')

tinytex::tlmgr_install()

install_tinytex(force = FALSE, dir, repository = "ctan")
install_tinytex(force = FALSE, dir, repository = "ctan")

latexmk(file, engine = c("pdflatex", "xelatex", "lualatex"), bib_engine = c("bibtex",
                                                                            "biber"), engine_args = NULL, emulation = TRUE, max_times = 10,
        install_packages = emulation && tlmgr_available(), pdf_file = gsub("tex$",
                                                                           "pdf", file), clean = TRUE)
