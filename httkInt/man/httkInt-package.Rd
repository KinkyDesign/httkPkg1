\name{httkInt-package}
\alias{httkInt-package}
\alias{httkInt}
\docType{package}
\title{
\packageTitle{httkInt}
}
\description{
\packageDescription{httkInt}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{httkInt}
\packageIndices{httkInt}
Package includes two functions, httk.fun() to built a PBTK model and function suggest.httk() to produce a data matrix with all PBTK values for the default httk model and the default time points.  
}

\author{
\packageAuthor{httkInt}

Maintainer: \packageMaintainer{httkInt}
}
\references{
Help files of httk package 
}

\keyword{ package }

\examples{
data('dat1p')
exmp.httk<- httk.fun(NULL,NULL,dat1p)
}
