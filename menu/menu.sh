#!/bin/bash

BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'


# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $xray_service == "running" ]]; then
status_xray="${GB}[ ON ]${NC}"
else
status_xray="${RB}[ OFF ]${NC}"
fi
if [[ $nginx_service == "running" ]]; then
status_nginx="${GB}[ ON ]${NC}"
else
status_nginx="${RB}[ OFF ]${NC}"
fi
dtoday="$(vnstat | grep today | awk '{print $2" "substr ($3, 1, 3)}')"
utoday="$(vnstat | grep today | awk '{print $5" "substr ($6, 1, 3)}')"
ttoday="$(vnstat | grep today | awk '{print $8" "substr ($9, 1, 3)}')"
dmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $2" "substr ($3, 1 ,3)}')"
umon="$(vnstat -m | grep `date +%G-%m` | awk '{print $5" "substr ($6, 1 ,3)}')"
tmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $8" "substr ($9, 1 ,3)}')"
domain=$(cat /usr/local/etc/xray/domain)
ISP=$(cat /usr/local/etc/xray/org)
CITY=$(cat /usr/local/etc/xray/city)
WKT=$(cat /usr/local/etc/xray/timezone)
DATE=$(date -R | cut -d " " -f -4)
MYIP=$(curl -sS ipv4.icanhazip.com)
clear

export MYIP=$( curl -s https://ipinfo.io/ip/ )
Name=$(curl -sS https://raw.githubusercontent.com/gigclone/permission/main/A1valid/ip | grep $MYIP | awk '{print $2}')
Exp=$(curl -sS https://raw.githubusercontent.com/gigclone/permission/main/A1valid/ip | grep $MYIP | awk '{print $3}')
clear

echo -e "${BIBlue}————————————————————————————————————————————————————————${NC}"
echo -e "               ${BIGreen}----- [ Xray Script ] -----${NC}              "
echo -e "${BIBlue}————————————————————————————————————————————————————————${NC}"
echo -e " ${BIRed}Service Provider${NC} ${BIGreen}: $ISP"
echo -e " ${BIRed}Timezone${NC}         ${BIGreen}: $WKT${NC}"
echo -e " ${BIRed}City${NC}             ${BIGreen}: $CITY${NC}"
echo -e " ${BIRed}Date${NC}             ${BIGreen}: $DATE${NC}"
echo -e " ${BIRed}Domain${NC}           ${BIGreen}: $domain${NC}"
echo -e "${BIBlue}————————————————————————————————————————————————————————${NC}"
echo -e "     ${BIGreen}NGINX STATUS :${NC} $status_nginx    ${BIGreen}XRAY STATUS :${NC} $status_xray   "
echo -e "${BIBlue}————————————————————————————————————————————————————————${NC}"
echo -e "          ${BIGreen}----- [ Bandwidth Monitoring ] -----${NC}"
echo -e ""
echo -e "  ${BICyan}Today ($DATE)     Monthly ($(date +%B/%Y))${NC}      "
echo -e "${BIBlue}————————————————————————————————————————————————————————${NC}"
echo -e "    ${BICyan}↓↓ Down: $dtoday          ↓↓ Down: $dmon${NC}   "
echo -e "    ${BICyan}↑↑ Up  : $utoday          ↑↑ Up  : $umon${NC}   "
echo -e "    ${BICyan}≈ Total: $ttoday          ≈ Total: $tmon${NC}   "
echo -e "${BIBlue}————————————————————————————————————————————————————————${NC}"
echo -e "                ${BIGreen}----- [ Xray Menu ] -----${NC}               "
echo -e "${BIBlue}————————————————————————————————————————————————————————${NC}"
echo -e " ${BIWhite}[1]${NC} ${BIRed}Vmess Menu${NC}"
echo -e " ${BIWhite}[2]${NC} ${BIRed}Vless Menu${NC}"
echo -e " ${BIWhite}[3]${NC} ${BIRed}Trojan Menu${NC}"
echo -e " ${BIWhite}[4]${NC} ${BIRed}Allxray Menu${NC}"
echo -e "${BIBlue}————————————————————————————————————————————————————————${NC}"
echo -e "                 ${BIGreen}----- [ Utility ] -----${NC}                "
echo -e "${BIBlue}————————————————————————————————————————————————————————${NC}"
echo -e " ${BIWhite}[5]${NC} ${BIRed}Log Create Account${NC}  ${BIWhite}[10]${NC} ${BIRed}DNS Setting${NC}"
echo -e " ${BIWhite}[6]${NC} ${BIRed}Speedtest${NC}           ${BIWhite}[11]${NC} ${BIRed}Check DNS Status${NC}"
echo -e " ${BIWhite}[7]${NC} ${BIRed}Change Domain${NC}"
echo -e " ${BIWhite}[8]${NC} ${BIRed}Cert Acme.sh${NC}"
echo -e " ${BIWhite}[9]${NC} ${BIRed}About Script${NC}"
echo -e "${BIBlue}————————————————————————————————————————————————————————${NC}"
echo -e ""
read -p " Select Menu :  "  opt
echo -e ""
case $opt in
1) clear ; vmess ;;
2) clear ; vless ;;
3) clear ; trojan ;;
4) clear ; allxray ;;
5) clear ; log-create ;;
6) clear ; speedtest ;;
7) clear ; dns ;;
8) clear ; certxray ;;
9) clear ; about ;;
10) clear ; changer ;;
11) clear ;
resolvectl status
echo ""
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
echo ""
echo ""
menu ;;
x) exit ;;
*) echo -e "${YB}salah input${NC}" ; sleep 1 ; menu ;;
esac
