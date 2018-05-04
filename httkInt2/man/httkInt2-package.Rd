\name{httkInt2-package}
\alias{httkInt2-package}
\alias{httkInt2}
\docType{package}
\title{
\packageTitle{httkInt2}
}
\description{
\packageDescription{httkInt2}
}

\details{
The DESCRIPTION file:
\packageDESCRIPTION{httkInt2}
\packageIndices{httkInt2}
Package includes two functions, httk.fun() to built a PBTK model and function suggest.httk() to produce a data matrix with all PBTK values for the default httk model and the default time points.  
}

\author{
\packageAuthor{httkInt2}
Maintainer: \packageMaintainer{httkInt2}
}

\references{Help files of httk package}

\keyword{ package }

\examples{
data('dat1p')
exmp.httk<- httk.fun(NULL,NULL,dat1p)
}