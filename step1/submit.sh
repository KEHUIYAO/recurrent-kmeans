#!/bin/bash
#SBATCH --mail-user=kyao24@wisc.edu
#SBATCH --mail-type=ALL
#SBATCH --mem-per-cpu=500M

##SBATCH -p short #can change this to long if it takes between 4 days and 2 weeks
#SBATCH -n 24

mkdir -p /workspace/$SLURM_JOB_USER/Matlab_DP_2016_varying_lam/matlab_ps/$SLURM_JOB_ID/.matlab
export HOME=/workspace/$SLURM_JOB_USER/Matlab_DP_2016_varying_lam/matlab_ps/$SLURM_JOB_ID
/workspace/software/matlab-2017a/bin/matlab -nodesktop -nosplash -r "u4"
