#!/bin/bash

#Colors
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
cyan="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

function ctrl_c(){
  echo -e "\n\n${red}[!] Terminating program...${end}\n"
  tput cnorm; exit 1 
}

function helpPannel(){
  echo -e "\n${yellow}[+]${end}${gray} Usage: ${end}"
  echo -e "\n\t${blue}-s${end}${gray}) Sends hidden text within an Image.${end}"
  echo -e "\t${blue}-e${end}${gray}) Extracts hidden text from an Image.${end}"
  echo -e "\t${blue}-h${end}${gray}) Shows the help panel.${end}\n"
  echo -e "${green}[+] By ne0mesys${end}\n"
}

function extractText(){
  echo -ne "\n${yellow}[+]${end}${gray} Enter the ${end}${yellow}image ${end}${gray}of the hidden text: ${end}${cyan}" && read archive

  echo -ne "\n${yellow}[+]${end}${gray} Enter the ${end}${yellow}passphrase${end}${gray} required: ${end}${cyan}" && read passphrase2

  if [ -f "$archive" ]; then

    before=$(ls)

    steghide extract -sf $archive -p "$passphrase2" &> /dev/null

    if [ "$?" -eq 0 ]; then
      echo -e "\n${yellow}[+]${end}${gray} Extracting text...${end}"
      tput cnorm

      after=$(ls)
      extracted_file=$(comm -13 <(echo "$before" | sort) <(echo "$after" | sort))

      if [ -n "$extracted_file" ]; then
        mv "$extracted_file" textExtracted.txt &> /dev/null

        echo -e "\n${green}[+] Text extracted and saved in ${end}${yellow}textExtracted.txt${end}"

        echo -ne "\n${yellow}[+]${end}${gray} Would you like to see the content? (yes/no)${end}${cyan} " && read answer

        if [ "$answer" == "yes" ]; then
          echo -e "\n${gray}--------${cyan} textExtracted.txt ${gray}--------${end}\n "
          while IFS= read -r line; do
            echo -e "${yellow}$line${end}"
          done < textExtracted.txt
          echo -e "\n${gray}-----------------------------------\n${end}"
        else 
          exit 1
        fi 
      else 
        echo -e "\n${red}[!] Extraction succeed, but no file was found.${end}"
        exit 1
      fi 
      
    else
      echo -e "\n\n${red}[!] The passphrase is not correct!\n${end}"
      tput cnorm 
      exit 1 
    fi 

  else 
    echo -e "\n\n${red}[!] No text was extracted! Check the image's name...${end}\n"
    exit 1 
  fi 
}

function sendText(){
  echo -ne "\n${yellow}[+]${end}${gray} Enter the${end}${yellow} text${end}${gray} to hide: ${end}${cyan}" && read text

  # Image name
  echo -ne "\n${yellow}[+]${end}${gray} Enter the name${end}${gray} of the ${end}${yellow}image${end}${gray} (ex. hi.jpg): ${end}${cyan}" && read name 
  image="$name"

  if [ -f "$image" ]; then

    tmpfile=$(mktemp)

    echo "$text" > "$tmpfile"

    echo -ne "\n${yellow}[+]${end}${gray} Enter the${end}${yellow} passphrase${end}${gray} to encrypt/decrypt: ${end}${cyan}" && read passphrase

    if [ -n "$passphrase" ]; then
      echo -e "\n${yellow}[+]${end}${gray} Hiding text within${end}${yellow} $name${end}"
    
      steghide embed -cf "$image" -ef "$tmpfile" -p "$passphrase" > /dev/null
      
      rm "$tmpfile"

      echo -e "\n${green}[+] Text embedded successfully!${end}\n"
    else 
      echo -e "\n\n${red}[!] A passphrase is required!\n"
      exit 1 
    fi 
  else 
    echo -e "\n\n${red}[!] Error: The image was not found...\n${end}"
    exit 1
  fi 
}

# Ctrl + C 
trap ctrl_c INT 

# Indicators
declare -i parameter_counter=0

while getopts "esh" arg; do
  case $arg in 
    e) let parameter_counter+=1;;
    s) let parameter_counter+=2;;
    h) ;;
    \?)
      echo -e "\n\n${red}[!] Invalid option: ${end}${blue}-$OPTARG${end}\n"
      tput cnorm; exit 1
  esac 
done 

if [ "$parameter_counter" -eq 1 ]; then
  extractText
elif [ "$parameter_counter" -eq 2 ]; then
  sendText
else 
  helpPannel
fi 
