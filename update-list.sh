#!/bin/bash
wget http://winhelp2002.mvps.org/hosts.txt -O ->> list.txt
wget http://someonewhocares.org/hosts/hosts -O ->> list.txt
wget https://raw.githubusercontent.com/gioxx/xfiles/master/filtri.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/easylist.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/abpindo+easylist.txt -O ->> list.txt
wget https://raw.githubusercontent.com/ABPindo/indonesianadblockrules/master/subscriptions/abpindo.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/bulgarian_list+easylist.txt -O ->> list.txt
wget http://stanev.org/abp/adblock_bg.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/easylistchina+easylist.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/easylistchina.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/easylistczechslovak+easylist.txt -O ->> list.txt
wget https://raw.github.com/tomasko126/easylistczechandslovak/master/filters.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/easylistdutch+easylist.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/easylistdutch.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/easylistgermany+easylist.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/easylistgermany.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/israellist+easylist.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/easylistitaly+easylist.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/easylistitaly.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/easylistlithuania+easylist.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/latvianlist+easylist.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/liste_ar+liste_fr+easylist.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/liste_ar.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/liste_fr+easylist.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/liste_fr.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/rolist+easylist.txt -O ->> list.txt
wget http://www.zoso.ro/pages/rolist.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/ruadlist+easylist.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/advblock.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/easylistspanish.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/easyprivacy+easylist.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/easyprivacy.txt -O ->> list.txt
wget http://adblock.gardar.net/is.abp.txt -O ->> list.txt
wget http://www.void.gr/kargig/void-gr-filters.txt -O ->> list.txt
wget http://bit.ly/11QrCfx -O ->> list.txt
wget http://gurud.ee/ab.txt -O ->> list.txt
wget https://raw.githubusercontent.com/szpeter80/hufilter/master/hufilter.txt -O ->> list.txt
wget http://pgl.yoyo.org/adservers/serverlist.php?hostformat -O ->> list.txt
wget https://adblock.dk/block.csv -O ->> list.txt
wget http://noads.it/filtri.txt -O ->> list.txt
wget https://raw.githubusercontent.com/yous/YousList/master/youslist.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/antiadblockfilters.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/fanboy-annoyance.txt -O ->> list.txt
wget https://easylist-downloads.adblockplus.org/fanboy-social.txt -O ->> list.txt
wget http://www.kiboke-studio.hr/i-dont-care-about-cookies/abp/ -O ->> list.txt
wget https://raw.github.com/liamja/Prebake/master/obtrusive.txt -O ->> list.txt
wget https://raw.githubusercontent.com/Dawsey21/Lists/master/adblock-list.txt -O ->> list.txt
wget https://phishing.army/download/phishing_army_blocklist_extended.txt -O ->> list.txt
wget https://v.firebog.net/hosts/Easylist.txt -O ->> list.txt
wget https://v.firebog.net/hosts/AdguardDNS.txt -O ->> list.txt

npm run build && npm run start

# filter non url content and eliminate duplicates
cat list.txt | tr -d " \t" > adlist.txt
rm -rf list.txt
