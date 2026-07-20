# Prior analysis
library("rtracklayer")
library("RnBeads")

data_dir <- "~/Project_Analysis/Combined Data/"
annotation <- file.path(data_dir, "annotation_MPP-CMP.csv") 


# Directory where the file is written
analysis.dir <- "~/Project_Analysis/analysis2.2.0"

# Directory where the report file is written
report.dir <- file.path(analysis.dir, "reports_details")

# Retrieve Annotation Tracks from UCSC Genome Browser
session <- browserSession()
genome(session) <- "hg19"
trackNames(session)
tab.chromK562 <- getTable(ucscTableQuery(session,track="wgEncodeAwgSegmentation", 
                                         table="wgEncodeAwgSegmentationChromhmmK562"))

# Extract enhancers
tab.enhancersK562 <- tab.chromK562[grep("Enh", tab.chromK562$name), ]
tab.enhancersK562 <- tab.enhancersK562[, c("chrom", "chromStart", "chromEnd", "name")]
colnames(tab.enhancersK562) <- c("chromosome", "start", "end", "name")

# Set annotation to rnb analysis
rnb.set.annotation("enhancerK562", tab.enhancersK562, assembly="hg19")
rnb.options(region.types=c(rnb.getOption("region.types"),"enhancerK562"))


# Another Genome Browser Track:
tab.chromGm12878 <- getTable(ucscTableQuery(session,track="wgEncodeAwgSegmentation", table="wgEncodeAwgSegmentationChromhmmGm12878"))
tab.enhancersGm12878 <- tab.chromGm12878[grep("Enh", tab.chromGm12878$name), ]
tab.enhancersGm12878 <- tab.enhancersGm12878[, c("chrom", "chromStart", "chromEnd", "name")]
colnames(tab.enhancersGm12878) <- c("chromosome", "start", "end", "name")
rnb.set.annotation("enhancerGm12878", tab.enhancersGm12878, assembly="hg19")
rnb.options(region.types=c(rnb.getOption("region.types"),"enhancerGm12878"))

rnb.region.types()

# Write the data:
write.table(x=tab.enhancersGm12878, 
            file="/Users/somdebpaul/Project_Analysis/enhancerGm12878.txt",
            quote = F)
write.table(x=tab.enhancersK562, 
            file="/Users/somdebpaul/Project_Analysis/enhancerK562.txt",
            quote = F)

rnb.options(region.types=c("genes","promoters","enhancerK562","enhancerGm12878"))
rnb.getOption("region.types")

# -----------




rnb.initialize.reports(report.dir)
rnb.options(import.bed.style="bismarkCov")
rnb.options("import.bed.columns")
rnb.options(inference=TRUE)
rnb.options(filtering.greedycut=F)
rnb.options(filtering.sex.chromosomes.removal = TRUE)
rnb.options(differential = TRUE)
rnb.options("differential.comparison.columns"=c("cellTypeCode"))



# Run analysis:
result <- rnb.run.analysis(data.source = data.source, 
                           dir.reports = report.dir, 
                           data.type="bs.bed.dir")

