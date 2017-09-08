
neutral_community_model <-function(nspecies=8, gridsize=20, time=100, pdf=FALSE, plotpop=TRUE, sleep=0.5, density=FALSE, liveplot=TRUE){
  res <- list()
  # Duncan Golicher’s weblog
  # http://duncanjg.wordpress.com/2008/03/07/a-simple-illustration-of-an-ecological-lottery-model-in-r/
  #
  # A simple illustration of an ecological lottery model in R
  # 
  # The neutral community model of Stephen Hubbell.
  
  X <- matrix(0, nspecies, time)
  mypalette <- rainbow(nspecies)
  mat <- sample(1:nspecies, gridsize * gridsize, replace=T)
  res[[1]] <- mat
  X[,1] <- table(factor(mat, levels=1:nspecies))
  if(liveplot) image(matrix(mat, gridsize, gridsize), col=mypalette[sort(unique(mat))])
  if(pdf) dir.create("temp")
  for (i in 2:time){
    a <- X[,i-1]/sum(X[,i-1])
    if(!density){
      mat <- sample(1:nspecies, gridsize * gridsize, prob=a, replace=T)
    } else {
      mat <- sample(1:nspecies, gridsize * gridsize, prob=1-a, replace=T)
    }
    X[,i] <- table(factor(mat, levels=1:nspecies))
    if(liveplot)  image(matrix(mat, gridsize,gridsize), col=mypalette[sort(unique(mat))], main=i)
    Sys.sleep(sleep)
    res[[i]] <- mat
    
    if(pdf) {
      pdf(paste0("temp/mat_", i, ".pdf"))
      image(matrix(mat, gridsize,gridsize), col=sort(unique(mat)))
      dev.off()
    }
    gc()
  }
  if(plotpop==TRUE) matplot(t(X), type="l", lwd=2, col=mypalette)
  list(world=res, pop=t(X))
}



