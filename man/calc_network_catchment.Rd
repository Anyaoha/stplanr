% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/catchmentArea.R
\name{calc_network_catchment}
\alias{calc_network_catchment}
\title{Calculate catchment area and associated summary statistics using network.}
\usage{
calc_network_catchment(sln, polygonlayer, targetlayer, calccols,
  maximpedance = 1000, distance = 100,
  projection = paste0("+proj=aea +lat_1=90 +lat_2=-18.416667",
  " +lat_0=0 +lon_0=10 +x_0=0 +y_0=0",
  " +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs"),
  retainAreaProportion = FALSE, dissolve = FALSE)
}
\arguments{
\item{sln}{The SpatialLinesNetwork to use.}

\item{polygonlayer}{A SpatialPolygonsDataFrame containing zones from which
the summary statistics for the catchment variable will be calculated.
Smaller polygons will increase the accuracy of the results.}

\item{targetlayer}{A SpatialPolygonsDataFrame, SpatialLinesDataFrame or
SpatialPointsDataFrame object containing the specifications of the
facilities and zones for which the catchment areas are being calculated.}

\item{calccols}{A vector of column names containing the variables in the
polygonlayer to be used in the calculation of the summary statistics for
the catchment area. If dissolve = FALSE, all other variables in the
original SpatialPolygonsDataFrame for zones that fall partly or entirely
within the catchment area will be included in the returned
SpatialPolygonsDataFrame but will not be adjusted for the proportion within
the catchment area.}

\item{maximpedance}{The maximum value of the network's weight attribute in
the units of the weight (default = 1000).}

\item{distance}{Defines the additional catchment area around the network
in the units of the projection.
(default = 100 metres)}

\item{projection}{The proj4string used to define the projection to be used
for calculating the catchment areas or a character string 'austalbers' to
use the Australian Albers Equal Area projection. Ignored if the polygonlayer
is projected in which case the targetlayer will be converted to the
projection used by the polygonlayer. In all cases the resulting object will
be reprojected to the original coordinate system and projection of the
polygon layer. Default is an Albers Equal Area projection but for more
reliable results should use a local projection (e.g., Australian Albers
Equal Area project).}

\item{retainAreaProportion}{Boolean value. If TRUE retains a variable in
the resulting SpatialPolygonsDataFrame containing the proportion of the
original area within the catchment area (Default = FALSE).}

\item{dissolve}{Boolean value. If TRUE collapses the underlying zones
within the catchment area into a single region with statistics for the
whole catchment area.}
}
\description{
Calculate catchment area and associated summary statistics using network.
}
\section{Details}{

Calculates the catchment area of a facility (e.g., cycle path) using
network distance (or other weight variable) as well as summary statistics
from variables available in a SpatialPolygonsDataFrame with census tracts
or other zones. Assumes that the frequency of the variable is evenly
distributed throughout the zone. Returns a SpatialPolygonsDataFrame.
}

\examples{
\dontrun{
data_dir <- system.file("extdata", package = "stplanr")
unzip(file.path(data_dir, "smallsa1.zip"), exdir = tempdir())
unzip(file.path(data_dir, "testcycleway.zip"), exdir = tempdir())
unzip(file.path(data_dir, "sydroads.zip"), exdir = tempdir())
sa1income <- readOGR(tempdir(), "smallsa1")
testcycleway <- readOGR(tempdir(), "testcycleway")
sydroads <- readOGR(tempdir(), "roads")
sydnetwork <- SpatialLinesNetwork(sydroads)
calc_network_catchment(
  sln = sydnetwork,
  polygonlayer = sa1income,
  targetlayer = testcycleway,
  calccols = c("Total"),
  maximpedance = 800,
  distance = 200,
  projection = "austalbers",
  dissolve = TRUE
)
}
}
