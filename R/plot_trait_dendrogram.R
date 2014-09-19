
#' Title: Plot a phylogeny with discrete character traits <br />
#' Description: Plots a phylogeny with binary or discrete character states, given a tree and a trait matrix <br />
#'
#' Parameters: apetree (an ape tree object) <br />
#' Parameters: character_matrix (a data frame of species:trait relationship) <br />
#' Parameters: tree_type (what class of tree to build; defaults to phylogram) <br />
#' Parameters: header (the dataframe column header of your character of interest) <br />
#' Expected output: diversitree plot with color-coded characters as tips <br />
#' Author: Alex Harkess <br />
#' Example: plot_trait_dendrogram(tree, charactermatrix, tree_type="fan", trait_header="island")

plot_trait_dendrogram <- function(apetree, character_vector, tree_type="phylogram", binary_trait=FALSE, legend=TRUE, legend_cex=0.75, tiplabel_cex=0.4, legend_loc="bottomleft") {
	
	
	plot(apetree, show.tip.label=FALSE, no.margin=FALSE, type=tree_type)
	
	# binary plot colors and legend 
	if(isTRUE(binary_trait)) {
		character_vector <- character_vector + 1
		tipcols <- c("lightblue","red")
		tiplabels(col=tipcols[character_vector], pch=19, cex=tiplabel_cex)
		
		if(isTRUE(legend)) {
			legend(legend_loc, legend=as.character(unique(character_vector)), fill=unique(tipcols[character_vector]), bty="n", border=FALSE, cex=legend_cex)
		}
	}
	
	# discrete plot colors and legend
	else {
		tiplabels(col=character_vector, pch=19, cex=tiplabel_cex)
		if(isTRUE(legend)) {
			legend(legend_loc, legend=unique(character_vector), fill=unique(character_vector), bty="n", border=FALSE, cex=legend_cex)
		}
	}
}
