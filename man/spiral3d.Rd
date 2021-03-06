\name{spiral3d}
\alias{spiral3d}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Seashell cone in 3d
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
spiral3d(phi, R=1, a=1, b=1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{phi}{
%%     ~~Describe \code{x} here~~
}
\item{R}{
%%     ~~Describe \code{x} here~~
}
\item{a}{
%%     ~~Describe \code{x} here~~
}
\item{b}{
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
Klara Dolos
}

\seealso{
\code{\link{seashell}}
}
\examples{
phi <- seq(0,100, len=1000)
R <- 1/100
a <- 1
b <- 1
spiral <- spiral3d(phi=phi, R=R, a=a, b=a)

library(scatterplot3d)
x11(width=12)
par(mfrow=c(1,2), mar=c(4,4,4,1))
plot(spiral$x, spiral$y, type="l", asp=1, main="2D Spirale", xlab="x", ylab="y", col="steelblue4", lwd=1.5)
scatterplot3d(spiral$x, spiral$y, spiral$z, type="l", asp=1, main="3D Schneckenhaus", xlab="x", ylab="y", zlab="z", color="steelblue4", lwd=1.5)
}

