#!/bin/bash -l

#SBATCH -N 1 # 1 node.
#SBATCH --ntasks=1 
#SBATCH -p gpu # we have a different partition for gpu.
#SBATCH --gres=gpu:1 # configures number of gpus you need.
#SBATCH --time=00:30:00

module load cudnn/cuda9.0/7.1
module load python/3.6.5 # an old version of tensorflow is installed here
# the server may provide different versions/installations of a single software package
# e.g. python, cuda, mpi. 
# Users can switch to different versions/installations using the module command above. 
# The module manages the environment variables as necessary. 

# see, for example, https://www.nersc.gov/users/software/user-environment/modules/ 
# for further information on module above. 
python3 3_tensorflow_gpu.py 
