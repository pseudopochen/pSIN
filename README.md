## Citation:
Chen, Po, Nicholas J. Taylor, Ken G. Dueker, Ian S. Keifer, Andra K. Wilson, Casey L. McGuffy, Christopher G. Novitsky, Alec J. Spears, and W. Steven Holbrook. "pSIN: A scalable, Parallel algorithm for Seismic INterferometry of large-N ambient-noise data." Computers & Geosciences 93 (2016): 88-95.

## For a distributed-memory cluster
###1. write a job script name like "run.sh" following the syntax:

example script:

#!/bin/sh
#SBATCH --job-name=psin
#SBATCH --account="your account"
#SBATCH --nodes=40
#SBATCH --ntasks-per-node=16
#SBATCH --time=0-01:00:00

time srun --mpi=pmi2 /home/pchen/ANGF/psin 20 32 /home/pchen/ANGF/binlst 500 65536 0.2 100 500 1000 64000 65000  /glade/scratch/pochen/ANGF/BW3_xcor

###2. explanation about the command-line inputs

arg1 (20): process row number M
arg2 (32): process column number N
arg3 (binlst): a text file listing the absolute path to each *.bin data files
arg4 (500): sampling rate of the seismograms (0.002 s)
arg5 (65536): number of time samples per data segment (has to be power of 2)
arg6 (0.2): width of the moving time window for time-domain normalization in seconds
arg7 (100): width of the frequency-domain moving window in samples


###3. output files

Two sets of output files name like:
psin.idxRIDCID
psin.ouRIDCID
where RID, CID are 2-digit process ID. Both sets of files are binary. psin.idxRANK are 4-byte integers, psin.ouRANK are 4-byte floats.
psin.idxRANK: read first into Matlab, it will give you the receiver IDs of each stacked xcorr
psin.ouRANK: read after, stores all xcorr

