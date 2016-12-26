#!/bin/bash
input_file="ibus_han_poj_123.txt"

#sed 's/0123456789//' $input_file

awk '
BEGIN {OFS=""};
{
    if (/^VALID_INPUT_CHARS/)
        print $1," ",$2," ",$3=gensub(/0123456789/,"",1,$3);
    else if (/[[:alpha:]]*[^ptkh[:digit:]]\t.*\t.*/ && $3 > 10)
        print $1=$1"a","\t",$2,"\t",$3;
    else if (/[[:alpha:]][2]\t.*\t.*/)
        print $1=gensub(/2$/,"s",1,$1),"\t",$2,"\t",$3;
    else if (/[[:alpha:]][3]\t.*\t.*/)
        print $1=gensub(/3$/,"d",1,$1),"\t",$2,"\t",$3;
    else if (/[[:alpha:]][ptkh]\t.*\t.*/)
        print $1=$1"f","\t",$2,"\t",$3;
    else if (/[[:alpha:]][5]\t.*\t.*/)
        print $1=gensub(/5$/,"z",1,$1),"\t",$2,"\t",$3;
    else if (/[[:alpha:]][6]\t.*\t.*/)
        print $1=gensub(/6$/,"x",1,$1),"\t",$2,"\t",$3;
    else if (/[[:alpha:]][7]\t.*\t.*/)
        print $1=gensub(/7$/,"c",1,$1),"\t",$2,"\t",$3;
    else if (/[[:alpha:]][8]\t.*\t.*/)
        print $1=gensub(/8$/,"v",1,$1),"\t",$2,"\t",$3;
    else if (/[[:alpha:]][9]\t.*\t.*/)
        print $1=gensub(/9$/,"b",1,$1),"\t",$2,"\t",$3;
    else
        print $0;
    }

    ' $input_file
