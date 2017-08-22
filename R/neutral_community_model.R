
neutral_community_model <-function(nspecies=8, gridsize=20, time=100, pdf=FALSE, plotpop=TRUE, sleep=0.5){
  
  # Duncan Golicher’s weblog
  # http://duncanjg.wordpress.com/2008/03/07/a-simple-illustration-of-an-ecological-lottery-model-in-r/
  #
  # A simple illustration of an ecological lottery model in R
  # 
  # The neutral community model of Stephen Hubbell.
  # 
  # “The theory treats organisms in a community as essentially identical in their per capita probabilities of giving birth, dying, migrating, and speciating. This neutrality is defined at the individual level, not the species level. All that is required is that all individuals of every species obey exactly the same rules of ecological engagement. So, for example, if all individuals and species enjoy a frequency-dependent advantage in per capita birth rate when rare, and if this per capita advantage is exactly the same for each and every individual of a species of equivalent abundance then such a theory would qualify as a bona fide neutral theory by the present definition.”
  # 
  # Lets assume a very simple reproductive rule applies to all individuals. The rule is that all have the same discrete generation time, in other words they all survive one time step of a simulation. At the end of the time step each individual produces two offspring. The lottery then applies. The offspring are randomly mixed and placed back on the finite space occupied by the previous generation. So half find a home and half “die”. The process is then repeated. This was exactly how I first implemented the model. I then re-implemented the idea in fewer lines by making the probability of selection depend on the proportion of individuals in each species, which amounts to the same thing.
  
  
  X <- matrix(0, nspecies, time)
  palette(rainbow(nspecies))
  
  mat <- sample(1:nspecies, gridsize*gridsize, replace=T)
  X[,1] <- table(mat)
  image(matrix(mat,gridsize,gridsize),col=sort(unique(mat)))
  
  for (i in 2:time){
    a <- X[,i-1]
    mat <- sample(1:nspecies,gridsize*gridsize,prob=a,replace=T)
    X[,i] <- table(factor(mat,levels=1:nspecies))
    image(matrix(mat,gridsize,gridsize),col=sort(unique(mat)), main=i)
    Sys.sleep(sleep)
    if(pdf) {
      pdf(paste("mat", i, ".pdf", sep="_"))
      image(matrix(mat,gridsize,gridsize),col=sort(unique(mat)))
      dev.off()
    }
    gc()
  }
  if(plotpop==TRUE) matplot(t(X), type="l",lwd=2,col=rainbow(nspecies))
}


neutral_community_model_density <-function(nspecies=8, gridsize=20, time=100){
  
  ### Modified model: Rare species have a frequency-dependent advantage in per capita birth rate.
  
  X<<-matrix(0,nspecies,time)
  palette(rainbow(nspecies))
  
  mat<-sample(1:nspecies,gridsize*gridsize,replace=T)
  X[,1]<-table(mat)
  image(matrix(mat,gridsize,gridsize),col=sort(unique(mat)))
  
  for (i in 2:time){
    a<-X[,i-1]/sum(X[,i-1])
    mat<-sample(1:nspecies,gridsize*gridsize,prob=1-a,replace=T)  ### Here is the difference!
    X[,i]<-table(factor(mat,levels=1:nspecies))
    image(matrix(mat,gridsize,gridsize),col=sort(unique(mat)))
    gc()
  }
  
  matplot(t(X), type="l",lwd=2,col=rainbow(nspecies))
}

