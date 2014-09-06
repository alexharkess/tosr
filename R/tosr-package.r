#' tosr.
#'
#' @name tosr
#' @docType package
NULL

# pull a local copy of the database into memory
# working with plants for now

# future -- add @opts for which db to download

plant_tos <- read.csv(url("http://bbrowse.biol.berkeley.edu/treeV2/styled/downloads-3/files/plantsTreeOfSex.csv"))
vertebrate_tos <- read.csv(url("http://bbrowse.biol.berkeley.edu/treeV2/styled/downloads/files/vertebrateTreeOfSex.csv"))
invertebrate_tos <- read.csv(url("http://bbrowse.biol.berkeley.edu/treeV2/styled/downloads-2/files/invert.data.csv"))


