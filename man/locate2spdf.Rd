% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/osrmfunctions.R
\name{locate2spdf}
\alias{locate2spdf}
\title{Return SpatialPointsDataFrame with located points from OSRM locate service}
\usage{
locate2spdf(lat, lng = lng, osrmurl = "http://router.project-osrm.org",
  return_sf = FALSE)
}
\arguments{
\item{lat}{Numeric vector containing latitude coordinate for each coordinate
to map. Also accepts dataframe with latitude in the first column and
longitude in the second column.}

\item{lng}{Numeric vector containing longitude coordinate for each
coordinate to map.}

\item{osrmurl}{Base URL of the OSRM service}

\item{return_sf}{Boolean value if this function should return an sf object, if
FALSE returns sp object (default FALSE).}
}
\description{
Return SpatialPointsDataFrame with located points from OSRM locate service
}
\section{Details}{

Retrieve coordinates of the node(s) on the network mapped from coordinates
passed to functions using OSRM API v4 only. For API v5, use nearest_osm.
}

\examples{
\dontrun{
locate2spdf(
  lat = c(50.3, 50.2),
  lng = c(13.2, 13.1)
)
}

}
