
# Metropolis-Hastings Markov Chain Monte Carlo sampler. 
# For each of theta=1..200, we take 10000 Monte Carlo samples 
# following the distribution exp(theta).

require(matrixStats) # for rowSds
exp.d = function(x, theta=1) { 
  # pdf of exponential distribution
  ifelse(x >= 0,  exp(-x/theta)/theta, 0)
} # NOTE: [dexp/pexp/qexp/rexp] uses different parametrization.

MH.MCMC = function(target.d, samples=100, startval=1, sd=1) {
  # Metropolis-Hastings sampler.
  # uses Normal(x[i-1], sd) as the proposal distribution.
  # target.d: pdf of the target distribution.
  # samples: number of samples to take
  # startval: the first sample
  # sd: standard deviation of the proposal distribution
  
  x = rep(0, samples)
  x[1] = startval
  for (i in 2:samples) { 
    # This is hard to vectorize, 
    # as an iteration depends on the previous one. 
    # This can be accelerated using e.g. RCpp. 
    current = x[i-1]
    proposed = rnorm(1, mean=current, sd=sd)
    A = target.d(proposed)/target.d(current)
    if (runif(1) < A) {
      x[i] = proposed
    } else {
      x[i] = current
    }
  }
  x
}

MH.MCMC.exp = function(theta, samples=100, startval=theta, sd=theta) {
  # M-H sampler for the exponential distribution
  MH.MCMC(function(y) exp.d(y, theta=theta), samples, startval, sd)
}
