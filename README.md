# CutSeq
Extract sequence based on  keywords of contig 
:see_no_evil: Actually, you can use it to extract any gene you need.
## Input
Fasta format file
## Usage
```
#help
sh CutSeq.sh -h
#Extract sequence
sh CutSeq.sh -i <input file> -k <your keyword>
```
### For example

#Inputfile format
```
cat test.fasta

#####################
>E.coli 1
aaattttccc
tttgaaaaaa
>E.coli 99
ttttaaagggaaacccccc
>Listeria
tttccccggggaaaacgcgcg
#####################
```
#Run command
```
sh CutSeq.sh -i ST123.fasta -keyword E.coli
```
#you will get CUT_OUT.fasta
```
cat CUT_OUT.fasta

#####################
>E.coli 1
aaattttccctttgaaaaaa
>E.coli 99
ttttaaagggaaacccccc
#####################
```
:star: Each contig sequence will become a line in OUT_PUT.fasta, such as E.coli 1  
If you want to display in multiple lines for easy visualization，you can:
```
seqkit seq test.fa -w 100
```
