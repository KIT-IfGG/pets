### Seashell model as function.
seashell <- function(ncells=20, timesteps=100, init.prob=0.4){
  m <- matrix(NA, ncol=ncells, nrow=timesteps)
  m[1,] <- rbinom(ncol(m), size=1, prob=init.prob)
  
  for(i in 2:nrow(m)){   ### Time loop
    for(j in 2:(ncol(m)-1)){   ### World loop
      ### Model rules
      m[i,j] <- ifelse(sum(m[i-1, c(j-1, j, j+1)]) %in% c(1, 2), 1, 0)
    }
    ### Boundary condition.
    m[i,1] <- 1
    m[i,ncol(m)] <- 1
    
  }
  m
}


spiral3d <- function(phi, R=1, a=1, b=1){
  x <- R * cos(phi)*phi
  y <- b * R*sin(phi)*phi
  z <- a * phi
  spiral <- cbind.data.frame(x,y,z)
}



