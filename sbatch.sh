#!/bin/sh

#SBATCH -p RT
#SBATCH --comment=lammps
#SBATCH -N 1
##SBATCH --exclusive
#SBATCH --ntasks-per-node=4
#SBATCH --time=60


module load gcc/7.4.0
module load mpi/openmpi3

mpirun ~/bin/lmp_mpi -in in.crack

curl -s -X POST https://api.telegram.org/bot1652857387:AAHTMs0O_O4ThK5R9ExMKwBNxb8dBY_4_nQ/sendMessage -d chat_id=-553219995 -d text="Process finished"

