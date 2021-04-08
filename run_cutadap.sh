#!/bin/sh 
# Elsa Gongora
# 31Oct2015
# Cutadapt


for i in `cat list`
do
NAME=$(echo $i | sed 's/\// /g' | awk '{print $2}' | sed 's/.fastq.gz//')
echo $NAME
cutadapt -f fastq -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACNNNNNNNNNTCGTATGCCGTCTTCTGCTTG -m 25 -q 20 -o ${NAME}_cutadapt.fq /Users/share/elsa/fusarium/raw_seqs/$i &> ${NAME}_cut.log
done 




