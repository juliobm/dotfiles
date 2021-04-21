# https://www.polydesmida.info/cookbook/functions.html

#PS1="\[\e[0;31m\][\u@\h:\w]$ \[\e[0m\]"
#PS1="\[\e[0;31m\][\h:\w]$ \[\e[0m\]"
#PS1="\[\e[0;31m\][\h:\w]\n> \[\e[0m\]"
#PS1="\[\e[0;31m\][\h:\w] \[\e[0m\]"
#if [[ $HOSTNAME == "ghostbuster" || $HOSTNAME == "tecra1" ]]
#if [[ $HOSTNAME == "ghostbuster"  ]]
#then
#	PS1="\[\e[0;36m\]\w\n[\h] \[\e[0m\]"
#fi
buscazip ()
{
	find . -name '*.zip' -print -exec unzip -l {} \; | grep -i "$1"
}

fields ()
{
head -n 1 "$1" | tr "\t" "\n" | nl -w1 | pr -t -2
} 

fieldsc ()
{
head -n 1 "$1" | tr ";" "\n" | nl -w1 | pr -t -2
} 

broken ()
{
awk -F"\t" '{print NF}' "$1" | sort -n | uniq -c
}

hunt ()
{
awk -F"\t" -v tgt="$2" '{for (i=1;i<=NF;i++) if ($i ~ tgt) print NR" f"i": "$i}' "$1"
}

maxchk ()
{
tail -n +2 "$1" | cut -f"$2" | awk -F"\t" '{print length($1)"\t"$1}' | sort | uniq | sort -nr | head -n "$3"
}

minchk ()
{
tail -n +2 "$1" | cut -f"$2" | awk -F"\t" '{print length($1)"\t"$1}' | sort | uniq | sort -n | head -n "$3"
}

recbyfld ()
{
paste <(head -n1 "$1" | tr '\t' '\n') <(sed -n "$2p" "$1"| tr '\t' '\n') | nl
}

tally ()
{
tail -n +2 "$1" | cut -f"$2" | sort | uniq -c | sed 's/^[ ]*//;s/ /\t/'
}

widths()
{
awk -F"\t" -v fld="$2" 'NR>1 {print length($fld)}' "$1" | sort -n | uniq -c | sed 's/^[ ]*//;s/ /\t/'
}

c2t()
{
sed 's/""/@@@/g' "$1" \
| awk -v FPAT='[^;]*|"[^"]*"' -v OFS="\t" \
'{$1=$1; gsub(/"/,""); print}' \
| sed 's/\t@@@\t/\t\t/g;s/@@@/"/g' > tsv_"$1"
}

wifi()
{
echo -e "estos son algunos ejemplos de nmcli"
echo -e "-----------------------------------"
echo -e "sudo sudo nmcli dev wifi rescan"
echo -e "nmcli c show"
echo -e "nmcli dev wifi list"
echo -e "sudo nmcli con down vodafone8BA"
echo -e "sudo nmcli dev wifi connect vodafone8BA7 password tupassword"
echo -e "sudo nmcli c up uuid cd79a7a1-1cf4-49c3-ad58-21ab17d1ba05"
echo -e "sudo nmcli c up id Rishbh-Q1000"
echo -e "sudo nmcli -f all dev wifi list"
echo -e "ejecuto:\\nnmcli -f 'in-use,ssid,mode,chan,freq,rate,signal,bars,security,bssid,device,active' dev wifi"
echo -e "----------------------------------\n"
date
nmcli -f "in-use,ssid,mode,chan,freq,rate,signal,bars,security,bssid,device,active" dev wifi
}

marcajes ()
{
arsys cat /home/virtual/marcajes/MARCAJES/marcajes_$1.txt
}

h ()
{
	if [[ $# -gt 0 ]] 
	then
		history | grep -i $1
	else

		history
	fi
}

b () 
{ 
    if [[ $# -gt 0 ]]; then
        grep --color=auto -i "$1" *.txt;
    else
        history;
    fi
}

book() { printf "$(pwd)\n" | sed 's|/home/julio/||' >> ~/Documentos/06-Zaprogramas/bash/workplaces; }

function goto
{
local foo=$(sort ~/Documentos/06-Zaprogramas/bash/workplaces | nl -w1)
local REPLY
echo -e "\n0\tquit\n$foo\n"
read -p "Enter a directory number: "
if [[ $REPLY =~ ^[0-"$(echo "$foo" | wc -l)"]$ ]]; then
[[ $REPLY = "0" ]] && return
cd "/home/julio/$(grep ^$REPLY <<<$foo | cut -f2)" && echo "Now in $(pwd)"
else
echo "No such number"
fi
}

