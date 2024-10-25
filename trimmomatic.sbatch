#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=25:00:00
#SBATCH --mem=64GB
#SBATCH --job-name=trimmomatic
#SBATCH --mail-type=END
#SBATCH --mail-user=sp7512@nyu.edu
#SBATCH --output=slurm
%j.out

#purge all modules, then load trimmomatic
module purge
module load trimmomatic/0.39

#setting up a for loop to go through the pwd and grab every file ending with .fastq, then running trimmomatic using SE defaults from the webpage with the input being the files ending in .fastq and then output being a file that changes . to trimmed. but leaving the Sample# and the fastq after the . alone via the technique showed in recitation for changing characters in the file name

for file in ./*
.fastq
do
java -jar $TRIMMOMATIC
JAR SE -phred33 $file ${file::-6}
trimmed ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
done

#because I am getting a slurm error when I make the outputs in the previous loop end with the fastq extension, I realized it was taking the new files and trying to infinitely generate trimmed fastqs. Thus it no longer creates files with the fastq extension and instead those are added on in this second for loop.

for file in ./*trimmed
do
mv $file ${file}.fastq
done