# HOMER Transcription Factor Motif Enrichment Analysis

## Overview

Transcription factor (TF) motif enrichment analysis was performed to identify regulatory factors potentially involved in hematopoietic stem and progenitor cell differentiation.

This analysis integrated DNA methylation-derived regulatory regions with known transcription factor binding motifs to identify lineage-associated regulatory programs.

The analysis was performed using HOMER (Hypergeometric Optimization of Motif EnRichment).

## Tool

HOMER version:

```
v4.9
```

Reference genome:

```
hg19
```

HOMER was selected because it provides genome-wide motif enrichment analysis using known transcription factor binding motifs and statistical enrichment testing.

## Input Regions

The input regions were generated from DNA methylation analysis.

Differential methylation analysis identified hypomethylated regulatory regions associated with hematopoietic differentiation.

The analyzed regions included:

- Promoter regions
- Enhancer regions

Population comparisons included:

- HSC vs MPP
- MPP vs CMP
- MPP vs MLP
- CMP vs GMP
- CMP vs MEP
- GMP vs CLP

For each comparison, hypomethylated regions from each population were analyzed separately.

## HOMER Analysis

The main HOMER command used was:

```bash
findMotifsGenome.pl input_file.txt hg19 output_directory/ -size given -mask
```

The input file contained genomic coordinates:

| Column | Description |
|---|---|
| 1 | Region identifier |
| 2 | Chromosome |
| 3 | Start position |
| 4 | End position |
| 5 | Strand |

HOMER compared observed motif frequencies within target regions against genomic background regions to identify significantly enriched transcription factor binding motifs.

## Output

HOMER generated known motif enrichment results containing:

- transcription factor motif name
- enrichment score
- p-value
- log p-value
- percentage of target sequences containing the motif
- percentage of background sequences containing the motif

Example output:

```
knownResults.html
```

The results identified transcription factors whose binding motifs were enriched in regulatory regions associated with specific differentiation transitions.

## Biological Interpretation

The enriched motifs represented candidate transcription factors involved in lineage commitment.

Candidate TFs were further evaluated by integrating:

- RNA-seq expression profiles
- methylation status of regulatory regions
- leukemia expression datasets

This allowed assessment of whether enriched transcription factors showed lineage-specific expression patterns.

## Reproducibility Notes

The original HOMER analyses were performed on a Unix-based computational environment.

Required software:

- Perl
- GNU make
- GCC compiler
- wget
- standard Unix utilities

HOMER installation:

```bash
perl configureHomer.pl -install
```

The complete original analysis can be reproduced by rerunning HOMER on the processed genomic region files available in the repository.

## My Contribution

I was responsible for:

- performing HOMER motif enrichment analysis
- analyzing enriched transcription factor motifs
- integrating motif results with RNA-seq expression data
- generating TF clustering analyses
- documenting the motif enrichment workflow

The analysis was performed as part of a collaborative team project.
