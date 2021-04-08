#!/bin/sh -login
# Elsa Gongora
# Cufflinks 

# Time job will take to execute & Memory needed
#PBS -l walltime=5:00:00
#PBS -l mem=4gb
# PBS -l nodes=1:ppn=2 

# Make output and error files
#PBS -j oe 
#PBS -o /mnt/scratch/casti111/gongora/fusarium/cufflinks/stdout/ 

# Give the job a name
#PBS -V
#PBS -N cuff4B73fus

# Send an email when a job is aborted, begins or ends
#PBS -M casti111@msu.edu
#PBS -m abe

# Specifies whether a job is rerunnable (y/n)
#PBS -r n


# submission example:
# qsub -t 1-3 -v INFILE=filelist.txt,FLOWCELL= /mnt/research/vitamaize_project/
# FLOWCELL=flowcell directory
# INFILE=library directory name


module load cufflinks/2.2.1 
module load SAMTools/0.1.19
module load Eigen/3.0.3

cd ${PBS_O_WORKDIR} 


FILE=`/bin/sed -n ${PBS_ARRAYID}p ${INFILE}`
NAME=$( echo $FILE | sed 's/_accepted_hits.bam//') 


# cufflinks
cufflinks -I 60000 -o /mnt/scratch/casti111/gongora/fusarium/cufflinks/cuff_${NAME} -G /mnt/scratch/casti111/gongora/fusarium/tophat/ZmB73_5b_FGS_wo_PtMt.gtf /mnt/scratch/casti111/gongora/fusarium/tophat/bam/$FILE

echo "Cufflinks done..."


