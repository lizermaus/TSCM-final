set terminal png
set output "RDF.png"
set xlabel "r"
set ylabel "g"
plot for [i=1:n] 'data'.i.'.txt' using 1:2 title 'RDF'.i lc rgb "orange"

