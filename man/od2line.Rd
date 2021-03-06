% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/od-funs.R
\name{od2line}
\alias{od2line}
\alias{od2line2}
\title{Convert flow data to SpatialLinesDataFrame}
\usage{
od2line(flow, zones, destinations = NULL, zone_code = names(zones)[1],
  origin_code = names(flow)[1], dest_code = names(flow)[2],
  zone_code_d = NA, silent = TRUE)

od2line2(flow, zones)
}
\arguments{
\item{flow}{A data frame representing the flow between two points
or zones. The first two columns of this data frame should correspond
to the first column of the data in the zones. Thus in \code{\link[=cents]{cents()}},
the first column is geo_code. This corresponds to the first two columns
of \code{\link[=flow]{flow()}}.}

\item{zones}{A SpatialPolygonsDataFrame or SpatialPointsDataFrame
representing origins (and destinations if no separate destinations object is provided)
of travel flows.}

\item{destinations}{A SpatialPolygonsDataFrame or SpatialPointsDataFrame
representing destinations of travel flows.}

\item{zone_code}{Name of the variable in \code{zones} containing the ids of the zone.
By default this is the first column names in the zones.}

\item{origin_code}{Name of the variable in \code{flow} containing the ids of the zone of origin.
By default this is the first column name in the flow input dataset.}

\item{dest_code}{Name of the variable in \code{flow} containing the ids of the zone of destination.
By default this is the second column name in the flow input dataset or the first column name in the
destinations if that is set.}

\item{zone_code_d}{Name of the variable in \code{destinations} containing the ids of the zone.
By default this is the first column names in the destinations.}

\item{silent}{TRUE by default, setting it to TRUE will show you the matching columns}
}
\description{
Origin-destination ('OD') flow data is often provided
in the form of 1 line per flow with zone codes of origin and destination
centroids. This can be tricky to plot and link-up with geographical data.
This function makes the task easier.
}
\details{
The function expects zone codes to be in the 1st column of the zones/destinations
datasets and the 1st and 2nd columns of the flow data, respectively.

\code{\link[=od2line2]{od2line2()}} is a faster implementation
(around 6 times faster on large datasets)
that returns a \code{SpatialLines} object, omitting the data and working
only when there is no destinations dataset (i.e. when the geography of
origins is the same as that of destinations).
}
\examples{
data(flow) # load example data - see ?flow for mor information
data(cents)
newflowlines <- od2line(flow = flow, zones = cents)
newflowlines2 <- od2line2(flow = flow, zones = cents)
plot(cents)
lines(newflowlines, lwd = 3)
lines(newflowlines2, col = "white")
nfl_sldf <- sp::SpatialLinesDataFrame(newflowlines, flow, match.ID = FALSE)
identical(nfl_sldf, newflowlines)
# When destinations are different
data(destinations)
head(flow_dests[1:5]) # check data
head(destinations@data[1:5])
flowlines_dests <- od2line(flow_dests, cents, destinations = destinations, silent = FALSE)
plot(flowlines_dests)
nfl_sf <- od2line(flow, zones_sf)
}
