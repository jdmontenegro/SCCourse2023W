#!/bin/bash

#SBATCH --job-name=blastp
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=4G
#SBATCH --time=5:0:0
#SBATCH --partition=basic
#SBATCH --output=/scratch/molevo/jmontenegro/SCCourse/logs/blastp-%j_%A.log
#SBATCH --error=/scratch/molevo/jmontenegro/SCCourse/logs/blastp-%j_%A.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=juan.montenegro@univie.ac.at

### ENVIRONMENT
module load ncbiblastplus/2.13.0
module list

### CONSTANTS
wd="/scratch/molevo/jmontenegro/SCCourse"
chunks=( ${wd}/data/refs/chunks/chunk*.fasta )
od="${wd}/results/blastp"
nr_db="/scratch/mirror/ncbi/2022-12-17/nr"
taxids="/scratch/molevo/jmontenegro/nvectensis/scripts/metazoa.taxids"

### VARIABLE
inFasta="${chunks[${SLURM_ARRAY_TASK_ID}]}"
outFile="${od}/chunk_${SLURM_ARRAY_TASK_ID}.metazoa.blastp.tsv"

### EXECUTION
echo "Started at `date`"

echo "mkdir ${od}"
mkdir ${od}

echo "blastp -query ${inFasta} -db ${nr_db} -out ${outFile} -num_threads 8 -evalue 1e-5 -taxidlist ${taxids} -outfmt 6 qseqid sseqid ssciname salltitles evalue bitscore qlen slen length"
blastp -query ${inFasta} -db ${nr_db} -out ${outFile} -num_threads 8 -evalue 1e-5 -taxidlist ${taxids} -outfmt "6 qseqid sseqid ssciname salltitles evalue bitscore qlen slen length"

echo "Finished at `date`"
