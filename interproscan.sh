#!/bin/bash

#SBATCH --job-name=interproscan
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=16G
#SBATCH --time=24:00:00
#SBATCH --partition=basic
#SBATCH --output=/scratch/course/2023w300106/jmontenegro/interproscan.log
#SBATCH --error=/scratch/course/2023w300106/jmontenegro/interproscan.err
#SBATCH --mail-type=END
#SBATCH --mail-user=juan.montenegro@univie.ac.at

### MODULES
module unload java
module load interproscan
module list

### COMMAND
interproscan.sh -b /scratch/course/2023w300106/jmontenegro/ex9/NemVec.function \
  -cpu 16 -etra -f TSV,GFF3 -goterms -i /scratch/course/2023w300106/jmontenegro/ex9/proteinTransdecoder.fasta \
  -pa -t p
