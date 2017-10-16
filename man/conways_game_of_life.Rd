\name{conways_game_of_life}
\alias{conways_game_of_life}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Conways game of life
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
conways_game_of_life(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
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
### Simulate
mygrid <- Conway_game_of_life(size = 50, num_reps = 200, prob = c(0.01, 0.99), plot=TRUE)

### Plot the result
x11()
for(i in 1:length(mygrid)) {
  image(mygrid[[i]], main=i, col=c("white", "green"))
  Sys.sleep(0.1)
}

### Plot population sizes over time.
pop <- sapply(mygrid, sum)/length(mygrid[[1]])

x11()
par(mar=c(5,5,1,1))
plot(pop ~ seq(1,length(pop), by=1), xlab="Time", ylab="Population size", cex.axis=1.5, cex.lab=1.5, type="l", col="darkred", lwd=1.5, ylim=c(0,0.5))

### Compare several runs with the same parameters!
reps <- replicate(10, Conway_game_of_life(size = 10, num_reps = 30, prob = c(0.5, 0.5), plot=FALSE), simplify = FALSE)

pops <- sapply(reps, function(x) sapply(x, sum)/length(x[[1]]))

x11()
matplot(seq(1,nrow(pops), by=1), pops, xlab="Time", ylab="Population size", cex.axis=1.5, cex.lab=1.5, type="l", col=rainbow(ncol(pops)), lwd=1.5, ylim=c(0,0.6))

### Create a gif
saveGIF(Conway_game_of_life(size = 50, num_reps = 100, prob = c(0.01, 0.99), plot=TRUE), movie.name = "animation.gif", img.name = "Rplot", convert = "convert",  interval = 0.6)

}
