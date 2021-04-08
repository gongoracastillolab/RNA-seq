#!/bin/sh
# Elsa Gongora
# 12Nov2015 
# Tophat 

export PATH=$PATH:/usr/local/bin/samtools:/usr/bin/tophat:/usr/bin/bowtie:/usr/bin/bowtie-build:/usr/bin/bowtie-inspect

for i in `cat list`
do
NAME=$( echo $i | sed 's/_/ /g' | awk '{print $1 $2 $4}')
echo $NAME

# Running Tophat
tophat -p 2 --bowtie1 -o /Users/share/elsa/fusarium/tophat_cufflinks/${NAME}_vs_FGv3 -G /Users/share/sequences_db/fusarium_graminearum_genome/fusarium_graminearum_ph-1_3_transcripts.gtf /Users/share/elsa/fusarium/tophat_cufflinks/bowtie_index/fusarium_graminearum_ph-1_3_supercontigs $i &> ${NAME}_vs_FGv3_tophat.log

done
