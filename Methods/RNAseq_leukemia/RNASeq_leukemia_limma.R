setwd('RNA-seq/Leukemia/data')
library(limma)
AML=read.table('AML_expected_count_data.csv', sep = ',', header=TRUE, row.names=1)
CLL=read.table('CLL_expected_count_data.csv',sep = ',', header=TRUE, row.names=1)

new_AML <- AML[,-1]
rownames(new_AML) <- AML[,1]
new_CLL <- CLL[,-1]
rownames(new_CLL)<- CLL[,1]
counts <- cbind(new_AML,new_CLL)
groups <- factor(c(rep("AML", 7), c(rep("CLL", 7))))

# Build design matrix
des <- model.matrix(~groups)

# Compute normalisation
norm.factors <- calcNormFactors(counts)

lib.size <- norm.factors * colSums(counts)

# Convert counts to log2-cpm
dat <- voom(counts, des, lib.size=lib.size)

# Fit model
fit <- lmFit(dat, des)

#create an mean difference plot displaying the log-fold-changes and average A-values for each gene
plotMD(fit)
abline(0,0,col="blue")

#Empirical Bayes analysis
fit <- eBayes(fit)

# Extract all results
top.table <- topTable(fit, coef=2, n=Inf, p.value=0.05)
#top.table1 <- top.table[top.table$adj.P.Val<0.05,]

#distribution of the p value
hist(top.table$P.Value,col="grey50", border="white")

write.table(top.table, file = "toptable.txt", row.names=TRUE, col.names=NA, sep="\t")




