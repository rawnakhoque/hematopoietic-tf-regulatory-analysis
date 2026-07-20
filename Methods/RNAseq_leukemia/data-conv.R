setwd("RNA-seq/Leukemia/AML")
dat_raw1 <- read.table('S00CWT11.gene_quantification.rsem_grape2_crg.GRCh38.20151028.results', 
                      header = T, sep = '\t')
dat_raw2 <- read.table('S00D1D11.gene_quantification.rsem_grape2_crg.GRCh38.20151028.results', 
                      header = T, sep = '\t')
dat_raw3 <- read.table('S00D2B11.gene_quantification.rsem_grape2_crg.GRCh38.20151028.results', 
                      header = T, sep = '\t')
dat_raw4 <- read.table('S00D3911.gene_quantification.rsem_grape2_crg.GRCh38.20151028.results', 
                      header = T, sep = '\t')
dat_raw5 <- read.table('S00D4711.gene_quantification.rsem_grape2_crg.GRCh38.20151028.results', 
                      header = T, sep = '\t')
dat_raw6 <- read.table('S00D5511.gene_quantification.rsem_grape2_crg.GRCh38.20151028.results', 
                      header = T, sep = '\t')
dat_raw7 <- read.table('S00XUN11.gene_quantification.rsem_grape2_crg.GRCh38.20151028.results', 
                      header = T, sep = '\t')

head(dat_raw)
x <- data.frame(dat_raw1$gene_id, dat_raw1$expected_count, dat_raw2$expected_count, dat_raw3$expected_count,
                dat_raw4$expected_count, dat_raw5$expected_count, dat_raw6$expected_count, 
                dat_raw7$expected_count)
colnames(x) <- c("gene_id","S00CWT11","S00D1D11", "S00D2B11", "S00D3911", "S00D4711", "S00D5511", "S00XUN11")
x
write.csv(x, file = 'AML_expected_count_data.csv')
y <- read.csv('RNASeq_AML.csv', header = T, sep = ',')
head(y)
############################
setwd("RNA-seq/Leukemia/CLL")

dat_raw1 <- read.table('S00AXZ11.gene_quantification.rsem_grape2_crg.GRCh38.20160531.results', 
                       header = T, sep = '\t')
dat_raw2 <- read.table('S00AYX11.gene_quantification.rsem_grape2_crg.GRCh38.20160531.results', 
                       header = T, sep = '\t')
dat_raw3 <- read.table('S00B0N11.gene_quantification.rsem_grape2_crg.GRCh38.20160531.results', 
                       header = T, sep = '\t')
dat_raw4 <- read.table('S00B1L11.gene_quantification.rsem_grape2_crg.GRCh38.20160531.results', 
                       header = T, sep = '\t')
dat_raw5 <- read.table('S00B2J11.gene_quantification.rsem_grape2_crg.GRCh38.20160531.results', 
                       header = T, sep = '\t')
dat_raw6 <- read.table('S00GPR11.gene_quantification.rsem_grape2_crg.GRCh38.20160531.results', 
                       header = T, sep = '\t')
dat_raw7 <- read.table('S01FG411.gene_quantification.rsem_grape2_crg.GRCh38.20160531.results', 
                       header = T, sep = '\t')


x <- data.frame(dat_raw1$gene_id, dat_raw1$expected_count, dat_raw2$expected_count, dat_raw3$expected_count,
                dat_raw4$expected_count, dat_raw5$expected_count, dat_raw6$expected_count, 
                dat_raw7$expected_count)
colnames(x) <- c("gene_id","S00AXZ11","S00AYX11", "S00B0N11", "S00B1L11", "S00B2J11", "S00GPR11", "S01FG411")
x
write.csv(x, file = 'CLL_expected_count_data.csv')
y <- read.csv('CLL_expected_count_data.csv', header = T, sep = ',')
head(y)
