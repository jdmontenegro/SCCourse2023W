#!/bin/bash

#SBATCH --job-name=stringtie
#SBATCH --nodes=1
#SBATCH --cpus-per-task=6
#SBATCH --mem=32G
#SBATCH --time=2:00:00
#SBATCH --partition=basic
#SBATCH --output=/scratch/course/2023w300106/jmontenegro/stringtie.log
#SBATCH --error=/scratch/course/2023w300106/jmontenegro/stringtie.err
#SBATCH --mail-type=END
#SBATCH --mail-user=juan.montenegro@univie.ac.at

### MODULES
module load stringtie
module list

### EXECUTION
mkdir /scratch/course/2023w300106/jmontenegro/ex6
cd /scratch/course/2023w300106/jmontenegro/ex6

echo "stringtie /scratch/course/2023w300106/BAMS/*.bam -l NemVecV1 -o NemVecAnnotation.gtf -p 6 -u"
stringtie /scratch/course/2023w300106/BAMS/*.bam -l NemVecV1 -o NemVecAnnotation.gtf -p 6 -u
