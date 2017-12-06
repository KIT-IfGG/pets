\name{beetles_simulate}
\alias{beetles_simulate}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Bark beetle proliferation in a forest
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
beetles_simulate(n_steps = 10, world_size = 100, dispPar = 20, plot_flag = TRUE, col_forest = c("brown", "green", "darkgreen"), col_beetle = c("white", "blue"), regrowth = 0.2, sleep = 1, K = 10, write_out = FALSE, young_forest = 3, beetle_reproduction = 0.5)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n_steps}{
%%     ~~Describe \code{n_steps} here~~
}
  \item{world_size}{
%%     ~~Describe \code{world_size} here~~
}
  \item{dispPar}{
%%     ~~Describe \code{dispPar} here~~
}
  \item{plot_flag}{
%%     ~~Describe \code{plot_flag} here~~
}
  \item{col_forest}{
%%     ~~Describe \code{col_forest} here~~
}
  \item{col_beetle}{
%%     ~~Describe \code{col_beetle} here~~
}
  \item{regrowth}{
%%     ~~Describe \code{regrowth} here~~
}
  \item{sleep}{
%%     ~~Describe \code{sleep} here~~
}
  \item{K}{
%%     ~~Describe \code{K} here~~
}
  \item{write_out}{
%%     ~~Describe \code{write_out} here~~
}
  \item{young_forest}{
%%     ~~Describe \code{young_forest} here~~
}
  \item{beetle_reproduction}{
%%     ~~Describe \code{beetle_reproduction} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (n_steps = 10, world_size = 100, dispPar = 20, plot_flag = TRUE, 
    col_forest = c("brown", "green", "darkgreen"), col_beetle = c("white", 
        "blue"), regrowth = 0.2, sleep = 1, K = 10, write_out = FALSE, 
    young_forest = 3, beetle_reproduction = 0.5) 
{
    if (!"temp" \%in\% list.files() & write_out) 
        dir.create("temp")
    world <- matrix(0, nrow = world_size, ncol = world_size)
    world[round(world_size/2), round(world_size/2)] <- K
    forest <- world
    forest[] <- ifelse(world[] == 0, young_forest, 0)
    coords <- numeric(length = 2)
    pops <- matrix(NA, dimnames = list(NULL, c("beetles", "forest")), 
        nrow = n_steps, ncol = 2)
    worlds <- list()
    forests <- list()
    for (t in 1:n_steps) {
        print(t)
        forest[forest[] > 0] <- forest[forest[] > 0] + 1
        if (plot_flag) {
            forest_fig <- forest
            forest_fig[forest_fig[] <= young_forest & forest_fig[] > 
                0] <- 1
            forest_fig[forest_fig[] > young_forest] <- 2
            par(mfrow = c(1, 3), cex = 1.2, mar = c(1, 1, 1, 
                1), oma = c(2, 2, 2, 2))
            image(world, col = col_beetle, asp = 1, axes = F)
            image(forest_fig, col = col_forest[1 + as.numeric(names(table(forest_fig)))], 
                main = paste0("Time step = ", t), asp = 1, axes = F)
            par(mar = c(1, 4, 1, 1))
            matplot(x = matrix(1:n_steps, nrow = nrow(pops), 
                ncol = 2), y = pops, ylim = c(0, 1), col = c(col_beetle[2], 
                col_forest[2]), type = "l", lty = 1, lwd = 2, 
                xlab = "Time", ylab = "Population")
        }
        newworld <- world
        for (i in sample.int(length(world))) {
            if (world[i] > 0) {
                coords[1] <- ceiling(i/world_size)
                coords[2] <- i - ((coords[1] - 1) * world_size)
                while (newworld[i] > 0) {
                  dist <- sample(1:world_size, 1, prob = dexp(seq(0, 
                    1, len = world_size), rate = dispPar))
                  angle <- runif(1, 0, 2 * pi)
                  dcol <- round(dist * cos(angle))
                  drow <- round(dist * sin(angle))
                  newcoords <- c(coords[1] + dcol, coords[2] + 
                    drow)
                  if (newcoords[1] <= world_size & newcoords[2] <= 
                    world_size & newcoords[1] > 0 & newcoords[2] > 
                    0) {
                    newworld[i] <- newworld[i] - 1
                    if (forest[newcoords[2], newcoords[1]] > 
                      young_forest & newworld[newcoords[2], newcoords[1]] < 
                      K) 
                      newworld[newcoords[2], newcoords[1]] <- newworld[newcoords[2], 
                        newcoords[1]] + round(beetle_reproduction * 
                        K)
                  }
                  else {
                    newworld[i] <- newworld[i] - 1
                  }
                }
            }
        }
        world <- newworld
        forest[world[] > 0] <- 0
        forest[world[] == 0 & forest[] == 0] <- sample(c(0, 1), 
            size = sum(world[] == 0 & forest[] == 0), prob = c(1 - 
                regrowth, regrowth), replace = T)
        pops[t, "forest"] <- sum(forest[] > 0)/length(forest)
        pops[t, "beetles"] <- sum(world[] > 0)/(length(world) * 
            K)
        if (write_out) {
            write.table(world, paste0("temp/world_", t, ".txt"))
            write.table(forest, paste0("temp/forest_", t, ".txt"))
        }
        else {
            worlds[[t]] <- world
            forests[[t]] <- forest
        }
        Sys.sleep(sleep)
    }
    if (write_out) {
        write.table(pops, paste0("temp/population.txt"))
    }
    else {
        list(worlds = worlds, forests = forests, pops = pops)
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
