# run this code before the analysis to CREATE and LOAD the enhancer annotation options
# get rtracklayer package
source("https://bioconductor.org/biocLite.R")
biocLite("rtracklayer")
library("rtracklayer")
library(RnBeads)
# Retrieve the track from UCSC Table Browser (refer to manual 5.2.1 Custom annotation)

session <- browserSession()
genome(session) <- "hg19"
tab.chromK562 <- getTable(ucscTableQuery(session,track="wgEncodeAwgSegmentation", table="wgEncodeAwgSegmentationChromhmmK562"))

# extract enhancer regions

tab.enhancersK562 <- tab.chromK562[grep("Enh", tab.chromK562$name), ]
tab.enhancersK562 <- tab.enhancersK562[, c("chrom", "chromStart", "chromEnd", "name")]
colnames(tab.enhancersK562) <- c("chromosome", "start", "end", "name")
rnb.set.annotation("enhancerK562", tab.enhancersK562, assembly="hg19")
rnb.options(region.types=c(rnb.getOption("region.types"),"enhancerK562"))

# Do the same for annother annotation track- Gm12878
tab.chromGm12878 <- getTable(ucscTableQuery(session,track="wgEncodeAwgSegmentation", table="wgEncodeAwgSegmentationChromhmmGm12878"))
tab.enhancersGm12878 <- tab.chromGm12878[grep("Enh", tab.chromGm12878$name), ]
tab.enhancersGm12878 <- tab.enhancersGm12878[, c("chrom", "chromStart", "chromEnd", "name")]
colnames(tab.enhancersGm12878) <- c("chromosome", "start", "end", "name")
rnb.set.annotation("enhancerGm12878", tab.enhancersGm12878, assembly="hg19")
rnb.options(region.types=c(rnb.getOption("region.types"),"enhancerGm12878"))

rnb.region.types() # list the region types to carry out analysis on

# save tab.enhancersGm12787 as a data.frame text file, so the next time it can be loaded directly
write.table(x=tab.enhancersGm12878, file="/Users/fangwu/Documents/540/data/Data/Progenitors/rnbeads/enhancerGm12878.txt",quote = F)
write.table(x=tab.enhancersK562, file="/Users/fangwu/Documents/540/data/Data/Progenitors/rnbeads/enhancerK562.txt",quote = F)

rnb.options(region.types=c("genes","promoters","enhancerK562","enhancerGm12878"))
rnb.getOption("region.types")

# Run analysis - same as previous
data.dir <- "/Users/fangwu/Documents/540/data/Data/Progenitors/BED"
sample.annotation <- file.path(data.dir, "annotationMPP-CMP.csv")
analysis.dir <- "/Users/fangwu/Documents/540/data/Data/Progenitors/rnbeads5"
report.dir <- file.path(analysis.dir, "reports")
data.source<-c(data.dir, sample.annotation)

rnb.options(import.bed.style="bismarkCov")
rnb.options(filtering.greedycut=F)
rnb.options(differential = TRUE)
rnb.options("differential.comparison.columns"=c("cellTypeCode"))
rnb.run.analysis(dir.reports=report.dir, data.source=data.source,data.type="bs.bed.dir")

read.table(file="diffMethTable_region_cmp1_promoters.csv")
