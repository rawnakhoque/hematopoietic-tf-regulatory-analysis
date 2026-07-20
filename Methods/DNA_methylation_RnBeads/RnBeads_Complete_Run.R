library(RnBeads)
require(ff)
data_dir <- "/Volumes/Dark/Study/University of British Columbia/Courses/GSAT 540/Project/Combined Data"
annotation <- file.path(data_dir, "annotation.csv") # file.path() attaches the file mentioned in 2nd argument to an R object that you assign to. 
data.source <- c(data_dir, annotation)

# Directory where the file is written
analysis.dir <- "/Volumes/Dark/Study/University of British Columbia/Courses/GSAT 540/Project/analysis1.4"

# Directory where the report file is written
report.dir <- file.path(analysis.dir, "reports_details")

rnb.options(disk.dump.big.matrices=TRUE)
options(fftempdir = "/Volumes/Dark/Study/University of British Columbia/Courses/GSAT 540/Project/ff")
rnb.options(logging.disk=TRUE)
rnb.options(enforce.memory.management=TRUE)

rnb.initialize.reports(report.dir)
rnb.options(import.bed.style="bismarkCov")
rnb.options("import.bed.columns")
rnb.options(filtering.greedycut=F)
rnb.options(differential = TRUE)
rnb.options("differential.comparison.columns"=c("cellTypeCode"))

rnb.run.analysis(dir.reports = report.dir, data.source = data.source, data.type = "bs.bed.dir")

