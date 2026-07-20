# list of TFs from a pair of comparison on the promoter regions
# CMP-MLP

CMPl<-c("SPI1","IRF8","ERG","EWS","FOS", "JUN","FOSL2","ETS1","ZNF528","ATF3","NFKB","PAX7","PAX3","FOXO1","ELF1","HOXA9","JUNB","ELF5","FOSL1","IRF1","HNF1","BACH2","GATA3","FLI1","FOXP1")

MLPl<-c("KLF4","MAX","NF1","KLF1","KLF10","STAT6","ATF2","USF1","MYF5","MAFK","TLX","MAFA","STAT3","MYC","ATF7","MAFB","USF2","RUNX1","KLF9","SPIB","TCF12","SOX17","NRF2","NR5A2","ZNF675","EBNA1")

# combine the list with annotation for CMP and MLP
TF<-c("SPI1","IRF8","ERG","EWSR1","FOS", "JUN","FOSL2","ETS1","ZNF528","ATF3","NFKB1","FOXO1","ELF1","HOXA9","JUNB","FOSL1","IRF1","HNF1A","BACH2","GATA3","FLI1","FOXP1","KLF4","MAX","NF1","KLF1","KLF10","STAT6","ATF2","USF1","MAFK","NR2E1","STAT3","MYC","ATF7","MAFB","USF2","RUNX1","KLF9","SPIB","TCF12","NFE2L2","ZNF675")
pop<-c(rep("CMP",22),rep("MLP",21))

# create empty columns to store expression value
CMP<-as.numeric(rep(0,43))
MLP<-as.numeric(rep(0,43))

# combine into a data.frame
CMP_MLP<-data.frame(TF,pop,CMP,MLP)
rownames(CMP_MLP)<-CMP_MLP[,1]

for(i in TF)
{colSums(data_matchgene[data_matchgene[,8]==i,c(5,7)])->CMP_MLP[CMP_MLP$TF==i,3:4]
}

library(pheatmap)
an<- data.frame(row.names=CMP_MLP$TF, Active = CMP_MLP$pop)
pdf(file="/Users/fangwu/Documents/540/data/Data/Progenitors/RNA-seq/Normal_TFexp.pdf")
pheatmap(mat=CMP_MLP[,3:4],scale="none",cluster_cols = F, cluster_rows = F,annotation_row = an)
dev.off()


## Clustering of leukemia data (same method)
# load data
leuk<-read.table(file="/Users/fangwu/Documents/540/data/Data/Progenitors/RNA-seq/CLL_expected_count_data.csv", header=T,sep=",",row.names = 1)
leukAML<-read.table(file="/Users/fangwu/Documents/540/data/Data/Progenitors/RNA-seq/AML_expected_count_data.csv", header=T,sep=",",row.names = 1)
leukmerge<-cbind(leuk, leukAML[1:7])
symbol<-as.character(rep("NA",60483))
leukmerge<-data.frame(leukmerge,symbol)
leukmerge$symbol<-as.character(leukmerge$symbol)

for (i in 1:62589)
{leukmerge[rownames(leukmerge)==data_matchgene[i,9],15]<-data_matchgene[i,8]
}

S00AXZ11<-as.numeric(rep(0,43))
S00AYX11<-as.numeric(rep(0,43))
S00B0N11<-as.numeric(rep(0,43))
S00B1L11<-as.numeric(rep(0,43))
S00B2J11<-as.numeric(rep(0,43))
S00GPR11<-as.numeric(rep(0,43))
S01FG411<-as.numeric(rep(0,43))
S00CWT11<-as.numeric(rep(0,43))
S00D1D11<-as.numeric(rep(0,43))
S00D2B11<-as.numeric(rep(0,43))
S00D3911<-as.numeric(rep(0,43))
S00D4711<-as.numeric(rep(0,43))
S00D5511<-as.numeric(rep(0,43))
S00XUN11<-as.numeric(rep(0,43))

lkdata<-data.frame(S00AXZ11,S00AYX11,S00B0N11,S00B1L11,S00B2J11,S00GPR11,S01FG411,S00CWT11,S00D1D11,S00D2B11,S00D3911,S00D4711,S00D5511,S00XUN11)
lkdata<-cbind(TF,lkdata)

for(i in TF)
{colSums(leukmerge[leukmerge[,15]==i,1:14])->lkdata[lkdata[,1]==i,2:15]
}
lksamp<-c("S00AXZ11","S00AYX11","S00B0N11","S00B1L11","S00B2J11","S00GPR11","S01FG411","S00CWT11","S00D1D11","S00D2B11","S00D3911","S00D4711","S00D5511","S00XUN11")
LeukemiaType<-c(rep("CLL",7),rep("AML",7))

library(pheatmap)
colan<-data.frame(row.names=lksamp,LeukemiaType)
rownames(lkdata)<-lkdata[,1]
pdf(file="/Users/fangwu/Documents/540/data/leukemia_TF_clustering.pdf")
pheatmap(mat=lkdata[,2:15], scale="row",cluster_rows = F,cluster_cols = T,annotation_col = colan,annotation_row = an)
dev.off()


