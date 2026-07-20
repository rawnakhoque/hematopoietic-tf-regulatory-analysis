library(gplots)
library(NMF)


setwd("RNA-seq/Normal/data")
expr_data = read.csv('GSE87195_rnaseq_ensT_all.csv', header = T,  sep = ',', row.names = 1)
expr_data = expr_data[,c(1:10,12:13)]
factor_data = read.csv('factor_data.csv', header = T, sep = ',')
str(expr_data)
#heatmap production for quality check
cellType = factor(factor_data$cell_type, labels = c('CLP', 'GMP', 'HSC', 'HSC1','MLP', 'MLP1', 'MLP2',
                                                    'MLP3', 'MPP', 'CMP', 'MLP4', 'MPP1' ))
aheatmap(cor(expr_data), Rowv = FALSE, Colv = FALSE)

