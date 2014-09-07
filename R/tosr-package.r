#' tosr.
#'
#' @name tosr
#' @docType package
NULL

# pull a local copy of the database into memory
# ex:  extract_db("plant")

extract_db <- function(...) {
	opts <- list(...)
	if ('plant' %in% opts) {
		cat("loading plant db")
		return(plant_tos<-read.csv(url("http://bbrowse.biol.berkeley.edu/treeV2/styled/downloads-3/files/plantsTreeOfSex.csv")))
	}
	if ('vertebrate' %in% opts) {
		cat("loading vertebrate db")
		return(vertebrate_tos <- read.csv(url("http://bbrowse.biol.berkeley.edu/treeV2/styled/downloads/files/vertebrateTreeOfSex.csv")))
	}
	if ('invertebrate' %in% opts) {
		cat("loading invertebrate db")
		return(invertebrate_tos <- read.csv(url("http://bbrowse.biol.berkeley.edu/treeV2/styled/downloads-2/files/invert.data.csv")))
		}
}

