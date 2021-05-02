#!/usr/bin/env bash

deps=("bc" "lolcat")
deps=("bc" "neofetch")

for i in ${deps[@]}; do
	if [[ ! $(which $i 2>/dev/null) ]]; then
		echo "Need install: $i."
		exit 1
	fi
done

usage(){
	cat <<EOF

  MyFetch - Show info system and logo system in ASCII

  -h, --help           Show help
  -v, --version        Show version

  * Version beta 1.0

EOF
}

display_info(){

	d_title=$USER@$HOSTNAME
	d=$(cat /proc/version | sed 's/version.*//g')
	d_user=$(whoami)
	a=$(neofetch | grep Host | sed 's/.*://g')
	d_os=$(uname -o)
	d_kname=$(cat /proc/sys/kernel/ostype)
	d_uptime=$(uptime | awk '{print $3}' | tr -d ,)" min"
	d_shell=$(basename $SHELL)
	d_font=$(fc-match | sed 's/\..*//g')
	d_cpu=$(cat /proc/cpuinfo | grep -o 'model name.*' | sed -n 1p | sed 's/Processor.*//g' | sed 's/.*:.//g;s/(.*)//g')
	d_mem=$(echo $(cat /proc/meminfo | sed -n 1p | tr -d [A-Za-z:' ']) / 1000000 | bc)" MB"
	d_memfree=$(echo "scale=2;$(cat /proc/meminfo | sed -n 2p | tr -d [A-Za-z:' '])" / 1000000 | bc)" MB"
	d_arch=$(getconf LONG_BIT)"-bit"
	d_char=$(expr length "$d_title"); qtd=
	d_date=$(date '+%D')
	d_time=$(date '+%T')

	for i in $(seq 1 $d_char); do
qtd="$qtd─"
	done
}

set_info(){
display_info
cat <<EOF


$d_title
$qtd
Distro: ${d^}
User:$d_user
OS:$d_os
CPU:$d_cpu
Uptime:$d_uptime
Date:$d_date
Time:$d_time
Shell:$d_shell
RAM:$d_mem
Kernel:$d_kname
Font:$d_font
Mem Free:$d_memfree
Architeture:$d_arch

EOF
}

display_info
d=${d,,}

outra="
	 ..,;:cllllc:;..            
     ,d0NMMMMMMMMMMMMMMMMMWKx;      
   .KMMMMMMMMMMMMMMMMMMMMMMMMMN.    
   0MMMMMMMMMMMMMMMMMMMMMMMMMMMX    
  'MMMKkddxONMMMMMMMMMNOdloxKMMM;   
  oM0xkx;. . .dWMMMWx. . .,xkx0Mx   
  0MWMMMMM0:...OMMMO...;0MMMMMWM0   
  XMMMMNKKNMN,.KMMMN,cXMNKKXMMMMX   
  NW0;     .:0..MMMWNK:.     ;0WW   
  WO.,;:cclldK. WMMMMXdddddxxxOOO   
  KMMMMMMMMMMW  WMMMMMMMMMMMMMMMN   
  .KMMMMMMMMMx  MMMMMMMMMMMMMMMMx   
  ,;lKNNXKKXl  .MMMMKOMMMMMMMWOl    
   k.. l0KWo k ;MMMMMXOMKOk..'.l    
    0cc ;OWMNW.cMMMKMMMMMK,.O;0     
     0o,,  .,'  .:  ´ol;. ;l,0.     
      OO.ckdc,',kOc...,ckNl:0.      
       oK. kKKXWWMMMMMMMMxkx        
        ;X.XMMNd   0MMMWxX:         
         .k0MMMk  .WMMMNX.          
           oMMM,   KMMMk            
            'XMx  .WMK,             
              ';  .c.               


"


case "$(echo $d)" in
	'arch') distro="$arch" ;;
	*) distro="$outra" ;;
esac

if [[ "$1" ]]; then
	while [[ "$1" ]]; do
		case "$1" in
		
			-h|--help) usage && exit 0 ;;
			-v|--version) echo Version 1.0 && exit 0 ;;
			*) echo "Invalid option" && exit 1 ;;
			
		esac
		shift
	done
else
	paste <(printf "%s" "$distro") <(printf "%s" "$(set_info)") | lolcat
fi
exit 0
