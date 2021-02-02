#! /bin/bash

#$ -wd /broad/finucanelab/carlos/scz_exome_pops
#$ -l h_vmem=15G
#$ -l h_rt=1:00:00
#$ -t 1-22
#$ -o jobs/scores.out
#$ -j y

use Anaconda3
source /broad/finucanelab/carlos/scz_exome_pops/venv/bin/activate
python pops/pops.predict_scores.py \
	--gene_loc data/pops/gene_loc.txt \
	--gene_results data/scz \
	--features data/pops/downsampled_features.tsv \
	--selected_features data/test.features \
	--control_features data/pops/control.features \
	--chromosome ${SGE_TASK_ID} \
	--out data/scores/scz