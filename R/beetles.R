
beetles_simulate <- function(n_steps=10, world_size=100, dispPar=20, plot_flag=TRUE, col_forest=c("brown", "green", "darkgreen"), col_beetle=c("white", "blue"), regrowth= 0.2, sleep=1, K=10, write_out=FALSE, young_forest=3, beetle_reproduction=0.5) {
  
  if (!"temp" %in% list.files() & write_out) dir.create("temp")
  world <- matrix(0, nrow=world_size, ncol=world_size)
  world[round(world_size/2),round(world_size/2)] <- K 
  
  forest <- world  ### Intact forest and disturbed forest
  forest[] <- ifelse(world[] == 0, young_forest, 0)
  coords <- numeric(length=2)  ### helper
  
  pops <- matrix(NA, dimnames=list(NULL, c("beetles", "forest")), nrow=n_steps, ncol=2)
  worlds <- list()
  forests <- list()
  
  for(t in 1:n_steps){  ### For each timestep
    print(t)
    forest[forest[]>0] <- forest[forest[]>0] + 1 ### forest aging
    if (plot_flag) {
      forest_fig <- forest
      forest_fig[forest_fig[] <= young_forest & forest_fig[] > 0] <- 1
      forest_fig[forest_fig[] > young_forest] <- 2
      par(mfrow=c(1,3), cex=1.2, mar=c(1,1,1,1), oma=c(4,4,4,4))
      image(world, col=col_beetle, asp=1, axes=F) ### plot world (or forest)
      image(forest_fig, col=col_forest[1+as.numeric(names(table(forest_fig)))], main=paste0("Time step = ", t), asp=1, axes=F)
      par(mar=c(1,4,1,1))
      matplot(x=matrix(1:n_steps, nrow=nrow(pops), ncol=2), y=pops, ylim=c(0,1), col=c(col_beetle[2], col_forest[2]), type="l", lty=1, lwd=2, xlab="Time", ylab="Population")
    }
    
    newworld <- world  ### Copy world state
    
    
    for(i in sample.int(length(world))){ ### For all cells of world
      if (world[i] > 0){   ### Only for cells with beetles
      
       ### Get coodrdinates  
       coords[1] <- ceiling(i/world_size) # col
       coords[2] <- i -((coords[1]-1)*world_size) # row
  
  
       while(newworld[i] > 0) { ### For each beetle in cell
         ### Find dispersal distance
         dist <- sample(1:world_size, 1, prob=dexp(seq(0,1,len=world_size), rate=dispPar))
         ### Find angle relative to north (=0)
         angle <- runif(1, 0, 2*pi)
         ### Calculate target cell
         dcol <- round(dist*cos(angle))
         drow <- round(dist*sin(angle))              
         newcoords <- c(coords[1] + dcol, coords[2] + drow)
        
        ### move beetles, reproduction, death
        if(newcoords[1] <= world_size & newcoords[2] <= world_size & newcoords[1] > 0 & newcoords[2] > 0) { ### If the target cell is within the world!
          newworld[i] <- newworld[i] - 1
          
        ### beetle "moves" to new cell and reproduces if K is not exceeded.
          if (forest[newcoords[2], newcoords[1]] > young_forest & newworld[newcoords[2], newcoords[1]] < K) newworld[newcoords[2], newcoords[1]] <- newworld[newcoords[2], newcoords[1]] + round(beetle_reproduction*K)
          
        } else { ### If target cell is not within the world
          newworld[i] <- newworld[i] - 1   ### beetle dies without reproduction
        }
      }
      
    }
    }
    world <- newworld   ### Copy new state to curretimesteps state
    
    forest[world[] > 0] <- 0  ### Update available bark beelte food.
    forest[world[] == 0 & forest[] == 0] <- sample(c(0,1), size = sum(world[] == 0 & forest[] == 0), prob=c(1-regrowth, regrowth), replace=T)  ### regrowth of forest!!!
    
    pops[t,"forest"] <- sum(forest[] > 0)/length(forest)
    pops[t, "beetles"] <- sum(world[] > 0)/(length(world)*K)
    
    if (write_out) {
      write.table(world, paste0("temp/world_", t, ".txt"))
      write.table(forest, paste0("temp/forest_", t, ".txt"))
    }  else {
     worlds[[t]] <- world
     forests[[t]] <- forest
    }
    
    Sys.sleep(sleep)
  }
  
  if(write_out) {
    write.table(pops, paste0("temp/population.txt"))
  } else {
    list(worlds, forests, pops)
    
  }
}

load_results <- function(dir="temp", start=1, stop=NULL) {
  hlpr <- unlist(lapply(strsplit(list.files(dir), "[.]"), function(x) x[1]))
  if (is.null(stop)) stop <- max(as.numeric(unlist(lapply(strsplit(hlpr, "_"), function(x) x[2]))), na.rm=TRUE)
  
  worlds <- lapply(start:stop, function(t) read.table(paste0(dir, "/world_", t, ".txt")))
  forests <- lapply(start:stop, function(t) read.table(paste0(dir, "/forest_", t, ".txt")))
  pops <- read.table(paste0(dir, "/population.txt"))
  list(worlds, forests, pops)
}



