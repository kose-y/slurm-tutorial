print_job_status(sjob) # checks if the job is completed.

# To see information of the jobs on slurm, type e.g., 
# sacct -j <job number> -o jobid,submit,start,end,nodelist,state
# to the terminal.

results <- get_slurm_out(sjob, outtype="raw", wait = FALSE)
# outtype="raw": obtains output as a list.
# outtype="table": obtains the result as a data frame, each row corresponding to an input.
# wait=TRUE: wait for the completion of the jobs. If you have to wait in a queue or your job takes 
#           more than several minutes, put wait=FALSE, as the RStudio window will not respond 
#           while the job is pending or running.
# wait=FALSE: The result is returned only if the jobs are completed.
#             When called before the job is completed, NA is returned. 


sapply(results, mean) # sapply: simplifies the result of lapply.
sapply(results, sd)


cleanup_files(sjob) # cleans up temporary files created for slurm submission

