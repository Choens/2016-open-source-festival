## #############################################################################
## entries
##
## Downloads all the data from a mongodb Nightscout server and
## saves it as a CSV file in the data folder.
##
##
## #############################################################################

## Init ------------------------------------------------------------------------
library(devtools)
library(mongolite)
load_all()


## Open connection to Mongo ----------------------------------------------------
con <- mongo(collection ="entries",
             url = paste("mongodb://",ns_user,":",ns_pw,ns_host,ns_db, sep="")
             )

entries <- con$find()


## Data Clean Up -----------------------------------------------------------

## Fixes dates.
## I'm not sure why I have to divide by 1000.
entries$date <- as.POSIXct(entries$date/1000, origin = "1970-01-01 00:00:01")

## Saves the data.
save(entries, file="data/entries.rda")

## Clean up the session and good-bye.
## If you don't want to immediately wipe out your session status,
## comment out this last line.
rm( list=ls() )
