source("https://bioconductor.org/biocLite.R")
biocLite("biomaRt")
library(biomaRt)

setwd("RNA-seq/Normal/Genelist")
trans_id <- read.table("raw_transcripts_3.csv", header = T, sep = ",")
ensembl = useEnsembl(biomart="ensembl", dataset="hsapiens_gene_ensembl")
hgnc_swissprot <- getBM(attributes=c('ensembl_transcript_id','ensembl_gene_id',
                                     'hgnc_symbol'),
                        filters = 'ensembl_transcript_id', 
                        values = trans_id$transcript.id, 
                        mart = ensembl)
write.table(hgnc_swissprot, file = "raw_genes_3.txt",sep = "\t")






