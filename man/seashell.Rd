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
seashell(x)
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
ncells=20; timesteps=100; init.prob=0.4

m <- seashell(ncells=100, timesteps=150, init.prob=0.1)
image(m, col=c("white", "darkgreen"))

}
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
