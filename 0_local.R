# local code. single core.
source('0_sampler.R')
chains = 200
samples = 10000
system.time(
  r <- lapply(1:chains, function(x) MH.MCMC.exp(x, samples=samples))
  # take 10000 samples from each of exp(theta), theta = 1, ..., 200
)
rr <- do.call(rbind, r) 
# rr: 200 x 10000 matrix. row i corresponds to samples taken from exp(i). 
rowMeans(rr) # mean of samples from exp(theta) is theta.  
rowSds(rr) # s.d. of samples from exp(theta) is theta.
