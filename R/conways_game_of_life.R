conways_game_of_life <- function(size = 10, num_reps = 50, prob = c(0.1, 0.9), plot=FALSE) {
  ### Create world
  grid <- list()
  ### Init
  grid[[1]] <- replicate(size, sample(c(0,1), size, replace = TRUE, prob = prob))
  ### Calculate neighbours.
  neighbours <- cell2nb(nrow=size, ncol=size, type="queen", torus=TRUE)
  
  for (i in 2:num_reps){     ### "time step" loop.
    grid[[i]] <- grid[[i-1]]
    for(j in 1:length(grid[[i]])){    ### grid/world loop
      # Apply game rules.        
      num_neighbours <- sum(grid[[i]][neighbours[[j]]])        
      alive <- grid[[i]][j] == 1
      if(alive && num_neighbours <= 1) grid[[i]][j] <- 0   ### Tod aus Einsamkeit
      if(alive && num_neighbours >= 4) grid[[i]][j] <- 0   ### Tod wegen Überfüllung
      if(!alive && num_neighbours == 3) grid[[i]][j] <- 1  ### Besiedelung einer Zelle
    }
    if(plot) {
      image(grid[[i]], main=i) ### Plot the grid/world.
      Sys.sleep(0.3)
    }
  }
  grid
}


how_many_neighbors <- function(grid, j, k) {
  size <- nrow(grid)
  count <- 0
  if(j > 1) {
    count <- count + grid[j-1, k]
    if (k > 1) count <- count + grid[j-1, k-1]
    if (k < size) count <- count + grid[j-1, k+1]
  }
  if(j < size) {
    count <- count + grid[j+1,k]
    if (k > 1) count <- count + grid[j+1, k-1]
    if (k < size) count <- count + grid[j+1, k+1]
  }
  if(k > 1) count <- count + grid[j, k-1]
  if(k < size) count <- count + grid[j, k+1]
  count
}


