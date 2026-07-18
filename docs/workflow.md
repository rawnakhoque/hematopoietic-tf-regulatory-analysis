# Analysis Workflow

## Overview

The project integrates DNA methylation and RNA-seq data to identify transcription factors associated with human hematopoietic stem and progenitor cell differentiation.

The overall workflow combines epigenomic analysis, transcriptomic analysis, motif enrichment analysis, and transcription factor expression validation.

---

## 1. DNA Methylation Analysis

### Input Data

Whole-genome bisulfite sequencing data from the BLUEPRINT Epigenome Project were used.

The analyzed hematopoietic populations included:

- Hematopoietic stem cells (HSC)
- Multipotent progenitors (MPP)
- Common myeloid progenitors (CMP)
- Granulocyte-monocyte progenitors (GMP)
- Megakaryocyte-erythroid progenitors (MEP)
- Common lymphoid progenitors (CLP)
- Multilineage progenitors (MLP)

### Processing

DNA methylation analysis was performed using the RnBeads package.

Main steps included:

1. Quality assessment of methylation sequencing data
2. Methylation level estimation
3. Differential methylation analysis between related progenitor populations
4. Identification of hypomethylated regulatory regions
5. Annotation of regions to promoters and enhancers using regulatory annotations

The resulting hypomethylated regulatory regions were used for downstream transcription factor motif analysis.

---

## 2. RNA-seq Analysis

RNA-seq data from normal hematopoietic progenitor populations were analyzed to identify lineage-associated gene expression patterns.

Main steps included:

1. Transcript-to-gene annotation conversion
2. Gene-level expression quantification
3. Filtering and normalization
4. Pairwise differential expression analysis between related cell populations
5. Identification of highly expressed lineage-associated genes

Differentially expressed genes were integrated with DNA methylation results to identify genes associated with active regulatory regions.

---

## 3. Integration of DNA Methylation and RNA Expression

The methylation and expression datasets were combined to identify candidate regulatory events.

Integration strategy:

- Hypomethylated regulatory regions were linked to nearby genes
- Genes showing increased expression in corresponding populations were selected
- These genes were used as input for transcription factor motif enrichment analysis

---

## 4. Transcription Factor Motif Enrichment Analysis

### Tool

Transcription factor binding motif enrichment was performed using:

**HOMER (Hypergeometric Optimization of Motif EnRichment)**

Version used:
```
HOMER v4.9
```

Reference genome:

```
hg19
```

### Analysis

Input regions consisted of:

- Hypomethylated promoter regions
- Hypomethylated enhancer regions

for pairwise differentiation stages:

- HSC vs MPP
- MPP vs CMP
- MPP vs MLP
- CMP vs GMP
- CMP vs MEP
- GMP vs CLP

Example command:

```bash
findMotifsGenome.pl input_file.txt hg19 output_directory/ -size given -mask
```

The output contained enriched known transcription factor motifs with:

- motif enrichment score
- p-value
- log p-value
- percentage of target sequences containing the motif
- percentage of background sequences containing the motif

---

## 5. Transcription Factor Expression Analysis

Enriched transcription factors were compared with RNA-seq expression data.

Analyses included:

- extraction of TF expression levels
- comparison between progenitor populations
- visualization using heatmaps
- evaluation of lineage-specific TF activity patterns

---

## 6. Leukemia Dataset Analysis

AML and CLL RNA-seq datasets were analyzed to investigate whether identified hematopoietic transcription factor programs were maintained in leukemia.

Steps included:

1. Extraction of TF expression profiles
2. Comparison between AML and CLL samples
3. Hierarchical clustering based on TF expression
4. Visualization of lineage-associated TF patterns

---

## Summary

This workflow integrates:

**DNA methylation → regulatory regions → TF motif enrichment → TF expression → leukemia validation**

to identify transcription factors potentially involved in hematopoietic lineage commitment.
