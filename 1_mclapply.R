# parallelizes lapply using the function `mclapply` from the package `parallel`.
# can run using four cores of a machine.
# submit`1_job_script.sh` to Slurm to utilize cores of the worker nodes.

# to submit the job, enter the command `1_job_script.sh` from the terminal

source("0_sampler.R")
require(parallel)

chains = 200
samples = 10000
system.time(
  r <- mclapply(1:chains, 
                function(x) MH.MCMC.exp(x, samples=samples),
                mc.cores = 4
                )
  # Utilizes four cores to complete the lapply job.
)
rr = do.call(rbind, r)
rowMeans(rr)
rowSds(rr)
