#!/bin/bash
input_file="ibus_han_poj_123.txt"

#sed 's/0123456789//' $input_file

awk '
BEGIN {OFS=""};
{
    start=10
    stop=300
    if (/^VALID_INPUT_CHARS/)
        print $1," ",$2," ",$3=gensub(/0123456789/,"",1,$3);
    else if (/[[:alpha:]]*[^ptkhz[:digit:]]\t.*\t.*/ && $3 >= start && $3 < stop)
        print $1=$1"a","\t",$2,"\t",$3;
    else if (/[[:alpha:]][2]\t.*\t.*/)
        print $1=gensub(/2$/,"s",1,$1),"\t",$2,"\t",$3;
    else if (/[[:alpha:]][3]\t.*\t.*/)
        print $1=gensub(/3$/,"d",1,$1),"\t",$2,"\t",$3;
    else if (/[[:alpha:]][ptkh]\t.*\t.*/ && $3 >= start && $3 < stop)
        print $1=$1"f","\t",$2,"\t",$3;
    else if (/[[:alpha:]][5]\t.*\t.*/)
        print $1=gensub(/5$/,"g",1,$1),"\t",$2,"\t",$3;
    else if (/[[:alpha:]][6]\t.*\t.*/)
        print $1=gensub(/6$/,"h",1,$1),"\t",$2,"\t",$3;
    else if (/[[:alpha:]][7]\t.*\t.*/)
        print $1=gensub(/7$/,"j",1,$1),"\t",$2,"\t",$3;
    else if (/[[:alpha:]][8]\t.*\t.*/)
        print $1=gensub(/8$/,"k",1,$1),"\t",$2,"\t",$3;
    else if (/[[:alpha:]][9]\t.*\t.*/)
        print $1=gensub(/9$/,"l",1,$1),"\t",$2,"\t",$3;
    else if (/[[:alpha:]][0]\t.*\t.*/)
        print $1=gensub(/0$/,";",1,$1),"\t",$2,"\t",$3;
    else
        print $0;
    }

    ' $input_file
