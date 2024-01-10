#!/bin/bash

#SBATCH --job-name=augustus_chr2
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=16G
#SBATCH --time=24:00:00
#SBATCH --partition=basic
#SBATCH --output=/scratch/course/2023w300106/jmontenegro/augustus.log
#SBATCH --error=/scratch/course/2023w300106/jmontenegro/augustus.err
#SBATCH --mail-type=END
#SBATCH --mail-user=juan.montenegro@univie.ac.at

### ENVIRONMENT
module load conda
module list

conda activate augustus-3.5.0

### EXECUTION
cd /scratch/course/2023w300106/jmontenegro
mkdir ex7
cd ex7

augustus --strand=both --genemodel=complete --gff3=on --outfile=nemVec_augustus.gff --species=nematostella_vectensis \
  /scratch/course/2023w300106/jmontenegro/ex2/ncbi_dataset/data/GCF_932526225.1/chr2.fasta
