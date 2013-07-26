#!/bin/bash

#SBATCH -J gmetisMIC #Job name
#SBATCH -o gmetisMIC.%j # stdout; %j expands to jobid
#SBATCH -p development # queue
#SBATCH -N 1 # Number of nodes, not cores (16 cores/node)
#SBATCH -n 1 # Total number of tasks (if omitted, n=N)
#SBATCH -t 04:00:00 # max time

MAXSTEP=1
TBEGIN=199
TEND=244
TNEXT=1

PART1=16
PART2=128
PART3=1024

METIS=/work/02556/dpereira/MIC/apps/gmetis/gmetis
INPUT=/work/02556/dpereira/Inputs/USA-road-d.W.gr

export MIC_ENV_PREFIX=MIC

cd /work/02556/dpereira/Measurements

mkdir -p Measurements
mkdir -p Logs

<< STEP1
for (( step = 0; step < $MAXSTEP; step++ )); do
    for (( threads = $TBEGIN; threads <= $TEND; threads+=$TNEXT )); do
      export MIC_OMP_NUM_THREADS=$threads
      $METIS -t=$threads $INPUT $PART1 2> Measurements/gmetis\_$PART1\_$threads > Logs/gmetis\_$PART1\_$threads 
    done
done
STEP1

<< STEP2
for (( step = 0; step < $MAXSTEP; step++ )); do
    for (( threads = $TBEGIN; threads <= $TEND; threads+=$TNEXT )); do
      export MIC_OMP_NUM_THREADS=$threads
      $METIS -t=$threads $INPUT $PART2 2> Measurements/gmetis\_$PART2\_$threads > Logs/gmetis\_$PART2\_$threads 
    done
done
STEP2

for (( step = 0; step < $MAXSTEP; step++ )); do
    for (( threads = $TBEGIN; threads <= $TEND; threads+=$TNEXT )); do
      export MIC_OMP_NUM_THREADS=$threads
      $METIS -t=$threads $INPUT $PART3 2> Measurements/gmetis\_$PART3\_$threads > Logs/gmetis\_$PART3\_$threads 
    done
done

