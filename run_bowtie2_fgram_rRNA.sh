#!/bin/sh
# Elsa Gongora
# 12Nov2015 
# Tophat 

export PATH=$PATH:/usr/local/bin/samtools:/usr/bin/tophat:/usr/bin/bowtie2:/usr/bin/bowtie2-build:/usr/bin/bowtie2-inspect

for i in `cat list`
do
NAME=$( echo $i | sed 's/_/ /g' | awk '{print $1 $2 $4}')
echo $NAME

# Running Tophat
bowtie2 -q $i -x /Users/share/elsa/fusarium/tophat_cufflinks/bowtie_index/f.gram_PH1_rRNA_seqs --qc-filter --very-fast-local -S ${NAME}_vs_rRNA.sam &> ${NAME}_vs_rRNA-Fgram.log

done
