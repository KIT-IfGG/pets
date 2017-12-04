\name{gradient_legend}
\alias{gradient_legend}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Gradient legend
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
gradient_legend(labels, color_palette, cex=0.7, lab_shift=0.5)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{labels}{
Labels of the legend. Must be provided suitable to the colors used in the image, i.e. min and max must be the same.
}
  \item{color_palette}{
Color palette used in the plot.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}

\references{
%% ~put references to the literature/web site here ~
}
\author{
Klara Dolos
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
layout(matrix(1:2, nrow=1), widths=c(0.8,0.2))
image(matrix(1:100, nrow=10), col=heat.colors(20))
gradient_legend(labels=round(seq(1,100, len=6)), color_palette=heat.colors(6), cex=1, lab_shift=0.45)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
