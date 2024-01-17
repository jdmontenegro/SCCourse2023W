#!/bin/bash

#SBATCH --job-name=emapper
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=10G
#SBATCH --time=24:00:00
#SBATCH --partition=basic
#SBATCH --output=/scratch/course/2023w300106/jmontenegro/emapper.log
#SBATCH --error=/scratch/course/2023w300106/jmontenegro/emapper.err
#SBATCH --mail-type=END
#SBATCH --mail-user=juan.montenegro@univie.ac.at

### load conda and activate environment
module load conda
conda activate eggnog-mapper-2.1.12

cd  /scratch/course/2023w300106/jmontenegro/ex9

### COMMAND
emapper.py -i /scratch/course/2023w300106/jmontenegro/ex9/proteinTransdecoder.fasta \
  --cpu 16 --itype proteins --data_dir /scratch/mirror/eggnog-mapper/2.1.12 \
  -m diamond --pident 60 --query_cover 60 --subject_cover 70 \
  --tax_scope 'eukaryota_broad' --resume \
  --output jaNemVect_emapper --output_dir /scratch/course/2023w300106/jmontenegro/ex9 \
  --temp_dir ${TMPDIR}
