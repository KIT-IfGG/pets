\name{neutral_community_model}
\alias{neutral_community_model}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
neutral_community_model
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
neutral_community_model(x)
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
\examples{neutral_community_model(nspecies=3, gridsize=20, time=100, pdf=FALSE, plotpop=TRUE, sleep=0.3)

neutral_community_model_density(nspecies=3, gridsize=20, time=100)

library(animation)
saveGIF(neutral_community_model(nspecies=3, gridsize=20, time=100, pdf=FALSE, plotpop=FALSE, sleep=0.3), movie.name = "animation.gif", img.name = "Rplot", convert = "convert", clean = TRUE)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
