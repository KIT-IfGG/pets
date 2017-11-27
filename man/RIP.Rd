\name{RIP}
\alias{RIP}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
RIP
}
\description{
Three types of bacteria live in a petri dish. R has the highest reproduction rate followed by I and P. I is immune against the poison produced by P.
}
\usage{
RIP(n=100, timesteps=50, sleep=0.1, col=c("blue", "yellow", "red"), image=TRUE) 
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n}{
Grid size
}
 \item{timesteps}{
Number of iterations
}
 \item{sleep}{
Argument for function Sys.sleep()
}
 \item{col}{
Color vector
}
 \item{image}{
Plot image during simulation TRUE/FALSE
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
List of matrices with three species coded with 1, 2 and 3.

1 | R, high reproduction

2 | I, immune against poisson, but lower reproduction than R

3 | P, poissoness species, but less reposduction than the other two

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
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

mycols <- c("blue", "yellow", "red")

### Simulate and plot
RIP(n=100, timesteps=50, sleep=0.1, col=mycols, image=TRUE) 

### Save grids for later
res <- RIP(n=100, timesteps=100, sleep=0, col=mycols, image=FALSE) 

### Plot Population size over time
pops <- do.call(rbind, lapply(res, function(m) c(sum(m[]==1), sum(m[]==2), sum(m[]==3))))
matplot(1:length(res), pops, type="l", col=mycols, lwd=2, xlab="Zeitschritte", ylab="Populationsgröße")

# saveGIF(RIP(n=100, timesteps=100, sleep=0, col=mycols, image=TRUE) , movie.name = "animation.gif", img.name = "Rplot", convert = "convert",  interval = 0.6)
# file.copy("/tmp/RtmpVqjsL1/animation.gif", ".../rip4.gif")
}

\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
