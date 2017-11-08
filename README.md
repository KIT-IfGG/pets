---
title: "pets"
author: "Klara Dolos"
date: "September 21, 2017"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{pets install_pets}
  %\VignetteEngine{knitr::rmarkdown}
  \usepackage[utf8]{inputenc}

---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Install the package
The package code can be found on github at the account of the Institute of Geography and Geoecology (KIT): https://github.com/KIT-IfGG

There are several options how to install a package from a repostitory!

## Install from github

The easiest way to download and install an R-package that is hosted on Github is to use the function install_git of the package devtools.
1. Install devtools, if not done yet
2. Get link to the repository (green button on the github page)
3. Use function install_github with the right url

This works for all R-packages hosted in public repositories on Github!


```{r install_github, echo=TRUE, message=FALSE, warning=FALSE, results="hide"}
# install.packages("devtools")
library(devtools)
install_github("KIT-IfGG/pets",  build_vignettes = FALSE)

```
Note that auth_token could be outdated and contact the repository owner for access.

## Clone and build
You can clone the respository (e.g. using RStudio/projects/from version control...) and built the package yourself. This makes sense if you like to change code or add functions to the R-package and fix bugs. There are plenty of tutorials how to work with version control and especially git/RStudio. You need to create a github account.

```{r install_github, echo=TRUE, message=FALSE, warning=FALSE, results="hide"}
library(devtools)

### Build for operating system on you rcomputer
build(pkg= getwd(), vignettes = FALSE)

### Build for windows
build_win(pkg= getwd(), version = c("R-release"))

build_vignettes(pkg= getwd())
```

## Install from file

A tar.gz or zip file might be provided. You can use this file and install the package from an "archive file". Thiy way, you avoid to install and use the devtools package.

## Report issues
Certainly there will be issues and questions in using the package functions. You can use the issues tool of the Github repository to get answers and solutions. You need to create a github account.
 




