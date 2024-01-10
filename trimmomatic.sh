#!/bin/bash

#SBATCH --job-name=trimmomatic
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=4G
#SBATCH --time=10:00:00
#SBATCH --partition=basic
#SBATCH --output=/scratch/course/2023w300106/jmontenegro/trimomatic.log
#SBATCH --error=/scratch/course/2023w300106/jmontenegro/trimomatic.err
#SBATCH --mail-type=END
#SBATCH --mail-user=juan.montenegro@univie.ac.at

### ENVIRONMENT
module load trimmomatic/0.39
module list

### SET UP DIRECTORIES
mkdir /scratch/course/2023w300106/jmontenegro/ex3/SRR24348404/trim
cd /scratch/course/2023w300106/jmontenegro/ex3/SRR24348404/trim

### ACTUAL COMMAND WE WILL BE USING
### COMMENTS SHOULD BE HERE OR

trimmomatic PE -threads 8 \
  -trimlog trimmomatic.log \
  -summary trim.summary.txt \
  /scratch/course/2023w300106/jmontenegro/ex3/SRR24348404/SRR24348404_1.fastq \
  /scratch/course/2023w300106/jmontenegro/ex3/SRR24348404/SRR24348404_2.fastq \
  /scratch/course/2023w300106/jmontenegro/ex3/SRR24348404/trim/SRR24348404_R1.qc.fastq \
  /scratch/course/2023w300106/jmontenegro/ex3/SRR24348404/trim/SRR24348404_S1.qc.fastq \
  /scratch/course/2023w300106/jmontenegro/ex3/SRR24348404/trim/SRR24348404_R2.qc.fastq \
  /scratch/course/2023w300106/jmontenegro/ex3/SRR24348404/trim/SRR24348404_S2.qc.fastq \
  ILLUMINACLIP:/scratch/course/2023w300106/jmontenegro/adapters.fa:2:30:10 \
  SLIDINGWINDOW:6:15 \
  MINLEN:75

### HERE
