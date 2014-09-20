[![Build Status](https://travis-ci.org/alexharkess/tosr.svg?branch=master)](https://travis-ci.org/alexharkess/tosr)

tosr
====

An R interface to the Tree of Sex database <br />

tosr is a toolkit to extract information from the [Tree of Sex database](www.treeofsex.org), a large aggregation of sexual character data across plants, vertebrate, and invertebrates. 


## installation ##

```r
library(devtools)

install_github("alexharkess/tosr")
```

## examples ##

First we pull some Tree of Sex into R using the function get_tos_database(). Here I extract the plant database, but you could also extract vertebrate and invertebrate.

```r
plant_sex <- get_tos_database("plant")
```

Now we can manipulate this database
