#!/bin/bash

#SBATCH --job-name=starTest
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=10G
#SBATCH --time=2:00:00
#SBATCH --partition=basic
#SBATCH --output=/scratch/course/2023w300106/jmontenegro/star.log
#SBATCH --error=/scratch/course/2023w300106/jmontenegro/star.err
#SBATCH --mail-type=END
#SBATCH --mail-user=juan.montenegro@univie.ac.at

module load star
module list

cd /scratch/course/2023w300106/jmontenegro
mkdir ex5
cd ex5

STAR --runThreadN 16 \
  --genomeDir /scratch/course/2023w300106/jmontenegro/ex2/ncbi_dataset/data/GCF_932526225.1/jaNemVect1.1_STAR \
  --readFilesIn /scratch/course/2023w300106/jmontenegro/ex3/SRR24348404/trim/SRR24348404_R1.qc.fastq /scratch/course/2023w300106/jmontenegro/ex3/SRR24348404/trim/SRR24348404_R2.qc.fastq \
  --outSAMtype BAM SortedByCoordinate \
  --twopassMode Basic \
  --outSAMstrandField intronMotif \
  --outFileNamePrefix SRR24348404_trim_
