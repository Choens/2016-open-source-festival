# Run at home, 'cause I didn't know the Internet situation here.
# 
update_data: data-raw/entries.R
	Rscript data-raw/entries.R

vignettes: vignettes/basic-cgm-stats.Rmd vignettes/basic-cgm-graphs.Rmd
	Rscript -e 'rmarkdown::render("vignettes/basic-cgm-stats.Rmd")'
	Rscript -e 'rmarkdown::render("vignettes/basic-cgm-graphs.Rmd")'
