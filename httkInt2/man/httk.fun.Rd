\name{httk.fun}
\alias{httk.fun}

\title{High-throughput toxicokinetics model.}

\description{
This function solves for the amounts or concentrations in uM of a chemical in different tissues as functions of time based on the dose and dosing frequency. 
}

\usage{
httk.fun(dataset, predictionFeature, parameters)
}


\arguments{
  \item{dataset}{list of 2 objects, datasetURI:= character sring, code name of dataset, dataEntry:= data frame with 2 columns}
  \item{predictionFeature}{character string specifying which is the prediction feature in dataEntry}
  \item{parameters}{A list of four parameter values for httk, namely, chem.name (either the chemical name, CAS number, or the parameters must be specified), species (either "Rat", "Rabbit", "Dog", "Mouse", or default "Human"), days (length of the simulation, default is 10), dose (amount of a single dose, mg/kg BW - overwrites daily.dose, default is NULL)
}
}

\details{No details required.}

\value{A List 
  \item{rawModel}{ A serialized numeric matrix indicating the httk model for the various variables and their level.}
  \item{pmmlModel}{ A pmml object - now empty}
  \item{independentFeatures}{ A list of independent variables - now empty.}
  \item{predictedFeatures}{A character vector with names for the variables of the created dataset based on httk model.}
  \item{additionalInfo}{ A list including the following: all.params (all httk parameters), predictedFeatures (The character string with names for the new variables as given by httk (C of organs etc., graphs (Concentration graphs versus time for all httk parameters).}
}

\references{httk cran pacakge}

\author{Georgia Tsiliki}

\note{No notes for this function}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
getwd()
data('dat1p')

dat1p 

exmp.httk<- httk.fun(NULL,NULL,dat1p)
}

\keyword{httk}