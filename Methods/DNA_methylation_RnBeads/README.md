# DNA Methylation Analysis

This directory contains the original DNA methylation analysis scripts developed during the STAT540 Team Bloodies project (2017).

The workflow used the RnBeads package to perform differential DNA methylation analysis of human hematopoietic stem and progenitor cell populations.

These scripts include:

- Custom enhancer annotation generation using UCSC ChromHMM tracks (K562 and GM12878)
- RnBeads configuration
- Differential methylation analysis
- Identification of hypomethylated promoter and enhancer regions
- Mapping of methylation regions to associated genes

These scripts were developed by team members responsible for the DNA methylation component of the project and are included here to preserve the complete computational workflow.

My contribution to this project focused on the downstream transcription factor motif enrichment analysis using HOMER and the integration of DNA methylation and RNA-seq results, described in the `Methods/tf_motif_enrichment/` directory.

## Integration with RNA-seq analysis

The methylation analysis workflow identified genes associated with hypomethylated regulatory regions, including promoter and enhancer regions.

These methylation-associated gene lists were integrated with RNA-seq expression profiles from normal hematopoietic progenitor populations to identify genes showing coordinated epigenetic activation and transcriptional upregulation.

The resulting gene sets were used as input for downstream transcription factor analysis, including HOMER motif enrichment analysis to identify candidate regulatory factors involved in hematopoietic differentiation.
