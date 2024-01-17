#!/bin/bash

#SBATCH --job-name=cellranger
#SBATCH --cpus-per-task=16
#SBATCH --mem=20GB
#SBATCH --time=24:00:00
#SBATCH --output=/scratch/course/2023w300106/jmontenegro/cellranger.log
#SBATCH --error=/scratch/course/2023w300106/jmontenegro/cellranger_%j_%a.err
#SBATCH --export=ALL

### ENVIRONMENT
module load cellranger
module list

## #CONSTANTS
wd="/scratch/course/2023w300106/jmontenegro/ex10"
res="$wd/results"
nv2="/scratch/molevo/jmontenegro/nvectensis/data/refs/fluorophores/Nv2_fluo"
od="${res}/cellranger"

### VARIABLES
dir="/scratch/molevo/agcole/course/datafiles/sequences_raw/12hr1/run1,/scratch/molevo/agcole/course/datafiles/sequences_raw/12hr1/run2,/scratch/molevo/agcole/course/datafiles/sequences_raw/12hr1/run3"
sample="89085"

### EXECUTION

echo "mkdir -p ${od}"
mkdir -p ${od}

echo "cd ${od}"
cd ${od}

echo "cellranger count --nosecondary --id 12hr1_nv2 --transcriptome ${nv2} --fastqs ${dir} --sample ${sample} --localcores 16"
cellranger count --nosecondary --id 12hr1_nv2 --transcriptome ${nv2} --fastqs ${dir} --sample ${sample} --localcores 16

echo "Started at `date`"
