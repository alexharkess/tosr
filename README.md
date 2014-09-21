[![Build Status](https://travis-ci.org/alexharkess/tosr.svg?branch=master)](https://travis-ci.org/alexharkess/tosr)

tosr
====

An R interface to the Tree of Sex database <br />

tosr is a toolkit to extract and phylogenetically display information from the [Tree of Sex database](www.treeofsex.org), a large aggregation of sexual character data across plants, vertebrates, and invertebrates. 


## installation ##

```r
library(devtools)

install_github("alexharkess/tosr")

library(tosr)
```

## examples ##

First we pull some Tree of Sex into R using the function get_tos_database(). Here I extract the plant database, but you could also extract vertebrate and invertebrate.

```r
plant_sex <- get_tos_database("plant")
```

What traits are in the plant database?

```r
> colnames(plant_sex)
 [1] "kingdom"                "higher_taxonomic_group" "order"                 
 [4] "family"                 "genus"                  "species"               
 [7] "species_author"         "infraspecific"          "common_name"           
[10] "hybrid"                 "hybrid_source"          "plant_list_status"     
[13] "plant_list_name"        "sexual_system"          "sexual_system_source"  
[16] "selfing"                "selfing_source"         "growth_form"           
[19] "growth_form_source"     "woodiness"              "woodiness_count"       
[22] "woodiness_source"       "life_form"              "life_form_source"      
[25] "gametophytic_n"         "gametophytic_n_min"     "gametophytic_n_mean"   
[28] "gametophytic_n_source"  "sporophytic_n"          "sporophytic_n_min"     
[31] "sporophytic_n_mean"     "sporophytic_n_source"   "karyotype"             
[34] "karyotype_source"       "molecular_basis"        "molecular_basis_source"
[37] "genotype"               "genotype_source"        "notes"                 
[40] "entry_email"
```

By default I change the rownames to "Genus species", but you can turn this behavior off by specifying ```rows_as_species=FALSE```

Now we can attach some of this data to a tree. Let's download a large Solanaceae tree first:

```r
library(RCurl)
library(ape)
library(diversitree)

# grab a tree
temp_tree <- getURL("https://raw.githubusercontent.com/lukejharmon/traitathon/master/solanaceae/Solanaceae.tre")
sol_tree <- read.tree(text = temp_tree)
```

Now that we have a tree object in ape, we need to modify the tree tip labels to match up with the rownames of the ToS database. In this case, I just needed to remove underscores separating the genus and species. 

```r
sol_tree$tip.label <- sub("_"," ",sol_tree$tip.label)
```

Now all that's left is to match up the ToS data to our tree tip data. Here I match up the ToS data for Sexual System against the tree tip species names. If there isn't a ToS entry for a species in my tree, call it "unknown".

```r
tipchars <- ifelse(sol_tree$tip.label %in% rownames(plant_sex),plant_sex$sexual_system,NA)
sex_levels <- levels(plant_sex$sexual_system)
solanaceae_sex <- sex_levels[tipchars]
solanaceae_sex[is.na(solanaceae_sex)] <- "unknown" 
solanaceae_sex <- as.factor(solanaceae_sex)
```

I wrote a simple wrapper around some plotting functions of ```diversitree``` that will plot and color tips for you. Let's put these characters on the Solanaceae tree.

```r
palette(c("blue","red", "yellow","orange","purple","lightgreen","darkgreen","lightblue","grey"))
plot_trait_dendrogram(sol_tree, solanaceae_sex, tree_type="fan", tiplabel_cex=0.15, legend=TRUE, legend_loc="bottomleft", legend_cex=0.6)
```

![solanaceae_example.png](http://i.imgur.com/oV7jzMC.jpg)
