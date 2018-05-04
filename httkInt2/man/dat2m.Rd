\name{dat2m}
\alias{dat2m}
\docType{data}

\title{
Serialize deSolve R object containing a data-frame of 13 ojects as they result by solve_pbtk() and its default values.
}

\description{
Serialize deSolve R object containing a data-frame of 13 ojects as they result by solve_pbtk() and its default values. The variables given are "time", "Agutlumen", "Cart", "Cven", "Clung", "Cgut", "Cliver", "Ckidney", "Crest", "Ametabolized", "Atubules", "Cplasma", "AUC".
}

\usage{data("dat2m")}

\format{A character string.}

\details{Example raw model produced by httk.fun()}

\source{A toy example for httk.fun based on jaqpot specifications}

\references{httk cran package}

\examples{
data(dat2m)
## maybe str(dat2m) ; plot(dat2m) ...
}

\keyword{datasets2m}