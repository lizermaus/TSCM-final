#!bin/bash

mkdir dumps

for rc in 2.0 2.5 5.0 10.0
do
	
	mkdir dumps/rcut_$rc
        cd dumps/rcut_$rc
	sed "s/CCCC/$rc/g" ~/finalp/in.crack > in.crack
        srun -N 1 -p RT --ntasks-per-node=8 -J lammps_krivosheya --comment="lammps melting" -p RT ~/bin/lmp_mpi -in in.crack
        cd ../../
done

echo "#Temp_initial Temp_average" > Temp.txt
echo "N r RDF" > rdf.txt
for TEMP in 0.0 0.5 1.0 1.5 2.0
do
avg=$(awk -f awk.sh lj/temp_$TEMP/log.lammps)
echo "$TEMP $avg" >> Temp.txt
tail -n 50 lj/temp_$TEMP/tmp.rdf > lj/temp_$TEMP/rdf.txt
done

gnuplot gnuplot.sh




curl -s -X POST https://api.telegram.org/bot1652857387:AAHTMs0O_O4ThK5R9ExMKwBNxb8dBY_4_nQ/sendMessage -d chat_id=-553219995 -d text="Process finished"
