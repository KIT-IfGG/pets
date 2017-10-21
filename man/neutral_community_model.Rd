\name{neutral_community_model}
\alias{neutral_community_model}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
neutral_community_model
}
\description{
The neutral community model of Stephen Hubbell.
}
\usage{
neutral_community_model(nspecies=8, gridsize=20, time=100, pdf=FALSE, plotpop=TRUE, sleep=0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{nspecies}{
Integer. Number of species to be simulated.
}
  \item{gridsize}{
Integer. Edge lenth of the grid.
}

  \item{time}{
Time steps to be simulated.
}
  \item{pdf}{
If TRUE, a pdf file will be produced for each time step.
}

  \item{plotpop}{
If TRUE, a plot of the population dynamics over time will be provided in the end of the simulation.
}

  \item{sleep}{
Value for function Sys.sleep().
}

}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Matrix with population sizes for each time step.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Klara Dolos
}
\note{
[Duncan Golicher's weblog](http://duncanjg.wordpress.com/2008/03/07/a-simple-illustration-of-an-ecological-lottery-model-in-r/)
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

mat <- neutral_community_model(nspecies=8, gridsize=20, time=10, pdf=FALSE, plotpop=TRUE, sleep=0.3, density=FALSE)

mat_dens <- neutral_community_model(nspecies=8, gridsize=20, time=10, pdf=FALSE, plotpop=TRUE, sleep=0.3, density=TRUE)

par(mfrow=c(2,1), mar=c(0,0,0,0), oma=c(5,4,1,1))
matplot(mat, type="l", axes=F, ylim=c(0, max(c(mat), mat_dens)))
axis(2); box()
matplot(mat_dens, type="l", ylim=c(0, max(c(mat), mat_dens)))

}

