library(pheatmap)
library(DESeq)

# load data
data<-read.table(file="RNA-seq/GSE87195_rnaseq_ensT_all.csv", header=T,sep=",")
rownames(data)<-data[,1]

# remove outlier "RNA_D2_GMP_100"
data<-data[,c(-12)]

# remove samples that will not be used in this study - HSCbm, MLP0, MLP2, MLP3
colnames(data)
data<-data[,c(2:4,7,10:13)]

# filtering out transcripts with low expression
# the total reads of all samples
sum<-rowSums(data)
data<-data.frame(data,sum)
# filter out transcripts with total reads below 50
data<-data[data$sum>50,] 
data<-data[,1:8]

# Big difference of the means across samples
colMeans(data) 
# Normalization using DESeq-"sizefactor"
data.frame(row.names=colnames(data),condition=c("CLP","GMP","HSC","MLP","MPP","CMP","MLP","MPP"))->metadata
cds=newCountDataSet(countData = data,conditions = metadata)
cds = estimateSizeFactors(cds)
sizeFactors(cds)->sizefactor
for (i in 1:8)
{data[,i]<-data[,i]/sizefactor[i]}
data<-round(data)

# means of samples look closer to each other
colMeans(data)

# order the data based on the mean expression
mean<-rowMeans(data)
data<-data.frame(data,mean)
data<-data[order(data$mean,decreasing = T),]
data<-data[,1:8]

# clustering based on the most abundant 2000 transcripts
pheatmap(mat=data[1:2000,],scale="row",cluster_cols = T, cluster_rows = T, show_rownames = F)
