# This code illustrates how to parallelize a job using the package rslurm.
# you can use multiple nodes with it. automatically submits the job to slurm. 
library(rslurm)

source("0_sampler.R")

chains = 200
samples = 10000

# create a data frame: 
# each row of it corresponds to a set of arguments to the function. 
params = data.frame(theta=1:chains, samples=rep(samples, chains))

n_jobs = 4
cores_per_job = 8 # number of cores you wish to use per job.
sjob <- slurm_apply(MH.MCMC.exp, 
                    params, nodes=n_jobs, cpus_per_node = cores_per_job,
                    add_objects=c("exp.d", "MH.MCMC"),
                    # additional objects needed to define the function `MH.MCMC.exp`
                    slurm_options=list(nodes=1, partition="cpu", 
                                       time="00:30:00", ntasks=1, "cpus-per-task"=cores_per_job
                    ), submit = TRUE)
# nodes: number of jobs to run. Technically, it is the size of Slurm jobarray.
# cpus_per_node: number of cores per job.
# on options, ntasks: number of tasks, one per job. cpus-per-task: same as cores_per_job. 

# In bigger clusters, where a user is given an exclusive access to each node 
# (no other users can use the node you are allocated),
# it is natural to set cores_per_job to the number of cores on that machine. 
# 'nodes' is guaranteed to be the number of actual nodes used in computation then.
# The design of rslurm is based on this scenario.

# However, that is NOT the case on our department cluster: 
# many of the users don't require or utilize all the cores on a machine.
# We are allocating four 8-core jobs, depending on availability. 


