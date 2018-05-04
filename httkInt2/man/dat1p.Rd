\name{dat1p}
\alias{dat1p}
\docType{data}

\title{
A sample data oobject conatining a list of parameters for function httk.fun
}

\description{An example for list of parameters httk.fun awaits.}

\usage{data("dat1p")}

\format{
A lsit of four objects 
 \item{chem.name}{A character string indicating the chemical name of drug, defualt is "imazalil"}
  \item{species}{A character string indicating the species, one from Rat", "Rabbit", "Dog", "Mouse", or default "Human"}
 \item{days}{An integer value indicating the days of the simulation, default is 10}
 \item{dose}{The amount of a single dose, mg/kg BW - overwrites daily.dose, default is NULL}
}

\details{A list of parameters for httk.fun}

\source{
A toy example for httk.fun based on jaqpot specifications
}

\references{httk cran package}

\examples{
data(dat1p)
## maybe str(dat1p) ; plot(dat1p) ...
}

\keyword{datasetsp}