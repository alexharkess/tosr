[![Build Status](https://travis-ci.org/alexharkess/tosr.svg?branch=master)](https://travis-ci.org/alexharkess/tosr)

tosr
====

An R interface to the Tree of Sex database <br />

tosr is a toolkit to extract information from the [Tree of Sex database](www.treeofsex.org), a large aggregation of sexual character data across plants, vertebrate, and invertebrates. 


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

