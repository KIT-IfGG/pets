\name{seashell}
\alias{seashell}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Seashell 1D
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
seashell(ncells=20, timesteps=100, init.prob=0.4)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ncells}{
Number of cells.
}

 \item{timesteps}{
Iterations to be simulated
}

 \item{init.prob}{
Probability at initialization that a cell is occupied.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Matrix with each row representing the world for different iterations.
}
\references{
Coombes, S (2009)
}
\author{
Klara Dolos
}



\seealso{

\code{\link{spiral3d}}
}
\examples{
ncells=20; timesteps=100; init.prob=0.4
m <- seashell(ncells=100, timesteps=150, init.prob=0.1)
image(m, col=c("white", "darkgreen"))

}
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
