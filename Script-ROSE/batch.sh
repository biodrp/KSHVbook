#!/bin/bash  
   
while getopts "o:i:a:b:c:y:z:" opt; 
do  
    case $opt in  
    o)
		vo=$OPTARG	  
      ;;
    i)
		vi=$OPTARG	  
      ;;  
    a)  
		va=$OPTARG	  
      ;;  
    b)  
		vb=$OPTARG	  
      ;;  
    c)  
		vc=$OPTARG	  
      ;;  
    y)  
		vy=$OPTARG	  
      ;;  
    z)  
		vz=$OPTARG	  
      ;;  	  
    \?)  
      echo "Invalid option: -$OPTARG"   
      ;; 
	 esac
done 
vinput="yes"
vcas="yes"

echo "parameter option"
echo "out:"$vo
echo "input:"$vi
echo "input1:"$va
echo "input2:"$vb
echo "cas:"$vc
echo "cas1:"$vy
echo "cas2:"$vz


echo "||||||||||||||||||||Start||||||||||||||||||||"

if [ $vi == $vinput ]
then

echo "1_Run the Bowtie(input_$vo)" #two
bowtie -e 70 -k 2 -n 2 -m 2 -S -q /linuxdata1/download/hg19/Sequence/BowtieIndex/genome -1 "$va".fastq -2 "$vb".fastq "$vo"_input.sam
echo "1_Bowtie(input_$vo)_Over"

else
echo "1_Run the Bowtie(input_$vo)" #one
bowtie -e 70 -k 2 -n 2 -m 2 -S -q /linuxdata1/download/hg19/Sequence/BowtieIndex/genome "$va".fastq "$vo"_input.sam
echo "1_Bowtie(input_$vo)_Over"
fi
echo "1_Over"

if [ $vc == $vcas ]
then

echo "2_Run the Bowtie(cas_$vo)" #two
bowtie -e 70 -k 2 -n 2 -m 2 -S -q /linuxdata1/download/hg19/Sequence/BowtieIndex/genome -1 "$vy".fastq -2 "$vz".fastq "$vo"_cas.sam
echo "2_Bowtie(cas_$vo)_Over"

else
echo "2_Run the Bowtie(cas_$vo)" #one
bowtie -e 70 -k 2 -n 2 -m 2 -S -q /linuxdata1/download/hg19/Sequence/BowtieIndex/genome "$vy".fastq "$vo"_cas.sam
echo "2_Bowtie(cas_$vo)_Over"
fi
echo "2_Over"

echo "3_Run the macs($vo)"
macs14 -p 1e-9 -w -S --keep-dup=auto --wig --single-profile --space=50  -c "$vo"_input.sam -t "$vo"_cas.sam -g hs -n "$vo"_macs
echo "3_Over"

echo "4_Samtools running inputtrol group($vo)"
samtools view -b -S "$vo"_input.sam > "$vo"_input.bam
samtools sort "$vo"_input.bam > "$vo"_input.sort.bam
samtools index "$vo"_input.sort.bam "$vo"_input.sort.bam.bai
echo "4_Over"

echo "5_Samtools running case group($vo)"
samtools view -b -S "$vo"_cas.sam > "$vo"_cas.bam
samtools sort "$vo"_cas.bam > "$vo"_cas.sort.bam
samtools index "$vo"_cas.sort.bam "$vo"_cas.sort.bam.bai
echo "5_Over"

echo "6_bed-inputvert-gff($vo)"
awk 'BEGIN{OFS=" "}{$5= "@"}{$6= $4}{$7 = "."}{$8 = "@"}{$9 = "@"}{print $1,$4,$5,$2,$3,$8,$7,$9,$6}' "$vo"_macs_peaks.bed > "$vo"_macs_peaks.gff
sed -i 's/@//g' "$vo"_macs_peaks.gff
sed -i 's/ /\t/g' "$vo"_macs_peaks.gff
echo "6_Over"

echo "7_cp-Rose($vo)"
cp -Rf /linuxdata3/jy/program/ROSE/* .
echo "7_Over"

echo "8_Run the Rose1($vo)"
python ROSE_main.py -g HG19 -i "$vo"_macs_peaks.gff -c "$vo"_input.sort.bam -r "$vo"_cas.sort.bam  -o "$vo" -s 12500 -t 2000
echo "8_Over"

echo "9_Run the Rose2($vo)"
python ROSE_geneMapper.py -g HG19 -i "$vo"/"$vo"_macs_peaks_SuperEnhancers.table.txt
echo "9_Over"

echo "10_Statistics section"

echo "10.1_SuperEnhancers.table.txt"
wc -l "$vo"/"$vo"_macs_peaks_SuperEnhancers.table.txt

echo "10.2_macs_peaks.bed"
wc -l "$vo"_macs_peaks.bed

echo "10_Over"

echo "||||||||||||||||||||End||||||||||||||||||||"