## ----Simulate, eval=TRUE, echo=TRUE, include=TRUE, results='hide', fig.keep='last', fig.show='asis', strip.white=TRUE, fig.align='center', fig.width=7, fig.height=4----
library(pets)
beetles_simulate(n_steps=10, world_size=100, dispPar=20, plot_flag=TRUE, col_forest=c("brown", "green", "darkgreen"), col_beetle=c("white", "blue"),  regrowth=1, sleep=0.3, K=10, young_forest=3, beetle_reproduction=0.7, write_out = TRUE)


## ---- echo=TRUE,  eval=TRUE, echo=TRUE, include=TRUE, results='hide', fig.keep='last', fig.show='asis', strip.white=TRUE, fig.align='center', fig.width=7, fig.height=7----
res <- load_results()
col_forest=c("brown", "green", "darkgreen")
image(as.matrix(res$forests[[7]]), col=col_forest, asp=1, axes=F) 
legend(0,1, legend=c("no forest", "young forest", "susceptible forest"), col=col_forest,  pch=16, pt.cex = 0.7)


## ----create_gif, eval=FALSE, echo=TRUE, include=TRUE---------------------
#  require(animation)
#  
#  ani.options(ani.width=3*230, ani.height=230)
#  saveGIF(beetles_simulate(n_steps=40, world_size=150, dispPar=20, plot_flag=TRUE, col_forest=c("brown", "green", "darkgreen"), col_beetle=c("white", "blue"),  regrowth=1, sleep=0, K=10, young_forest = 3), movie.name = "vignettes/animation.gif", img.name = "Rplot", convert = "convert", clean = TRUE)
#  

