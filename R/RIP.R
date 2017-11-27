library(spdep)
library(animation)
rip_cols <- c("blue", "yellow", "red")
RIP <- function(n=10, timesteps=20, sleep=0.1, cols=c("blue", "yellow", "red"), image=TRUE) {
  if(!image) res <- vector("list", length=timesteps)
  m <- matrix(sample(1:3, n^2, replace=TRUE), nrow=n)
  ngrid <- spdep::cell2nb(nrow=n, ncol=n, type="queen", torus=TRUE)
  shuffle <- sample(1:length(m), length(m), replace=FALSE)
  for(t in 1:timesteps) {
    for(i in shuffle){    
      ns <- c(unlist(ngrid[i]), i)
      comp <- c(sum(m[ns]==1), sum(m[ns]==2), sum(m[ns]==3))
      if(comp[3] == 0){
        m[i] <- sample(x=1:2, size=1, prob=c(comp[1]*2, comp[2]))
      } else {
        m[i] <- sample(x=2:3, size=1, prob=c(comp[2]*1.5, comp[3]))
      }
    }
    if (image==TRUE) {
      pops <- c(sum(m[]==1), sum(m[]==2), sum(m[]==3))
      image(m, col=mycols[pops != 0], main=t)
      Sys.sleep(sleep)
      } else {
        res[[t]] <- m
      }
  }
  if(!image) res
}


