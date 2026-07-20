# data_matchgene is the RNA-seq data with gene id matched to the transcript id. 
# transform to log2 scale
data_matchgene[,2:7]<-log(data_matchgene[,2:7]+1)

# get the list of genes with 2-fold expression change
GChGMP<-data_matchgene[(data_matchgene[,3]-data_matchgene[,2])>1,9]
GChCLP<-data_matchgene[(data_matchgene[,2]-data_matchgene[,3])>1,9]
MChMPP<-data_matchgene[(data_matchgene[,6]-data_matchgene[,5])>1,9]
MChCMP<-data_matchgene[(data_matchgene[,5]-data_matchgene[,6])>1,9]
MLhMPP<-data_matchgene[(data_matchgene[,6]-data_matchgene[,7])>1,9]
MLhMLP<-data_matchgene[(data_matchgene[,7]-data_matchgene[,6])>1,9]
HMhHSC<-data_matchgene[(data_matchgene[,4]-data_matchgene[,6])>1,9]
HMhMPP<-data_matchgene[(data_matchgene[,6]-data_matchgene[,4])>1,9]
CMhCMP<-data_matchgene[(data_matchgene[,5]-data_matchgene[,7])>1,9]
CMhMLP<-data_matchgene[(data_matchgene[,7]-data_matchgene[,5])>1,9]

# get lists of genes with lower DNA methylation on the promoters in pairwise comparison

read.table(file="/Users/fangwu/Documents/540/data/DNARNAcor/HSCvsMPP_HSC_tgenes.txt",header=T, sep="\t",stringsAsFactors = F)->HMhHSC
read.table(file="/Users/fangwu/Documents/540/data/DNARNAcor/HSCvsMPP_MPP_genes.txt",header=T, sep="\t",stringsAsFactors = F)->HMhMPP
read.table(file="/Users/fangwu/Documents/540/data/DNARNAcor/HSC-MPP_HSC.txt",header=T, sep="\t",stringsAsFactors = F)->HMlmHSC
read.table(file="/Users/fangwu/Documents/540/data/DNARNAcor/HSC-MPP_MPP.txt",header=T, sep="\t",stringsAsFactors = F)->HMlmMPP
read.table(file="/Users/fangwu/Documents/540/data/DNARNAcor/GMP-CLP_lowmethyl_CLP.txt",header=T, sep="\t",stringsAsFactors = F)->GClmCLP
read.table(file="/Users/fangwu/Documents/540/data/DNARNAcor/GMP-CLP_lowmethyl_GMP.txt",header=T, sep="\t",stringsAsFactors = F)->GClmGMP
  read.table(file="/Users/fangwu/Documents/540/data/DNARNAcor/MPP-CMP_lowmethyl_CMP.txt",header=T, sep="\t",stringsAsFactors = F)->MClmCMP
  read.table(file="/Users/fangwu/Documents/540/data/DNARNAcor/MPP-CMP_lowmethyl_MPP.txt",header=T, sep="\t",stringsAsFactors = F)->MClmMPP
  read.table(file="/Users/fangwu/Documents/540/data/DNARNAcor/MPP-MLP_lowmethyl_MLP.txt",header=T, sep="\t",stringsAsFactors = F)->MLlmMLP
  read.table(file="/Users/fangwu/Documents/540/data/DNARNAcor/MPP-MLP_lowmethyl_MPP.txt",header=T, sep="\t",stringsAsFactors = F)->MLlmMPP

# calculate the overlap between two lists with intesect function
  length(intersect(HMhHSC,HMlmHSC[,1]))#64
  length(HMlmHSC[,1]) #371
  length(intersect(HMhHSC,HMlmMPP[,1])) #18
  length(HMlmMPP[,1]) #120
  
  length(intersect(HMhMPP,HMlmHSC[,1])) #88
  length(intersect(HMhMPP,HMlmMPP[,1])) #28
  
  length(intersect(CMhCMP,CMlmCMP[,1]))#10
  length(CMlmCMP[,1]) #90
  length(intersect(CMhCMP,CMlmMLP[,1])) #13
  length(CMlmMLP[,1]) #71
  
  length(intersect(CMhMLP,CMlmCMP[,1])) #18
  length(intersect(CMhMLP,CMlmMLP[,1])) #13
  
  length(intersect(MChMPP,MClmMPP[,1]))#48
  length(MClmMPP[,1]) #249
  length(intersect(MChMPP,MClmCMP[,1])) #12
  length(MClmCMP[,1]) #62
  
  length(intersect(MChCMP,MClmMPP[,1])) #37
  length(intersect(MChCMP,MClmCMP[,1])) #11
  
  length(intersect(MLhMPP,MLlmMPP[,1]))#34
  length(MLlmMPP[,1]) #240
  length(intersect(MLhMPP,MLlmMLP[,1])) #9
  length(MLlmMLP[,1]) #63
  
  length(intersect(MLhMLP,MLlmMPP[,1])) #32
  length(intersect(MLhMLP,MLlmMLP[,1])) #15
  
  length(intersect(GChGMP,GClmGMP[,1]))#7
  length(GClmGMP[,1]) #68
  length(intersect(GChGMP,GClmCLP[,1])) #4
  length(GClmCLP[,1]) #11
  
  length(intersect(GChCLP,GClmGMP[,1])) #10
  length(intersect(GChCLP,GClmCLP[,1])) #4
  




