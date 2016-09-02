echo -e "converting ibus_han_poj_123.txt to ibus_han_poj_asd.tex ..."
bash table_converter.sh > ibus_han_poj_asd.txt

echo -e "creating poj.db ..."
ibus-table-createdb -s ibus_han_poj_asd.txt -n poj.db

echo -e "updating poj.db ... (need to be root)"
sudo cp poj.db /usr/share/ibus-table/tables/

echo -e "restarting ibus-daemon ..."
ibus-daemon -x -r -d

echo -e "done."
