# gatk-variant-calling
objective: variant calling with GATK

This code was written to be run on the NYU HPC Greene Cluster. 

Prerequisites:
bwa index

Prerequisite Modules:
trimmomatic
bwa
samtools
bamtools
PICARD
GATK

Method outline:
trimmomatic on fastq files -> bwa alignment -> convert sam to bam and sort with Picard -> duplicate removal with Picard -> Add or Replace read groups in Picard -> merge -> gatk variant calling

Afterwards, I visualized the variants in IGV
