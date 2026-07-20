# Transcription Factor Motif Enrichment and TF Expression Analysis

## Overview

This directory contains the analysis workflow for identifying transcription factors involved in hematopoietic stem and progenitor cell differentiation.

The analysis integrates:

- DNA methylation-derived regulatory regions
- HOMER transcription factor motif enrichment
- RNA-seq expression profiles
- leukemia RNA-seq datasets

The objective was to identify transcription factors whose binding motifs are enriched in active regulatory regions and determine whether these factors show lineage-specific expression patterns.

## Analysis Workflow

The workflow consists of two major components:

### 1. HOMER Motif Enrichment Analysis

Transcription factor binding motif enrichment was performed using HOMER v4.9.

Input regions:

- hypomethylated promoter regions
- hypomethylated enhancer regions

identified from DNA methylation analysis.

Example command:

```bash
findMotifsGenome.pl input_file.txt hg19 output_directory/ -size given -mask
```

The analysis was performed for hematopoietic differentiation transitions:

- HSC → MPP
- MPP → CMP
- MPP → MLP
- CMP → GMP
- CMP → MEP
- GMP → CLP

The output identified significantly enriched known transcription factor motifs.

## 2. TF Expression and Clustering Analysis

Enriched transcription factors were integrated with RNA-seq expression data.

Normal hematopoietic progenitor RNA-seq data were used to:

- evaluate expression of candidate TFs
- compare TF activity between populations
- generate TF expression heatmaps

AML and CLL RNA-seq datasets were used to evaluate whether identified TF programs were associated with leukemia lineage.

## Files

### Scripts

`TF_RNAseq_clustering.R`

Performs:

- extraction of TF expression values
- integration of TF motif lists with RNA-seq data
- clustering analysis
- heatmap generation

`TF_enrichment.Rmd`

Documents:

- HOMER analysis procedure
- motif enrichment workflow
- interpretation of enriched transcription factors

### Results

Examples of generated results:

- TF motif enrichment plots
- TF expression heatmaps
- leukemia TF clustering figures

## Input Data

Required input files are located in:

```
Data/
├── RNAseq_Normal-progenitors/
└── RNAseq_Leukemia_samples/
```

TF motif enrichment input regions were generated from:

```
Results/
└── 1.DNA_methylation_RnBeads/
└── 3.DNAme_RNA_correlation/
```

## Reproducibility

The HOMER analyses require:

- HOMER v4.9
- hg19 genome reference
- Unix/Linux environment

The original analysis was performed on a computational cluster.

The workflow can be reproduced by:

1. generating hypomethylated regulatory region files
2. running HOMER motif enrichment
3. extracting significant TF motifs
4. integrating TFs with RNA-seq expression
5. performing clustering analysis

## Contribution

This analysis was completed as part of a collaborative team project.

My main contributions included:

- HOMER transcription factor motif enrichment analysis
- integration of enriched motifs with RNA-seq expression data
- TF expression clustering analysis
- documentation of the TF analysis workflow

