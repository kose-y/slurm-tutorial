# slurm-tutorial
Tutorial code for slurm and rslurm. Written for First-year Graduate Seminar, Mar 22, 2019.

Illustrates how to use slurm (mostly on R).

## 0. Local Example
* `0_sampler.R` contains the code for Metropolis-Hastings algorithm. Functions here are used throughout our R examples.
    * NOTE: exponential distribution here is parametrized so that E(X) = \theta for X ~ exp(\theta). 
* `0_local.R` contains the code to take 10,000 samples from each of theta in 1:200. It takes around 20 seconds on single core using `lapply()`.

## 1. Parallelization using `mclapply()`
* `1_mclapply.R` parallelizes the previous job using the package `parallel`. The code uses four cores. This is for single-node only.
* `1_job_script.sh` contains the script to be submitted to slurm: specifically configured to use four cores.
    * Enter `sbatch 1_job_script.sh` to the terminal to submit.
    * Enter `squeue` to the terminal to check job status.

## 2. Using `rslurm`
* `2_rslurm.R` parallelizes the previous job using the package `rslurm`. The package automatically submits the workload to the job scheduler. Configured to run 8 jobs, each job utilizing 10 cores. The jobs may run on several different nodes, depending on availability.

## 3. GPU example.
* `3_tensorflow_gpu.py`: a tensorflow tutorial code for MNIST data for classification of handwritten digits.
* `3_tensorflow_gpu.sh`: job script for `3_tensorflow_gpu.py`. Illustrates how to configure the jobs in order to utilize GPUs.
