# poj_ibus_table

## Purpose
The purpose of the project is to create an IBus table for POJ users.
The table was modified from one of the cin-tables ([poj-holo.cin](https://github.com/chinese-opendesktop/cin-tables)).

## Test Environment
The table has only been created and tested in Ubuntu 14.04.

## Steps
* Go to you working directory.
* Prepare the cin table `poj-holo.cin`
* Copy the file for editing:
  `$cp /usr/share/ibus-table/table/template.txt ibus_poj.txt`
* Transform the cin table to meet the ibus format by using:
  `$awk '/\%chardef begin/{f=1;next}/\%chardef end/{exit}f' poj-holo.cin | awk '{count[$1]++}{print $1"\t"$2"\t"101-count[$1]}' | tr '[A-Z]' '[a-z]' >> ibus_poj.txt`
* Edit `ibus_poj.txt` to fit your need

## File list
* poj-holo.cin: The original cin table, which contains only Han characters.
* ibus_poj.txt: The file used to create the POJ table.
* poj.db: The ibus table generated from ibus_poj.txt.
* ibus-poj.svg: The icon file.
* lomaji.py: The original file which contains the (incomplete) POJ unicode list.
* print_poj_list.py: Used to print out the unicode list in lomaji.py.

## Note
The content of `ibus_poj.txt` is far than complete.
What I plan to do is to add Lô-má-jī ahead of the Han characters.
Any contributions/corrections/modifications/suggestions are welcome.

## Ref.
* [ibus上安裝大易輸入法](http://120.114.52.240/~T093000298/blog?node=000000103)
* [在 iBus 加入大易輸入法](http://jamyy.us.to/blog/2013/12/5653.html)
