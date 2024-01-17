#!/bin/bash

#SBATCH --job-name=starTest
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=10G
#SBATCH --time=10:00:00
#SBATCH --partition=basic
#SBATCH --output=/scratch/course/2023w300106/jmontenegro/star.log
#SBATCH --error=/scratch/course/2023w300106/jmontenegro/star.err
#SBATCH --mail-type=END
#SBATCH --mail-user=juan.montenegro@univie.ac.at

module load star
module list

cd /scratch/course/2023w300106/jmontenegro
mkdir ex4
cd ex4

STAR --runThreadN 16 \
  --genomeDir /scratch/course/2023w300106/jmontenegro/ex2/ncbi_dataset/data/GCF_932526225.1/jaNemVect1.1_STAR \
  --readFilesIn /scratch/course/2023w300106/jmontenegro/ex3/SRR24348404/SRR24348404_1.fastq /scratch/course/2023w300106/jmontenegro/ex3/SRR24348404/SRR24348404_2.fastq \
  --outSAMtype BAM SortedByCoordinate \
  --twopassMode Basic \
  --outSAMstrandField intronMotif \
  --outFileNamePrefix SRR24348404 
