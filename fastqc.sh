#!/bin/bash
#$ -cwd

# FasQC

for i in `cat list`
do
NAME=$(echo $i | sed 's/\// /g' | awk '{print $2}' | sed 's/.fastq.gz//')
mkdir $NAME
fastqc -o $NAME -f fastq /Users/share/elsa/fusarium/raw_seqs/$i
done
