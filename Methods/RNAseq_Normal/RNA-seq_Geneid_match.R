# load RNA-seq data
alldat<-as.numeric(alldat)
cor<-cor(alldat, method=c("pearson"))
jpeg(file="RNA-seq/correlation.jpg",res=200)
pheatmap(mat=cor,scale="none",cluster_cols = F,cluster_rows = F)
dev.off()
rownames(data)<-data[,1]

# remove outlier "RNA_D2_GMP_100"
data<-data[,c(-12)]

# remove samples that will not be used in this study - HSCbm, MLP0, MLP2, MLP3
colnames(data)
data<-data[,c(2:4,7,10:13)]

# Normalization using DESeq-"sizefactor"
data.frame(row.names=colnames(data),condition=c("CLP","GMP","HSC","MLP","MPP","CMP","MLP","MPP"))->metadata
cds=newCountDataSet(countData = data,conditions = metadata)
cds = estimateSizeFactors(cds)
sizeFactors(cds)->sizefactor
for (i in 1:8)
{data[,i]<-data[,i]/sizefactor[i]}
data<-round(data)

# take the mean of MPP/MLP replicates
MPP_mean<-(data[,5]+data[,8])/2 # MPP
MLP_mean<-(data[,4]+data[,7])/2 # MLP
data<-data.frame(data,MPP_mean,MLP_mean)

data<-data[,c(1:3,6,9,10)]

write.table(x=data,file="RNA-seq/data_exp.txt",quote=F,sep = "\t")

# The ENST ids were given corresponding ENSG and Gene symbol ids to facilitate matching of expression data to TFs identified from the Homer Findingmotif analysis.
# Essential codes are given as below:
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

# Create a RNA-seq dataset with the same length as the original data, annotation of ENSG and gene symbols were added
read.table(file="RNA-seq/raw_genes_3.txt",header=T,stringsAsFactors = F)->gl3
read.table(file="RNA-seq/data_p3.txt",header=T,sep = "\t",stringsAsFactors = F)->data3
symbol<-as.character(rep("NA",22590))
ensg<-as.character(rep("NA",22590))
data3<-data.frame(data3,symbol,ensg)
data3$symbol<-as.character(data3$symbol)
data3$ensg<-as.character(data3$ensg)
for (i in 1:22453)
{data3[data3[,1]==gl3[i,1],8]<-gl3[i,3]
data3[data3[,1]==gl3[i,1],9]<-gl3[i,2]
}
length(data3[data3[,9]=="NA",9])
data_matchgene<-rbind(data1,data2,data3)
write.table(x=data_matchgene,file="RNA-seq/datamatchgene.txt",quote=F, sep="\t")
