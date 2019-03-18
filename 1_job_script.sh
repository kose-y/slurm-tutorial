#!/bin/bash
#
#SBATCH --time=00:30:00 # time limit
#SBATCH --nodes=1 # number of nodes to be used 
#SBATCH --ntasks=1 # number of tasks
#SBATCH --cpus-per-task=4 # number of cpus taken by the task
#SBATCH --job-name="test_mclapply"
#SBATCH --mail-user=syko0507@snu.ac.kr
#SBATCH --mail-type=ALL

Rscript --vanilla 1_mclapply.R
