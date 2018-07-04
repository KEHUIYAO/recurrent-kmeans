#!/bin/bash
#SBATCH --mail-user=kyao24@wisc.edu
#SBATCH --mail-type=ALL
#SBATCH --mem-per-cpu=500M
#SBATCH -p short
#SBATCH -n 24 #no of workers to use^M
#SBATCH --array=10-12

export HOME=/workspace/$SLURM_JOB_USER/Matlab_DP_2016_varying_lam/matlab_ps/$SLURM_ARRAY_TASK_ID
mkdir -p /workspace/$SLURM_JOB_USER/Matlab_DP_2016_varying_lam/matlab_ps/$SLURM_ARRAY_TASK_ID/.matlab

/workspace/software/matlab-2017a/bin/matlab -nodesktop -nosplash -r "test$SLURM_ARRAY_TASK"
