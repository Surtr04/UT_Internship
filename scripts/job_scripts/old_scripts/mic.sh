#!/bin/bash

#SBATCH -J gmetisMIC #Job name
#SBATCH -o gmetisMIC.%j # stdout; %j expands to jobid
#SBATCH -p development # queue
#SBATCH -N 1 # Number of nodes, not cores (16 cores/node)
#SBATCH -n 1 # Total number of tasks (if omitted, n=N)
#SBATCH -t 02:00:00 # max time

MAXSTEP=1
THREADS=244
TBEGIN=1
TEND=20
TNEXT=20

PART1=16
PART2=1024

METIS=/work/02556/dpereira/MIC/apps/gmetis/gmetis
INPUT=/work/02556/dpereira/Inputs/USA-road-d.W.gr

export MIC_ENV_PREFIX=MIC

cd /work/02556/dpereira/PerformanceTests/MIC

rm -rf ./*
mkdir -p Measurements
mkdir -p Logs

<< THREADHEADER
echo threads: >> Measurements/gmetisMIC_16
echo threads: >> Measurements/gmetisMIC_128
echo threads: >> Measurements/gmetisMIC_1024

for (( threads = $TBEGIN; threads <= $THREADS; threads+=$NEXT )); do
  sed -i "/^threads:/ s/$/ $threads,/" Measurements/gmetisMIC_16
  sed -i "/^threads:/ s/$/ $threads,/" Measurements/gmetisMIC_128
  sed -i "/^threads:/ s/$/ $threads,/" Measurements/gmetisMIC_1024
done
THREADHEADER

<< STEPS
for (( step = 0; step < $MAX; step++ )); do
  echo $step: >> Measurements/gmetisMIC_16
  echo $step: >> Measurements/gmetisMIC_128
  echo $step: >> Measurements/gmetisMIC_1024
done
STEPS

for (( step = 0; step < $MAXSTEP; step++ )); do
    for (( threads = $TBEGIN; threads <= $TEND; threads+=$TNEXT )); do
      export MIC_OMP_NUM_THREADS=$threads
      $METIS -t=$threads $INPUT $PART1 2> Measurements/gmetis\_$PART1\_$threads > Logs/gmetis\_$PART1_$threads 
    done
done

for (( step = 0; step < $MAXSTEP; step++ )); do
    for (( threads = $TBEGIN; threads <= $TEND; threads+=$TNEXT )); do
      export MIC_OMP_NUM_THREADS=$threads
      $METIS -t=$threads $INPUT $PART2 2> Measurements/gmetis\_$PART2\_$threads > Logs/gmetis\_$PART2_$threads 
    done
done

