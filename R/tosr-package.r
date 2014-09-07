#' tosr.
#'
#' @name tosr
#' @docType package
NULL

# pull a local copy of the database into memory
# ex:  extract_db("plant") or extract_db("plant","vertebrate")

extract_db <- function(...) {
	# making opts a global variable to check in the future if users dl'ed more than one database
	opts <<- list(...)
	if ('plant' %in% opts) {
		cat("loading plant db\n")
		plant_tos <<- read.csv(url("http://bbrowse.biol.berkeley.edu/treeV2/styled/downloads-3/files/plantsTreeOfSex.csv"))
	}
	if ('vertebrate' %in% opts) {
		cat("loading vertebrate db\n")
		vertebrate_tos <<- read.csv(url("http://bbrowse.biol.berkeley.edu/treeV2/styled/downloads/files/vertebrateTreeOfSex.csv"))
	}
	if ('invertebrate' %in% opts) {
		cat("loading invertebrate db\n")
		invertebrate_tos <<- read.csv(url("http://bbrowse.biol.berkeley.edu/treeV2/styled/downloads-2/files/invert.data.csv"))
		}
}

# pull in a users newick tree with ape
# prerequisite issues : users need to be sure their newick species names are identical to the ToS names
# test tree in tests/asparagus.tos.newick
# ex: myTree <- read.newick("")

