# delete all vars
rm(list=ls(all=TRUE))

# set working directory
initial.dir<-getwd()
dirn <- "/Users/jakob/GitHub/bacteria-plot"
setwd(dirn)

# source file is based on https://en.wikipedia.org/wiki/List_of_clinically_important_bacteria
filen <- "bacteria_raw_sort.csv"
bact <- read.csv(filen, header = TRUE, sep = ",")

# select 3 columns of the source file
sel <- bact[,c("Name","Gram_staining","Motility")]
print(sel)

# check for required packages, if not present -> install
if(!(require("ggparallel"))) {
 install.packages("ggparallel") }

if(!(require("ggparallel"))) {
  install.packages("RColorBrewer") }

# load packages
library(ggparallel)
library(RColorBrewer)

# plot
ggparallel(list("Gram_staining", "Shape","Respiration"), data=bact, method="parset", text.angle=0, color="black")  + 
  scale_fill_manual(values = c( brewer.pal("Set3", n = 10), rep("grey80", 0)), guide="none") + 
          scale_colour_manual(values = c( brewer.pal("Set3", n = 10), rep("grey80", 0)), guide="none") +
          theme_bw()
