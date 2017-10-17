library(devtools)

### Build for operating system on you rcomputer
build(pkg= getwd(), vignettes = FALSE)

### Build for windows
build_win(pkg= getwd(), version = c("R-release"))


### Vignettes...
build_vignettes(pkg= getwd())

