#!/bin/bash
printUsage(){
        echo "usage: cut_seq.sh -i <filename> -k <keyword> 结果文件为CUT_OUT.fasta"
        exit -1
    }
    if [ $# -eq 0 ];then
        printUsage
    fi
    while getopts :hi:k: opts;do
        case "$opts" in
            i)
                inputfile=$OPTARG
                if [ ! -f $inputfile ];then
                    echo "The input file $inputfile doesn't exist!"
                    exit -1
                fi
                ;;
            k)
                keyword=$OPTARG
                ;;
            h)
                printUsage
                ;;
            :)
                echo "$0 must supply an argument to option -$OPTARG!"
                printUsage
                ;;
            ?)
                echo "invalid option -$OPTARG ignored!"
                printUsage
                ;;
        esac
    done
awk '!/^>/ { printf "%s", $0; n = "\n" } /^>/ { print n $0; n = "" } END { printf "%s", n }' $inputfile | awk '/'$keyword'/{getline a;print $0"\n"a}'> CUT_OUT.fasta
