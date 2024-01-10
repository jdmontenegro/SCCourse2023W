#!/bin/bash

#SBATCH --job-name=samtoolsFilter
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=8G
#SBATCH --time=2:00:00
#SBATCH --partition=basic
#SBATCH --output=/scratch/course/2023w300106/jmontenegro/samFilter.log
#SBATCH --error=/scratch/course/2023w300106/jmontenegro/samFilter.err
#SBATCH --mail-type=END
#SBATCH --mail-user=juan.montenegro@univie.ac.at


### MODULES

module load samtools
module list

### EXECUTION

samtools view -b -o /scratch/course/2023w300106/BAMS/SRR24348404.f.bam \
  -q 20 -f 0x2 -F 0x4 -@ 8 \
  /scratch/course/2023w300106/jmontenegro/ex5/SRR24348404_trim_Aligned.sortedByCoord.out.bam
