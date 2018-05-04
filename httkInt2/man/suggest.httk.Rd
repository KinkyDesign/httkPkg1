\name{suggest.httk}
\alias{suggest.httk}

\title{Returns a data frame for compartmental model as in httk.}

\description{
Returns a data frame of class deSolve with a column for time(in days), each compartment, the area under the curve, and plasma concentration and a row for each time point. 
}

\usage{
suggest.httk(dataset, rawModel, pmmlModel, independentFeatures, predictedFeatures, additionalInfo)
}

\arguments{
  \item{dataset}{Dataset for prediction - here empty.
}
  \item{rawModel}{An R deSolve serialized data table as resultes from solve_pbtk().
}
  \item{pmmlModel}{A pmml model - here null.}
  \item{independentFeatures}{Independent features in case of prediction - here null.}
  \item{predictedFeatures}{Predicted features in case of prediction - here null.}
  \item{additionalInfo}{All additional information needed for httk.fun() plus the names of the compartmental model produced ('predictedFeatures'). 
}
}

\details{No further details required.}

\value{
A list of one objected called 'predictions' which is also a list of data-frames each containing compartmental values/ measurements per time point considered (961 default time points). This object is a matrix for the httk model.
}

\references{httk cran package}

\author{Georgia Tsiliki}

\note{No notes for this function}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

data('dat2m')
data('dat2i')
s1<- suggest.httk(NULL, dat2m, NULL, NULL, NULL, dat2i)
}

\keyword{ suggestHTTK }